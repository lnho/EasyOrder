<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1 class="pull-left">
        结算单明细
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <button type="button" class="btn btn-primary" id="add">添加结算单明细</button>
        <button type="button" class="btn btn-primary" id="export">导出Excel文档</button>
    </div>
</div>

<!-- Main content -->
<div class="content body">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>名称</th>
            <th>长或高(米)</th>
            <th>宽(米)</th>
            <th>数量(条片)</th>
            <th>面积(平方米)</th>
            <th>单价(每平方米或每米)</th>
            <th>金额</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <#list data as item>
            <tr>
                <td>${item.name}</td>
                <td>${item.spec1}</td>
                <td>${item.spec2}</td>
                <td>${item.num}</td>
                <td>${item.area}</td>
                <td>${item.price}</td>
                <td>${item.money}</td>
                <td>${item.remark}</td>
                <td>
                    <a class="btn btn-primary" href="${ctx}order/detail/edit.htm?id=${item.id}">编辑</a>
                    <a class="btn btn-primary" onclick="del(${item.id})">删除</a>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>
</@inc.body>
<@inc.footer nav>
<script>
    function del(id) {
        $.post('${ctx}order/detail/del.htm', {id: id}, function (data, status) {
            if (data.data == true) {
                alert("删除成功");
                location = "/order/detail.htm?orderId=${orderId}";
            } else {
                alert("删除失败");
            }
        });
    }
    $("#add").click(function () {
        location = "${ctx}order/detail/edit.htm?orderId=${orderId}";
    });
    $("#export").click(function () {
        alert("该功能暂不可用");
    });
</script>
</@inc.footer>
