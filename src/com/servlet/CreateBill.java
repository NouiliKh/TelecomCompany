package com.servlet;

import com.bean.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateBill")
public class CreateBill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer SIMNumber = Integer.valueOf(request.getParameter("SIMNumber"));
        Integer NumberUnityConsumed= Integer.valueOf(request.getParameter("NumberUnityConsumed"));
        Integer Total = Integer.valueOf(request.getParameter("Total"));

        Bill bill = new Bill(SIMNumber,NumberUnityConsumed,Total);
        bill.CreateBill();
        response.sendRedirect("WelcomePayment.jsp");



    }



}
