<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>Manage Bookings</title>

<style>
body{
    font-family:Arial;
    background:#f4f4f4;
    margin:0;
    padding:0;
}
header{
    background:linear-gradient(to right,#2e7d32,#66bb6a);
    color:white;
    text-align:center;
    padding:20px;
    font-size:28px;
}
nav{
    background:#333;
    text-align:center;
    padding:12px;
}
nav a{
    color:white;
    text-decoration:none;
    margin:15px;
    font-weight:bold;
}
nav a:hover{
    text-decoration:underline;
}
table{
    width:95%;
    margin:20px auto;
    border-collapse:collapse;
    background:white;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}
th,td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}
th{
    background:#2e7d32;
    color:white;
}
tr:hover{
    background:#f1f1f1;
}
.button{
    background:#2e7d32;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:4px;
    margin:2px;
    display:inline-block;
}
.button:hover{
    background:#1b5e20;
}
.delete{
    background:#e53935;
}
.delete:hover{
    background:#b71c1c;
}
</style>

</head>
<body>

<header>Manage Equipment Bookings</header>

<nav>
<a href="admin_dashboard.html">Dashboard</a>
<a href="admin_logout.jsp">Logout</a>
</nav>

<table>
<tr>
    <th>Booking ID</th>
    <th>Equipment ID</th>
    <th>Renter ID</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>No of Days</th>
    <th>Total Cost</th>
    <th>Action</th>
</tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/farmer","root",""
    );

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM rentalbooking ORDER BY booking_id DESC");

    while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("booking_id") %></td>
    <td><%= rs.getInt("equipment_id") %></td>
    <td><%= rs.getInt("renter_id") %></td>
    <td><%= rs.getString("start_date") %></td>
    <td><%= rs.getString("end_date") %></td>
    <td><%= rs.getString("no_of_days") %></td>
    <td>₹ <%= rs.getString("total_cost") %></td>
    <td>
        <a class="button" href="admin_update_booking.jsp?booking_id=<%= rs.getInt("booking_id") %>">Update</a>
        <a class="button delete" href="admin_delete_booking.jsp?booking_id=<%= rs.getInt("booking_id") %>" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</a>
    </td>
</tr>
<%
    }
    conn.close();
}catch(Exception e){
    out.println("<h3 style='color:red;text-align:center;'>Error: "+e+"</h3>");
}
%>

</table>

</body>
</html>