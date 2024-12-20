<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Score" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Điểm Sinh Viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        table {
            margin-top: 20px;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .btn-custom {
            margin: 0 5px;
        }
        .no-data {
            color: gray;
            text-align: center;
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
        <h2 class="text-center">Danh Sách Điểm Sinh Viên</h2>
       <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-primary"> 
                <tr>
                    <th>Mã lớp môn học</th>
                    <th>Mã lớp</th>
                    <th>Mã môn học</th>
                    <th>Mã sinh viên</th>
                    <th>Điểm</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Score> scoreList = (List<Score>) request.getAttribute("scoreList");
                if (scoreList != null && !scoreList.isEmpty()) {
                    for (Score score : scoreList) {
                %>
                <tr>
                    <td><%= score.getMaLopMonHoc() %></td>
                    <td><%= score.getMaLop() %></td>
                    <td><%= score.getMaMH() %></td>
                    <td><%= score.getMaSV() %></td>
                    <td><%= score.getDiem() %></td>
                    <td>
                        <form action="EditScore.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="MaLopMonHoc" value="<%= score.getMaLopMonHoc() %>">
                            <button type="submit" class="btn btn-warning btn-sm btn-custom">Sửa</button>
                        </form>
                        <form action="diem" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="MaLopMonHoc" value="<%= score.getMaLopMonHoc() %>">
                            <button type="submit" class="btn btn-danger btn-sm btn-custom">Xóa</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="no-data">Không có dữ liệu</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <div class="text-center mt-5">
            <h3>Thêm điểm mới</h3>
            <form action="InsertScore.jsp" method="get">
                <button type="submit" class="btn btn-success">Thêm điểm</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
