<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%

String name = request.getParameter("name");
String type = request.getParameter("type");
String brand = request.getParameter("brand");
String model = request.getParameter("model");
String description = request.getParameter("description");
String rental_rate_per_day = request.getParameter("rental_rate_per_day");

String availability_status = request.getParameter("availability_status");
String photo = request.getParameter("photo");

Connection con = null;
PreparedStatement ps = null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer",
"root",
""
);

String sql = "INSERT INTO equipment (name,type,brand,model,description,rental_rate_per_day,availability_status,photo) VALUES (?,?,?,?,?,?,?,?)";

ps = con.prepareStatement(sql);

ps.setString(1,name);
ps.setString(2,type);
ps.setString(3,brand);
ps.setString(4,model);
ps.setString(5,description);
ps.setDouble(6,Double.parseDouble(rental_rate_per_day));

ps.setString(7,availability_status);
ps.setString(8,photo);

int result = ps.executeUpdate();

if(result>0){


response.sendRedirect("../user/view_equipment.jsp");
}

}
catch(Exception e){

out.println("<h3 style='color:red;text-align:center;'>Error : "+e.getMessage()+"</h3>");

}

finally{

if(ps!=null) ps.close();
if(con!=null) con.close();

}

%>