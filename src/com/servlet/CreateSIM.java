package com.servlet;

import com.bean.LandlineSIM;
import com.bean.MobileSIM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateSIM")
public class CreateSIM extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer CIN = Integer.valueOf(request.getParameter("CIN"));
        String SIMType=request.getParameter("SIMType");

        if(SIMType.equals("Landline"))
        {
            String GeoLocal=request.getParameter("GeoLocal");
            LandlineSIM ldsim =new LandlineSIM(CIN,GeoLocal);
            ldsim.CreateSIM();
        }

        else
        {
            String SIMConnectionType =request.getParameter("SIMConnectionType");
            String SIMNetworkType =request.getParameter("SIMNetworkType");
            String SIMPaymentType =request.getParameter("SIMPaymentType");

            String SIMServiceType =request.getParameter("SIMServiceType");

            if(SIMServiceType.equals("Network")) {
                Integer NetworkServiceNum = Integer.valueOf(request.getParameter("SIMPaymentType1"));
                MobileSIM Mbsim = new MobileSIM(CIN,SIMConnectionType,SIMNetworkType,SIMPaymentType,NetworkServiceNum,Integer.valueOf(null));
                Mbsim.CreateSIM();
            }
             else if (SIMServiceType.equals("Landline"))
            {
                Integer VocalServiceNum = Integer.valueOf(request.getParameter("SIMPaymentType2"));
                MobileSIM Mbsim = new MobileSIM(CIN,SIMConnectionType,SIMNetworkType,SIMPaymentType,Integer.valueOf(null),VocalServiceNum);
                Mbsim.CreateSIM();
            }
            else
            {
                Integer NetworkServiceNum = Integer.valueOf(request.getParameter("SIMPaymentType3"));
                Integer VocalServiceNum = Integer.valueOf(request.getParameter("SIMPaymentType4"));
                MobileSIM Mbsim = new MobileSIM(CIN,SIMConnectionType,SIMNetworkType,SIMPaymentType,NetworkServiceNum,VocalServiceNum);
                Mbsim.CreateSIM();
            }


        }



    }


}
