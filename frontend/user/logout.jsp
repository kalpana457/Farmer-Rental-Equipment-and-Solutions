<%@ page language="java" %>
<%
    // Invalidate the current session to log out the user
    session.invalidate();

    // Redirect back to the login page
    response.sendRedirect("index.html");
%>