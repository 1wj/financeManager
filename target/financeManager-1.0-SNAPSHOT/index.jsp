<%--
-Author(s): Wj
-Date: 2022/4/11 18:59
-Copyright:
-Description:  TODO
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE >
<html lang="en">
<head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js"  ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<body>
    <div id="body">
        <div id="bodytop">
            <iframe src="${pageContext.request.contextPath}/menu.jsp"></iframe>
        </div>
        <div id="bodyend">
            <iframe src="${pageContext.request.contextPath}/views/l1/szqk.jsp" name="show"></iframe>
        </div>
    </div>
</body>
</html>