<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        结算单管理
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">结算单管理</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- general form elements -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><#if data??>编辑结算单<#else>添加结算单</#if></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" lpformnum="1" id="edit-form">
                <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">客户</label>
                        <input type="text" class="form-control" name="clientName" placeholder="客户"
                               autocomplete="off" value="<#if data??>${data.clientName}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">地址</label>
                        <input type="text" class="form-control" name="clientAddress"
                               placeholder="地址" autocomplete="off" value="<#if data??>${data.clientAddress}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">电话</label>
                        <input type="number" class="form-control" name="clientPhone"
                               placeholder="电话" autocomplete="off" value="<#if data??>${data.clientPhone}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">创建日期</label>
                        <input type="date" class="form-control" name="orderTime" placeholder="时间"
                               value="<#if data??>${data.orderTime?date}</#if>">
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="button" class="btn btn-primary" id="submit">确定</button>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </div>
</section>
</@inc.body>
<@inc.footer nav>
<script>
    $("#submit").click(function () {
        $.post('${ctx}order/save.htm', $("#edit-form").serialize(), function (res, status) {
            if (res.result == "success") {
                alert("保存成功");
                location = "/order.htm";
            } else if (res.messages != "") {
                alert(res.messages[0]);
            } else {
                alert("保存失败");
            }
        });
    });
</script>
</@inc.footer>
