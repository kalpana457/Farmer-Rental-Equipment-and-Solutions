<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/farmer", "root", ""
    );

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO contact(name, email, subject, message, contact_date) VALUES(?,?,?,?,CURDATE())"
    );
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, subject);
    ps.setString(4, message);

    ps.executeUpdate();
    conn.close();

    // Redirect to thank you page
    response.sendRedirect("contact_success.html");

} catch(Exception e) {
    out.println("<p style='color:red;'>Error: "+e+"</p>");
}
%>