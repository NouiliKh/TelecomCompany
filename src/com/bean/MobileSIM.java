package com.bean;


import com.connection.ConnectionBD;

public class MobileSIM extends SIM {

    Integer Number;
    String ConnectionType;
    String NetworkType;
    String PaymentType;
    Integer NetworkServiceNum;
    Integer VocalServiceNum;
    static int i=1000000;


    public MobileSIM(Integer CIN , String ConnectionType,String NetworkType,String Payment,Integer NetworkServiceNum,Integer VocalServiceNum)
    {
        super(CIN);
        i+=1;
        this.Number=Integer.valueOf(("55"+i));
        this.ConnectionType=ConnectionType;
        this.NetworkType= NetworkType;
        this.PaymentType=Payment;
        this.NetworkServiceNum=NetworkServiceNum;
        this.VocalServiceNum=VocalServiceNum;
    }

    public void CreateSIM()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO Mobile (Number,Type,Network,payment,VocalServiceNumber,NetworkServiceNumber,SubscriberRegistrationNumber) VALUES ('"+this.Number+"','"+this.ConnectionType+"','"+this.NetworkType+"','"+this.PaymentType+"','"+this.NetworkServiceNum+"','"+this.VocalServiceNum+"','"+this.CIN+"'); ");
        Con.closeConnection();
    }




}
