<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.Contribution" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String username = "root";
    String password = "Tien0610";

    String MaXH = request.getParameter("MaXH");
    Contribution ctb = null;

    try (Connection connection = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = connection.prepareStatement("SELECT * FROM XepHang_TichCuc WHERE MaXH = ?")) {
        stmt.setString(1, MaXH);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                ctb = new Contribution(
                    rs.getString("MaXH"),
                    rs.getString("MaSV"),
                    rs.getInt("SoHoatDong")
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
    <title>Chỉnh sửa đóng góp</title>
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

        .btn-secondary {
            width: 100%;
            padding: 10px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Chỉnh sửa đóng góp</h2>

        <form action="donggop" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="MaXH" value="<%= ctb != null ? ctb.getMaXH() : "" %>">

            <div class="form-group">
                <label for="MaSV">Mã sinh viên</label>
                <input type="text" class="form-control" id="MaSV" name="MaSV" value="<%= ctb != null ? ctb.getMaSV() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="SoHoatDong">Số hoạt động</label>
                <input type="number" class="form-control" id="SoHoatDong" name="SoHoatDong" value="<%= ctb != null ? ctb.getSoHoatDong() : "" %>" required>
            </div>

            <button type="submit" class="btn">Cập nhật</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
