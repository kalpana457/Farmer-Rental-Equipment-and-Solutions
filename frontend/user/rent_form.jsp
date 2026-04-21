<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Get Equipment ID and Rate from the URL parameters
    String eqId = request.getParameter("equipment_id");
    String rate = request.getParameter("rate");
    
    // 2. Get Renter ID from session (Assumes you set "user_id" during login)
    Object sessionUser = session.getAttribute("user_id");
    String renterId = (sessionUser != null) ? sessionUser.toString() : "";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Equipment</title>
    <style>
        body { font-family: Arial; background:#f4f6f8; display:flex; justify-content:center; align-items:center; height:100vh; margin:0; }
        .container { background:white; padding:30px; width:350px; border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.1); }
        h2 { text-align:center; color:#2c3e50; }
        label { font-weight:bold; margin-top:10px; display:block; }
        input { width:100%; padding:10px; margin-top:5px; border:1px solid #ccc; border-radius:5px; box-sizing: border-box; }
        button { width:100%; padding:12px; margin-top:20px; background:#27ae60; color:white; border:none; border-radius:6px; font-weight:bold; cursor:pointer; }
        input[readonly] { background-color: #eee; cursor: not-allowed; } /* Grays out the auto-filled boxes */
    </style>
    <script>
        function calculateDays(){
            var start = new Date(document.getElementById("start_date").value);
            var end = new Date(document.getElementById("end_date").value);
            var rate = parseFloat(document.getElementById("rate").value);

            if(start && end && end > start){
                var diff = end - start;
                var days = Math.ceil(diff / (1000*60*60*24));
                document.getElementById("no_of_days").value = days;
                document.getElementById("total_cost").value = (days * rate).toFixed(2);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Rent Equipment</h2>
    <form action="rent.jsp" method="post">
        <label>Equipment ID</label>
        <input type="text" name="equipment_id" value="<%= (eqId != null) ? eqId : "" %>" readonly>

        <label>Renter ID</label>
        <input type="text" name="renter_id" value="<%= renterId %>" required readonly>

        <label>Rate Per Day</label>
        <input type="text" id="rate" name="rate" value="<%= (rate != null) ? rate : "500" %>" readonly>

        <label>Start Date</label>
        <input type="date" id="start_date" name="start_date" onchange="calculateDays()" required>

        <label>End Date</label>
        <input type="date" id="end_date" name="end_date" onchange="calculateDays()" required>

        <label>Number of Days</label>
        <input type="text" id="no_of_days" name="no_of_days" readonly>

        <label>Total Cost</label>
        <input type="text" id="total_cost" name="total_cost" readonly>

        <button type="submit">Confirm Booking</button>
    </form>
</div>
</body>
</html>