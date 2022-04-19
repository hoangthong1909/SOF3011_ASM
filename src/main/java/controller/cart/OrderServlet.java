package controller.cart;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import entity.Order;
import entity.Orderdetail;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO;

    public OrderServlet() {
        this.orderDAO = new OrderDAO();
        this.orderDetailDAO = new OrderDetailDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order orderSession = (Order) session.getAttribute("order");
        if (orderSession != null) {
            User user = (User) session.getAttribute("user");
            List<Orderdetail> listOrder = orderSession.getOrderdetails();
            Order order = new Order();
            order.setUserDatHang(user);
            order.setOrderdetails(listOrder);
            order.setDateCreate(new Date());
            order.setStatus(0);
            double tong = 0;
            for (Orderdetail item : listOrder) {
                tong += item.getDonGia() * item.getSoLuong();
            }
            order.setTongTien(tong);
            try {
                this.orderDAO.create(order);
                for (Orderdetail item : listOrder) {
                    Orderdetail orderdetail = new Orderdetail();
                    orderdetail.setOrder(order);
                    orderdetail.setProduct(item.getProduct());
                    orderdetail.setSoLuong(item.getSoLuong());
                    orderdetail.setDonGia(item.getDonGia());
                    this.orderDetailDAO.create(orderdetail);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.removeAttribute("order");
        }else {
            response.sendRedirect("/home");
        }
        response.sendRedirect("/history");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
