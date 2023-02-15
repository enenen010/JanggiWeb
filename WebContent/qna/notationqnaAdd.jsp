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
	//detail[5];
			
	sql="SELECT Nkey, title, notation FROM notation WHERE id = '"+(String)session.getAttribute("id")+"' ";
	List<Object[]> notations = mysqlWork.executeQuery(sql, 3);
	
%>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	$(function(){
        $('select').change(function(e){
            console.log($(e.target).val());
        });
    })
</script>
</head>
<body>
    <div id="container">
        <div>
            <div id="header">
            <jsp:include page="../module/header.jsp"></jsp:include>
            </div>
            
            <div id="section">
                <div id="article">
                    <form action="" method="post">
                        <div>
                            <div>
                                <span>제목:</span>
                                <span><input type="text" name="sub" value="<%=detail[3] %>"></span>
                            </div>
                            <div>
                                <span>작성자:</span>
                                <span><input type="text" name="id" value="<%=detail[6] %>"></span>
                            </div>
                            <div>
                                <span>색:</span>
                                <span><input type="text" name="mycolor" value="<%=detail[4] %>"></span>
                            </div>
                            <div>
                                <div>내용:</div>
                                <div><input type="text" name="content" value="<%=detail[1] %>"></div>
                            </div>
                            <div>
                                <div>기보:</div>
                                <div>
                                    <select name="nkey">
                                        <%for(Object[] no : notations){ %>
                                        <option value="<%=no[0] %>"><%=no[1] %></option>
                                        <%} %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button>수정완료</button>
                            <a href="notationqnaDetail.jsp">취소</a>
                        </div>
                    </form>
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
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="aside">
            <%@include file="../module/sideBar.jsp" %>
            </div>
        </div>
        <%@include file="../module/footer.jsp" %>
</div>
</body>
</html>