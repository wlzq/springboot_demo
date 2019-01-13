<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <%--<link rel="stylesheet" href="../layui/css/layui.css">--%>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="login-main">
    <header class="layui-elip">登录</header>
    <div class="layui-input-inline" lay-filter="err-msg"></div>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="btn-login" class="layui-btn">登录</button>
        </div>
        <hr/>
        <!--<div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div>-->
        <p><a href="register.html" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
</div>

<script src="../layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;//form
        var $ = layui.jquery;//jquery
        form.on('submit(btn-login)',function (data) {
            console.log(JSON.stringify(data.field));
            debugger;
            $.ajax({
                url:'./login',
                data:data.field,
                dataType:'json',
                type:'post',
                success:function (datas) {
                    if (datas == '1'){
                        //layer.msg('登录成功');
                        window.location.href="./main";
                    }else{
                        layer.msg('登录名或密码错误');
                        $('#err-msg').text("登录名或密码错误");
                    }
                }
            });
            return false;
        })
    });
</script>
</body>
</html>
