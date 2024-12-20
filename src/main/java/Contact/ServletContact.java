package Contact;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ServletContact")
public class ServletContact extends HttpServlet {
    // Sử dụng danh sách tĩnh để lưu các liên hệ
    private static final List<Contact> contactList = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        // Lấy thông tin từ form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Tạo đối tượng Contact và thêm vào danh sách
        Contact contact = new Contact(name, email, message);
        synchronized (contactList) {
            contactList.add(contact);
        }

        // Lưu danh sách liên hệ vào application scope để admin có thể truy cập
        getServletContext().setAttribute("contactList", contactList);

        // Chuyển hướng người dùng tới trang xác nhận
        response.sendRedirect("confirm.jsp");
    }
}
