<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<section class="content-header clearfix">
    <h1 class="pull-left">
        项目列表
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <button type="button" class="btn btn-primary" id="add">添加项目</button>
    </div>
</section>

<!-- Main content -->
<section class="content">
    <div class="box">
        <div class="box-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <#list data as item>
                    <tr>
                        <td>${item.name}</td>
                        <td>
                            <a class="btn btn-primary" href="${ctx}project/edit.htm?id=${item.id}">修改</a>
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
        $.post('${ctx}project/del.htm', {id: id}, function (data, status) {
            if (data.data == true) {
                alert("删除成功");
                location = "/project.htm?orderId=${orderId}";
            } else {
                alert("删除失败");
            }
        });
    }
    $("#add").click(function () {
        location = "${ctx}project/add.htm?orderId=${orderId}";
    });
</script>
</@inc.footer>
