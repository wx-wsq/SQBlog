<%@ page import="POJO.Faq" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FAQ</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blog/css/bootstrap4.6.1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blog/faq/css/timeline.css">
</head>
<style>
    .faqBody {
        background: url("/blog/faq/images/bg.jpg") fixed;
        background-size: cover;
    }

    .col-md-12, .shadow {
        opacity: 0.85;
    }
</style>
<body class="faqBody">
<div class="shadow p-3 mb-1 bg-white rounded">
    <header class="d-flex justify-content-center">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link"
                                    aria-current="page">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link">博客</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link">留言板</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link active">FAQ</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link">友链</a></li>
        </ul>
    </header>
</div>
<div class="container-fluid">
    <div class="col-md-12">
        <div class="row">
            <h1 class="display-4 text-break">FAQ</h1>
        </div>
        <div class="row">
            <h2>版本历程&杂谈</h2>
            <div class="timeline timeline-line-dotted">
                <% List<Faq> faqs;
                    if (request.getAttribute("faqs") != null)
                        faqs = (List<Faq>) request.getAttribute("faqs");
                    else
                        throw new RuntimeException("request域中没有faq K-V from faq.jsp");
                %>
                <%
                    for (int i = faqs.size() - 1; i >= 0; i--)
                        {
                %>

                <span class="timeline-label">
                    <span class="label label-primary rounded"><%=new SimpleDateFormat("yyyy/MM/dd").format(faqs.get(i).getCreateTime())%></span>
                </span>
                <div class="timeline-item">
                    <div class="timeline-point timeline-point-success">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="timeline-event">
                        <div class="timeline-heading">
                            <h1><%=faqs.get(i).getVersionNumber()%>
                            </h1>
                        </div>
                        <div class="timeline-body">
                            <p class="lead"><%=faqs.get(i).getVersionNumberText()%>
                            </p>
                        </div>
                        <div class="timeline-footer">
                            <p class="text-right"><%=new SimpleDateFormat("yyyy/MM/dd").format(faqs.get(i).getCreateTime())%>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-item ">
                    <div class="timeline-point timeline-point-success">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="timeline-event">
                        <div class="timeline-heading">
                            <h1><%=faqs.get(i).getVersionBodyTitle()%>
                            </h1>
                        </div>
                        <div class="timeline-body">
                            <p class="lead">
                                <%=new String(faqs.get(i).getVersionBodyText(), StandardCharsets.UTF_8)%>
                            </p>
                        </div>
                        <div class="timeline-footer">
                            <p class="text-right"><%=new SimpleDateFormat("yyyy/MM/dd").format(faqs.get(i).getCreateTime())%>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-point timeline-point-success">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="timeline-event">
                        <div class="timeline-heading">
                            <h1><%=faqs.get(i).getBugTitle()%>
                            </h1>
                        </div>
                        <div class="timeline-body">
                            <p class="lead"><%=faqs.get(i).getBugText()%>
                            </p>
                        </div>
                        <div class="timeline-footer">
                            <p class="text-right"><%=new SimpleDateFormat("yyyy/MM/dd").format(faqs.get(i).getCreateTime())%>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-point timeline-point-success">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="timeline-event">
                        <div class="timeline-heading">
                            <h2><%=faqs.get(i).getContactTitle()%>
                            </h2>
                        </div>
                        <div class="timeline-body">
                            <p class="lead">
                                <%=faqs.get(i).getContactText()%>
                            </p>
                        </div>
                        <div class="timeline-footer">
                            <p class="text-right"><%=new SimpleDateFormat("yyyy/MM/dd").format(faqs.get(i).getCreateTime())%>
                            </p>
                        </div>
                    </div>
                </div>
                <%}%>
                <span class="timeline-label">
                    <a href="#" class="btn btn-dark" title="More...">
                        <i class="bi bi-arrow-bar-up"></i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-arrow-bar-up" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 10a.5.5 0 0 0 .5-.5V3.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0
                                    .708.708L7.5 3.707V9.5a.5.5 0 0 0 .5.5zm-7 2.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z">
                            </path>
                        </svg>
                    </a>
                </span>
            </div>
        </div>
    </div>
</div>
</body>
</html>