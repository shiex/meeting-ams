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

        .content .left li {
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
                    <li style="background-color: #009E94; ">
                        <a href="/admin/user/data/edit" style="color: #F6F6F6">编辑资料</a>
                    </li>
                    <li><a href="/admin/user/password">修改密码</a></li>
                </ul>
            </div>
            <div class="layui-col-xs7 layui-col-sm7 layui-col-md7" style="margin-left: 230px">
                <#if user??>
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="width: 50px; text-align: left; padding-left: 0px;">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input" value="${user.userName}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label"
                                       style="width: 50px; text-align: left; padding-left: 0px;">手机号</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="cellphone" required lay-verify="required|phone"
                                           placeholder="请输入手机号"
                                           autocomplete="off" class="layui-input" value="${user.cellphone}">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label"
                                       style="width: 50px; text-align: left; padding-left: 0px;">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="email" required lay-verify="required|email"
                                           placeholder="请输入邮箱"
                                           autocomplete="off" class="layui-input" value="${user.email}">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label"
                                       style="width: 50px; text-align: left; padding-left: 0px;">性别</label>
                                <div class="layui-input-inline">
                                    <#if user.sex>
                                        <input type="radio" name="sex" value="false" title="男">
                                        <input type="radio" name="sex" value="true" title="女" checked>
                                    <#else>
                                        <input type="radio" name="sex" value="false" title="男" checked>
                                        <input type="radio" name="sex" value="true" title="女">
                                    </#if>
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

        // 保存
        form.on('submit(save)', function (formData) {
            layer.msg(JSON.stringify(formData.field));
            Ax.rest("/admin/user/data/save", formData.field, function (data) {
                location.reload();
            })
        });
    });
</script>
</html>