<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/wangEditor-3.1.1/release/wangEditor.min.css">

    <style>
        #add-ok{
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="layui-layout layui-layout-admin" style="margin-bottom: 30px">
    <#include "static_top.ftl">
    <div class="layui-container layui-form layui-form-pane" style="margin-top: 30px; min-width: 1200px">
        <div class="layui-row">
            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 0px">
                        <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                <div id="editor"></div>
            </div>

            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="margin-top: 15px; text-align: center">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <div id="user-list" class="demo-transfer"></div>
                </div>
                <div class="layui-col-xs5 layui-col-sm5 layui-col-md5">
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择会议室</label>
                        <div class="layui-input-block">
                            <select name="meetingRoomId" lay-verify="required">
                                <option value="">请选择会议室</option>
                                <#list meetingRoomList as meetingRoom>
                                    <option value="${meetingRoom.id}">名称：${meetingRoom.name}，费用：${meetingRoom.cost}元</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择宾馆</label>
                        <div class="layui-input-block">
                            <select name="hotelId" lay-verify="required">
                                <option value="">请选择宾馆</option>
                                <#list hotelList as hotel>
                                    <option value="${hotel.id}">名称：${hotel.name}，费用：${hotel.cost}元</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">开始时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="startTime" type="text" autocomplete="off" id="startTime"
                                   lay-verify="required" class="layui-input laydate" placeholder="请选择会议开始时间">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">结束时间</label>
                        <div class="layui-input-block">
                            <input name="endTime" type="text" autocomplete="off" id="endTime"
                                   lay-verify="required" class="layui-input laydate" placeholder="请选择会议结束时间">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="margin-top: 15px; text-align: right">
                <div class="layui-block">
                    <button class="layui-btn" lay-submit lay-filter="add">
                        确定
                    </button>
                </div>
            </div>
        </div>
    </div>
</nav>

<div id="add-ok" style="display: none">
    <label>添加成功</label>
</div>
</body>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/axquery.js"></script>
<script type="text/javascript" src="/js/template-web.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>
<script type="text/javascript" src="/wangEditor-3.1.1/release/wangEditor.min.js"></script>

<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'table',  // 表格
        'undo',  // 撤销
        'redo'  // 重复
    ]
    editor.create();

    layui.use(['element', 'laydate', 'layer', 'form', 'transfer', 'util'], function () {
        var laydate = layui.laydate,
            layer = layui.layer,
            form = layui.form,
            element = layui.element,
            transfer = layui.transfer,
            util = layui.util;

        var startTime = laydate.render({
            elem: '#startTime',
            type: 'datetime',
            btns: ['confirm'],
            min: 0,
            done: function (value, date) {
                endTime.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date,
                    hours: date.hours,
                    minutes: date.minutes,
                    seconds: date.seconds
                };
            }
        });

        var endTime = laydate.render({
            elem: '#endTime',
            type: 'datetime',
            btns: ['confirm'],
            min: 0,
            done: function (value, date) {
                startTime.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date,
                    hours: date.hours,
                    minutes: date.minutes,
                    seconds: date.seconds
                }
            }
        });

        var userList = {};
        jQuery.ajax({
            url: "/admin/user/list/all",
            method: "POST",
            processData: false,
            data: null,
            dataType: 'json',
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function (ans) {
                userList = ans.data;
            }
        });
        //显示搜索框
        transfer.render({
            elem: '#user-list',
            data: userList,
            title: ['选择人员', '已选人员'],
            showSearch: true,
            id: 'userList',
            parseData: function (res) {
                return {
                    "value": res.id,
                    "title": res.userName
                }
            }
        })

        form.on('submit(add)', function (data) {
            var userList = transfer.getData('userList');
            if (userList.length <= 0) {
                layer.msg('请先选择人员');
                return;
            }
            var meeting = data.field;
            meeting.outline = editor.txt.html();
            meeting.meetingUserList = [];
            for (var i = 0; i < userList.length; i++) {
                meeting.meetingUserList.push({
                    userId:userList[i].value,
                    userName:userList[i].title
                });
            }
            Ax.rest("/admin/meeting/add", meeting, function (data) {
                layer.open({
                    type: 1,
                    title: false,
                    content: $('#add-ok'),
                    area: '150px',
                    cancel: function(index, layero){
                        location.reload();
                    }
                });
            })
        });

        // reset
        form.on('submit(reset)', function (data) {
            location.reload();
        });

    });
</script>
</html>