package com.bean;


import com.connection.ConnectionBD;
import org.omg.CORBA.INTERNAL;

public class Personne {
    Integer CIN;
    String Name;
    String FamilyName;
    String Address;
    String Email;

    public Personne(Integer cin,String name, String familyName, String address, String email) {
        this.CIN=cin;
        this.Name=name;
        this.FamilyName=familyName;
        this.Address= address;
        this.Email=email;
    }

    public void CreateSubsciber()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO Subscriber (CIN,Name,FamilyName,Address,Email)VALUES ('"+this.CIN+"','"+this.Name+"','"+this.FamilyName+"','"+this.Email+"','"+this.Address+"'); ");
        Con.closeConnection();
    }



}
