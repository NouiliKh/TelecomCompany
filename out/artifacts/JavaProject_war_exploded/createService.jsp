<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 21/12/17
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a service</title>
</head>
<body>

<form action="CreateService" method="post">
    <br/>Describe the service<input type="text" name="Description">
    <br/>Price:<input type="number" name="Price">
    <br/><B>Select a Service type</B> <BR>
    <SELECT onchange="yesnoCheck(this);"  name="ServiceType">
        <OPTION id="Vocal" SELECTED> Vocal Service</OPTION>
        <OPTION id="Network" > Network Service</OPTION>
    </SELECT>

    <div id="ifYes" style="display: none;">
        <br/>ISP<input type="text" id="ISP" name="ISP" /><br />
    </div>

    <br/><input type="submit" value="Submit">
</form>

</body>
<script>
    function yesnoCheck(nameselect) {
        if(nameselect){
            admOptionValue = document.getElementById("Network").value;
            if(admOptionValue == nameselect.value){
                document.getElementById("ifYes").style.display = "block";
            }
            else{
                document.getElementById("ifYes").style.display = "none";
            }
        }
        else{
            document.getElementById("ifYes").style.display = "none";
        }
    }
</script>
</html>
