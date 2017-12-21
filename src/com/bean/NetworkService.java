package com.bean;

import com.connection.ConnectionBD;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NetworkService extends Service{
    String ISP;

    public NetworkService(String ServiceDescription, float Price,String ISP) {
        super(ServiceDescription, Price);
        this.ISP=ISP;
    }

    public String getISP() {
        return ISP;
    }

    public void CreateNetworkService()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO NetworkService (Description,Price,ISP)VALUES ('"+this.ServiceDescription+"','"+this.Price+"','"+this.ISP+"'); ");
        Con.closeConnection();
    }

    public static   ResultSet getData()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        ResultSet rs= Con.selectExec("SELECT ServiceID,Description FROM NetworkService ;");
        return rs;

    }



}
