<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Reviews</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
            margin: 0;
        }
        header {
            background: linear-gradient(to right,#2e7d32,#66bb6a);
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 28px;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background: #2e7d32;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
    </style>
</head>
<body>

<header>Manage User Reviews</header>

<table>
    <tr>
        <th>Review ID</th>
        <th>Equipment Name</th>
        <th>User ID</th>
        <th>Rating</th>
        <th>Comment</th>
        <th>Review Date</th>
    </tr>

<%
Connection conn = null;
Statement st = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");
    st = conn.createStatement();
    rs = st.executeQuery(
        "SELECT r.review_id, e.name AS equipment_name, r.user_id, r.rating, r.comment, r.review_date " +
        "FROM review r JOIN equipment e ON r.equipment_id = e.equipment_id"
    );

    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("review_id") %></td>
        <td><%= rs.getString("equipment_name") %></td>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("rating") %></td>
        <td><%= rs.getString("comment") %></td>
        <td><%= rs.getString("review_date") %></td>
    </tr>
<%
    } // end while
} catch(Exception e) {
    out.println("<tr><td colspan='6' style='color:red;text-align:center;'>Error: " + e + "</td></tr>");
} finally {
    if(rs != null) try { rs.close(); } catch(Exception e) {}
    if(st != null) try { st.close(); } catch(Exception e) {}
    if(conn != null) try { conn.close(); } catch(Exception e) {}
}
%>
</table>

</body>
</html>