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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/fed/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/fed/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/fed/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Admin</b>LTE</span>
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
                    <li><a href="http://almsaeedstudio.com">Almsaeed Studio</a></li>
                    <li><a href="http://almsaeedstudio.com/premium">Premium Templates</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <div class="sidebar" id="scrollspy">

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="nav sidebar-menu">
                <li class="header">功能</li>
                <li class="active"><a href="#introduction"><i class="fa fa-circle-o"></i> 销售管理</a></li>
                <#--<li class="treeview" id="scrollspy-components">-->
                    <#--<a href="javascript::;"><i class="fa fa-circle-o"></i> 销售管理</a>-->
                    <#--<ul class="nav treeview-menu">-->
                        <#--<li><a href="#component-main-header">出库单据</a></li>-->
                    <#--</ul>-->
                <#--</li>-->
            </ul>
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <h1>
                AdminLTE Documentation
                <small>Current version 2.3.0</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Documentation</li>
            </ol>
        </div>

        <!-- Main content -->
        <div class="content body">
            <#nested>
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.1
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
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