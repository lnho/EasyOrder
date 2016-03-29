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
        <!-- /.box-header -->
        <!-- form start -->
        <form role="form" class="form-horizontal" id="edit-form">
            <div class="col-sm-7">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><#if data??>编辑结算单明细<#else>添加结算单明细</#if></h3>
                    </div>
                    <input type="hidden" name="id" value="<#if data??>${data.id}</#if>">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="projectId" id="project-lable"
                                   class="col-sm-2 control-label">项目</label>
                            <div class="col-sm-10">
                                <select name="projectId" id="projectId" class="form-control"
                                        onchange="changeProject(this.options.selectedIndex)">
                                    <#list projects as item>
                                        <option value="${item.id}"
                                                <#if data??&&item.id==data.projectId>selected</#if>>${item.name}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-4">
                                <select name="type" id="type" class="form-control"
                                        onchange="changeType(this.options.selectedIndex+1)">
                                    <option value="1">产品列表</option>
                                    <option value="2">线条列表</option>
                                    <option value="3">加工费列表</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <select name="productId" id="name" class="form-control"
                                        onchange="changeName(this.options.selectedIndex)">
                                </select>
                            </div>
                        </div>
                        <div class="form-group" id="spec1">
                            <label for="spec1" id="spec1-lable"
                                   class="col-sm-2 control-label">长或高</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="spec1" placeholder="长或高(米)"
                                       id="spec1-val" value="<#if data??>${data.spec1}</#if>">
                            </div>
                        </div>
                        <div class="form-group" id="spec2">
                            <label for="spec2" class="col-sm-2 control-label">宽</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="spec2" placeholder="宽(米)"
                                       id="spec2-val" value="<#if data??>${data.spec2}</#if>">
                            </div>
                        </div>
                        <div class="form-group" id="num">
                            <label for="num" class="col-sm-2 control-label">数量</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="num"
                                       id="num-val" placeholder="数量(条片)" value="<#if data??>${data.num}<#else>1</#if>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="remark" class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="remark"
                                       placeholder="备注" value="<#if data??>${data.remark}</#if>"></div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <label for="exampleInputPassword1" class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <button type="button" class="btn btn-primary" id="submit">确定</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">小计</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group" id="area">
                            <label for="area" class="col-sm-2 control-label">面积</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="area" readonly
                                       id="area-val" placeholder="面积(平方米)"
                                       value="<#if data??>${data.area}<#else>0</#if>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2 control-label">单价</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-cny"></i></span>
                                    <input type="number" class="form-control" name="price" readonly
                                           id="price-val" placeholder="单价(每平方米或每米)"
                                           value="<#if data??>${data.price}</#if>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="money" class="col-sm-2 control-label">金额</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-cny"></i></span>
                                    <input type="number" class="form-control" name="money" placeholder="金额"
                                           id="money" readonly value="<#if data??>${data.money}</#if>">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
                location = "/order/detail.htm?orderId=${orderId}";
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
    function change(type) {
        if (type == 1) {//产品列表
            $("#spec1").removeClass("hide");
            $("#spec2").removeClass("hide");
            $("#area").removeClass("hide");
        } else if (type == 2) {//线条列表
            $("#spec1").removeClass("hide");
            $("#spec2").removeClass("hide");
            $("#area").addClass("hide");
        } else {//加工费列表
            $("#spec1").addClass("hide");
            $("#spec2").addClass("hide");
            $("#area").addClass("hide");
        }
    }
    function cal() {
        var type = $('#type').val();
        var spec1 = $('#spec1-val').val();
        var spec2 = $('#spec2-val').val();
        var price = $('#price-val').val();
        var area = 0;
        var num = $('#num-val').val();
        var money = 0;
        if (type == "1") {
            area = spec1 * spec2 * num;
            money = area * price;
            $('#area-val').val(area.toFixed(3));
        } else if (type == "2") {
            money = spec1 * price * num;
        } else {
            money = price * num;
        }
        $('#money').val(money.toFixed(2));
    }
    var allProducts = [];
    var products = [];
    var currentType = 1;
        <#list products1 as item>
        var product = ['${item.id}', '${item.name}', '${item.price}', '${item.spec2}'];
        products.push(product);
        </#list>
    allProducts.push(products);
    products = [];
        <#list products2 as item>
        var product = ['${item.id}', '${item.name}', '${item.price}', '${item.spec2}'];
        products.push(product);
        </#list>
    allProducts.push(products);
    products = [];
        <#list products3 as item>
        var product = ['${item.id}', '${item.name}', '${item.price}', '${item.spec2}'];
        products.push(product);
        </#list>
    allProducts.push(products);
    products = [];
    function changeName(index) {
        var product = allProducts[currentType - 1][index];
        change(currentType);
        $("#price-val").val(product[2]);
        $("#type").val(currentType);
        if (currentType == 2) {
            $("#spec2-val").val(product[3]);
        }
        cal();
    }
    function changeNameById(productId) {
        var products = allProducts[currentType - 1];
        for (var index in products) {
            var product = products[index];
            if (product[0] == productId) {
                $("#name").val(productId);
                changeName(index);
            }
        }
    }
    function changeType(type) {
        currentType = type;
        var products = allProducts[type - 1];
        $("#name").html("");
        for (var index in products) {
            var product = products[index];
            $("#name").append("<option value='" + product[0] + "'>" + product[1] + "</option>");
        }
        changeName(0);
    }
        <#if data??>
        $("#type").val(${data.type});
        changeType(${data.type});
        changeNameById(${data.productId});
        <#else>
        changeType(1);
        </#if>
</script>
</@inc.footer>
