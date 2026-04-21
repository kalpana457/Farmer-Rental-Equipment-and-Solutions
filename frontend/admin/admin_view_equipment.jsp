<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>All Equipment - Admin</title>

<style>
body { font-family: Arial; background:#f4f4f4; margin:0; padding:0; }

header {
background: linear-gradient(to right,#2e7d32,#66bb6a);
color:white;
text-align:center;
padding:20px;
font-size:28px;
font-weight:bold;
}

nav {
background:#333;
text-align:center;
padding:12px;
}

nav a {
color:white;
text-decoration:none;
margin:15px;
font-size:16px;
font-weight:bold;
}

nav a:hover { color:#90ee90; }

table {
width:90%;
margin:20px auto;
border-collapse:collapse;
}

th,td {
border:1px solid #ccc;
padding:10px;
text-align:center;
}

th {
background:#2e7d32;
color:white;
}

tr:hover { background:#f1f1f1; }

a.button{
text-decoration:none;
padding:5px 10px;
background:green;
color:white;
border-radius:5px;
}

a.button:hover{ background:darkgreen; }

.add-btn{
display:block;
width:200px;
margin:20px auto;
text-align:center;
padding:10px;
background:#2e7d32;
color:white;
text-decoration:none;
border-radius:6px;
font-weight:bold;
}

.add-btn:hover{
background:#1b5e20;
}

</style>
</head>

<body>

<header>All Equipment</header>

<nav>
<a href="admin_dashboard.html">Dashboard</a>
<a href="admin_logout.jsp">Logout</a>
</nav>

<h2 style="text-align:center;margin-top:20px;">Current Equipment List</h2>

<table>

<tr>
<th>Equipment ID</th>
<th>Name</th>
<th>Type</th>
<th>Brand</th>
<th>Model</th>
<th>Rental Rate/Day</th>
<th>Availability</th>
<th>Actions</th>
</tr>

<%
try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer","root","");

String sql="SELECT * FROM equipment ORDER BY equipment_id";

Statement st=conn.createStatement();

ResultSet rs=st.executeQuery(sql);

while(rs.next()){
%>

<tr>
<td><%= rs.getInt("equipment_id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("type") %></td>
<td><%= rs.getString("brand") %></td>
<td><%= rs.getString("model") %></td>
<td><%= rs.getString("rental_rate_per_day") %></td>
<td><%= rs.getString("availability_status") %></td>

<td>
<a class="button" href="admin_edit_equipment.jsp?equipment_id=<%= rs.getInt("equipment_id") %>">Edit</a>

<a class="button" href="admin_delete_equipment.jsp?equipment_id=<%= rs.getInt("equipment_id") %>">Delete</a>
</td>

</tr>

<%
}

rs.close();
st.close();
conn.close();

}catch(Exception e){

out.println("<tr><td colspan='8' style='color:red;'>"+e+"</td></tr>");

}
%>

</table>

<!-- ADD NEW EQUIPMENT BUTTON -->
<a class="add-btn" href="addEquipment.html">Add New Equipment</a>

</body>
</html>