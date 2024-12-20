<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
    body {
        background-image: url('backgroundlogin.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        font-family: Arial, sans-serif;
        position: relative;
    }

    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Lớp phủ màu đen với độ trong suốt 50% */
        z-index: -1;
    }

    .login-box {
        background: white;
        border: 1px solid #dee2e6;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        margin-top: 50px;
        opacity: 0;
        transform: translateY(-50px); /* Start with the form slightly above */
        transition: opacity 0.6s ease, transform 0.6s ease; /* Smooth transition */
    }

    .login-box.show {
        opacity: 1;
        transform: translateY(0); /* Form slides into place */
    }

    .login-box h2 {
        font-weight: bold;
        color: #343a40;
        margin-bottom: 20px;
    }

    .login-box h3 {
        color: #6c757d;
        font-weight: normal;
        margin-bottom: 20px;
    }

    .form-label {
        font-weight: bold;
        color: #495057;
    }

    .form-control {
        border-radius: 8px;
        border: 1px solid #ced4da;
        padding: 15px;
        font-size: 16px;
        margin-bottom: 15px;
        transition: border 0.3s ease, box-shadow 0.3s ease; /* Transition for inputs */
    }

    .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
    }

    .btn-primary {
        background-color: #0d6efd;
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 8px;
        transition: background-color 0.3s ease; /* Smooth hover effect */
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .alert {
        border-radius: 8px;
        margin-bottom: 15px;
    }

    .d-grid {
        margin-top: 15px;
    }
</style>
</head>
<body>

<div class="container">
    <div class="login-box mx-auto text-center" style="max-width: 400px;">
        <h2>Chào mừng đến Trang Chủ Câu Lạc Bộ Tin Học UED</h2>
        <h3>Xin vui lòng đăng nhập</h3>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <%
            String errorMessage = request.getParameter("error");
            if ("1".equals(errorMessage)) {
        %>
            <div class="alert alert-danger text-center" role="alert">
                Sai tên đăng nhập hoặc mật khẩu! Vui lòng thử lại.
            </div>
        <%
            }
        %>
        
        <!-- Form đăng nhập -->
        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <!-- Updated with label text -->
                <label for="username" class="form-label">Vui lòng nhập Tài khoản</label>
                <input type="text" class="form-control" name="name" placeholder="Tên đăng nhập" required id="username">
            </div>
            <div class="mb-3">
                <!-- Updated with label text -->
                <label for="password" class="form-label">Vui lòng nhập Mật khẩu</label>
                <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required id="password">
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Wait for the document to fully load before showing the login box with animation
    window.addEventListener('load', function() {
        document.querySelector('.login-box').classList.add('show');
    });
</script>
</body>
</html>
