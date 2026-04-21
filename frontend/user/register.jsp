<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String phone = request.getParameter("phone");
String city = request.getParameter("city");
String address = request.getParameter("address");
String farm_location = request.getParameter("farm_location");
String role = request.getParameter("role");

Connection conn = null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer",
"root",
""
);

PreparedStatement ps = conn.prepareStatement(
"INSERT INTO userregistration(name,email,password,phone,city,address,farm_location,role) VALUES (?,?,?,?,?,?,?,?)"
);

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,password);
ps.setString(4,phone);
ps.setString(5,city);
ps.setString(6,address);
ps.setString(7,farm_location);
ps.setString(8,role);

ps.executeUpdate();

out.println("<h3>Registration Successful</h3>");
out.println("<a href='login.html'>Click here to Login</a>");

}
catch(Exception e){
out.println(e);
}
%>