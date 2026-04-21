<%@ page import="java.sql.*" %>

<%

String equipment_id = request.getParameter("equipment_id");
String user_id = request.getParameter("user_id");
String rating = request.getParameter("rating");
String comment = request.getParameter("comment");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer","root",""
);

PreparedStatement ps = conn.prepareStatement(
"INSERT INTO review(equipment_id,user_id,rating,comment,review_date) VALUES(?,?,?,?,CURDATE())"
);

ps.setInt(1,Integer.parseInt(equipment_id));
ps.setInt(2,Integer.parseInt(user_id));
ps.setInt(3,Integer.parseInt(rating));
ps.setString(4,comment);

ps.executeUpdate();

out.println("<h2>Review Submitted Successfully</h2>");
out.println("<a href='dashboard.jsp'>Back to Dashboard</a>");

conn.close();

}
catch(Exception e){
out.println(e);
}

%>