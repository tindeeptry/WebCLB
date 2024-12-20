<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Teachers" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm giáo viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('backgroundlogin.jpg'); /* Thay đường dẫn ảnh nếu có */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding-top: 30px;
        }

        .container {
            max-width: 450px;
            margin: auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.8);
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
        <h3>Thêm giáo viên</h3>

        <form action="giaovien" method="post">
            <div class="form-group">
                <label for="MaGV">Mã Giáo Viên</label>
                <input type="text" class="form-control" id="MaGV" name="MaGV" required>
            </div>

            <div class="form-group">
                <label for="TenGV">Tên Giáo Viên</label>
                <input type="text" class="form-control" id="TenGV" name="TenGV" required>
            </div>

            <div class="form-group">
                <label for="SDT">Số Điện Thoại</label>
                <input type="tel" class="form-control" id="SDT" name="SDT" required>
            </div>

            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" class="form-control" id="Email" name="email" required>
            </div>

            <div class="form-group">
                <label for="DOB">Ngày Sinh</label>
                <input type="date" class="form-control" id="DOB" name="DOB" required>
            </div>

            <input type="hidden" name="action" value="add">
            <button type="submit" class="btn">Thêm giáo viên</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>