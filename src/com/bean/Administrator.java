package com.bean;

import com.connection.ConnectionBD;
import com.servlet.CreateEmployee;

public class Administrator extends Employee {


    public Administrator(Integer CIN,String Name, String FamilyName, String Address, String Email, String Password, Integer ServiceNumber) {
        super(CIN,Name, FamilyName, Address, Email, Password, ServiceNumber);
    }

    public void CreateEmployee()
    {
        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        Integer rs= Con.updateExec("INSERT INTO Employee (Name,FamilyName,Address,Email,Password,NumService)VALUES ('"+this.Name+"','"+this.FamilyName+"','"+this.Email+"','"+this.Address+"','"+this.Password+"','"+this.ServiceNumber+"'); ");
        Con.closeConnection();
    }





}
