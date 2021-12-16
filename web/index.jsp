<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="SQ">
    <meta name="generator" content="Hugo 0.88.1">
    <title>SQBlog</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blog/css/bootstrap4.6.1.css">
    <link href="${pageContext.request.contextPath}/blog/index/css/cover.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="${pageContext.request.contextPath}/blog/login/js/loginAndOffline.js"></script>
</head>
<script>
    <%
        if(session.getAttribute("loginError")!=null){
    %>
    window.onload = function () {
        alert("<%=session.getAttribute("loginError")%>")
    }
    <%
        session.removeAttribute("loginError");
        }
    %>
    <%
        if(session.getAttribute("register")!=null){
    %>
    window.onload = function () {
        alert("<%=session.getAttribute("register")%>")
    }
    <%
        session.removeAttribute("register");
        }
    %>
</script>
<style>
    .d-flex {
        background: url("blog/index/images/background.jpg") fixed;
        background-size: cover;
    }

    .login {
        display: none;
        position: fixed;
        border: 5px solid #ccc;
        background-color: white;
        width: 400px;
        height: 400px;
        border-radius: 15px; /*圆角*/
        -webkit-box-shadow: 0 5px 27px rgba(0, 0, 0, 0.3); /*窗体阴影*/
    }

    .loginBody {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #000000;
        opacity: 0.5;
    }
</style>

<body class="h-100 text-center text-white bg-dark">

<div class="d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div class="row">
            <h3 class="col-3">SQ Blog</h3>
            <nav class="nav nav-masthead justify-content-center col-6 offset-3">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">首页</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/BlogPage">博客</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/messages">留言板</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/Faq">FAQ</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/links">友链</a>
                <a class="nav-link" href="javascript:void(0)"
                   onclick="<%=session.getAttribute("loginUser")!=null?"offline()":"showLogin()"%>"><%=session.getAttribute("loginUser") != null ? session.getAttribute("loginUser") : "登录"%>
                </a>
            </nav>
        </div>
    </header>

    <main class="px-3">
        <h1>一语不能践，万卷徒虚空</h1>
        <p class="lead"></p>
        <p class="lead">
            <a href="${pageContext.request.contextPath}/BlogPage"
               class="btn btn-lg btn-secondary fw-bold border-white bg-white">Learn more</a>
        </p>
    </main>
    <footer class="mt-auto text-white-50">
        <p>页面设计来自于 <a href="#" class="text-white">SQ个人</a>, 基于 <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>.
        </p>
    </footer>
</div>
<div id="loginBody" class="loginBody"></div>
<div class="login" id="login">
    <a id="loginClose" class="offset-11 row py-3"><i class="bi bi-dash-square"></i>
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-dash-square"
             viewBox="0 0 16 16">
            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
            <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"></path>
        </svg>
    </a>
    <h1 class="h3 mb-3 fw-normal text-dark ">请登录</h1>
    <div class="form-floating">
        <label for="name"></label><input type="text" class="form-control" id="name" placeholder="username"
                                         value="${cookie.get("loginUser").value}">
        <p class="text-dark lead">如果是第一次登录会直接注册</p>
        <div class="form-floating">
            <input type="password" class="form-control" id="password" placeholder="Password"
                   value="${cookie.get("UserPassword").value}">
            <label for="password"></label>
        </div>
    </div>

    <div class="checkbox mb-3">
        <label class="text-dark">
            <input type="checkbox" value="remember-me" id="remember-me">remember me
        </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="login()">Sign in</button>
</div>
</body>
</html>
