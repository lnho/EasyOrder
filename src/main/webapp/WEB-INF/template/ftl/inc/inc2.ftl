<#global ctx = '${ctx}'>
<#macro header title>
<!DOCTYPE HTML>
<html>
<head>
    <title>${title!""}</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/fed/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/fed/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/fed/css/skins/_all-skins.min.css">
    <#--<link rel="stylesheet" href="/fed/css/style.css">-->
    <link rel="stylesheet" href="/fed/css/custom.css">
    <#nested>
</head>
</#macro>
<#macro body>
<body class="skin-blue fixed" data-spy="scroll" data-target="#scrollspy">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <!-- Logo -->
        <a href="../index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>E</b>Order</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Easy</b>Order</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li><a href="#">退出</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <div class="sidebar" id="scrollspy">

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">功能</li>
                <li class="treeview active" id="scrollspy-components">
                    <a href="javascript::;"><i class="fa fa-circle-o"></i> 产品管理</a>
                    <ul class="treeview-menu menu-open">
                        <li><a href="/product.htm?type=1">产品列表</a></li>
                        <li><a href="/product.htm?type=2">线条列表</a></li>
                        <li><a href="/product.htm?type=3">加工费列表</a></li>
                    </ul>
                </li>
                <li class=""><a href="/order.htm"><i class="fa fa-circle-o"></i> 结算单</a></li>

            </ul>
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <#nested>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.1
        </div>
        <strong>Copyright &copy; 2014-2016 EasyOrder.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <div class="pad">
            This is an example of the control sidebar.
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>
</#macro>

<#macro footer nav>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/fed/js/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="/fed/js/app.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="/fed/js/jquery.slimscroll.min.js"></script>
    <#nested>
</body>
</html>

</#macro>