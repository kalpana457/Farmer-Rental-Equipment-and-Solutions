<!DOCTYPE html>
<html>

<head>
<title>Farmer Dashboard</title>

<style>

body{
font-family:Arial, sans-serif;
margin:0;
background:#f2f6f9;
}

/* Header */

.header{
background:linear-gradient(90deg,#2e8b57,#3cb371);
color:white;
padding:25px;
text-align:center;
}

.header h1{
margin:0;
}

/* Navigation */

.nav{
background:#333;
padding:15px;
text-align:center;
}

.nav a{
color:white;
text-decoration:none;
margin:20px;
font-size:17px;
}

.nav a:hover{
color:#00ff99;
}

/* Container */

.container{
padding:40px;
display:flex;
flex-wrap:wrap;
justify-content:center;
gap:30px;
}

/* Cards */

.card{
width:240px;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.1);
text-align:center;
transition:0.3s;
}

.card:hover{
transform:translateY(-8px);
box-shadow:0 10px 20px rgba(0,0,0,0.2);
}

/* Icons */

.icon{
font-size:40px;
margin-bottom:10px;
}

/* Card Links */

.card a{
text-decoration:none;
font-size:18px;
color:#2e8b57;
font-weight:bold;
}


</style>

</head>

<body>

<div class="header">
<h1>Farmer Rental Equipment Dashboard</h1>
<p>Welcome to Farmer Rental Equipment and Solutions</p>
</div>

<div class="nav">
<a href="index.html">Home</a>
<a href="logout.jsp">Logout</a>
</div>

<div class="container">

<div class="card">
<h3>View Equipment</h3>
<p>Browse available farming machines</p>
<a href="view_equipment.jsp">Open</a>
</div>

<div class="card">
<h3>Book Equipment</h3>
<p>Rent tractors and farming tools</p>
<a href="rent_form.jsp">Open</a>
</div>

<div class="card">
<h3>Make Payment</h3>
<p>Pay for your equipment rental</p>
<a href="payment.jsp">Open</a>
</div>


<div class="card">
<h3>Write Review</h3>
<p>Share feedback about equipment</p>
<a href="review.html">Open</a>
</div>

</div>



</body>
</html>