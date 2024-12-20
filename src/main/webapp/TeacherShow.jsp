<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.Teachers" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Giáo viên</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="Home_Login.jsp">CLB Tin Học</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="nav-link">Chào mừng, <%= username %></span>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-danger btn-sm" onclick="confirmLogout()">Đăng xuất</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Danh sách Giáo viên</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã GV</th>
                    <th>Họ tên</th>
                    <th>SĐT</th>
                    <th>Email</th>
                    <th>Ngày sinh</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
            <% 
            List<Teachers> teacherList = (List<Teachers>) request.getAttribute("teacherList");
            if (teacherList != null && !teacherList.isEmpty()) {
                for (Teachers teacher : teacherList) { 
            %>
                <tr>
                    <td><%= teacher.getMaGV() %></td>
                    <td><%= teacher.getTenGV() %></td>
                    <td><%= teacher.getSDT() %></td>
                    <td><%= teacher.getEmail() %></td>
                    <td><%= teacher.getDOB() %></td>
                    <td>
                        <form action="EditTeacher.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="MaGV" value="<%= teacher.getMaGV() %>">
                            <input type="submit" class="btn btn-primary btn-sm" value="Sửa">
                        </form>
                        <form action="giaovien" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="MaGV" value="<%= teacher.getMaGV() %>">
                            <input type="submit" class="btn btn-danger btn-sm" value="Xóa">
                        </form>
                    </td>
                </tr>
            <% 
                }
            } else { 
            %>
                <tr>
                    <td colspan="6" class="text-center">Không có dữ liệu</td>
                </tr>
            <% 
            } 
            %>
            </tbody>
        </table>

        <h2>Thêm mới Giáo viên</h2>
        <a href="InsertTeacher.jsp" class="btn btn-success">Thêm Giáo viên</a>
    </div>

</body>
</html>