<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        结算单明细管理
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">结算单明细管理</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- general form elements -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><#if data??>编辑结算单明细<#else>添加结算单明细</#if></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" lpformnum="1" id="edit-form">
                <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
                <input type="hidden" name="orderId" value="<#if orderId??>${orderId}</#if>">
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">名称</label>
                        <input type="text" class="form-control" name="name" placeholder="名称"
                               autocomplete="off" value="<#if data??>${data.name}</#if>">
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
                        <label for="exampleInputPassword1">数量(条片)</label>
                        <input type="number" class="form-control" name="num"
                               placeholder="数量(条片)" autocomplete="off" value="<#if data??>${data.num}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">面积(平方米)</label>
                        <input type="number" class="form-control" name="area"
                               placeholder="面积(平方米)" autocomplete="off" value="<#if data??>${data.area}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">单价(每平方米或每米)</label>
                        <input type="number" class="form-control" name="price"
                               placeholder="单价(每平方米或每米)" autocomplete="off" value="<#if data??>${data.price}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">金额</label>
                        <input type="number" class="form-control" name="money"
                               placeholder="金额" autocomplete="off" value="<#if data??>${data.money}</#if>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">备注</label>
                        <input type="text" class="form-control" name="remark"
                               placeholder="备注" autocomplete="off" value="<#if data??>${data.remark}</#if>">
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
        $.post('${ctx}order/detail/save.htm', $("#edit-form").serialize(), function (data, status) {
            if (data.data == true) {
                alert("保存成功");
                location = "/order/detail.htm?orderId=${orderId}";
            } else {
                alert("保存失败");
            }
        });
    });
</script>
</@inc.footer>
