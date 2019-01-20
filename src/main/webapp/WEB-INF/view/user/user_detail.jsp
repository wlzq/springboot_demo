<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="../layout.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-row">
                <span>
                    <h2>用户管理</h2></span>
                <hr/>
            </div>
        </div>
        <div class="layui-container">

            <form class="layui-form" style="width: 50%" id="userForm" method="post">
                <input type="hidden" name="userid" value="${sysUser.userid}">
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <h3>编辑用户信息</h3>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${sysUser.username}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${sysUser.password}">
                    </div>
                    <%--<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <select name="status" lay-verify="required">
                            <option value=""  <c:if test="${sysUser.status == ''}">selected="selected"</c:if>></option>
                            <option value="Y" <c:if test="${sysUser.status == 'Y'}">selected="selected"</c:if>>正常</option>
                            <option value="L" <c:if test="${sysUser.status == 'L'}">selected="selected"</c:if>>锁定</option>
                            <option value="D" <c:if test="${sysUser.status == 'D'}">selected="selected"</c:if>>停用</option>
                        </select>
                    </div>
                </div>
                <%--<div class="layui-form-item">
                    <label class="layui-form-label">复选框</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="like[write]" title="写作">
                        <input type="checkbox" name="like[read]" title="阅读" checked>
                        <input type="checkbox" name="like[dai]" title="发呆">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">开关</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="switch" lay-skin="switch">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">单选框</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女" checked>
                    </div>
                </div>--%>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">用户简介</label>
                    <div class="layui-input-block">
                        <textarea name="userdesc" placeholder="请输入内容" class="layui-textarea">${sysUser.userdesc}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" onclick="save()">提交</button>
                        <button type="button" class="layui-btn" onclick="window.history.back(-1)">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
    });

    function save(){
        var $ = layui.jquery;
        var layer = layui.layer;
        $.ajax({
            type:'post',
            url:'./edit',
            data:$('#userForm').serialize(),
            dataType:'json',
            success:function(msg1){
                var msg = '';
                if(msg1 == 'insert_success'){
                    msg = '新增成功！';
                }
                if(msg1 == 'update_success'){
                    msg = '修改成功！';
                }
                layer.confirm(msg, function(index){
                    layer.close(index);
                    window.location.href='./list'
                });
            }
        });
    }
</script>
</body>
</html>
