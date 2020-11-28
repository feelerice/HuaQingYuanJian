<%@ page import="com.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/11/28
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成绩排名</title>

<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
    <%
        int user_id = ((User)request.getSession().getAttribute("user")).getUser_id();
        String user_name = ((User)request.getSession().getAttribute("user")).getName();
        request.setAttribute("username",user_name);
        request.setAttribute("user_id",user_id);
        request.setAttribute("Null","**");
        System.out.println( user_id + " , " + user_name );
    %>
    <form method="post" action="userServlet?method=batchDel" id="form1">
        <div class="panel admin-panel">
            <div class="panel-head">
                <strong class="icon-reorder">历史成绩</strong>
            </div>
            <div class="padding border-bottom">
                <ul class="search">
                    <li>

                    </li>
                </ul>
            </div>
            <table class="table table-hover text-center">
                <tr>
                    <th>排名</th>
                    <th>答题人</th>
                    <th>科目</th>
                    <th>成绩</th>
                    <th>答题时间</th>
                </tr>


                <c:forEach items="${ grades }" var="grade" varStatus = "status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${ user_id == grade.user_id ? Null : username}</td>
                        <td>${grade.paper }</td>
                        <td>${grade.score }</td>
                        <td>${grade.time }</td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </form>
</body>
</html>
