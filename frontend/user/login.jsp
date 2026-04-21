<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");

    PreparedStatement ps = conn.prepareStatement(
        "SELECT * FROM userregistration WHERE email=? AND password=?"
    );
    ps.setString(1, email);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        // Use the built-in session object
        session.setAttribute("user_id", rs.getInt("user_id"));
        session.setAttribute("name", rs.getString("name"));
        session.setAttribute("role", rs.getString("role"));

        response.sendRedirect("dashboard.jsp");
    } else {
        out.println("<p style='color:red;text-align:center;'>Invalid Email or Password</p>");
    }

    conn.close();

} catch(Exception e){
    out.println("Error: "+e);
}

%>