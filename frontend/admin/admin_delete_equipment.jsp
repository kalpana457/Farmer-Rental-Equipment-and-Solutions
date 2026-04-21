<%@ page import="java.sql.*" %>

<%
String equipment_id = request.getParameter("equipment_id");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer",
"root",
""
);

// First delete booking records
PreparedStatement ps1 = conn.prepareStatement(
"DELETE FROM rentalbooking WHERE equipment_id=?"
);

ps1.setInt(1, Integer.parseInt(equipment_id));
ps1.executeUpdate();

// Then delete equipment
PreparedStatement ps2 = conn.prepareStatement(
"DELETE FROM equipment WHERE equipment_id=?"
);

ps2.setInt(1, Integer.parseInt(equipment_id));
ps2.executeUpdate();

ps1.close();
ps2.close();
conn.close();

response.sendRedirect("admin_view_equipment.jsp");

}catch(Exception e){
out.println("Error: "+e);
}
%>