package controller.cart;

import DAO.ProductDAO;
import entity.Order;
import entity.Orderdetail;
import entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
    private ProductDAO productDAO;

    public AddToCartServlet() {
        this.productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int idProduct = Integer.parseInt(request.getParameter("idP"));
        Product product = this.productDAO.findByID(idProduct);
        if (product != null) {
            if (request.getParameter("quantity") != null) {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
            HttpSession session = request.getSession();
            if (session.getAttribute("order") == null) {
                Order order = new Order();
                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setProduct(product);
                orderdetail.setSoLuong(quantity);
                orderdetail.setDonGia(product.getDonGia());
                List<Orderdetail> list = new ArrayList<>();
                list.add(orderdetail);
                order.setOrderdetails(list);
                session.setAttribute("order", order);

            } else {
                Order order = (Order) session.getAttribute("order");
                List<Orderdetail> listOrder = order.getOrderdetails();
                boolean check = false;
                for (Orderdetail item : listOrder) {
                    if (item.getProduct().getId() == product.getId()) {
                        item.setSoLuong(item.getSoLuong() + quantity);
                        check = true;
                    }
                }
                if (check == false) {
                    Orderdetail orderdetail = new Orderdetail();
                    orderdetail.setProduct(product);
                    orderdetail.setSoLuong(quantity);
                    orderdetail.setDonGia(product.getDonGia());
                    listOrder.add(orderdetail);
                }
                session.setAttribute("order", order);
            }
            response.sendRedirect("/cart");
        } else {
            response.sendRedirect("/cart");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
