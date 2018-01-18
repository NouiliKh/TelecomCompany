<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 21/12/17
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html>
<head>
    <title> Welcome Contractor !</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/vendor/animate/animate.css">
    <link type="text/css" rel="stylesheet" media="all" href="assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
    <link rel="stylesheet" href="assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap/bootstrap-dropdown-multilevel.css">

    <link rel="stylesheet" href="assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="assets/js/vendor/chosen/css/chosen-bootstrap.css">
    <link rel="stylesheet" href="assets/js/vendor/datatables/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="assets/js/vendor/datatables/css/ColVis.css">
    <link rel="stylesheet" href="assets/js/vendor/datatables/css/TableTools.css">

    <link href="assets/css/minimal.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-1">
<%
    if (session != null) {
        if (session.getAttribute("user") != "Payment") {
            response.sendRedirect("login.jsp");

        }
    }
%>


<!-- Preloader -->
<div class="mask"><div id="loader"></div></div>
<!--/Preloader -->

<!-- Wrap all page content here -->
<div id="wrap">


    <!-- Make page fluid -->
    <div class="row">


        <!-- Fixed navbar -->
        <div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top" role="navigation" id="navbar">



            <!-- Branding -->
            <div class="navbar-header col-md-2">
                <a class="navbar-brand" href="WelcomeAdmin.jsp">
                    <strong>Welcome  </strong>Payment Team !
                </a>
                <div class="sidebar-collapse">
                    <a href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </div>
            <!-- Branding end -->


            <!-- .nav-collapse -->
            <div class="navbar-collapse">

                <!-- Sidebar -->
                <ul class="nav navbar-nav side-nav" id="sidebar">

                    <li class="collapsed-content">
                        <ul>
                            <li class="search"><!-- Collapsed search pasting here at 768px --></li>
                        </ul>
                    </li>

                    <li class="navigation" id="navigation">
                        <a href="#" class="sidebar-toggle" data-toggle="#navigation">Navigation <i class="fa fa-angle-up"></i></a>

                        <ul class="menu">

                            <li >
                                <a href="WelcomePayment.jsp">
                                    <i class="fa fa-tachometer"></i> Dashboard
                                </a>
                            </li>

                            <li class ="active">
                                <a href="CreateBill.jsp" >
                                    <i class="fa fa-list"></i> Create Bill
                                </a>
                            </li>

                            <li>
                                <a href="searchBill.jsp" >
                                    <i class="fa fa-list"></i> Search for a Bill
                                </a>
                            </li>

                            <li>
                                <a href="sendBill.jsp" >
                                    <i class="fa fa-list"></i> Send Bill
                                </a>
                            </li>


                            <li>
                                <a href="logout.jsp">
                                    <i class="fa fa-tint"></i> Logout
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>

                <!-- Sidebar end -->

            </div>
            <!--/.nav-collapse -->


        </div>
        <!-- Fixed navbar end -->


        <!-- Page content -->
        <div id="content" class="col-md-12">

            <!-- page header -->
            <div class="pageheader">


                <h2><i class="fa fa-thumb-tack" style="line-height: 48px;padding-left: 1px;"></i> Create Bill



            </div>
            <!-- /page header -->






            <!-- content main container -->
            <div class="main">




                <!-- row -->
                <div class="row">

                    <!-- col 12 -->
                    <div class="col-md-6">



                        <!-- tile -->
                        <section class="tile color transparent-black">



                            <!-- tile header -->
                            <div class="tile-header">
                                <h1><strong>Text</strong> Inputs</h1>
                                <div class="controls">
                                    <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                                    <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                                    <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                </div>
                            </div>
                            <!-- /tile header -->

                            <!-- tile body -->
                            <div class="tile-body">

                                <form action="CreateBill" method="post" class="form-horizontal" role="form">

                                    <div class="form-group">
                                        <label for="input01" class="col-sm-4 control-label">SIM Number</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="SIMNumber">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="input01" class="col-sm-4 control-label">Number Unity Consumed</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="NumberUnityConsumed">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="input01" class="col-sm-4 control-label">Total</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="Total">
                                        </div>
                                    </div>




                                    <div class="form-group form-footer">
                                        <div class="col-sm-offset-4 col-sm-8">
                                            <button  value="Submit" type="submit" class="btn btn-primary">Submit</button>
                                            <button type="reset" class="btn btn-default">Reset</button>
                                        </div>
                                    </div>





                                </form>

                            </div>
                            <!-- /tile body -->




                        </section>
                        <!-- /tile -->




                    </div>


                </div>
            </div>
        </div>
    </div>
</div>





<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/js/vendor/bootstrap/bootstrap.min.js"></script>
<script src="assets/js/vendor/bootstrap/bootstrap-dropdown-multilevel.js"></script>
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?lang=css&amp;skin=sons-of-obsidian"></script>
<script type="text/javascript" src="assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="assets/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript" src="assets/js/vendor/blockui/jquery.blockUI.js"></script>

<script src="assets/js/vendor/summernote/summernote.min.js"></script>

<script src="assets/js/vendor/chosen/chosen.jquery.min.js"></script>

<script src="assets/js/vendor/momentjs/moment-with-langs.min.js"></script>
<script src="assets/js/vendor/datepicker/bootstrap-datetimepicker.min.js"></script>

<script src="assets/js/vendor/colorpicker/bootstrap-colorpicker.min.js"></script>

<script src="assets/js/vendor/colorpalette/bootstrap-colorpalette.js"></script>

<script src="assets/js/minimal.min.js"></script>


</body>
</html>

