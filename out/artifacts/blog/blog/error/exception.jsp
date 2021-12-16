<%--
  Created by IntelliJ IDEA.
  User: SQ
  Date: 2021/11/24
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>请求失败了.....</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<body>
<p class="text-center py-5">${requestScope.get("msg")}</p>
<p class="text-center">有问题请联系:wsq2001@Outlook.com，如果你能帮助我完善网页，感激不尽<br>(请复制上面错误代码并描述下请求问题,或截图)<br>点击下方按钮返回主页</p>
<button class="btn btn-primary offset-6" onclick="location.href='../../'">
    <i class="bi bi-reply-all-fill"></i>
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-all-fill" viewBox="0 0 16 16">
        <path d="M8.021 11.9 3.453 8.62a.719.719 0 0 1 0-1.238L8.021 4.1a.716.716 0 0 1 1.079.619V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"></path>
        <path d="M5.232 4.293a.5.5 0 0 1-.106.7L1.114 7.945a.5.5 0 0 1-.042.028.147.147 0 0 0 0 .252.503.503 0 0 1 .042.028l4.012 2.954a.5.5 0 1 1-.593.805L.539 9.073a1.147 1.147 0 0 1 0-1.946l3.994-2.94a.5.5 0 0 1 .699.106z"></path>
    </svg>
</button>
</body>
</html>
