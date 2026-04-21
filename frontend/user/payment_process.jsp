<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String user_id = request.getParameter("user_id");
String rental_id = request.getParameter("rental_id");
String total_cost = request.getParameter("total_cost");
String payment_method = request.getParameter("payment_method");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/farmer", "root", ""
    );

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO payment(user_id, rental_id, amount, payment_method, payment_date) VALUES (?, ?, ?, ?, CURDATE())"
    );

    ps.setInt(1, Integer.parseInt(user_id));
    ps.setInt(2, Integer.parseInt(rental_id));
    ps.setDouble(3, Double.parseDouble(total_cost));
    ps.setString(4, payment_method);

    ps.executeUpdate();
    conn.close();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <style>
    body{
        font-family:Arial;
        background:#f4f4f4;
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
    }
    .box{
        background:white;
        padding:40px;
        text-align:center;
        border-radius:10px;
        box-shadow:0 5px 15px rgba(0,0,0,0.2);
    }
    h2{color:#27ae60;}
    a{
        display:inline-block;
        margin-top:20px;
        padding:10px 20px;
        background:#27ae60;
        color:white;
        text-decoration:none;
        border-radius:5px;
    }
    a:hover{background:#219150;}
    </style>
</head>
<body>
<div class="box">
<h2>Payment Successful ✅</h2>
<p>Your equipment has been booked and payment recorded.</p>
<a href="view_equipment.jsp">Back to Equipment</a>
</div>
</body>
</html>

<%
} catch(Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e + "</h3>");
}
%>