<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chính - CLB Tin Học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        header {
            background-image: url('cover-image.jpg'); /* Thay 'cover-image.jpg' bằng đường dẫn ảnh bìa của bạn */
            background-size: cover;
            background-position: center;
            padding: 150px 0;
            color: white;
            text-align: center;
        }
        header h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
        header p {
            font-size: 1.25rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }
    </style>
    <script>
        // Xử lý nút đăng xuất
        function confirmLogout() {
            const confirmed = confirm("Bạn chắc chắn muốn đăng xuất?");
            if (confirmed) {
                window.location.href = "Home.jsp";
            }
        }
    </script>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="logotin.png" alt="CLB Tin Học" width="115" height="35" class="me-2">
            <span>CLB Tin Học</span>
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="btn btn-primary me-2" href="#" role="button">Chào mừng <%= username %></a>
                </li>
                <li class="nav-item">
                    <button class="btn btn-danger" onclick="confirmLogout()">Đăng xuất</button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Cover Section -->
<header>
    <h1>Chào mừng đến với CLB Tin Học</h1>
    <p>Hệ thống quản lý học viên, giáo viên và các khoá học</p>
</header>

<!-- Main Content -->
<div class="container">
    <h1 class="text-center">Xin chào, <%= username %>!</h1>
    <p class="text-center">Vai trò của bạn: <strong><%= role %></strong></p>
    <p class="text-center">Chào mừng bạn đến với hệ thống quản lý CLB Tin Học.</p>

    <div class="row text-center">
        <div class="col-md-4">
            <a href="ViewCourses.jsp" class="btn btn-primary btn-custom btn-lg">Xem các khoá học</a>
        </div>
        <div class="col-md-4">
            <a href="ViewTeachers.jsp" class="btn btn-secondary btn-custom btn-lg">Xem giáo viên</a>
        </div>
        <div class="col-md-4">
            <a href="ViewClasses.jsp" class="btn btn-secondary btn-custom btn-lg">Xem lớp</a>
        </div>
    </div>

    <div class="row text-center mt-3">
        <div class="col-md-4">
            <a href="ViewStudents.jsp" class="btn btn-secondary btn-custom btn-lg">Xem sinh viên</a>
        </div>
        <div class="col-md-4">
            <a href="ViewActivities.jsp" class="btn btn-secondary btn-custom btn-lg">Xem hoạt động</a>
        </div>
        <div class="col-md-4">
            <a href="ViewScores.jsp" class="btn btn-secondary btn-custom btn-lg">Xem điểm</a>
        </div>
    </div>

    <div class="row text-center mt-3">
        <div class="col-md-4 mx-auto">
            <a href="ViewCtb.jsp" class="btn btn-secondary btn-custom btn-lg">Xem đóng góp</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center mt-5">
    <p>&copy; 2024 CLB Tin Học - Đại học Sư phạm Đà Nẵng</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
