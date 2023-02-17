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
<link href="css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css" rel="stylesheet">  
h2{
	display:block;
    margin: 0px auto;
    padding-top: 10px;
    width: 400px;
    font-size: 50px;
    height: 35px;
    color: rgb(200,200,200);
    padding-bottom: 50px;
}
img{
	display: block;
	margin: 0px auto;
}
</style>
</head>
<body>
<div id="container">
    <div>
        <div id="header">
                <jsp:include page="./module/header.jsp"></jsp:include>
        </div>
            
        <div id="section">
            <div id="article">
            	<h2>환영합니다</h2>
            	<img src="imgs/big01.png">
            </div>
        </div>
        <div id="aside">
            <%@include file="./module/sideBar.jsp" %>
        </div>
    </div>
    <%@include file="./module/footer.jsp" %>
</div>

</body>
</html>