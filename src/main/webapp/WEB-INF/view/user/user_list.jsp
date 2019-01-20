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
            <div>
                <h2>用户管理</h2><hr/>
            </div>
        </div>
        <%--container-fluid--%>
        <div class="layui-container" style="margin:0; width: auto">
            <form id="searchForm" action="./list">
                <div class="layui-row">
                    搜索：
                    <div class="layui-inline">
                        <input type="text" id="username" name="username" value="${sysUser.username}" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                    <%--<div class="layui-inline">
                        <input type="text" id="email" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                    </div>--%>
                    <input type="hidden" id="currentPage" name="currentPage" value="${sysUser.pageParameter.currentPage}">
                    <button type="button" class="layui-btn" onclick="search(1)"><i class="layui-icon">&#xe615;</i> 查询</button>
                    <%--<button type="button" class="layui-btn" onclick="sreach()"><i class="layui-icon">&#xe608;</i> 添加</button>--%>
                    <a href="./edit" type="button" class="layui-btn"><i class="layui-icon">&#xe608;</i> 添加</a>
                </div>
            </form>
            <div class="layui-row">
                <table class="layui-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>状态</th>
                            <th>简介</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="status">
                        <tr id="tr${user.userid}">
                            <td>${status.index + 1}</td>
                            <td>${user.username}</td>
                            <td>
                                <c:if test="${user.status == 'Y'}">正常</c:if>
                                <c:if test="${user.status == 'L'}">锁定</c:if>
                                <c:if test="${user.status == 'D'}">停用</c:if>
                            </td>
                            <td>${user.userdesc}</td>
                            <td>
                                <a class="layui-btn layui-btn-xs" href="./edit?userid=${user.userid}">编辑</a>
                                <a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:;" onclick="del(${user.userid})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                    <c:if test="${empty userList}">
                        <tr><td colspan="5">没有查询到数据！</td></tr>
                    </c:if>
                </table>
            </div>
            <c:if test="${!empty userList}">
                <div id="pager"></div>
            </c:if>
        </div>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    var currentPage = '${sysUser.pageParameter.currentPage}';
    var totalNum = '${sysUser.pageParameter.totalNum}';
    var pageSize = '${sysUser.pageParameter.pageSize}';
    //JavaScript代码区域
    layui.use(['element','laypage'], function(){
        var element = layui.element;

        //分页
        var laypage = layui.laypage;
        laypage.render({
            elem: 'pager'
            ,count: totalNum
            ,limit: pageSize
            ,curr: currentPage
            ,first: '首页'
            ,last: '尾页'
            // ,prev: '<em>←</em>'
            // ,next: '<em>→</em>'
            //,layout: ['pager', 'count']
            ,jump: function(obj, first){
                if(!first){
                    search(obj.curr);
                }
            }
        });
    });

    function search(pageNum){
        var $ = layui.jquery;
        $('#currentPage').val(pageNum);
        $('#searchForm').submit();
    }
    function del(userid){
        var layer = layui.layer;
        var $ = layui.jquery;
        layer.confirm('确定删除？', function(index){
            $.ajax({
                type:'post',
                url:'./delete',
                data:{'userid':userid},
                success:function(msg){
                    if(msg == 'delete_success'){
                        $('#tr'+userid).remove();
                        layer.close(index);
                        //layer.msg('删除成功！');
                        layer.confirm('删除成功！', function(index){
                            layer.close(index);
                            window.location.href='./list'
                        });
                    }else{
                        layer.msg('删除失败！');
                    }
                }
            });
        });
    }
</script>
</body>
</html>
