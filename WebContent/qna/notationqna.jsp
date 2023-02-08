<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.callback.MysqlCallbackHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12K-Chese</title>
<%@ page import="java.util.*,java.sql.*,com.jang.MysqlWork" %>
<%
	//String id=(String)session.getAttribute("id");
	MysqlWork mysqlWork = new MysqlWork();
	String sql="";
	List<Object[]> list = mysqlWork.executeQuery(sql, 4);
%>
</head>
<body>

<div id="header">
<jsp:include page="../header.jsp"></jsp:include>
</div>

<div id="section">
    <div id="article">
        <table>
            <thead>
                <th>NO.</th>
                <th>제목</th>
                <th>색</th>
                <th>작성자</th>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>
<div id="aside">
<%@include file="../sideBar.jsp" %>
</div>
<div id="footer">
<%@include file="../footer.jsp" %>
</div>
</body>
</html>