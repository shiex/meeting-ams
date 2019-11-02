<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin-meeting-room</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        i {
            margin-right: 10px;
        }

        .content {
            padding: 15px;
        }

        #meeting-room-save{
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
                <li class="layui-nav-item">
                    <a href="/admin/user/index"><i class="layui-icon">&#xe770;</i>人员管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/hotel/index"><i class="layui-icon">&#xe629;</i>宾馆管理</a>
                </li>
                <li class="layui-nav-item  layui-this">
                    <a href="/admin/cost/index"><i class="layui-icon">&#xe609;</i>费用管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content">
            <div class="content-meeting-room">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>费用管理</legend>
                </fieldset>

                <table class="layui-hide" id="cost" lay-filter="cost-table"></table>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © com.xbb --- shiex制作
    </div>
</nav>
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

        element.on('nav(demo)', function (elem) {
            layer.msg('shy');
            console.log(elem); //得到当前点击的DOM对象
        });

        //执行一个 table 实例
        var tableObj = table.render({
            elem: '#cost',
            toolbar: '#topDemo',
            title: '宾馆数据列表',
            page: true,
            limit: 15,
            limits: [15, 30, 40, 50],
            url: '/admin/cost/list',
            cols: [[
                {field: 'id', title: '费用ID', width: 130, sort: true, fixed: 'left'},
                {field: 'meetingTitle', title: '会议标题', minWidth: 150},
                {field: 'userName', title: '注册人员', width: 150},
                {field: 'meetingCost', title: '会议费用', width: 120, sort: true},
                {field: 'hotelCost', title: '宾馆费用', width: 120, sort: true},
                {field: 'subtotal', title: '费用小计', width: 130, sort: true}
            ]]
        });

    });
</script>
</html>