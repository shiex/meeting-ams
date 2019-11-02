<div class="layui-header" style="min-width: 1200px">
    <div class="layui-logo">
        <h4>会议管理系统</h4>
    </div>
    <ul class="layui-nav layui-layout-right">
        <#if user??>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <label style="margin-right: 5px;">管理员：</label>${user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/user/data" target="_blank">个人资料</a></dd>
                    <dd><a href="/admin/user/data/edit" target="_blank">编辑资料</a></dd>
                    <dd><a href="/admin/user/password" target="_blank">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/admin/user/login.out">退出</a></li>
        <#else>
            <li class="layui-nav-item"><a href="/admin/user/login">登录</a></li>
            <li class="layui-nav-item"><a href="/admin/user/register">注册</a></li>
        </#if>
    </ul>
</div>