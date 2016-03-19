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
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">订单</li>
    </ol>
</div>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- general form elements -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">编辑订单明细</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" lpformnum="1">
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">名称</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="名称"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">长或高(米)</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="长或高(米)" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">宽(米)</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="宽(米)" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">数量(条片)</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="数量(条片)" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">面积(平方米)</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="面积(平方米)" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">单价(每平方米或每米)</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="单价(每平方米或每米)" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">金额</label>
                        <input type="number" class="form-control" id="exampleInputPassword1"
                               placeholder="金额" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">备注</label>
                        <input type="text" class="form-control" id="exampleInputPassword1"
                               placeholder="备注" autocomplete="off">
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">确定</button>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </div>
</section>
</@inc.body>
<@inc.footer nav>
</@inc.footer>
