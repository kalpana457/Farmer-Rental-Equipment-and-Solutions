<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Equipments</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 20px; }
        .container { width: 95%; margin: auto; text-align: center; }
        .card { border: 1px solid #ddd; border-radius: 12px; width: 300px; padding: 15px; margin: 15px; display: inline-block; background: white; box-shadow: 0 4px 15px rgba(0,0,0,0.1); vertical-align: top; text-align: left; transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .img-container { width: 100%; height: 180px; background: #ececec; border-radius: 8px; overflow: hidden; margin-bottom: 12px; }
        img { width: 100%; height: 100%; object-fit: cover; }
        h3 { margin: 10px 0; color: #333; text-transform: capitalize; font-size: 20px; }
        p { margin: 6px 0; color: #555; font-size: 14px; }
        .status-available { color: #27ae60; font-weight: bold; font-size: 12px; }
        .status-rented { color: #e74c3c; font-weight: bold; font-size: 12px; }
        button { background: #27ae60; color: white; border: none; padding: 12px; cursor: pointer; border-radius: 6px; width: 100%; font-weight: bold; margin-top: 10px; font-size: 14px; }
        button:hover { background: #219150; }
        button:disabled { background: #bdc3c7; cursor: not-allowed; }
    </style>
</head>
<body>

<div class="container">
    <h2>Available Equipments</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer", "root", "");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM equipment");

            while(rs.next()) {
                String photoName = rs.getString("photo");
                photoName = (photoName == null || photoName.trim().isEmpty()) ? "default.jpg" : photoName.replace("images/", "");
                String status = rs.getString("availability_status");
                boolean isAvailable = (status != null && status.equalsIgnoreCase("Available"));
    %>
                <div class="card">
                    <div class="img-container">
                        <img src="../images/<%=photoName%>" onerror="this.src='https://via.placeholder.com/300x180?text=No+Image';">
                    </div>
                    <h3><%=rs.getString("name")%></h3>
                    <p><b>Rate / Day:</b> ₹<%=rs.getString("rental_rate_per_day")%></p>
                    <p><b>Status:</b> <span class="<%= isAvailable ? "status-available" : "status-rented" %>"><%= status %></span></p>

                    <form action="rent_form.jsp" method="get">
                        <input type="hidden" name="equipment_id" value="<%=rs.getInt("equipment_id")%>">
                        <input type="hidden" name="rate" value="<%=rs.getString("rental_rate_per_day")%>">
                        <button type="submit" <%= isAvailable ? "" : "disabled" %>>
                            <%= isAvailable ? "Rent Equipment" : "Unavailable" %>
                        </button>
                    </form>
                </div>
    <%
            }
            conn.close();
        } catch(Exception e) { out.println(e); }
    %>
</div>
</body>
</html>