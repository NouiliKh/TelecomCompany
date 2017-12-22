package com.bean;

import java.util.Date;

public class bill {
    Integer SIMNumber;
    Integer NbreUnityCOnsumed;
    Integer Total;
    Date BillDate;
    Date ExpirationDate;

    public bill(Integer SIMNumber,Integer NbreUnityConsumed,Integer Total,Date ExpirationDate)
    {
        this.SIMNumber=SIMNumber;
        this.NbreUnityCOnsumed=NbreUnityConsumed;
        this.Total = Total;
        this.BillDate=Date;
    }
}