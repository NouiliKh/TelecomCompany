package com.servlet;

import com.bean.Administrator;
import com.bean.NetworkService;
import com.bean.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateService")
public class CreateService extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String Description=request.getParameter("Description");
        float Price = Float.parseFloat(request.getParameter("Price"));
        String ServiceType =request.getParameter("ServiceType");
        String ISP =request.getParameter("ISP");

        if(ServiceType.equals("Network Service"))
        {
            NetworkService service =new NetworkService(Description,Price,ISP);
            service.CreateNetworkService();
            response.sendRedirect("WelcomeAdmin.jsp");
        }

        else if (ServiceType.equals("Vocal Service"))
        {
            Service service = new Service(Description,Price);
            service.CreateService();
            response.sendRedirect("WelcomeAdmin.jsp");
        }
    }


}
