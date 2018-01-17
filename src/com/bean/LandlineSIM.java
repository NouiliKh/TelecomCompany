package com.bean;

import com.connection.ConnectionBD;

public class LandlineSIM extends SIM {
    Integer Number;
    String GeographicLocalissation;
    static int i=100000;
    public LandlineSIM(Integer CIN,String GeoLoc) {

        super(CIN);
        i+=1;
        this.Number= Integer.valueOf(("72"+i));
        this.GeographicLocalissation=GeoLoc;
    }

    public void CreateSIM()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO Landline (Number,GeographicLocalisation,SubscriberRegistrationNumber)VALUES ('"+this.Number+"','"+this.GeographicLocalissation+"','"+this.CIN+"'); ");
        Integer rs2= Con.updateExec("INSERT INTO SIMNumber (SIMnumber) VALUES ('"+this.Number+"'); ");
        Con.closeConnection();
    }


}
