<#import '/WEB-INF/template/ftl/inc/inc2.ftl' as inc />
<#assign title='首页'>
<#assign nav='1'>
<@inc.header title>
</@inc.header>
<@inc.body>
<!-- Content Header (Page header) -->
<section class="content-header clearfix">
    <h1 class="pull-left">
        附件列表
    <#--<small>Current version 2.3.0</small>-->
    </h1>
    <div class="pull-right">
        <button type="button" class="btn btn-primary" id="add">添加附件</button>
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
                        <td>${item.fileName}</td>
                        <td>
                            <a class="btn btn-primary" href="${ctx}attachment/edit.htm?id=${item.id}">修改</a>
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
        $.post('${ctx}attachment/del.htm', {id: id}, function (res, status) {
            if (res.result == "success") {
                alert("删除成功");
                location = "/attachment.htm?type=${type}&relativeId=${relativeId}";
            } else if (res.messages != "") {
                alert(res.messages[0]);
            } else {
                alert("删除失败");
            }
        });
    }
    $("#add").click(function () {
        location = "${ctx}attachment/add.htm?type=${type}&relativeId=${relativeId}";
    });
</script>
</@inc.footer>
