package com.bean;

import com.connection.ConnectionBD;

import java.util.Date;

public class bill {
    Integer SIMNumber;
    Integer NbreUnityCOnsumed;
    Integer Total;
    long BillDate;
    Date ExpirationDate;

    public bill(Integer SIMNumber,Integer NbreUnityConsumed,Integer Total,Date ExpirationDate)
    {
        this.SIMNumber=SIMNumber;
        this.NbreUnityCOnsumed=NbreUnityConsumed;
        this.Total = Total;
        Date now = new Date();
        this.BillDate= now.getTime();
        this.ExpirationDate=ExpirationDate;
    }

    public void CreateBill()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
       // Integer rs= Con.updateExec("INSERT INTO bill (SIMNumber,NumberUnityConsumed,Date,Total,ExpirationDate,NumService) VALUES ('"+this.Name+"','"+this.FamilyName+"','"+this.Email+"','"+this.Address+"','"+this.Password+"','"+this.ServiceNumber+"'); ");
        Con.closeConnection();
    }









}