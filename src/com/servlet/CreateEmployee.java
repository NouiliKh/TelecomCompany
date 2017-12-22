package com.servlet;

import com.bean.Administrator;
import com.connection.ConnectionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "CreateEmployee")
public class CreateEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer ServiceNumber;
        Integer CIN = Integer.valueOf(request.getParameter("CIN"));
        String Name=request.getParameter("Name");
        String FamilyName =request.getParameter("FamilyName");
        String Address =request.getParameter("Address");
        String Email =request.getParameter("Email");
        String Password =request.getParameter("Password");
        String ServiceName =request.getParameter("ServiceName");

        if(ServiceName.equals("Payment"))
        {
             ServiceNumber=2;
        }
        else if(ServiceName.equals("Administrator"))
        {
             ServiceNumber=1;
        }
        else
        {
             ServiceNumber=3;
        }

        Administrator Admin =new Administrator(CIN,Name,FamilyName,Address,Email,Password,ServiceNumber);
        Admin.CreateEmployee();
        response.sendRedirect("WelcomeAdmin.jsp");


    }


}
