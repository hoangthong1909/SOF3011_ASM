package controller.cart;

import entity.Order;
import entity.Orderdetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        double tong = 0;
        int soLuong=0;
        Order order= (Order) session.getAttribute("order");
        if (order==null){
            tong=0;
            soLuong=0;
        }else {
            List<Orderdetail> listOrder=order.getOrderdetails();
            for (Orderdetail item:listOrder) {
                tong+=item.getDonGia()*item.getSoLuong();
                soLuong+=item.getSoLuong();
            }
        }
        request.setAttribute("tong",tong);
        session.setAttribute("soLuong",soLuong);
        request.setAttribute("view","/views/cart/cart.jsp");
        request.getRequestDispatcher("views/home/layout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
