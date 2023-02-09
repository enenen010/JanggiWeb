<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12K-Chese</title>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.jang.MysqlWork" %>
<%
	//String id=(String)session.getAttribute("id");
	MysqlWork mysqlWork = new MysqlWork();
	String sql="SELECT CAST(NUM AS signed integer), NQID, SUB, MYCOLOR, ID "+
			"FROM (SELECT @RNUM:= @RNUM +1 AS NUM, A.* "+ 
			"FROM  notation_qna A, (SELECT @RNUM := 0) B"+ 
			") A ";
	List<Object[]> list = mysqlWork.executeQuery(sql, 5);
%>
</head>
<body>

<div id="header">
<jsp:include page="../module/header.jsp"></jsp:include>
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
            <tbody>
            <%for(Object[] row : list){%>
            <tr>
            <td><%=row[0] %></td>
            <td><a href="notationqnaDetail.jsp?key=<%=(String)row[1] %>"><%=(String)row[2] %></a></td>
            <td><%=(String)row[3] %></td>
            <td><%=(String)row[4] %></td>
            </tr>
            <%} %>
            </tbody>
        </table>
        <div>
        	<select>
        	<option>
        	</select>
        </div>
    </div>
</div>
<div id="aside">
<%@include file="../module/sideBar.jsp" %>
</div>
<div id="footer">
<%@include file="../module/footer.jsp" %>
</div>
</body>
</html>