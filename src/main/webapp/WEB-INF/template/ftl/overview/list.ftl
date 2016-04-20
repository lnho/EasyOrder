<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<section class="content-header clearfix">

</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">月度统计</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th width="25%">月份</th>
                    <th width="25%">单数</th>
                    <th width="25%">面积</th>
                    <th width="25%">金额</th>
                </tr>
                </thead>
                <tbody>
                    <#list monthsList as item>
                    <tr>
                        <td>${item.countTime}</td>
                        <td>${item.orderNum}</td>
                        <td>${item.area!0.0}</td>
                        <td>${item.money!0.0}</td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>

    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">年度统计</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th width="25%">年份</th>
                    <th width="25%">单数</th>
                    <th width="25%">面积</th>
                    <th width="25%">金额</th>
                </tr>
                </thead>
                <tbody>
                    <#list yearsList as item>
                    <tr>
                        <td>${item.countTime}</td>
                        <td>${item.orderNum}</td>
                        <td>${item.area!0.0}</td>
                        <td>${item.money!0.0}</td>
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

</script>
</@inc.footer>
