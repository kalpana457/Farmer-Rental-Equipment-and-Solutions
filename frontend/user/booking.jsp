<%@ page import="java.sql.*" %>

<%
String equipment_id = request.getParameter("equipment_id");
String renter_id = request.getParameter("renter_id");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
String total_cost = request.getParameter("total_cost");
String booking_status = request.getParameter("booking_status");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer","root",""
);

PreparedStatement ps = conn.prepareStatement(
"INSERT INTO rentalbooking(equipment_id,renter_id,start_date,end_date,total_cost,booking_status) VALUES (?,?,?,?,?,?)"
);

ps.setInt(1,Integer.parseInt(equipment_id));
ps.setInt(2,Integer.parseInt(renter_id));
ps.setString(3,start_date);
ps.setString(4,end_date);
ps.setDouble(5,Double.parseDouble(total_cost));
ps.setString(6,booking_status);

ps.executeUpdate();

out.println("<h2>Booking Successful</h2>");

conn.close();

}
catch(Exception e){
out.println(e);
}
%>