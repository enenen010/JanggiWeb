<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12K-Chese</title>
<%
	//String id=(String)session.getAttribute("id");
%>
<style type="text/css" rel="stylesheet">
    #container{
        width: 1200px;
    }
</style>
</head>
<body>
<div id="container">
    <div id="header">
            <jsp:include page="./module/header.jsp"></jsp:include>
    </div>
        
    <div id="section">
        <div id="article">
        환영합니다
        </div>
    </div>
    <div id="aside">
        <%@include file="./module/sideBar.jsp" %>
    </div>
     <div id="footer">
        <%@include file="./module/footer.jsp" %>
    </div>
</div>

</body>
</html>