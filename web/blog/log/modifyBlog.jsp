<%@ page import="POJO.Blog" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<%
    Blog blog;
    if (request.getAttribute("blog") != null)
        blog = (Blog) request.getAttribute("blog");
    else
        blog = new Blog();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap - Prebuilt Layout</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/blog/css/bootstrap4.6.1.css">
    <script src="${pageContext.request.contextPath}/blog/log/js/modifyBlogJs.js">
    </script>
    <style>
        .createBlogBody {
            background: url("/blog/log/images/createBlog-bg.jpg") fixed;
            background-size: cover;
        }

        .shadow, .card {
            opacity: 0.9;
        }
    </style>
</head>
<body class="createBlogBody">
<div class="shadow p-3 mb-1 bg-white rounded">
    <header class="d-flex justify-content-center">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link"
                                    aria-current="page">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link active">博客</a>
            </li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link">留言板</a>
            </li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link">FAQ</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link">友链</a></li>
        </ul>
    </header>
</div>
<div class=" card col-8 offset-2" style="width: 80rem;">
    <form class="was-validated py-5">
        <input type="hidden" id="blogID" value="<%=blog.getID()!=null?blog.getID():""%>">
        <div class="input-group mb-3 col-5">
            <div class="input-group-prepend">
                <div class="input-group-text">标题：</div>
            </div>
            <label for="title"></label><input type="text" class="form-control" id="title" placeholder="title"
                                              value="<%=blog.getTitle()!=null?blog.getTitle():""%>" required>
        </div>

        <div class="input-group mb-3 col-5">
            <div class="input-group-prepend">
                <div class="input-group-text">作者：</div>
            </div>
            <label for="author"></label><input type="text" class="form-control" id="author" placeholder="author"
                                               value="<%=blog.getAuthor()!=null?blog.getAuthor():""%>" required>
        </div>

        <div class="custom-control custom-checkbox mb-3 col-5 offset-1">
            <input type="checkbox" class="custom-control-input" id="isBadge" onclick="isTrue()" required>
            <label class="custom-control-label" for="isBadge">是否选择带入标签</label>
        </div>

        <div class="input-group mb-3 col-3" style="visibility: hidden" id="badgeDiv">
            <div class="input-group-prepend">
                <div class="input-group-text">
                    <i class="bi bi-award"></i>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-award" viewBox="0 0 16 16">
                        <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"></path>
                        <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"></path>
                    </svg>
                </div>
            </div>
            <label for="badge"></label><input type="text" class="form-control" id="badge" placeholder="badge"
                                              value="<%=blog.getBadge()!=null?blog.getBadge():""%>" required>
        </div>


        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">With textarea</span>
            </div>
            <textarea id="text" rows="30" class="form-control" aria-label="With textarea" placeholder="写点自己想写的..."
                      required><%=new String(blog.getBlogText() != null ? blog.getBlogText() : new byte[0], StandardCharsets.UTF_8)%></textarea>
        </div>
        <div class="py-5">
            <button type="button" class="btn btn-primary btn-lg offset-4" onclick="submitData()">submit</button>
            <button type="button" class="btn btn-secondary btn-lg offset-2" onclick="location.href='/BlogPage'">close</button>
        </div>
    </form>
</div>
<div class="py-5"></div>
</body>
</html>