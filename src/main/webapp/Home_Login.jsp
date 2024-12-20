<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Quản lý CLB Tin học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        header {
            background-image: url('cover-image.jpg'); /* Replace with your cover image */
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
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .dashboard-grid {
            margin-top: 50px;
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <%
                            if (username != null) {
                        %>
                            <a class="btn btn-primary me-2" href="#">Chào mừng <%= username %></a>
                        <%
                            } else {
                        %>
                            <a class="btn btn-primary" href="Login.jsp" role="button">Đăng nhập</a>
                        <%
                            }
                        %>
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
        <p>Hệ thống quản lý học viên, giáo viên và các khóa học của chúng tôi</p>
    </header>

    <!-- Dashboard Grid -->
    <div class="container dashboard-grid">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">Quản lý giáo viên</h5>
                        <p class="card-text">Xem và quản lý thông tin giáo viên trong hệ thống.</p>
                        <a href="/CLB_TIN_HOC/giaovien" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">Quản lý khóa học</h5>
                        <p class="card-text">Quản lý các khóa học hiện có trong CLB Tin Học.</p>
                        <a href="/CLB_TIN_HOC/khoahoc" class="btn btn-success">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">Hoạt động câu lạc bộ</h5>
                        <p class="card-text">Theo dõi và quản lý các hoạt động của CLB Tin Học.</p>
                        <a href="/CLB_TIN_HOC/CLB" class="btn btn-info">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-4 mt-3">
            <div class="col-md-4 mx-auto">
                <div class="card h-100 text-center">
                    <div class="card-body">
                        <h5 class="card-title">Đóng góp</h5>
                        <p class="card-text">Gửi ý kiến đóng góp và hỗ trợ phát triển hệ thống.</p>
                        <a href="/CLB_TIN_HOC/donggop" class="btn btn-warning">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<a href="ViewContacts.jsp" class="btn btn-secondary">Xem danh sách liên hệ</a>
	
    <!-- Footer -->
    <footer class="text-center mt-5">
        <p>&copy; 2024 CLB Tin Học - Đại học Sư phạm Đà Nẵng</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
