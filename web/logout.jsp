<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 18/01/18
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%
    response.setContentType("text/html");

    session = request.getSession(false);
    session.removeAttribute("user");
    response.sendRedirect("login.jsp");
%>

</body>
</html>
