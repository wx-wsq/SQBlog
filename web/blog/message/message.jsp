<%@ page import="java.util.List" %>
<%@ page import="POJO.Message" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>SQ's 留言板</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/blog/message/css/bootstrap4.6.1.css" rel="stylesheet">
    <script type="text/javascript">
        function CommentPost() {
            const submit = document.createElement('form');
            const text = document.createElement('textarea');
            const author = document.createElement('input');
            const str = document.getElementById('editText').value;
            const isLogin=<%=session.getAttribute("loginUser")==null%>
            if(isLogin) {
                alert("请先登录(主页)");
            }else if (str.length === 0 || str.trim() === "") {
                alert("请输入非空字段");
            } else {
                submit.action = '${pageContext.request.contextPath}/setMessage';
                submit.method = 'post';
                author.name = 'author';
                author.value = "<%=session.getAttribute("loginUser")%>";
                text.name = 'text';
                text.value = str;
                submit.appendChild(text);
                submit.appendChild(author);
                document.body.appendChild(submit);
                submit.submit();
            }
        }
        function isDel(){
            if()
        }
    </script>
    <style>
        .mainBody {
            background: url("/blog/message/images/background.jpg") fixed;
            background-size: cover;
        }

        .shadow {
            opacity: 0.85
        }

        .rows {
            opacity: 0.85
        }

        .py-3 {
            margin-right: 40px
        }

    </style>
</head>
<body class="mainBody">

<div class="shadow p-3 mb-1 bg-white rounded">
    <header class="d-flex justify-content-center">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link"
                                    aria-current="page">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link">博客</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link active">留言板</a>
            </li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link">FAQ</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link">友链</a></li>
        </ul>
    </header>
</div>
<div class="d-flex justify-content-center py-3">
    <div class="container">
        <label for="editText"></label>
        <p class="lead">发表留言：</p>
        <textarea rows="10" cols="100" class="form-control bg-transparent text-white-50" id="editText"
                  name="text"></textarea>
        <div class="row">
            <div class="col-1 offset-8 py-2">
                <div class="col-1 offset-11">
                    <button type="submit" class="btn btn-primary" onclick="CommentPost()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-chat-square-text" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                            <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="rows">
    <div class=<%%>"row offset-2">
        <%
            List<? extends Message> messages = (List<Message>) request.getAttribute("messages");
            for (int i = 0; i < messages.size(); ) {
        %>
        <div class="py-3">
            <form method="post" action="${pageContext.request.contextPath}/delMessage">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <p class="card-text"><%=messages.get(i).getText()%>
                        </p>
                        <p class="card-text"
                           class="text-black-50">from:<%=messages.get(i).getAuthor()%></p>
                        <span class="text-black-50"><%=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(messages.get(i).getCreateTime())%></span>
                        <div class="col-5 offset-8">
                            <input name="delMessage" type="hidden" value="<%=messages.get(i).getId()%>">
                            <%if (session.getAttribute("loginUser") != null && (session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser") || session.getAttribute("loginUser").toString().equalsIgnoreCase(messages.get(i).getAuthor()))) {%>
                            <input name="delBtn" type="submit" value="删除" class="btn btn-danger">
                            <%}%>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%
            i++;
            if (i % 4 == 0) {
        %>
    </div>
    <div class="row offset-2">
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>