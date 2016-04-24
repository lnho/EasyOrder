<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<body onload="window.print();">
<div class="wrapper">
    <!-- Main content -->
    <section class="invoice">
        <div id="print-header" class="clearfix">
            <h1>${printTitle}</h1>
            <span class="no">单据编号：${order.id}</span>
            <span class="pull-right">${order.orderTime?date}</span>
            <div class="clientInfo">客户：${order.clientName}　地址：${order.clientAddress}　电话：${order.clientPhone}</div>
            <div class="pull-right">单价及金额单位：元</div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th rowspan="2" width="4%">项目号</th>
                <th rowspan="2">名　称</th>
                <th rowspan="2" width="20%">品　　　名</th>
                <th colspan="4" width="33%">规　格　数　量</th>
                <th rowspan="2" width="8%">单价(每㎡或m)</th>
                <th rowspan="2" width="15%">金　额</th>

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
                    <td>${item.remark}</td>
                    <td>${item.name}</td>
                    <td class="number"><#if item.type==1||item.type==2>${item.spec1}</#if></td>
                    <td class="number"><#if item.type==1||item.type==2>${item.spec2}</#if></td>
                    <td class="number">${item.num}</td>
                    <td class="number"><#if item.type==1>${item.area}</#if></td>
                    <td class="number">${item.price}</td>
                    <td class="number">${item.money}</td>
                </tr>
                </#list>
            <tr>
                <td></td>
                <td class="project-count text-center">${project.title}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td class="project-count number">${project.area}</td>
                <td></td>
                <td class="project-count number">${project.money}</td>

            </tr>
            </#list>
            </tbody>
        </table>
        <div class="attachments">
            <#list attachments as item>
            ${item.fileName}:
                <img src="${item.savePath}" class="attachment-img">
            </#list>
        </div>
    </section>
</div>
</body>
<!-- Main content -->
<@inc.footer nav>
</@inc.footer>
