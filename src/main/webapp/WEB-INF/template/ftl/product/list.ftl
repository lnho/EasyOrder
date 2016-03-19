<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1 class="pull-left">
        产品列表
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <button type="submit" class="btn btn-primary" id="add">添加产品</button>
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
            <th>单价(每平方米或每米)</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <#list data as item>
            <tr>
                <td>${item.name}</td>
                <td>${item.spec1}</td>
                <td>${item.spec2}</td>
                <td>${item.price}</td>
                <td>
                    <a class="btn btn-primary" href="${ctx}product/edit.htm?id=${item.id}">修改</a>
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
        $.post('${ctx}product/del.htm', {id: id}, function (data, status) {
            if (data.data == true) {
                alert("删除成功");
                location = "/product.htm";
            } else {
                alert("删除失败");
            }
        });
    }
    $("#add").click(function () {
        location = "${ctx}product/edit.htm";
    });
</script>
</@inc.footer>
