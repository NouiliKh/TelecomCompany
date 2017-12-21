package com.bean;

abstract class Employee extends Personne {


    String Password;
    Integer ServiceNumber;

    public Employee(String Name, String FamilyName, String Address, String Email, String Password, Integer ServiceNumber)
    {
        super(Name,FamilyName,Address,Email);
        this.Password = Password;
        this.ServiceNumber = ServiceNumber;
    }

}
