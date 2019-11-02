<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
            background-color: #eeeeee;
        }

        .content {
            margin-top: 10px;
            padding: 20px;
            min-width: 1200px;
            background-color: #fff;
        }

        .meeting-data {
            margin-top: 13px
        }

        .meeting-data ul {
            padding: 2px;
        }

        .meeting-data li {
            display: inline-block;
            margin-right: 10px;
            color: rgba(119, 119, 119, 1);
        }

        .content .md {
            margin-bottom: 10px;
            border-left: 3px solid #009f95;
            font-size: 18px;
            padding-left: 5px;
            width: 120px;
        }
    </style>
</head>
<body>
<nav class="layui-layout layui-layout-admin">
    <#include "static_top.ftl">
    <div class="layui-container content">
        <div class="layui-row" style="padding-bottom: 5px">
            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                <h1>${meeting.title}</h1>
            </div>
            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 meeting-data">
                <ul>
                    <li>注册人员：${meeting.userName}</li>
                    <li>注册时间：${meeting.registerTime}</li>
                </ul>
                <ul>
                    <li>会议室：${meeting.meetingRoom.name}</li>
                    <li>会议室费用：${meeting.meetingRoom.cost?c}元</li>
                    <li>会议人数：${meeting.meetingPeopleCount?c}</li>
                    <li>会议地址：${meeting.meetingRoom.location}</li>
                </ul>
                <ul>
                    <li>宾馆：${meeting.hotel.name}</li>
                    <li>宾馆费用：${meeting.hotel.cost?c}元</li>
                    <li>宾馆地址：${meeting.hotel.location}</li>
                </ul>
                <ul>
                    <li>开始时间：${meeting.startTime}</li>
                    <li>结束时间：${meeting.endTime}</li>
                </ul>
            </div>
        </div>
        <div class="layui-row" style="border-bottom: 1px solid #eeeeee; padding: 15px 0px">
            <div class="md">会议大纲</div>
            <div>
                ${meeting.outline!'暂无'}
            </div>
        </div>
        <div class="layui-row" style="padding: 10px 0px;">
            <div class="md">会议人员名单</div>
            <ul class="user-list">
                <#list meeting.userList as u>
                    <li class="layui-btn layui-btn-sm layui-btn-radius layui-btn-primary" style="margin-bottom: 5px">
                        ${u.userName}
                    </li>
                </#list>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>