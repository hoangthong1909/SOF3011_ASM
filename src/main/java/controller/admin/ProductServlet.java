package controller.admin;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.UserDao;
import JPAUtils.FileUtil;
import entity.Category;
import entity.Product;
import entity.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
@MultipartConfig
@WebServlet({"/Product", "/storeProduct", "/updateProduct", "/deleteProduct", "/editProduct"})
public class ProductServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO dao;

    public ProductServlet() {
        this.dao = new ProductDAO();
        this.categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("Product")) {
            this.create(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("updateProduct")) {
            this.update(request, response);
        } else if (uri.contains("storeProduct")) {
            this.store(request, response);
        } else if (uri.contains("editProduct")) {
            this.edit(request, response);
        } else if (uri.contains("deleteProduct")) {
            this.delete(request, response);
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> dsCategory = this.categoryDAO.all();
        request.setAttribute("dsCategory", dsCategory);
        List<Product> list = this.dao.all();
        request.setAttribute("list", list);
        request.setAttribute("view", "/views/admin/product/create.jsp");
        request.setAttribute("view1", "/views/admin/product/table.jsp");
        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        int idCate=Integer.parseInt(request.getParameter("category_id"));
        try {
            Category category = this.categoryDAO.findByID(idCate);
            Product entity = this.dao.findByID(id);
            BeanUtils.populate(entity, request.getParameterMap());
            File file = FileUtil.saveFileUpload("products", request.getPart("img"));
            if (file.getName().equals("products")) {
                entity.setImg(entity.getImg());
            } else {
                entity.setImg(file.getName());
            }
            entity.setCategory(category);
            this.dao.update(entity);
            session.setAttribute("message","Cập Nhật Thành Công");
            response.sendRedirect("/Product");
        } catch (Exception e) {
            response.sendRedirect("/Product");
            session.setAttribute("error","Cập Nhật Thất Bại");
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        try {
            Product entity = this.dao.findByID(id);
            BeanUtils.populate(entity, request.getParameterMap());
            entity.setStatus(false);
            this.dao.update(entity);
            session.setAttribute("message","Xóa Thành Công");
            response.sendRedirect("/Product");
        } catch (Exception e) {
            session.setAttribute("error","Xóa Thất Bại");
            response.sendRedirect("/Product");
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> dsCategory = this.categoryDAO.all();
        request.setAttribute("dsCategory", dsCategory);
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        Product entity = this.dao.findByID(id);
        request.setAttribute("product", entity);
        List<Product> list = this.dao.all();
        request.setAttribute("list", list);
        request.setAttribute("view", "/views/admin/product/edit.jsp");
        request.setAttribute("view1", "/views/admin/product/table.jsp");
        request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);
    }

    protected void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String s = request.getParameter("category_id");
        int id = Integer.parseInt(s);
        Product entity = new Product();
        List<Product> list = new ArrayList<>();
        try {
            BeanUtils.populate(entity, request.getParameterMap());
            File file = FileUtil.saveFileUpload("products", request.getPart("img"));
            if (file.getName().equals("products")) {
                entity.setImg("quan1.jpg");
            } else {
                entity.setImg(file.getName());
            }
            Category category = this.categoryDAO.findByID(id);
            entity.setCategory(category);
            entity.setStatus(true);
            this.dao.create(entity);
            session.setAttribute("message", "Thêm Mới Thành Công");
            list.add(entity);
            request.setAttribute("list", list);
            List<Product> all = this.dao.all();
            request.setAttribute("list", all);
            response.sendRedirect("/Product");
        } catch (Exception e) {
            session.setAttribute("error", "Thêm Mới Thất Bại");
            response.sendRedirect("/Product");
            e.printStackTrace();
        }
    }
}
