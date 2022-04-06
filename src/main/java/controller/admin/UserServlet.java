package controller.admin;

import DAO.UserDao;
import JPAUtils.EncryptUtil;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/store", "/edit", "/update", "/delete", "/User"})
public class UserServlet extends HttpServlet {
    private UserDao dao;

    public UserServlet() {
        this.dao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("User")) {
            this.create(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("store")) {
            this.store(request, response);
        } else if (uri.contains("update")) {
            this.update(request, response);
        } else if (uri.contains("edit")) {
            this.edit(request, response);
        } else if (uri.contains("delete")) {
            this.delete(request, response);
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> list = this.dao.all();
        request.setAttribute("ds", list);
        request.setAttribute("view", "/views/admin/user/create.jsp");
        request.setAttribute("view1", "/views/admin/user/table.jsp");
        request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);
    }


    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User before = this.dao.findByID(id);
            User entity = new User();
            BeanUtils.populate(entity, request.getParameterMap());
            entity.setPassword(before.getPassword());
            entity.setStatus(before.getStatus());
            this.dao.update(entity);
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/edit");
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        try {
            int id = Integer.parseInt(s);
            User entity = this.dao.findByID(id);
            BeanUtils.populate(entity, request.getParameterMap());
            entity.setStatus(false);
            this.dao.update(entity);
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/delete");
        }
    }

    protected void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User entity = new User();
        List<User> list = new ArrayList<>();
        try {
            BeanUtils.populate(entity, request.getParameterMap());
            String encrypted = EncryptUtil.encrypt(request.getParameter("password"));
            entity.setStatus(true);
            entity.setPassword(encrypted);
            this.dao.create(entity);
            session.setAttribute("message", "Them Moi Thanh Cong");
            list.add(entity);
            request.setAttribute("ds", list);
            List<User> all = this.dao.all();
            request.setAttribute("ds", all);
            response.sendRedirect("/User");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Them Moi That Bai");
        }

    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        User entity = this.dao.findByID(id);
        request.setAttribute("user", entity);
        List<User> list = this.dao.all();
        request.setAttribute("ds", list);
        request.setAttribute("view", "/views/admin/user/edit.jsp");
        request.setAttribute("view1", "/views/admin/user/table.jsp");
        request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);

    }
}
