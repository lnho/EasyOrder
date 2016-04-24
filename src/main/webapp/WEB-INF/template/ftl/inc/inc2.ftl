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
    <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Theme style -->
    <link rel="stylesheet" href="/fed/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/fed/css/skins/_all-skins.min.css">
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
        <a href="/order.htm" class="logo">
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">${siteName}</span>
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
                <li class="<#if leftMenu=='overview'>active</#if>">
                    <a href="/overview.htm"><i class="fa fa-line-chart"></i> 概览</a>
                </li>
                <li class="treeview <#if leftMenu=='product1'||leftMenu=='product2'||leftMenu=='product3'>active</#if>"
                    id="scrollspy-components">
                    <a href="javascript::;"><i class="fa fa-gear"></i> 产品管理</a>
                    <ul class="treeview-menu">
                        <li class="<#if leftMenu=='product1'>active</#if>">
                            <a href="/product.htm?type=1"><i class="fa fa-circle-o"></i> 产品列表</a>
                        </li>
                        <li class="<#if leftMenu=='product2'>active</#if>">
                            <a href="/product.htm?type=2"><i class="fa fa-circle-o"></i> 线条列表</a>
                        </li>
                        <li class="<#if leftMenu=='product3'>active</#if>">
                            <a href="/product.htm?type=3"><i class="fa fa-circle-o"></i> 加工费列表</a>
                        </li>
                    </ul>
                </li>
                <li class="<#if leftMenu=='order'>active</#if>">
                    <a href="/order.htm"><i class="fa fa-archive"></i> 结算单</a>
                </li>

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
<!-- AdminLTE App -->
<script src="/fed/js/app.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="//cdn.bootcss.com/jQuery-slimScroll/1.3.7/jquery.slimscroll.min.js"></script>
    <#nested>
</body>
</html>

</#macro>