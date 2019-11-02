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
                    <li><a href="/admin/user/data">个人资料</a></li>
                    <li><a href="/admin/user/data/edit">编辑资料</a></li>
                    <li style="background-color: #009E94; ">
                        <a href="/admin/user/password" style="color: #F6F6F6">修改密码</a>
                    </li>
                </ul>
            </div>
            <div class="layui-col-xs7 layui-col-sm7 layui-col-md7" style="margin-left: 230px">
                <#if user??>
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label" style="width: 70px; text-align: left; padding-left: 0px;">新密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" required lay-verify="required" placeholder="请输入新密码"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label" style="width: 70px; text-align: left; padding-left: 0px;">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password2" required lay-verify="required" placeholder="请确认新密码"
                                           autocomplete="off" class="layui-input" >
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block" style="margin-left: 195px">
                                <button class="layui-btn" lay-submit lay-filter="save">保存</button>
                            </div>
                        </div>
                    </div>
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

        form.on('submit(save)', function(formData){
            Ax.rest("/admin/user/password/save", formData.field, function (data) {
                layer.msg('修改成功');
            })
        });
    });
</script>
</html>