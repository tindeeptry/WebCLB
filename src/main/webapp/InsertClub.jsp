<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Club" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm thông tin hoạt động</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        /* Body background and styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('backgroundlogin.jpg'); /* Add your image path here */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding-top: 30px;
        }

        /* Container styling */
        .container {
            max-width: 450px;
            margin: auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.8); /* Add transparency to the form */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
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
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <div class="container">
        <h3>Thêm hoạt động</h3>

        <form action="CLB" method="post">
            <div class="form-group">
                <label for="MaHD">Mã hoạt động</label>
                <input type="text" class="form-control" id="MaHD" name="MaHD" required>
            </div>

            <div class="form-group">
                <label for="TenHD">Tên hoạt động</label>
                <input type="text" class="form-control" id="TenHD" name="TenHD" required>
            </div>

            <div class="form-group">
                <label for="NgayToChuc">Ngày tổ chức</label>
                <input type="date" class="form-control" id="NgayToChuc" name="NgayToChuc" required>
            </div>

            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn">Thêm hoạt động</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
