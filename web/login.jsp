
<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 19/12/17
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Welcome - Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap/bootstrap-dropdown-multilevel.css">

    <link href="assets/css/minimal.css" rel="stylesheet">


    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

</head>
<body class="bg-1">
<div id="wrap">
    <div class="row">
        <div id="content" class="col-md-12 full-page login">

            <div class="inside-block">
                <img src="assets/images/logo-big.png" alt class="logo">
                <h1><strong>Welcome</strong></h1>
                <h5>Telecom Company Dashboard</h5>

                <form action="Login" method="post" id="form-signin" class="form-signin">
                    <section>
                        <div class="input-group">
                            <input type="text" class="form-control" name="username" placeholder="Username">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                        </div>
                        <div class="input-group">
                            <input type="password" class="form-control" name="password" placeholder="Password">
                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                        </div>
                    </section>
                    <section class="log-in">
                        <button type="submit" value="Submit" class="btn btn-greensea">Log In</button>
                    </section>
                </form>
            </div>


        </div>
    </div>
</div>
</body>
</html>


