<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Receive data from the form
    String equipment_id = request.getParameter("equipment_id");
    String renter_id = request.getParameter("renter_id");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    String no_of_days = request.getParameter("no_of_days");
    String total_cost = request.getParameter("total_cost");

    if(equipment_id != null && renter_id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");

            // Insert into rentalbooking table
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO rentalbooking(equipment_id, renter_id, start_date, end_date, no_of_days, total_cost) VALUES(?,?,?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, Integer.parseInt(equipment_id));
            ps.setInt(2, Integer.parseInt(renter_id));
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setInt(5, Integer.parseInt(no_of_days));
            ps.setDouble(6, Double.parseDouble(total_cost));

            ps.executeUpdate();
            
            // Get the unique booking ID to pass to payment
            ResultSet rs = ps.getGeneratedKeys();
            int bookingId = rs.next() ? rs.getInt(1) : 0;
            conn.close();

            // Redirect to payment with the generated ID
            response.sendRedirect("payment.jsp?rental_id=" + bookingId + "&amount=" + total_cost + "&user_id=" + renter_id);

        } catch(Exception e) {
            out.println("<h3 style='color:red;'>Error saving booking: " + e.getMessage() + "</h3>");
        }
    }
%>