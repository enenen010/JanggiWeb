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
	String sql;
			
	sql="SELECT Nkey, title, notation FROM notation "+
	    "WHERE id = '"+(String)session.getAttribute("id")+"' ";
	List<Object[]> notations = mysqlWork.executeQuery(sql, 3);
%>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	$(function(){

    	$('form').submit(function(){
            for(input of $('form>div>div>:nth-child(2n)').children()){ 
                $('form>div>div').last().next().remove();
                if($(input).val()==''){
                    $('form>div>div').last().after($('<span/>')
                            .css('color','red')
                            .text($(input).parent().prev().text()+'를 입력하지 않았습니다.'));
                    return false;
                }
             }
        });
    });
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
                    <form action="NotationQnaInsertOne" method="post">
                        <div>
                            <input type="hidden" value="<%=session.getAttribute("id") %>" name="id">
                            <div>
                                <span>제목</span>
                                <span><input type="text" name="sub"></span>
                            </div>
                            <div>
                                <span>색</span>
                                <span>
                                    <select name="mycolor">
                                        <option value="G">Green</option>
                                        <option value="R">Red</option>
                                    </select>
                                </span>
                            </div>
                            <div>
                                <div>내용</div>
                                <div><textarea name="content" cols="30" rows="10"></textarea></div>
                            </div>
                            <div>
                                <div>기보</div>
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
                            <button>등록</button>
                            <a href="notationqna.jsp">취소</a>
                        </div>
                    </form>
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