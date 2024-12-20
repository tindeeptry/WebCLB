<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Club" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaHD = request.getParameter("MaHD");
    Club club = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM HoatDong_CLB WHERE MaHD = ?")) {
        stmt.setString(1, MaHD);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                club = new Club(
                    rs.getString("MaHD"),
                    rs.getString("TenHD"),
                    rs.getString("NgayToChuc")
                );
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa Hoạt động CLB</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('backgroundlogin.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding-top: 30px;
        }

        .container {
            max-width: 450px;
            margin: auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group input:focus {
            border-color: #0d6efd;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Chỉnh sửa Hoạt động CLB</h2>

        <form action="CLB" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="MaHD" value="<%= club != null ? club.getMaHD() : "" %>">

            <div class="form-group">
                <label for="TenHD">Tên hoạt động</label>
                <input type="text" class="form-control" id="TenHD" name="TenHD" value="<%= club != null ? club.getTenHD() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="NgayToChuc">Ngày tổ chức</label>
                <input type="date" class="form-control" id="NgayToChuc" name="NgayToChuc" value="<%= club != null ? club.getNgayToChuc() : "" %>" required>
            </div>

            <button type="submit" class="btn">Cập nhật</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
  