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
	String sql="SELECT NQID, CONTENT, IMG, SUB, MYCOLOR, NKEY, ID "+
			"FROM notation_qna "+
			"WHERE NQID = '"+request.getParameter("key")+"' ";
	
	Object[] detail = mysqlWork.executeQueryOne(sql, 7);
	
	sql="SELECT notation FROM notation WHERE NKEY = '"+detail[5]+"' ";
	String[] notation = ((String)mysqlWork.executeQueryOne(sql, 1)[0]).split("/");
%>
</head>
<body>

<div id="header">
<jsp:include page="../module/header.jsp"></jsp:include>
</div>

<div id="section">
    <div id="article">
        <table>
            <tbody>
                <tr>
                    <td>제목:</td>
                    <td><%=detail[3] %></td>
                </tr>
                <tr>
                    <td>작성자:</td>
                    <td><%=detail[6] %></td>
                </tr>
                <tr>
                    <td>색:</td>
                    <td><%=detail[4] %></td>
                </tr>
                <tr>
                    <td>내용:</td>
                    <td>
                        <div>
                            <%=detail[1] %>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="notation">
            <div>기보:</div>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>기보</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%for(int i=0; i<notation.length; i++){%>
                        <tr>
                            <td><%=i %></td>
                            <td><%=notation[i] %></td>
                        </tr>
                    <%} %>
                    </tbody>
                </table>
            </div>
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