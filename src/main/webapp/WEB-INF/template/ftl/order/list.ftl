<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<section class="content-header clearfix">
    <h1 class="pull-left">
        结算单管理
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <div class="input-group search-bar">
            <input type="text" class="form-control" id="keyword" value="${keyword!""}">
            <span class="input-group-btn">
                <button id="search" type="button" class="btn btn-primary btn-flat">搜索</button>
            </span>
        </div>
        <button type="button" class="btn btn-primary" id="add">添加结算单</button>
    </div>
</section>
<section class="content">
    <div class="box">
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>客户</th>
                    <th>地址</th>
                    <th>电话</th>
                    <th>创建日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <#list data as item>
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.clientName}</td>
                        <td>${item.clientAddress}</td>
                        <td>${item.clientPhone}</td>
                        <td>${item.orderTime?date}</td>
                        <td>
                            <a class="btn btn-primary" href="${ctx}order/detail.htm?orderId=${item.id}">结算单明细</a>
                            <a class="btn btn-primary" href="${ctx}order/edit.htm?id=${item.id}">编辑</a>
                            <a class="btn btn-primary" onclick="del(${item.id})">删除</a>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
</section>
</@inc.body>
<@inc.footer nav>
<script>
    function del(id) {
        $.post('${ctx}order/del.htm', {id: id}, function (data, status) {
            if (data.data == true) {
                alert("删除成功");
                location = "/order.htm";
            } else {
                alert("删除失败");
            }
        });
    }
    $("#add").click(function () {
        location = "${ctx}order/edit.htm";
    });
    $("#search").click(function () {
        location = "${ctx}order.htm?keyword="+$("#keyword").val();
    });
</script>
</@inc.footer>
