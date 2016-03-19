<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
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
                <a class="btn btn-primary" href="${ctx}log.htm?userId=${item.id}">编辑</a>
                <a class="btn btn-primary" href="${ctx}log/count.htm?userId=${item.id}">删除</a>
            </td>
        </tr>
        </#list>
    </tbody>
</table>
</@inc.body>
<@inc.footer nav>
</@inc.footer>
