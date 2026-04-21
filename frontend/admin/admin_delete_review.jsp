<%@ page import="java.sql.*" %>

<%

String id = request.getParameter("id");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/farmer","root",""
);

PreparedStatement ps = conn.prepareStatement(
"DELETE FROM review WHERE review_id=?"
);

ps.setInt(1,Integer.parseInt(id));

ps.executeUpdate();

conn.close();

/* Redirect back to review page */

response.sendRedirect("admin_manage_reviews.jsp");

}

catch(Exception e){
out.println("Error: "+e);
}

%>