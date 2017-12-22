<%@ page import="com.connection.ConnectionBD" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.bean.Service" %>
<%@ page import="com.bean.NetworkService" %><%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 21/12/17
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create SIM</title>
</head>
<body>

<form action="CreateSIM" method="post">

    <br/>Subscriber CIN:<input type="number" name="CIN">
    <SELECT onchange="yesnoCheckSIMType(this);"  name="SIMType">
        <OPTION id="Landline" SELECTED> Landline</OPTION>
        <OPTION id="Mobile" > Mobile</OPTION>
    </SELECT>

    <div id="ifYes" style="display: block;">
        <br/>Geographic Localisation<input type="text" id="GeoLocal" name="GeoLocal" /><br />
    </div>

    <div id="ifNo" style="display: none;">
        <br/><B>Select a Connection type</B> <BR>
        <SELECT  name="SIMConnectionType">
            <OPTION id="3G" SELECTED> 3G</OPTION>
            <OPTION id="4G" > 4G</OPTION>
        </SELECT>
        <br/><B>Select a Network type</B> <BR>
        <SELECT name="SIMNetworkType">
            <OPTION id="type1" SELECTED> type1</OPTION>
            <OPTION id="type2" > type2</OPTION>
            <OPTION id="type3" > type3</OPTION>
        </SELECT>
        <br/><B>Payment Type</B> <BR>
        <SELECT name="SIMPaymentType">
            <OPTION id="cash" SELECTED> cash</OPTION>
            <OPTION id="paypal" > paypal</OPTION>
            <OPTION id="check" > check</OPTION>
        </SELECT>
        <br/><B>Service Type</B> <BR>
        <SELECT onchange="yesnoCheckSIMServiceType(this);" name="SIMServiceType">
            <OPTION id="Network" SELECTED> Network</OPTION>
            <OPTION id="Vocal" > Vocal</OPTION>
            <OPTION id="Both" > Both</OPTION>
        </SELECT>



        <div id="Ok1" style="display: block;">
            <SELECT name="SIMPaymentType1">
                <%
                    ResultSet rs1 = NetworkService.getData();
                    while(rs1.next()){ %>
                <OPTION value=<%= rs1.getString(1) %> > <%= rs1.getString(2) %></OPTION>
                <% } %>
            </SELECT>
        </div>

        <div id="Ok2" style="display: none;">
            <SELECT name="SIMPaymentType2">
                <%
                    ResultSet rs2 = Service.getData();
                    while(rs2.next()){ %>
                <OPTION value= <%=rs2.getString(1) %> > <%= rs2.getString(2) %></OPTION>
                <% } %>
            </SELECT>
        </div>

        <div id="Ok3" style="display: none;">
            <SELECT name="SIMPaymentType3">
                <%
                    ResultSet rs4 = NetworkService.getData();
                    while(rs4.next()){ %>
                <OPTION value=<%= rs4.getString(1) %> > <%= rs4.getString(2) %></OPTION>
                <% } %>

            </SELECT>

            <SELECT name="SIMPaymentType4">
                <%
                    ResultSet rs7 = Service.getData();
                    while(rs7.next()){ %>
                <OPTION value=<%= rs7.getString(1) %> > <%= rs7.getString(2) %></OPTION>
                <% } %>
            </SELECT>

        </div>
    </div>



    <br/><input type="submit" value="Submit">
</form>

</body>
<script>
    function yesnoCheckSIMType(nameselect) {
        if(nameselect){
            admOptionValue=document.getElementById("Landline").value;
            if(admOptionValue == nameselect.value){
                document.getElementById("ifYes").style.display = "block";
                document.getElementById("ifNo").style.display = "none";
            }
            else{
                document.getElementById("ifYes").style.display = "none";
                document.getElementById("ifNo").style.display = "block";
            }
        }
        else{
            document.getElementById("ifYes").style.display = "none";
            document.getElementById("ifNo").style.display = "block";
        }
    }

    function yesnoCheckSIMServiceType(nameselect) {
        if(nameselect) {

            if (document.getElementById("Network").value == nameselect.value) {
                document.getElementById("Ok1").style.display = "block";
                document.getElementById("Ok2").style.display = "none";
                document.getElementById("Ok3").style.display = "none";
            }
            else if (document.getElementById("Vocal").value == nameselect.value) {
                document.getElementById("Ok1").style.display = "none";
                document.getElementById("Ok2").style.display = "block";
                document.getElementById("Ok3").style.display = "none";
            }

            else if (document.getElementById("Both").value == nameselect.value) {
                document.getElementById("Ok1").style.display = "none";
                document.getElementById("Ok2").style.display = "none";
                document.getElementById("Ok3").style.display = "block";
            }
        }
    }
</script>
</body>
</html>
