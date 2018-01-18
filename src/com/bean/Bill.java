package com.bean;

import com.connection.ConnectionBD;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class Bill {
    Integer SIMNumber;
    Integer NbreUnityCOnsumed;
    Integer Total;
    String BillDate;
    String Datenow;
    String ExpirationDate;

    public Bill(Integer SIMNumber,Integer NbreUnityConsumed,Integer Total)
    {

        ZoneId z = ZoneId.of( "Europe/Paris" );
        this.BillDate = LocalDate.now( z ).toString();
        this.SIMNumber=SIMNumber;
        this.NbreUnityCOnsumed=NbreUnityConsumed;
        this.Total = Total;
        this.ExpirationDate=LocalDate.now( z ).plusMonths(3).toString();
    }

    public void CreateBill()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO bill (SIMNumber,NumberUnityConsumed,Date,Total,ExpirationDate) VALUES ('"+this.SIMNumber+"','"+this.NbreUnityCOnsumed+"','"+this.BillDate+"','"+this.Total+"','"+this.ExpirationDate+"'); ");
        Con.closeConnection();
    }

     public static ResultSet SearchBill(Integer SIMNumber)
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();



        ResultSet rs= Con.selectExec("Select * from bill INNER JOIN SIM ON  SIM.SIMNumber=bill.SIMNumber WHERE bill.SIMNumber ='"+SIMNumber+"' ");
        return rs;
    }








}