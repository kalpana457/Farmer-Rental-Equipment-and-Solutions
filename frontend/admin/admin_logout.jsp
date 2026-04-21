<%@ page language="java" %>
<%
    // Invalidate the admin session to log out
    session.invalidate();

    // Redirect to index.html under user folder
    response.sendRedirect("../user/index.html");
%>