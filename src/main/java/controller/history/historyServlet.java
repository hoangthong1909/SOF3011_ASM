package controller.history;

import DAO.OrderDAO;
import entity.Order;
import entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class historyServlet extends HttpServlet {
    private OrderDAO orderDAO;

    public historyServlet() {
        this.orderDAO=new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        if (user!=null){
            List<Order> orderList=this.orderDAO.findByIDUser(user.getId());
            request.setAttribute("orderList",orderList);
        }else {
            response.sendRedirect("/home");
        }
        request.setAttribute("view","/views/history/history.jsp");
        request.getRequestDispatcher("/views/home/layout.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
