<%@ page import="POJO.Blog" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="POJO.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title><%=((Blog) request.getAttribute("blog")).getTitle()%>--SQBlog</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        function CommentPost() {
            const submit = document.createElement('form');
            const text = document.createElement('textarea');
            const author = document.createElement('input');
            const blogId = document.createElement('input');
            const str = document.getElementById('editText').value;
            const isLogin=<%=session.getAttribute("loginUser")==null%>
            if(isLogin){
                alert("请先登录(首页)")
            }else if (str.length === 0 || str.trim() === "") {
                alert("请输入非空字段");
            } else {
                submit.action = '${pageContext.request.contextPath}/setComment';
                submit.method = 'post';
                author.name = 'author';
                author.value = "<%=session.getAttribute("loginUser")%>";
                blogId.name = 'blogId';
                blogId.value = document.getElementById('blogId').value;
                text.name = 'text';
                text.value = str;
                submit.appendChild(text);
                submit.appendChild(author);
                submit.appendChild(blogId);
                document.body.appendChild(submit);
                submit.submit();
            }
        }
    </script>
</head>
<style>
    .shadow {
        opacity: 0.85
    }

    .card {
        margin-top: 30px;
        opacity: 0.85
    }

    .comment {
        margin-top: 50px
    }

    .container {
        margin-top: 50px
    }

    .logBody {
        background: url("/blog/log/images/bg.jpg") fixed;
        background-size: cover;
    }

    .py-3 {
        margin-right: 40px
    }

    .badge {
        margin-left: 10px;
    }
</style>
<body class="logBody">
<div class="shadow p-3 mb-1 bg-white rounded">
    <header class="d-flex justify-content-center">
        <ul class="nav nav-pills <%=session.getAttribute("loginUser")!=null&&session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser")?"offset-5":""%>">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link" aria-current="page">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link active">博客</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link">留言板</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link">FAQ</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link">友链</a></li>
        </ul>
        <%if(session.getAttribute("loginUser")!=null&&session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser")){%>
        <ul class="nav nav-pills ml-auto">
            <li class="nav-item"><button type="button" class="btn btn-outline-success" onclick="location.href='/modifyBlogData<%=request.getAttribute("blog")!=null?"?ID="+((Blog) request.getAttribute("blog")).getID():""%>'">修改此博客</button></li>
        </ul>
        <%}%>
    </header>
</div>
<div class="card col-10 offset-1" style="width: 100rem;">
    <div class="card-body">
        <%
            Blog blog;
            List<Comment> comments;
            String[] badges = {"primary", "secondary", "success", "danger", "warning", "info"};
            if (request.getAttribute("blog") != null)
                blog = (Blog) request.getAttribute("blog");
            else
                throw new RuntimeException("request域中的blog为空 K-V from log.jsp");
            if (request.getAttribute("comments") != null)
                comments = (List<Comment>) request.getAttribute("comments");
            else
                throw new RuntimeException("request域中的comments为空 K-V from log.jsp");
        %>
        <div class="row">
        <h5 class="card-title"><%=blog.getTitle()%></h5>
        </div>
        <div class="card-title row">
            <%if (blog.getBadge() != null) {%>
            <span class="badge badge-pill badge-<%=badges[new Random().nextInt(6)]%>">&nbsp;<%=blog.getBadge()%>&nbsp;</span>
            <%}%>
        </div>
        <h6 class="card-subtitle mb-2 text-muted">作者:<%=blog.getAuthor()%>
            创建时间: <%=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(blog.getCreateTime())%>
            修改时间：<%=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(blog.getModifyTime())%>
        </h6>
        <p class="card-text"><%=new String(blog.getBlogText(), StandardCharsets.UTF_8)%>
        </p>
    </div>
</div>
<div class="comment">
    <h3 class="col-10 offset-2">评论：</h3>
</div>
<div class="rows">
    <div class="row offset-2">
        <%
            for (int i = 0; i < comments.size(); ) {%>
        <div class="py-3">
            <form action="${pageContext.request.contextPath}/delComment" method="post">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <p class="card-text"><%=comments.get(i).getCommentText()%>
                        </p>
                        <p class="card-text">from:<%=comments.get(i).getAuthor()%>
                        </p>
                        <div class="col-5 offset-8">
                            <input name="commentId" type="hidden" value="<%=comments.get(i).getID()%>">
                            <input name="blogId" type="hidden" value="<%=blog.getID()%>">
                            <%if (session.getAttribute("loginUser") != null && (session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser") || session.getAttribute("loginUser").toString().equalsIgnoreCase(comments.get(i).getAuthor()))) {%>
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
<div class="container">
    <input type="hidden" name="blogId" id="blogId" value="<%=blog.getID()%>">
    <label for="editText"></label>
    <p class="lead">发表评论：</p>
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
</body>
</html>
