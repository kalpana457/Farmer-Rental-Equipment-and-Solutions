<%@ page import="java.sql.*" %>
<%
    String equipment_id = request.getParameter("equipment_id");
    String message = "";

    if(request.getMethod().equalsIgnoreCase("POST")){
        // Form submitted - update the equipment
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String rental_rate = request.getParameter("rental_rate_per_day");
        String availability = request.getParameter("availability_status");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE equipment SET name=?, type=?, brand=?, model=?, rental_rate_per_day=?, availability_status=? WHERE equipment_id=?"
            );

            ps.setString(1, name);
            ps.setString(2, type);
            ps.setString(3, brand);
            ps.setString(4, model);
            ps.setString(5, rental_rate);
            ps.setString(6, availability);
            ps.setInt(7, Integer.parseInt(equipment_id));

            ps.executeUpdate();
            message = "Equipment updated successfully!";
            ps.close();
            conn.close();
        } catch(Exception e){
            message = "Error: " + e.getMessage();
        }
    }

    // Fetch existing equipment details
    String name="", type="", brand="", model="", rental_rate="", availability="";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM equipment WHERE equipment_id=?");
        ps.setInt(1, Integer.parseInt(equipment_id));
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("name");
            type = rs.getString("type");
            brand = rs.getString("brand");
            model = rs.getString("model");
            rental_rate = rs.getString("rental_rate_per_day");
            availability = rs.getString("availability_status");
        }
        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e){
        message = "Error fetching equipment: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Equipment</title>
    <style>
        body { font-family: Arial; background:#f4f4f4; margin:0; padding:0; }
        .container { width: 500px; margin:auto; margin-top:50px; background:white; padding:25px; border-radius:8px; box-shadow:0 0 10px gray; }
        h2 { text-align:center; color:#2e7d32; }
        input { width:100%; padding:10px; margin:8px 0; }
        button { width:100%; padding:10px; background:green; color:white; border:none; font-size:16px; }
        button:hover { background:darkgreen; }
        .message { text-align:center; color:blue; font-weight:bold; }
        a { text-decoration:none; display:block; text-align:center; margin-top:10px; color:#2e7d32; font-weight:bold; }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Equipment</h2>
    <div class="message"><%= message %></div>

    <form method="post">
        <label>Name</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label>Type</label>
        <input type="text" name="type" value="<%= type %>" required>

        <label>Brand</label>
        <input type="text" name="brand" value="<%= brand %>" required>

        <label>Model</label>
        <input type="text" name="model" value="<%= model %>" required>

        <label>Rental Rate Per Day</label>
        <input type="text" name="rental_rate_per_day" value="<%= rental_rate %>" required>

        <label>Availability Status</label>
        <input type="text" name="availability_status" value="<%= availability %>" required>

        <button type="submit">Update Equipment</button>
    </form>

    <a href="admin_view_equipment.jsp">Back to Equipment List</a>
</div>

</body>
</html>