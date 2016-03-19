<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        产品管理
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">产品管理</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- general form elements -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><#if data??>编辑产品<#else>添加产品</#if></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" lpformnum="1" id="edit-form">
                <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">名称</label>
                        <input type="text" class="form-control" name="name" placeholder="名称"
                               autocomplete="off" value="<#if data??>${data.name}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">类型</label>
                        <select name="type" class="form-control">
                            <option value="1" <#if data??&&data.type==1>selected</#if>>类型1【长、宽】</option>
                            <option value="2" <#if data??&&data.type==2>selected</#if>>类型2【高】</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">长或高(米)</label>
                        <input type="number" class="form-control" name="spec1"
                               placeholder="长或高(米)" autocomplete="off" value="<#if data??>${data.spec1}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">宽(米)</label>
                        <input type="number" class="form-control" name="spec2"
                               placeholder="宽(米)" autocomplete="off" value="<#if data??>${data.spec2}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">单价(每平方米或每米)</label>
                        <input type="number" class="form-control" name="price"
                               placeholder="单价(每平方米或每米)" autocomplete="off" value="<#if data??>${data.price}</#if>">
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="button" id="submit" class="btn btn-primary">确定</button>
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
        $.post('${ctx}product/save.htm',$("#edit-form").serialize(), function (data, status) {
            if(data.data==true){
                alert("保存成功");
                location="/product.htm";
            }else{
                alert("保存失败");
            }
        });
    });
</script>
</@inc.footer>
