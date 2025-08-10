package servlet;

import model.Cart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = getOrCreateCart(session);

        String productId = req.getParameter("productId");
        String productName = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));

        cart.addProduct(productId, productName, price);
        session.setAttribute("cart", cart);

        resp.sendRedirect("cart.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            String productId = req.getParameter("productId");
            cart.removeProduct(productId);
            session.setAttribute("cart", cart);
        }

        resp.setStatus(HttpServletResponse.SC_OK);
    }

    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
}