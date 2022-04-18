package controller.home;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/home", "/show"})
public class HomeServlet extends HttpServlet {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;

    public HomeServlet() {
        this.categoryDAO = new CategoryDAO();
        this.productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("home")) {
            this.home(request, response);
        } else if (uri.contains("show")) {
            this.show(request, response);
        }

        request.setAttribute("view", "/views/home/home.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request, response);
    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCate = this.categoryDAO.all();
        request.setAttribute("listCate", listCate);
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> list = this.productDAO.findByIDCategory(id);
        request.setAttribute("show", list);
    }

    protected void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCate = this.categoryDAO.all();
        request.setAttribute("listCate", listCate);
        List<Product> listpro = this.productDAO.all();
        request.setAttribute("show", listpro);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
