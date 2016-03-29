<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<section class="content-header clearfix">
    <h1 class="pull-left">
        结算单明细
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <button type="button" class="btn btn-primary" id="project">项目管理</button>
        <button type="button" class="btn btn-primary" id="add">添加条目</button>
        <button type="button" class="btn btn-primary" id="print"><i class="fa fa-print"></i> 打印</button>
    <#--<button type="button" class="btn btn-primary" id="export"><i class="fa fa-download"></i> 导出Excel</button>-->
    </div>
</section>
<section class="content order-detail">
    <div class="box">
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th rowspan="2" width="4%">项目号</th>
                    <th rowspan="2" width="20%">名　　　称</th>
                    <th colspan="4" width="30%">规　格　数　量</th>
                    <th rowspan="2" width="8%">单价(每㎡或m)</th>
                    <th rowspan="2" width="14%">金　额</th>
                    <th rowspan="2">备　注</th>
                    <th rowspan="2" width="130px">操　作</th>
                </tr>
                <tr>
                    <th>长或高(米)</th>
                    <th>宽(米)</th>
                    <th>数量(条片)</th>
                    <th>面积(㎡)</th>
                </tr>
                </thead>
                <tbody>
                    <#list data as project>
                        <#assign orderDetails=project.orderDetails>
                        <#list orderDetails as item>
                        <tr>
                            <td class="text-center"><#if item_index=0>${project.no}</#if></td>
                            <td>${item.name}</td>
                            <td class="number"><#if item.type==1||item.type==2>${item.spec1}</#if></td>
                            <td class="number"><#if item.type==1||item.type==2>${item.spec2}</#if></td>
                            <td class="number">${item.num}</td>
                            <td class="number"><#if item.type==1>${item.area}</#if></td>
                            <td class="number">${item.price}</td>
                            <td class="number">${item.money}</td>
                            <td>${item.remark}</td>
                            <td>
                                <a class="btn btn-primary" href="${ctx}order/detail/edit.htm?id=${item.id}">编辑</a>
                                <a class="btn btn-primary" onclick="del(${item.id})">删除</a>
                            </td>
                        </tr>
                        </#list>
                    <tr>
                        <td></td>
                        <td class="project-count text-center">${project.title}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="project-count number">${project.area}</td>
                        <td></td>
                        <td class="project-count number">${project.money}</td>
                        <td></td>
                        <td></td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>
</section>
<!-- Main content -->

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
    $("#print").click(function () {
        window.open("${ctx}order/detail/print.htm?orderId=${orderId}");
    });
    $("#export").click(function () {
        alert("该功能暂不可用");
    });
    $("#project").click(function () {
        location = "${ctx}project.htm?orderId=${orderId}";
    });
</script>
</@inc.footer>
