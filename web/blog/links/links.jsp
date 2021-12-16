<%@ page import="POJO.Link" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>友情链接</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blog/css/bootstrap4.6.1.css">

  </head>
    <style>
        .linkBody{
            background: url("/blog/links/images/headerBg1.jpg") fixed;
            background-size: cover;
        }
        .shadow{
            opacity: 0.85
        }
        .card{
            margin-left: 50px;
            margin-bottom: 50px;
        }
        .rows{
            opacity: 0.9;
        }
        .row{
            margin-top: 25px;
        }
        .card-img-top{
            width: 288px;
            height: 180px;
        }
    </style>
  <body class="linkBody">
    <div class="shadow p-3 mb-1 bg-white rounded">
        <header class="d-flex justify-content-center">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link" aria-current="page">首页</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/BlogPage" class="nav-link">博客</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/messages" class="nav-link">留言板</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/Faq" class="nav-link">FAQ</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/links" class="nav-link active">友链</a></li>
            </ul>
        </header>
    </div>
    <h1 class="display-5 text-white text-center py-4">友情链接</h1>
      <div class="rows container">
          <div class="row">
          <%
              List<? extends Link> links;
              if(request.getAttribute("links")!=null)
                  links=(List<Link>) request.getAttribute("links");
              else
                  throw new RuntimeException("request域中没有links K-V from link.jsp");
          %>
          <%for(int i=0;i< links.size();){%>
            <div class="card" style="width: 18rem;">
                <a href="<%=links.get(i).getUrl()%>">
                    <img src="<%=links.get(i).getImageUrl()%>" class="card-img-top" alt="title">
                    <div class="card-body">
                        <h5 class="card-title"><%=links.get(i).getTitle()%></h5>
                        <p class="card-text text-black-50"><%=links.get(i).getLinkText()%></p>
                    </div>
                </a>
            </div>
              <%i++;if(i%3==0){%>
          </div>
          <div class="row">
              <%}%>
            <%}%>
          </div>
      </div>
  </body>
</html>
