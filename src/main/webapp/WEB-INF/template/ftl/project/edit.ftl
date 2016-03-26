<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        项目列表
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">项目列表</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <!-- general form elements -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><#if data??>编辑项目<#else>添加项目</#if></h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form role="form" lpformnum="1" id="edit-form">
            <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
            <input type="hidden" name="orderId" value="${orderId}">
            <div class="box-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">名称</label>
                    <input type="text" class="form-control" name="name" placeholder="名称"
                           autocomplete="off" value="<#if data??>${data.name}</#if>">
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <button type="button" id="submit" class="btn btn-primary">确定</button>
            </div>
        </form>
    </div>
    <!-- /.box -->
</section>
</@inc.body>
<@inc.footer nav>
<script>
    $("#submit").click(function () {
        $.post('${ctx}project/save.htm', $("#edit-form").serialize(), function (res, status) {
            if (res.result == "success") {
                alert("保存成功");
                location = "/project.htm?orderId=${orderId}";
            } else if (res.messages != "") {
                alert(res.messages[0]);
            } else {
                alert("保存失败");
            }
        });
    });
</script>
</@inc.footer>
