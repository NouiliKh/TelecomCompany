package com.servlet;

import com.bean.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "SearchBill")
public class SearchBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer SIMNumber = Integer.valueOf(request.getParameter("SIMNumber"));
        ResultSet rs =Bill.SearchBill(SIMNumber);
        request.getSession().setAttribute("rs", rs);
        request.getRequestDispatcher("displayBill.jsp").forward(request, response);
    }


}
