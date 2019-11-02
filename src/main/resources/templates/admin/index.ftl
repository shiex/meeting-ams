<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin-index</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        i {
            margin-right: 10px;
        }
        .content{
            padding: 15px;
            text-align: center;
        }
        .content .content-welcome {
            margin-top: 30px;
        }
    </style>
</head>
<body class="layui-layout-body">
<nav class="layui-layout layui-layout-admin">
    <#include "static_top.ftl">

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
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
                <li class="layui-nav-item">
                    <a href="/admin/cost/index"><i class="layui-icon">&#xe609;</i>费用管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content">
            <div class="content-welcome">
                <h1>欢迎来到会议管理系统中心</h1>
                <h1 style="margin-top: 15px">Welcome to the conference management system center</h1>
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
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</html>