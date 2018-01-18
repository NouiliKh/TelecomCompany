package com.servlet;

import com.connection.ConnectionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "Login")
public class Login extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password =request.getParameter("password");
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        ResultSet rs= Con.selectExec("SELECT NumService,CIN FROM Employee WHERE Email='" + username + "' AND Password = '" + password + "';");

        try {
            if (!rs.next())
            {
                Con.closeConnection();
                response.sendRedirect("login.jsp");
            }
            else
            {
                Integer Id= null;
                try {
                    Id = Integer.parseInt(rs.getString(2));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (Integer.parseInt(rs.getString(1)) == 1) {
                    Con.closeConnection();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", "admin");
                    response.sendRedirect("WelcomeAdmin.jsp");

                } else if (Integer.parseInt(rs.getString(1)) == 2) {
                    Con.closeConnection();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", "Payment");
                    response.sendRedirect("WelcomePayment.jsp");
                } else {
                    Con.closeConnection();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", "Contract");
                    response.sendRedirect("WelcomeContracts.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
