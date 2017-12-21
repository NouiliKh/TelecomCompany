package com.bean;

abstract class Employee {

    String Name;
    String FamilyName;
    String Address;
    String Email;
    String Password;
    Integer ServiceNumber;

    public Employee(String Name, String FamilyName, String Address, String Email, String Password, Integer ServiceNumber) {
        this.Name = Name;
        this.FamilyName = FamilyName;
        this.Address = Address;
        this.Email = Email;
        this.Password = Password;
        this.ServiceNumber = ServiceNumber;
    }

}
