<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin-user</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        i {
            margin-right: 10px;
        }

        .content {
            padding: 15px;
        }

        #user-save {
            display: none;
            padding: 20px;
        }
    </style>
</head>
<body class="layui-layout-body">
<nav class="layui-layout layui-layout-admin">
    <#include "static_top.ftl">

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree layui-inline">
                <li class="layui-nav-item">
                    <a href="/admin/meeting/room/index"><i class="layui-icon">&#xe629;</i>会议室管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/meeting/index"><i class="layui-icon">&#xe656;</i>会议管理</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="/admin/user/index"><i class="layui-icon">&#xe770;</i>人员管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/hotel/index"><i class="layui-icon">&#xe629;</i>宾馆管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/cost/index"><i class="layui-icon">&#xe609;</i>费用管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content">
            <div class="content-user">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>用户管理</legend>
                </fieldset>

                <table class="layui-hide" id="user-table" lay-filter="user-table"></table>

                <script type="text/html" id="topDemo">
                    <a class="layui-btn layui-btn-primary  layui-btn-sm" lay-event="add">添加</a>
                </script>

                <script type="text/html" id="barDemo">
                    <#--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>-->
                    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © com.xbb --- shiex制作
    </div>
</nav>

<div class="layui-form layui-form-pane" id="user-save" lay-filter="user-save">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-block">
            <input type="text" name="id" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" required lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="cellphone" required lay-verify="required|phone" placeholder="请输入手机号"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="text" name="sex" required lay-verify="required" placeholder="请输入性别" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工工号</label>
        <div class="layui-input-block">
            <input type="text" name="jobNumber" required lay-verify="required" placeholder="请输入员工工号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save">确定</button>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/axquery.js"></script>
<script type="text/javascript" src="/js/template-web.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['element', 'table', 'form', 'layer'], function () {
        var element = layui.element,
            table = layui.table,
            form = layui.form,
            layer = layui.layer;

        //执行一个 table 实例
        table.render({
            elem: '#user-table',
            toolbar: '#topDemo',
            title: '用户数据列表',
            page: true,
            limit: 15,
            limits: [15, 30, 40, 50],
            url: '/admin/user/list',
            cols: [[
                {field: 'id', title: '用户ID', width: 100, sort: true, fixed: 'left'},
                {field: 'userName', title: '用户名', width: 210},
                {field: 'email', title: '邮箱', width: 170},
                {field: 'cellphone', title: '手机号', width: 170},
                {
                    field: 'sex', title: '性别', width: 80, templet: function (data) {
                        if (data.sex == true) {
                            return '女';
                        } else {
                            return '男';
                        }
                    }
                },
                {field: 'jobNumber', title: '员工工号', width: 150, sort: true},
                {fixed: 'right', width: 155, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(user-table)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 1,
                        title: '新增用户',
                        content: $('#user-save'),
                        area: ['550px', '420px'],
                        success: function (layero, index) {
                            form.val('user-save', { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "id": null,
                                "userName": null,
                                "email": null,
                                "cellphone": null,
                                "sex": null,
                                "jobNumber": null,
                                "registerTime": null,
                            });
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(user-table)', function (obj) { // 注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var layEvent = obj.event,
                tableData = obj.data; // 获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    Ax.rest("/admin/user/remove", tableData.id, function (data) {
                        obj.del(); // 删除对应行（tr）的DOM结构
                        layer.close(index);
                        layer.msg('删除成功');
                    })
                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title: '编辑中',
                    content: $('#user-save'),
                    area: ['550px', '420px'],
                    success: function (layero, index) {
                        if (tableData.sex == true) tableData.sex = '女';
                        if (tableData.sex == false) tableData.sex = '男';
                        form.val('user-save', tableData);
                    }
                });
            }
        });

        // 新增
        form.on('submit(save)', function(formData){
            var user = formData.field;
            if (user.sex != '男' || user.sex != '女') {
                layer.msg('性别输出有误，请输入男或者女');
            }
            if (user.sex == '男') user.sex = false;
            if (user.sex == '女') user.sex = true;
            Ax.rest("/admin/user/save", formData.field, function (data) {
                location.reload();
            })
        });

    });
</script>
</html>