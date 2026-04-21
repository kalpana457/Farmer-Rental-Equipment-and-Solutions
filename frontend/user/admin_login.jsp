<%@ page import="java.sql.*" %>

<%
Connection conn = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/farmer",
        "root",
        ""
    );

    // Check if admin exists
    Statement st = conn.createStatement();
    ResultSet rsCheck = st.executeQuery("SELECT COUNT(*) AS count FROM adminlogin");

    if(rsCheck.next() && rsCheck.getInt("count") == 0){
        st.executeUpdate("INSERT INTO adminlogin(username,password) VALUES('admin','admin123')");
    }

    // Login check
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(username != null && password != null){

        PreparedStatement ps = conn.prepareStatement(
        "SELECT * FROM adminlogin WHERE username=? AND password=?");

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            response.sendRedirect("../admin/admin_dashboard.html");
        } 
        else{
            out.println("<h3 style='color:red;text-align:center;'>Invalid Username or Password</h3>");
        }

        rs.close();
        ps.close();
    }

    st.close();
    conn.close();

} 
catch(Exception e){
    out.println("<p style='color:red;'>"+e+"</p>");
}
%>