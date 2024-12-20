<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Class" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách lớp học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        table {
            margin-top: 20px;
        }
        .btn-custom {
            margin: 0 5px;
        }
    </style>
    <script>
        function confirmLogout() {
            const confirmed = confirm("Bạn chắc chắn muốn đăng xuất?");
            if (confirmed) {
                window.location.href = "Home.jsp";
            }
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="Home_Login.jsp">
                <img src="logotin.png" alt="CLB Tin Học" width="115" height="35" class="me-2">
                <span>CLB Tin Học</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <%
                            if (username != null) {
                        %>
                            <a class="btn btn-primary me-2" href="#" role="button">Chào mừng <%= username %></a>
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

    <div class="container mt-4">
        <h2 class="text-center">Danh sách Lớp</h2>
        <table class="table table-striped table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Mã lớp</th>
                    <th>Tên lớp</th>
                    <th>Mã Khoá Học</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Class> classList = (List<Class>) request.getAttribute("classList");
                if (classList != null && !classList.isEmpty()) {
                    for (Class clas : classList) {
                %>
                <tr>
                    <td><%= clas.getMaLop() %></td>
                    <td><%= clas.getTenLop() %></td>
                    <td><%= clas.getMaKH() %></td>
                    <td>
                        <form action="editClass.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="MaLop" value="<%= clas.getMaLop() %>">
                            <button type="submit" class="btn btn-warning btn-sm btn-custom">Sửa</button>
                        </form>
                        <form action="lop" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="MaLop" value="<%= clas.getMaLop() %>">
                            <button type="submit" class="btn btn-danger btn-sm btn-custom">Xóa</button>
                        </form>
                        <form action="hocvien" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="select">
                            <input type="hidden" name="MaLop" value="<%= clas.getMaLop() %>">
                            <button type="submit" class="btn btn-info btn-sm btn-custom">Xem chi Tiết</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">Không có dữ liệu</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <h2 class="text-center mt-5">Thêm mới Lớp</h2>
        <div class="text-center">
            <form action="InsertClass.jsp" method="get">
                <button type="submit" class="btn btn-success">Thêm Hoạt động</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
