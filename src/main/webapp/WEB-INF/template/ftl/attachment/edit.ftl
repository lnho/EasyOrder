<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
    <#if result??>
<script>
        <#if result==true>
        alert("操作成功")
        location="/attachment.htm?type=${type}&relativeId=${relativeId}"
        <#else >
        alert("操作失败")
        history.go(-1);
        </#if>
</script>
    </#if>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        附件列表
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">附件列表</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <!-- general form elements -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><#if data??>编辑附件<#else>添加附件</#if></h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form role="form" lpformnum="1" id="edit-form" enctype="multipart/form-data" method="post" action="${ctx}attachment/save.htm">
            <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
            <input type="hidden" name="relativeId" value="${relativeId}">
            <input type="hidden" name="type" value="${type}">
            <div class="box-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">名称</label>
                    <input type="text" class="form-control" name="fileName" placeholder="名称"
                           autocomplete="off" value="<#if data??>${data.fileName}</#if>">
                </div>
            </div>
            <#if data??><#else>
            <div class="box-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">附件</label>
                    <input type="file" name="file">
                </div>
            </div>
            <!-- /.box-body -->
            </#if>
            <div class="box-footer">
                <button type="submit" id="submit" class="btn btn-primary">确定</button>
            </div>
        </form>
    </div>
    <!-- /.box -->
</section>
</@inc.body>
<@inc.footer nav>

</@inc.footer>
