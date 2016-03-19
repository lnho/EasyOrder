<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<div class="content-header">
    <h1>
        订单明细
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Documentation</li>
    </ol>
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
                    <a class="btn btn-primary" href="${ctx}order/detail/edit.htm?orderId=${item.id}">编辑</a>
                    <a class="btn btn-primary" href="${ctx}order/detail/del.htm?orderId=${item.id}">删除</a>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>
</@inc.body>
<@inc.footer nav>
</@inc.footer>
