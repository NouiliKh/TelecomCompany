package com.bean;

import com.connection.ConnectionBD;

public class Service {
    String ServiceDescription;
    float Price;

    public  Service(String ServiceDescription , float Price)
    {
        this.Price=Price;
        this.ServiceDescription=ServiceDescription;
    }

    public String getServiceDescription()
    {
        return ServiceDescription;
    }

    public float getPrice()
    {
        return Price;
    }

    public void CreateService()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO VocalService (Description,Price)VALUES ('"+this.ServiceDescription+"','"+this.Price+"'); ");
        Con.closeConnection();
    }

}
