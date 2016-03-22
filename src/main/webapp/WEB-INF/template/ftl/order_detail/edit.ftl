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
            <form role="form" class="form-horizontal" id="edit-form">
                <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
                <input type="hidden" name="projectId" value="<#if projectId??>${projectId}</#if>">
                <input type="hidden" name="type" id="type" value="<#if data??>${data.type}</#if>">
                <div class="box-body">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <#if data??>
                                <input type="text" class="form-control" name="name" placeholder="名称"
                                       value="<#if data??>${data.name}</#if>">
                            <#else>
                                <select name="name" id="name" class="form-control"
                                        onchange="changeName(this.options.selectedIndex)">
                                </select>
                            </#if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="spec1" id="spec1-lable"
                               class="col-sm-2 control-label">长或高(米)</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="spec1" placeholder="长或高(米)"
                                   id="spec1-val" value="<#if data??>${data.spec1}</#if>">
                        </div>
                    </div>
                    <div class="form-group" id="spec2">
                        <label for="spec2" class="col-sm-2 control-label">宽(米)</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="spec2" placeholder="宽(米)"
                                   id="spec2-val" value="<#if data??>${data.spec2}</#if>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">单价(每平方米或每米)</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="price"
                                   id="price-val" placeholder="单价(每平方米或每米)" value="<#if data??>${data.price}</#if>">
                        </div>
                    </div>
                    <div class="form-group" id="num">
                        <label for="num" class="col-sm-2 control-label">数量(条片)</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="num"
                                   id="num-val" placeholder="数量(条片)" value="<#if data??>${data.num}</#if>">
                        </div>
                    </div>
                    <div class="form-group" id="area">
                        <label for="area" class="col-sm-2 control-label">面积(平方米)</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="area"
                                   id="area-val" placeholder="面积(平方米)" value="<#if data??>${data.area}</#if>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="money" class="col-sm-2 control-label">金额</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="money" placeholder="金额"
                                   id="money" readonly value="<#if data??>${data.money}</#if>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="remark"
                                   placeholder="备注" value="<#if data??>${data.remark}</#if>"></div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <label for="exampleInputPassword1" class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <button type="button" class="btn btn-primary" id="submit">确定</button>
                    </div>
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
        cal();
        $.post('${ctx}order/detail/save.htm', $("#edit-form").serialize(), function (res, status) {
            if (res.result == "success") {
                alert("保存成功");
                location = "/order/detail.htm?projectId=${projectId}";
            } else if (res.messages != "") {
                alert(res.messages[0]);
            } else {
                alert("保存失败");
            }
        });
    });
    $("#spec1-val").change(function () {
        cal();
    });
    $("#spec2-val").change(function () {
        cal();
    });
    $("#price-val").change(function () {
        cal();
    });
    $("#area-val").change(function () {
        cal();
    });
    $("#num-val").change(function () {
        cal();
    });
    cal();
    function change(index) {
        if (index == 1) {
            $("#spec1-lable").html("长(米)");
            $("#spec2").removeClass("hide");
            $("#area").removeClass("hide");
            $("#num").addClass("hide");
        } else {
            $("#spec1-lable").html("高(米)");
            $("#spec2").addClass("hide");
            $("#area").addClass("hide");
            $("#num").removeClass("hide");
        }
    }
    function cal() {
        var type = $('#type').val();
        var spec1 = $('#spec1-val').val();
        var spec2 = $('#spec2-val').val();
        var price = $('#price-val').val();
        var area = $('#area-val').val();
        var num = $('#num-val').val();
        var money = 0;
        if (type == "1") {
            money = spec1 * spec2 * price * area;
        } else {
            money = spec1 * price * num;
        }
        $('#money').val(money);
    }
        <#if data??>
        change(${data.type});
        <#else>
        var products = [];
            <#list products as item>
            var product = ['${item.name}', '${item.type}', '${item.spec1}', '${item.spec2}', '${item.price}'];
            products.push(product);
            $("#name").append("<option value='${item.name}'>${item.name}</option>");
            </#list>
        changeName(0);
        function changeName(index) {
            var product = products[index];
            change(product[1]);
            $("#spec1-val").val(product[2]);
            $("#spec2-val").val(product[3]);
            $("#price-val").val(product[4]);
            $("#type").val(product[1]);
        }
        </#if>
</script>
</@inc.footer>
