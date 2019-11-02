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

        .content .left {
            text-align: center;
        }

        .content .left li{
            background-color: #eeeeee;
            margin-bottom: 10px;
            padding: 5px;
        }

        .content .right li {
            margin-bottom: 10px;
            padding: 15px;
            border: 1px solid #009E94;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<nav class="layui-layout layui-layout-admin">
    <#include "static_top.ftl">
    <div class="layui-container content">
        <div class="layui-row" style="padding-bottom: 5px">
            <div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
                <ul class="left">
                    <li style="background-color: #009E94; ">
                        <a href="/admin/user/data" style="color: #F6F6F6">个人资料</a>
                    </li>
                    <li><a href="/admin/user/data/edit">编辑资料</a></li>
                    <li><a href="/admin/user/password">修改密码</a></li>
                </ul>
            </div>
            <div class="layui-col-xs10 layui-col-sm10 layui-col-md10" style="margin-left: 30px">
                <#if user??>
                    <ul class="right">
                        <li>用户名：${user.userName}</li>
                        <li>邮箱：${user.email}</li>
                        <li>手机号：${user.cellphone}</li>
                        <#if user.sex ??>
                            <#if user.sex == true>
                                <li>性别：男</li>
                            <#else>
                                <li>性别：女</li>
                            </#if>
                        <#else>
                            <li>性别：无</li>
                        </#if>
                        <li>注册时间：${user.registerTime?datetime}</li>
                    </ul>
                </#if>
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
    layui.use(['element', 'form', 'layer'], function () {
        var element = layui.element,
            form = layui.form,
            layer = layui.layer;

        // 保存
        form.on('submit(save)', function(formData){
            layer.msg(JSON.stringify(formData.field));
            Ax.rest("/admin/user/data/save", formData.field, function (data) {
                location.reload();
            })
        });
    });
</script>
</html>