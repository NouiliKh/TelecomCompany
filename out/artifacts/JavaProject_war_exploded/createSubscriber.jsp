<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 21/12/17
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a subscriber</title>
</head>
<body>

<form action="CreateSubscriber" method="post">
    <br/>CIN:<input type="number" name="CIN">
    <br/>Name:<input type="text" name="Name">
    <br/>FamilyName:<input type="text" name="FamilyName">
    <br/>Address:<input type="text" name="Address">
    <br/>Email:<input type="text" name="Email">
    <br/><input type="submit" value="Submit">
</form>

</body>
</html>
