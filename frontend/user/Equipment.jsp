<%@ page import="java.sql.*" %>

<%

String owner_id = request.getParameter("owner_id");
String name = request.getParameter("name");
String type = request.getParameter("type");
String brand = request.getParameter("brand");
String model = request.getParameter("model");
String description = request.getParameter("description");
String rental_rate_per_day = request.getParameter("rental_rate_per_day");
String purchase_price = request.getParameter("purchase_price");
String availability_status = request.getParameter("availability_status");
String location = request.getParameter("location");
String condition = request.getParameter("condition");
String photo = request.getParameter("photo");

Connection conn = null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer",
"root",
""
);

PreparedStatement ps = conn.prepareStatement(
"INSERT INTO equipment(owner_id,name,type,brand,model,description,rental_rate_per_day,purchase_price,availability_status,location,`condition`,photo) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"
);

ps.setInt(1, Integer.parseInt(owner_id));
ps.setString(2, name);
ps.setString(3, type);
ps.setString(4, brand);
ps.setString(5, model);
ps.setString(6, description);
ps.setDouble(7, Double.parseDouble(rental_rate_per_day));
ps.setDouble(8, Double.parseDouble(purchase_price));
ps.setString(9, availability_status);
ps.setString(10, location);
ps.setString(11, condition);
ps.setString(12, photo);

int result = ps.executeUpdate();

ps.close();
conn.close();

if(result > 0){
response.sendRedirect("admin_view_equipment.jsp");
}else{
out.println("Failed to add equipment");
}

}
catch(Exception e){
out.println("Error: " + e);
}

%>