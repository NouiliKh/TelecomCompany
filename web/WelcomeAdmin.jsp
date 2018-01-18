<%@ page import="com.connection.ConnectionBD" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: gomni
  Date: 21/12/17
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title> Welcome Admin !</title>
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
        if (session.getAttribute("user") != "admin") {
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
                    <strong>Welcome  </strong>Administrator !
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

                            <li class ="active">
                                <a href="WelcomeAdmin.jsp">
                                    <i class="fa fa-tachometer"></i> Dashboard
                                </a>
                            </li>

                            <li>
                                <a href="createEmployee.jsp" >
                                    <i class="fa fa-list"></i> Create Employee
                                </a>
                            </li>

                            <li>
                                <a href="createService.jsp" >
                                    <i class="fa fa-list"></i> Create Service
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

                <h2><i class="fa fa-lightbulb-o" style="line-height: 48px;padding-left: 0;"></i> DataTables </h2>

            </div>
            <!-- /page header -->


            <!-- content main container -->
            <div class="main">

                <!-- row -->
                <div class="row">

                    <!-- col 12 -->
                    <div class="col-md-12">



                        <!-- tile -->
                        <section class="tile transparent">


                            <!-- tile header -->
                            <div class="tile-header transparent">
                                <h1><strong>Employees</strong> Datatable </h1>
                                <div class="controls">
                                    <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                                    <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                                    <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                </div>
                            </div>
                            <!-- /tile header -->

                            <!-- tile body -->
                            <div class="tile-body color transparent-black rounded-corners">

                                <div class="table-responsive">
                                    <table  class="table table-datatable table-custom" id="basicDataTable1">
                                        <thead>
                                        <tr>
                                            <th class="sort-alpha">CIN</th>
                                            <th class="sort-alpha">Name</th>
                                            <th class="sort-alpha">FamilyName</th>
                                            <th class="sort-amount">Address</th>
                                            <th class="sort-numeric">E-mail</th>
                                            <th class="sort-numeric">Role</th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <%
                                            try
                                            {

                                                String query="select * from Employee";
                                                ConnectionBD Con = new ConnectionBD();
                                                Con.driver();
                                                Con.OpenConnexion();
                                                ResultSet rs =Con.selectExec(query);
                                                while(rs.next())
                                                {

                                        %>

                                        <tr class="odd gradeX">
                                            <td class="text-center"><%=rs.getString("CIN") %></td>
                                            <td class="text-center"><%=rs.getString("Name") %></td>
                                            <td class="text-center"><%=rs.getString("FamilyName") %></td>
                                            <td class="text-center"><%=rs.getString("Address") %></td>
                                            <td class="text-center"><%=rs.getString("Email") %></td>
                                            <%

                                                String Role="sdq";

                                                if (rs.getInt("NumService") == 1)
                                                {
                                                    Role ="Administrator";
                                                }

                                                if (rs.getInt("NumService") == 2)
                                                {
                                                    Role ="Payment";
                                                }

                                                if (rs.getInt("NumService") == 3)
                                                {
                                                    Role="Contract";
                                                }

                                            %>
                                            <td class="text-center"><%= Role%></td>
                                        </tr>

                                        <%

                                            }
                                        %>
                                        </tbody>

                                    </table>
                                    <%
                                            rs.close();
                                            Con.closeConnection();
                                        }
                                        catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>
                            </div>
                            <!-- /tile body -->
                        </section>
                        <!-- /tile -->
                        <!-- tile -->
                        <section class="tile transparent">


                            <!-- tile header -->
                            <div class="tile-header transparent">
                                <h1><strong>Vocal</strong> Services </h1>
                                <div class="controls">
                                    <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                                    <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                                    <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                </div>
                            </div>
                            <!-- /tile header -->

                            <!-- tile body -->
                            <div class="tile-body color transparent-black rounded-corners">

                                <div class="table-responsive">
                                    <table  class="table table-datatable table-custom" id="basicDataTable2">
                                        <thead>
                                        <tr>
                                            <th class="sort-alpha">Service ID</th>
                                            <th class="sort-alpha">Description</th>
                                            <th class="sort-amount">Price</th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <%
                                            try
                                            {

                                                String query="select * from VocalService";
                                                ConnectionBD Con = new ConnectionBD();
                                                Con.driver();
                                                Con.OpenConnexion();
                                                ResultSet rs =Con.selectExec(query);
                                                while(rs.next())
                                                {

                                        %>

                                        <tr class="odd gradeX">
                                            <td class="text-center"><%=rs.getString("ServiceID") %></td>
                                            <td class="text-center"><%=rs.getString("Description") %></td>
                                            <td class="text-center"><%=rs.getString("Price") %></td>
                                        </tr>

                                        <%

                                            }
                                        %>
                                        </tbody>

                                    </table>
                                    <%
                                            rs.close();
                                            Con.closeConnection();
                                        }
                                        catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                                    %>

                                </div>
                            </div>
                            <!-- /tile body -->
                        </section>
                        <!-- tile -->
                        <section class="tile transparent">


                            <!-- tile header -->
                            <div class="tile-header transparent">
                                <h1><strong>Network</strong> Services </h1>
                                <div class="controls">
                                    <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                                    <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                                    <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                </div>
                            </div>
                            <!-- /tile header -->

                            <!-- tile body -->
                            <div class="tile-body color transparent-black rounded-corners">

                                <div class="table-responsive">
                                    <table  class="table table-datatable table-custom" id="basicDataTable">
                                        <thead>
                                        <tr>
                                            <th class="sort-alpha">ServiceID</th>
                                            <th class="sort-alpha">ISP</th>
                                            <th class="sort-amount">Description</th>
                                            <th class="sort-numeric">Price</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            try
                                            {
                                                String query="select * from NetworkService";
                                                ConnectionBD Con = new ConnectionBD();
                                                Con.driver();
                                                Con.OpenConnexion();
                                                ResultSet rs =Con.selectExec(query);
                                                while(rs.next())
                                                {

                                        %>

                                        <tr class="odd gradeX">
                                            <td class="text-center"><%=rs.getString("ServiceID") %></td>
                                            <td class="text-center"><%=rs.getString("ISP") %></td>
                                            <td class="text-center"><%=rs.getString("Description") %></td>
                                            <td class="text-center"><%=rs.getString("Price") %></td>
                                        </tr>

                                        <%

                                            }
                                        %>
                                        </tbody>

                                    </table>
                                    <%
                                            rs.close();
                                            Con.closeConnection();
                                        }
                                        catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>
                            </div>
                            <!-- /tile body -->
                        </section>
                    </div>
                    <!-- /col 12 -->
                </div>
                <!-- /row -->
            </div>
            <!-- /content container -->
        </div>
        <!-- Page content end -->
    </div><!-- tab-content -->
</div>

</div>
<!-- Make page fluid-->

</div>
<!-- Wrap all page content end -->



<section class="videocontent" id="video"></section>



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
<script type="text/javascript" src="assets/js/vendor/blockui/jquery.blockUI.js"></script>\

<script src="assets/js/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="assets/js/vendor/datatables/ColReorderWithResize.js"></script>
<script src="assets/js/vendor/datatables/colvis/dataTables.colVis.min.js"></script>
<script src="assets/js/vendor/datatables/tabletools/ZeroClipboard.js"></script>
<script src="assets/js/vendor/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="assets/js/vendor/datatables/dataTables.bootstrap.js"></script>

<script src="assets/js/vendor/chosen/chosen.jquery.min.js"></script>

<script src="assets/js/minimal.min.js"></script>


</body>
</html>
