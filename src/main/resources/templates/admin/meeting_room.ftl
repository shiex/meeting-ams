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
                <li class="layui-nav-item layui-this">
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
                <li class="layui-nav-item">
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
                    <legend>会议室管理</legend>
                </fieldset>

                <table class="layui-hide" id="meeting" lay-filter="meeting-table"></table>

                <script type="text/html" id="topDemo">
                    <a class="layui-btn layui-btn-primary  layui-btn-sm" lay-event="add">添加</a>
                </script>

                <script type="text/html" id="barDemo">
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

    <div class="layui-form layui-form-pane" id="meeting-room-save" lay-filter="meeting-room-save">
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">会议室ID</label>
            <div class="layui-input-block">
                <input type="text" name="id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="location" required  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">费用</label>
            <div class="layui-input-block">
                <input type="text" name="cost" required  lay-verify="required" placeholder="请输入费用" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">人数总容量</label>
            <div class="layui-input-block">
                <input type="text" name="roomPeopleCount" required  lay-verify="required" placeholder="请输入人数总容量" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="save">确定</button>
            </div>
        </div>
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
            elem: '#meeting',
            toolbar: '#topDemo',
            title: '会议室数据列表',
            page: true,
            limit: 15,
            limits: [15, 30, 40, 50],
            url: '/admin/meeting/room/list',
            cols: [[
                {field: 'id', title: '会议室ID', width: 130, sort: true, fixed: 'left'},
                {field: 'name', title: '名称', width: 150},
                {field: 'location', title: '地址', minWidth: 310, sort: true},
                {field: 'cost', title: '费用', width: 110, sort: true},
                {field: 'roomPeopleCount', title: '人数容纳量', width: 150, sort: true},
                {fixed: 'right', width: 155, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(meeting-table)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 1,
                        title: '新增会议室',
                        content: $('#meeting-room-save'),
                        area: ['500px','350px'],
                        success: function (layero, index) {
                            form.val('meeting-room-save',  { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "id": null,
                                "place": null,
                                "roomNumber": null,
                                "cost": null,
                                "roomPeopleCount": null,
                            });
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(meeting-table)', function (obj) { // 注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var layEvent = obj.event,
                tableData = obj.data; // 获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    Ax.rest("/admin/meeting/room/remove", tableData.id, function (data) {
                        obj.del(); // 删除对应行（tr）的DOM结构
                        layer.close(index);
                        layer.msg('删除成功');
                    })
                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title: '编辑中',
                    content: $('#meeting-room-save'),
                    area: ['500px','350px'],
                    success: function(layero, index){
                        form.val('meeting-room-save', tableData);
                    }
                });
            }
        });

        // 新增
        form.on('submit(save)', function(formData){
            Ax.rest("/admin/meeting/room/save", formData.field, function (data) {
                location.reload();
            })
        });

    });
</script>
</html>