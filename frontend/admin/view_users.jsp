<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users - Admin</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; margin:0; padding:0; }
        header { background: linear-gradient(to right,#2e7d32,#66bb6a); color:white; text-align:center; padding:20px; font-size:28px; font-weight:bold; }
        nav { background:#333; text-align:center; padding:12px; }
        nav a { color:white; text-decoration:none; margin:15px; font-size:16px; font-weight:bold; }
        nav a:hover { color:#90ee90; }
        table { width: 85%; margin: 20px auto; border-collapse: collapse; background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background: #2e7d32; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background: #f1f1f1; }
        .status-online { color: green; font-weight: bold; }
        .status-offline { color: gray; }
    </style>
</head>
<body>

<header>All Users</header>
<nav>
    <a href="admin_dashboard.html">Dashboard</a>
    <a href="admin_logout.jsp">Logout</a>
</nav>

<h2 style="text-align:center; margin-top:20px;">Users and Login Status</h2>

<table>
    <tr>
        <th>User ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Login Status</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");

        // Use LEFT JOIN so we see ALL registered users even if they aren't in the userlogin table
        String sql = "SELECT r.user_id, r.name, r.email, r.role, IFNULL(l.login_type, 'Offline') as status " +
                     "FROM userregistration r " +
                     "LEFT JOIN userlogin l ON r.user_id = l.user_id " +
                     "ORDER BY r.user_id";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()){
            String status = rs.getString("status");
%>
    <tr>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("role") %></td>
        <td class="<%= status.equalsIgnoreCase("Online") ? "status-online" : "status-offline" %>">
            <%= status %>
        </td>
    </tr>
<%
        }
        rs.close();
        st.close();
        conn.close();
    } catch(Exception e){
        out.println("<tr><td colspan='5' style='color:red;'>"+e.getMessage()+"</td></tr>");
    }
%>

</table>

</body>
</html>