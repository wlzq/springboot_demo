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
            <div>
                <h2>用户管理
                    <button class="layui-btn layui-btn-sm" style="padding-right: 10px">
                        <i class="layui-icon">&#xe608;</i> 添加
                    </button>
                </h2><hr/>
            </div>
        </div>
        <%--container-fluid--%>
        <div class="layui-container" style="margin:0; width: auto">
            <div class="layui-row">
                搜索：
                <div class="layui-inline">
                    <input type="text" id="username" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-inline">
                    <input type="text" id="email" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" onclick="sreach()"><i class="layui-icon">&#xe615;</i></button>
            </div>

            <div class="layui-row">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col width="100">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>注册时间</th>
                        <th>性别</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>贤心</td>
                        <td>2016-11-29</td>
                        <td>男</td>
                        <td>人生就像是一场修行</td>
                    </tr>
                    <tr>
                        <td>许闲心</td>
                        <td>2016-11-28</td>
                        <td>男</td>
                        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
