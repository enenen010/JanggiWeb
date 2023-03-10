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
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css" rel="stylesheet">
    #container #section{}
    #container #section>#article{}
    #container #section>#article>div{
    }
    #container #section>#article>div:first-child{
    	margin: 0px auto;
    	width: 600px;
    	height: 600px;
    	border: 3px solid gray;
    	border-radius: 10px;
    }
    #cont{}
    #container #article>div:first-child>div{display:block; margin: 0px auth; width: 600px; padding: 30px;}
    #container #article>div:first-child>div:nth-child(2){}
    #container #article>div:first-child>div:nth-child(3){}
    #container #article>div:first-child>div:nth-child(4){}
    #container #article>div:first-child>div:nth-child(5){}
    
    #container #article>div:first-child>div>span{color: rgb(200,200,200); font-weight: 50px; }
    #container #article>div:first-child>div>span:first-child{display:inline-block; width: 200px;}
    #container #article>div:first-child>div>span:last-child{width: 400px;}
    
    #container #article>div:first-child>div>div{color: rgb(200,200,200); font-weight: 50px; }
    #container #article>div:first-child>div>div:first-child{display:inline-block; width: 200px;}
    #container #article>div:first-child>div>div:last-child{width: 400px; padding-top: 30px;}
    
    #container #section>#article{}
    
        	
    #container #section>h2{
        display:block;
    	margin: 0px auto;
    	padding-top: 10px;
    	width: 400px;
    	font-size: 50px;
    	height: 35px;
    	color: rgb(200,200,200);
    	padding-bottom: 50px;
    }
    #container #section>#article>h2+div{
    	padding-right: 50px;
    	margin-bottom: 50px;
    }
    #container #section>#article>h2+div>a{
        margin-left: 20px;
        float: right;
        display: block;
        width: 100px;
        height: 35px;
        background-color: #669966;
        text-decoration: none;
        color: rgb(20,20,20);
        font-weight: bold;
        text-align: center;
        line-height: 35px;
        border: 3px solid gray;
        border-radius: 10px;
    }
    #container #section>#article>h2+div>a:hover {
		background-color:orange;
	}
	#notation{float: left; position: absolute; left:1400px; top:100px;}
	#container #section>#article table{
		display: block;
        clear: both;
        margin: 0px auto;
        border-radius: 10px;
        border: 0px solid gray;
        border-collapse:collapse;
	}
	#container #section>#article table>thead{
    }
    #container #section>#article table>thead>tr{
    	border: 3px solid gray;
    }
    #container #section>#article table>thead>tr>th{
        text-align: center;
        background-color: rgb(80,80,80);
        border: 3px solid gray;
        text-decoration: none;
    }
	#container #section>#article table>tbody{
        padding-top: 10px;
    }
    #container #section>#article table>tbody>tr{
        border: 3px solid gray;
        border-collapse:collapse;
    }
    #container #section>#article table>tbody>tr>td{
    	height: 35px;
        color: rgb(200,200,200);
        text-align: center;
    }
    #cont a{
    	margin-right: 30px;
        float: right;
        display: block;
        width: 60px;
        height: 30px;
        background-color: #669966;
        text-decoration: none;
        color: rgb(20,20,20);
        font-weight: bold;
        text-align: center;
        line-height: 30px;
        border: 3px solid gray;
        border-radius: 10px;
    }
    
    #cont a:hover{
        background-color: orange;
    }
</style>
</head>
<body>
    <div id="container">
        <div>

            <div id="header">
            <jsp:include page="../module/header.jsp"></jsp:include>
            </div>
            
            <div id="section">
                	<h2>?????? Q & A ??????</h2>
                <div id="article">
                    <div>
                        <div id="cont">
                            <%if(session.getAttribute("id").equals(detail[6])){ %>
                            <a href="notationqnaEdit.jsp?key=<%=request.getParameter("key") %>">??????</a>
                            <a href="NotationQnaDeleteOne?key=<%=request.getParameter("key") %>">??????</a>
                            <%} %>
                        </div>
                        <div>
                            <span>??????:</span>
                            <span><%=detail[3] %></span>
                        </div>
                        <div>
                            <span>?????????:</span>
                            <span><%=detail[6] %></span>
                        </div>
                        <div>
                            <span>???:</span>
                            <span><%=detail[4] %></span>
                        </div>
                        <div>
                            <div>??????:</div>
                            <div><%=detail[1] %></div>
                        </div>
                    </div>
                    <div id="notation">
                        <div>??????:</div>
                        <div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>??????</th>
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
        </div>
        <%@include file="../module/footer.jsp" %>
    </div>
</body>
</html>