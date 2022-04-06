package controller.account;

import DAO.UserDao;
import JPAUtils.EncryptUtil;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    public LoginServlet() {
        this.userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("view","/views/account/info/login.jsp");
        request.getRequestDispatcher("/views/account/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");
        User user = this.userDao.findByEmail(email);
        boolean check = EncryptUtil.check(pwd, user.getPassword());
        if (check == true) {
            // Đăng nhập thành công
            session.setAttribute("user", user);
            response.sendRedirect("/User");
        } else {
            // Đăng nhập thất bại
            response.sendRedirect("/Product");
        }

    }
}
