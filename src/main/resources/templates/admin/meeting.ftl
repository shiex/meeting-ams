<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin-meeting</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        i {
            margin-right: 10px;
        }

        .content {
            padding: 15px;
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
                <li class="layui-nav-item layui-this">
                    <a href="/admin/meeting/index"><i class="layui-icon">&#xe656;</i>会议管理</a>
                </li>
                <li class="layui-nav-item">
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
            <div class="content-meeting">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>会议管理</legend>
                </fieldset>

                <table class="layui-hide" id="meeting" lay-filter="meeting-table"></table>

                <script type="text/html" id="topDemo">
                    <a class="layui-btn layui-btn-primary layui-btn-sm" href="/admin/meeting/add.html" target="_blank">注册会议</a>
                    <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="sx()">刷新</button>
                </script>

                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
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
        table.render({
            elem: '#meeting',
            toolbar: '#topDemo',
            title: '会议数据列表',
            page: true,
            limit: 15,
            limits: [15, 30, 40, 50],
            url: '/admin/meeting/list',
            cols: [[
                {field: 'id', title: '会议ID',width:100, sort: true, fixed: 'left'},
                {field: 'title', title: '标题', minWidth: 310},
                {field: 'meetingPeopleCount', title: '会议人数', width: 110, sort: true},
                {field: 'startTime', title: '开始时间', width: 150},
                {field: 'endTime', title: '结束时间', width: 150},
                {fixed: 'right', width: 155, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(meeting-table)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    location.href = "/admin/meeting/add.html";
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(meeting-table)', function (obj) { // 注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var layEvent = obj.event,
                tableData = obj.data; // 获得 lay-event 对应的值
            if (layEvent === 'detail') {
                window.open("/admin/meeting/" + tableData.id + ".html");
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    Ax.rest("/admin/meeting/remove", tableData.id, function (data) {
                        obj.del(); // 删除对应行（tr）的DOM结构
                        layer.close(index);
                        layer.msg('删除成功');
                    })
                    // 向服务端发送删除指令
                });
            } else if (layEvent === 'edit') {
                location.href = "/admin/meeting/edit/" + tableData.id;
            }
        });
    });

    function sx() {
        location.reload();
    }
</script>
</html>