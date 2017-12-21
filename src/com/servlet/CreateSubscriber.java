package com.servlet;

import com.bean.Administrator;
import com.bean.Personne;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateSubscriber")
public class CreateSubscriber extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Name=request.getParameter("Name");
        String FamilyName =request.getParameter("FamilyName");
        String Address =request.getParameter("Address");
        String Email =request.getParameter("Email");



        Personne Admin =new Personne(Name,FamilyName,Address,Email);
        Admin.CreateSubsciber();
        response.sendRedirect("WelcomeContracts.jsp");
    }

}
