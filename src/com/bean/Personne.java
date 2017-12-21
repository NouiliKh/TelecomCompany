package com.bean;


import com.connection.ConnectionBD;

public class Personne {
    String Name;
    String FamilyName;
    String Address;
    String Email;

    public Personne(String name, String familyName, String address, String email) {
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
        Integer rs= Con.updateExec("INSERT INTO Subscriber (Name,FamilyName,Address,Email)VALUES ('"+this.Name+"','"+this.FamilyName+"','"+this.Email+"','"+this.Address+"'); ");
        Con.closeConnection();
    }



}
