<!-- ViewContacts.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Contact.Contact" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách liên hệ - CLB Tin Học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Danh sách liên hệ</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Họ và tên</th>
                    <th>Email</th>
                    <th>Nội dung</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Lấy danh sách liên hệ từ application scope
                    List<Contact> contactList = (List<Contact>) application.getAttribute("contactList");
                    if (contactList != null && !contactList.isEmpty()) {
                        int index = 1;
                        for (Contact contact : contactList) {
                %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= contact.getName() %></td>
                    <td><%= contact.getEmail() %></td>
                    <td><%= contact.getMessage() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">Chưa có thông tin liên hệ nào.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="Home_Login.jsp" class="btn btn-primary mt-3">Quay lại trang chủ</a>
    </div>
</body>
</html>