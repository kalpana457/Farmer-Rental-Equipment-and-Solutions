<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Secure Payment</title>
    <style>
        body{
            font-family:'Segoe UI',Arial;
            background:linear-gradient(135deg,#27ae60,#2ecc71);
            margin:0;
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .container{
            background:white;
            padding:35px;
            width:380px;
            border-radius:12px;
            box-shadow:0 10px 25px rgba(0,0,0,0.15);
        }
        h2{
            text-align:center;
            margin-bottom:20px;
            color:#2c3e50;
        }
        label{
            font-weight:bold;
            display:block;
            margin-top:15px;
        }
        input,select{
            width:100%;
            padding:10px;
            margin-top:6px;
            border:1px solid #ccc;
            border-radius:6px;
        }
        button{
            width:100%;
            padding:12px;
            margin-top:20px;
            background:#27ae60;
            color:white;
            border:none;
            border-radius:6px;
            font-weight:bold;
            cursor:pointer;
        }
        button:hover{
            background:#219150;
        }
        .hidden{
            display:none;
        }
    </style>
</head>
<body>

<div class="container">

<h2>Secure Payment</h2>

<form action="payment_process.jsp" method="post">

    <!-- Hidden fields to pass rental info -->
    <input type="hidden" name="user_id" value="<%= request.getParameter("user_id") %>">
    <input type="hidden" name="rental_id" value="<%= request.getParameter("rental_id") %>">
    <input type="hidden" name="total_cost" value="<%= request.getParameter("amount") %>">

    <label>Total Amount</label>
    <input type="text" name="amount_display" value="₹ <%= request.getParameter("amount") %>" readonly>

    <label>Select Payment Method</label>
    <select id="method" name="payment_method" required>
        <option value="">Select</option>
        <option value="UPI">UPI</option>
        <option value="Credit Card">Credit Card</option>
        <option value="Debit Card">Debit Card</option>
        <option value="Cash">Cash</option>
    </select>

    <div id="upiBox" class="hidden">
        <label>Enter UPI ID</label>
        <input type="text" name="upi_id" placeholder="example@upi">
    </div>

    <div id="cardBox" class="hidden">
        <label>Card Number</label>
        <input type="text" name="card_number">
        <label>Expiry Date</label>
        <input type="month" name="expiry">
        <label>CVV</label>
        <input type="password" name="cvv">
    </div>

    <button type="submit">Pay Now</button>
</form>

</div>

<script>
    // Show/hide UPI or Card fields
    window.addEventListener('DOMContentLoaded', function() {
        document.getElementById('method').addEventListener('change', function() {
            document.getElementById('upiBox').style.display = this.value === 'UPI' ? 'block' : 'none';
            document.getElementById('cardBox').style.display = (this.value === 'Credit Card' || this.value === 'Debit Card') ? 'block' : 'none';
        });
    });
</script>

</body>
</html>