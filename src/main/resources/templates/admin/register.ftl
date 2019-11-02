<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin-register</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

    <style>
        .content {
            position: relative;
            margin: 300px auto;
        }

        .beat {
            position: absolute;
            left: 40%;
            top: 50%;
            margin-top: -50px;
            margin-left: -40px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="content">
    <div class="beat">
        <h2 style="margin-bottom: 20px">欢迎注册 ---- 会议管理系统</h2>
        <div class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 50px; text-align: left; padding-left: 0px;">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 50px; text-align: left; padding-left: 0px;">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 50px; text-align: left; padding-left: 0px;">手机号</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="cellphone" required lay-verify="required|phone" placeholder="请输入手机号"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label" style="width: 50px; text-align: left; padding-left: 0px;">邮箱</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" required lay-verify="required|email" placeholder="请输入邮箱"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="register">注册</button>
                    <a class="layui-btn" href="/admin/user/login">登录</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/axquery.js"></script>
<script type="text/javascript" src="/layui/layui.all.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(register)', function (data) {
            Ax.rest("/admin/user/register.do", data.field, function (data) {
                layer.msg('注册成功');
            })
        });
    });
</script>
</html>