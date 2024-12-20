<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/clb_tin_hoc";
    String dbUser = "root";
    String dbPassword = "Tien0610";

    List<String[]> clubs = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM HoatDong_CLB")) {
        while (rs.next()) {
            clubs.add(new String[]{rs.getString("MaHD"), rs.getString("TenHD"), rs.getString("NgayToChuc")});
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Hoạt động</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Danh sách Hoạt Động</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã Hoạt Động</th>
                <th>Tên Hoạt Động</th>
                <th>Ngày Tổ chức</th>
            </tr>
        </thead>
        <tbody>
            <% if (clubs.isEmpty()) { %>
                <tr>
                    <td colspan="3">Không có khoá học nào.</td>
                </tr>
            <% } else { %>
                <% for (String[] club : clubs) { %>
                    <tr>
                        <td><%= club[0] %></td>
                        <td><%= club[1] %></td>
                        <td><%= club[2] %></td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
    <a href="Login_home.jsp" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
