<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Payments</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        header {
            background: linear-gradient(to right,#2e7d32,#66bb6a);
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 26px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #2e7d32;
            color: white;
        }

        td.amount {
            text-align: right;
            font-weight: bold;
            color: #2e7d32;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .button {
            background: #2e7d32;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
        }

        .button:hover {
            background: #1b5e20;
        }
    </style>
</head>
<body>

<header>Manage Payments</header>

<table>
<tr>
    <th>Payment ID</th>
    <th>Booking ID</th>
    <th>Equipment ID</th>
    <th>Renter ID</th>
    <th>Amount</th>
    <th>Payment Method</th>
    <th>Payment Date</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/farmer", "root", ""
    );

    String sql = "SELECT p.payment_id, p.amount, p.payment_method, p.payment_date, " +
                 "r.booking_id, r.equipment_id, r.renter_id " +
                 "FROM payment p " +
                 "JOIN rentalbooking r ON p.rental_id = r.booking_id " +
                 "ORDER BY p.payment_id DESC";

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("payment_id") %></td>
    <td><%= rs.getInt("booking_id") %></td>
    <td><%= rs.getInt("equipment_id") %></td>
    <td><%= rs.getInt("renter_id") %></td>
    <td class="amount">₹ <%= String.format("%.2f", rs.getDouble("amount")) %></td>
    <td><%= rs.getString("payment_method") %></td>
    <td><%= rs.getDate("payment_date") %></td>
</tr>
<%
    }

    conn.close();
} catch(Exception e){
    out.println("<tr><td colspan='7' style='color:red;'>Error: " + e + "</td></tr>");
}
%>

</table>

</body>
</html>