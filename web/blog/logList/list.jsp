<%@ page import="java.util.List" %>
<%@ page import="POJO.Blog" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>博客</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blog/logList/css/bootstrap4.6.1.css">
    <link href="${pageContext.request.contextPath}/blog/logList/css/list-groups.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/blog/logList/css/dropdowns.css" rel="stylesheet">
</head>
<style>
    .shadow {
        opacity: 0.8;
    }

    .btn {
        margin-top: 25px;
        opacity: 0.85;
    }

    .listLog {
        background: url("/blog/logList/images/bg.jpg") fixed;
        background-size: cover;
    }

    .listDiv {
        margin-left: 30px;
    }

    .option {
        opacity: 0.85;
        width: auto;
    }

    .badge {
        margin-left: 10px;
        margin-top: 10px;
    }
    .createBtn{
        margin-top: 0;
    }
</style>
<body class="listLog">
<div class="shadow p-3 mb-1 bg-white rounded">
    <header class="d-flex justify-content-center <%=session.getAttribute("loginUser")!=null&&session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser")?"offset-5":""%>">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link" aria-current="page">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link active">博客</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link">留言板</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link">FAQ</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link">友链</a></li>
        </ul>
        <%if (session.getAttribute("loginUser") != null && session.getAttribute("loginUser").toString().equalsIgnoreCase("SQAdminUser")) {%>
        <ul class="nav nav-pills ml-auto">
            <li class="nav-item"><button type="button" class="createBtn btn btn-outline-success" onclick="location.href='/modifyBlogData'">新增博客</button></li>
        </ul>
        <%}%>
    </header>
</div>
<div class="row">
    <div class="listDiv col-8">
        <%
            List<Blog> blogs;
            String[] badges = {"primary", "secondary", "success", "danger", "warning", "info"};
            if (request.getAttribute("page") != null)
                blogs = (List<Blog>) request.getAttribute("page");
            else
                throw new RuntimeException("request域中没有page K-V from list.jsp");
        %>
        <%
            for (Blog blog : blogs) {
        %>
        <a role="button" class="btn col-12 " href="${pageContext.request.contextPath}/Article?id=<%=blog.getID()%>">
            <div class="card shadow-sm">
                <div class="card-header text-black-50">
                    <h3 class="text-left"><%=blog.getTitle()%></h3>
                </div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <div class="timeline-footer">
                            <p class="text-left text-black-50 ">作者:<%=blog.getAuthor()%></p>
                            <p class="text-left lead">最后修改时间：<%=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(blog.getModifyTime())%></p>
                        </div>
                        <footer class="blockquote-footer text-left"><%=new String(blog.getBlogText(), StandardCharsets.UTF_8).substring(0,Math.min(blog.getBlogText().length, 70))%>
                            ...
                        </footer>
                    </blockquote>
                    <div class="col-12 row">
                        <%if (blog.getBadge() != null) {%>
                        <span class="badge badge-pill badge-<%=badges[new Random().nextInt(6)]%>">&nbsp;<%=blog.getBadge()%>&nbsp;</span>
                        <%}%>
                    </div>
                </div>
            </div>
        </a>
        <%}%>
        <nav aria-label="Page navigation example" class="d-flex justify-content-center">
            <ul class="pagination">
                <li class="page-item <%=request.getParameter("page")==null||request.getParameter("page").equals("1")?"disabled":""%>">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/BlogPage?page=<%=request.getParameter("page")==null?0:Integer.parseInt(request.getParameter("page"))-1%><%=(request.getParameter("time")!=null?"&time="+request.getParameter("time"):"")+(request.getParameter("search")!=null?"&search="+request.getParameter("search"):"")+(request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):"")%>"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <%
                    for (int i = 1; i <= (Integer) request.getAttribute("pageSum"); i++) {
                %>
                <li class="page-item <%=(request.getParameter("page")==null&&i==1)||(request.getParameter("page")!=null&&Integer.parseInt(request.getParameter("page"))==i)?"active":""%>">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/BlogPage?page=<%=i%><%=(request.getParameter("time")!=null?"&time="+request.getParameter("time"):"")+(request.getParameter("search")!=null?"&search="+request.getParameter("search"):"")+(request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):"")%>"><%=i%>
                    </a>
                </li>
                <%}%>
                <li class="page-item <%=request.getParameter("page")==null?"1".equals(request.getAttribute("pageSum").toString())?"disabled":"":request.getParameter("page").equals(request.getAttribute("pageSum").toString())?"disabled":""%>">
                    <a class="page-link "
                       href="${pageContext.request.contextPath}/BlogPage?page=<%=request.getParameter("page")==null?2:Integer.parseInt(request.getParameter("page"))+1%><%=(request.getParameter("time")!=null?"&time="+request.getParameter("time"):"")+(request.getParameter("search")!=null?"&search="+request.getParameter("search"):"")+(request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):"")%>"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="option bg-dark col-3 rounded ">
        <form class="form-inline my-2 my-lg-0 offset-2 py-5" action="${pageContext.request.contextPath}/BlogPage">
            <input class="form-control mr-sm-2" type="search"
                   placeholder="<%=request.getParameter("search")==null||request.getParameter("search").equals("")?"搜索":request.getParameter("search")%>"
                   aria-label="Search" name="search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="bi bi-check2"></i>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2"
                     viewBox="0 0 16 16">
                    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
                </svg>
            </button>
        </form>
        <div class=" listOfGroup list-group list-group-checkable">
            <input class="list-group-item-check" type="radio" name="listGroupCheckableRadios"
                   id="listGroupCheckableRadios1" <%=request.getParameter("time")!=null&&!request.getParameter("time").equals("")&&!request.getParameter("time").equals("null")&&Integer.parseInt(request.getParameter("time"))==1?"checked":""%>
                   onclick="location.href='${pageContext.request.contextPath}/BlogPage?page=1&time=1<%=request.getParameter("search")!=null?"&search="+request.getParameter("search"):""%><%=request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):""%>'">
            <label class="list-group-item py-3" for="listGroupCheckableRadios1">
                近一个月
            </label>
            <input class="list-group-item-check" type="radio" name="listGroupCheckableRadios"
                   id="listGroupCheckableRadios2" <%=request.getParameter("time")!=null&&!request.getParameter("time").equals("")&&!request.getParameter("time").equals("null")&&Integer.parseInt(request.getParameter("time"))==2?"checked":""%>
                   onclick="location.href='${pageContext.request.contextPath}/BlogPage?page=1&time=2<%=request.getParameter("search")!=null?"&search="+request.getParameter("search"):""%><%=request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):""%>'">
            <label class="list-group-item py-3" for="listGroupCheckableRadios2">
                近三个月
            </label>
            <input class="list-group-item-check" type="radio" name="listGroupCheckableRadios"
                   id="listGroupCheckableRadios3" <%=request.getParameter("time")!=null&&Integer.parseInt(request.getParameter("time"))==3?"checked":""%>
                   onclick="location.href='${pageContext.request.contextPath}/BlogPage?page=1&time=3<%=request.getParameter("search")!=null?"&search="+request.getParameter("search"):""%><%=request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):""%>'">
            <label class="list-group-item py-3" for="listGroupCheckableRadios3">
                近一年
            </label>

            <input class="list-group-item-check" type="radio" name="listGroupCheckableRadios"
                   id="listGroupCheckableRadios4" <%=request.getParameter("time")==null? "checked":!request.getParameter("time").equals("")&&!request.getParameter("time").equals("null")&&Integer.parseInt(request.getParameter("time"))==4?"checked":""%>
                   onclick="location.href='${pageContext.request.contextPath}/BlogPage?page=1&time=4<%=request.getParameter("search")!=null?"&search="+request.getParameter("search"):""%><%=request.getParameter("badge")!=null?"&badge="+request.getParameter("badge"):""%>'">


            <label class="list-group-item py-3" for="listGroupCheckableRadios4">
                全部
            </label>

            <input class="list-group-item-check" type="radio" name="listGroupCheckableRadios"
                   id="listGroupCheckableRadios5" value="" disabled>
            <label class="list-group-item py-3" for="listGroupCheckableRadios5">
                很久很久之前.....
                <span class="d-block small opacity-50">.....到底是多久呢</span>
            </label>
            <div class="row py-5">
                <%
                    if (request.getAttribute("badges") != null) {
                        for (String badge : (List<String>) request.getAttribute("badges")) {
                %>
                <a href="${pageContext.request.contextPath}/BlogPage?page=1&badge=<%=badge%>"
                   class="badge badge-pill badge-<%=badges[new Random().nextInt(6)]%> py-2">&nbsp;<%=badge%>&nbsp;</a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
