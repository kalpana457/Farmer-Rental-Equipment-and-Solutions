<%@ page import="java.sql.*" %>
<%
String bookingId = request.getParameter("booking_id");
int equipmentId = 0;
int renterId = 0;
String startDate = "";
String endDate = "";
int noOfDays = 0;
double rentalRate = 0;
double totalCost = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM rentalbooking rb JOIN equipment e ON rb.equipment_id=e.equipment_id WHERE booking_id=?");
    ps.setInt(1, Integer.parseInt(bookingId));
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        equipmentId = rs.getInt("equipment_id");
        renterId = rs.getInt("renter_id");
        startDate = rs.getString("start_date");
        endDate = rs.getString("end_date");
        noOfDays = rs.getInt("no_of_days");
        totalCost = rs.getDouble("total_cost");
        rentalRate = rs.getDouble("rental_rate_per_day"); // Assuming equipment table has this
    }
    conn.close();
} catch(Exception e){
    out.println("<h3 style='color:red;'>Error: "+e+"</h3>");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Booking</title>
    <style>
        body{font-family:Arial; background:#f4f4f4; padding:20px;}
        .container{background:white; max-width:500px; margin:auto; padding:20px; border-radius:10px; box-shadow:0 5px 15px rgba(0,0,0,0.2);}
        input, select{width:100%; padding:10px; margin:10px 0; border-radius:5px; border:1px solid #ccc;}
        button{padding:12px 20px; background:#2e7d32; color:white; border:none; border-radius:6px; cursor:pointer;}
        button:hover{background:#1b5e20;}
    </style>
    <script>
        var rentalRate = parseFloat('<%= rentalRate %>') || 0;

        function calculateTotal(){
            var days = parseInt(document.getElementById("no_of_days").value) || 0;
            var total = days * rentalRate;
            document.getElementById("total_cost").value = total.toFixed(2);
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Update Booking Details</h2>
    <form method="post" action="admin_update_booking_process.jsp">
        <input type="hidden" name="booking_id" value="<%= bookingId %>">
        <input type="hidden" name="equipment_id" value="<%= equipmentId %>">
        <input type="hidden" name="renter_id" value="<%= renterId %>">

        <label>Start Date</label>
        <input type="date" name="start_date" value="<%= startDate %>">

        <label>End Date</label>
        <input type="date" name="end_date" value="<%= endDate %>">

        <label>No of Days</label>
        <input type="number" name="no_of_days" id="no_of_days" value="<%= noOfDays %>" oninput="calculateTotal()">

        <label>Total Cost</label>
        <input type="text" name="total_cost" id="total_cost" value="<%= totalCost %>" readonly>

        <button type="submit">Update Booking</button>
    </form>
</div>
</body>
</html>