<%@ page import="java.sql.*" %>

<%
String booking_id = request.getParameter("booking_id");

if(booking_id!=null){

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer","root",""
);

PreparedStatement ps = conn.prepareStatement(
"DELETE FROM rentalbooking WHERE booking_id=?"
);

ps.setInt(1, Integer.parseInt(booking_id));

int result = ps.executeUpdate();

if(result>0){
response.sendRedirect("admin_manage_booking.jsp");
}else{
out.println("<h3 style='color:red;text-align:center;'>Booking ID not found.</h3>");
}

conn.close();

}catch(Exception e){
out.println("Error: "+e);
}

}else{
out.println("Invalid Booking ID");
}
%>
