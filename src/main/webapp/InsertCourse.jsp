<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Courses" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sinh viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        /* Body background and styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('backgroundlogin.jpg'); /* Replace with your image path */
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
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
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
    </style>
</head>
<body>

    <div class="container">
        <h3>Thêm khoá học</h3>

        <form action="khoahoc" method="post">
            <div class="form-group">
                <label for="MaKH">Mã khóa học</label>
                <input type="text" class="form-control" id="MaKH" name="MaKH" required>
            </div>

            <div class="form-group">
                <label for="TenKH">Tên khóa học</label>
                <input type="text" class="form-control" id="TenKH" name="TenKH" required>
            </div>

            <div class="form-group">
                <label for="NgayBatDau">Ngày bắt đầu</label>
                <input type="date" class="form-control" id="NgayBatDau" name="NgayBatDau_N_H" required>
            </div>

            <div class="form-group">
                <label for="NgayKetThuc">Ngày kết thúc</label>
                <input type="date" class="form-control" id="NgayKetThuc" name="NgayKetThuc_N_H" required>
            </div>

            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn">Thêm khoá học</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
