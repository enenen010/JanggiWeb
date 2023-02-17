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
<link href="../css/main2.css" rel="stylesheet" type="text/css" />
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
    
    #container form>div{display:block; margin: 0px auth; width: 500px; padding: 30px;}
    #container form>div>div:first-child>div:nth-child(2){}
    #container form>div>div:first-child>div:nth-child(3){}
    #container form>div>div:first-child>div:nth-child(4){}
    #container form>div>div:first-child>div:nth-child(5){}
    
    #container form>div>div>span{color: rgb(200,200,200); }
    #container form>div>div>span:first-child{display:inline-block; width: 100px;}
    #container form>div>div>span:last-child{width: 400px;}
    
    
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
	#notation{float: left; position: absolute; left:210px; top:100px;}
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
    
    form{
    	padding-top: 10px;
    	display: block;
    	width: 600px;
    	margin: 0px auto;
    }
    form select{
        width: 150px;
        height: 35px;
        background-size: 20px;
        padding: 5px 30px 5px 10px;
        border-radius: 4px;
        outline: 0 none;
    }
    form select option{
        background: black;
        color: #fff;
        padding: 3px 0;
    }
    form input{
        width: 300px;
        height: 23px;
        background-size: 20px;
        padding: 5px 30px 5px 10px;
        border-radius: 4px;
        outline: 0 none;
    }

    form button{
    	float:left;
        margin-top: 0px;
        padding: 0px;
        width: 60px;
        height: 35px;        
        border-radius: 4px;
        outline: 0 none;
        border: 3px solid gray;
        border-radius: 10px;
    }
    
    form button:hover{
        background-color: orange;
    }
    
    #cont{}
    form a{
    	margin-left: 20px;
        float: left;
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
    
    form a:hover{
        background-color: orange;
    }
    
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	$(function(){
        $('select').eq(0).val('<%=detail[4] %>').prop("selected",true)
             .end().eq(1).val('<%=detail[5] %>').prop("selected",true)
             ;


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
            	<h2>수정</h2>
                <div id="article">
                    <form action="NotationQnaUpdateOne" method="post">
                        <div>
                            <input type="hidden" value="<%=detail[0] %>" name="nqid">
                            <input type="hidden" value="<%=detail[6] %>" name="id">
                            <div>
                                <span>제목</span>
                                <span><input type="text" name="sub" value="<%=detail[3] %>"></span>
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
                                <span>내용</span>
                                <span><textarea name="content"><%=detail[1] %></textarea></span>
                            </div>
                            <div>
                                <span>기보</span>
                                <span>
                                    <select name="nkey">
                                        <%for(Object[] no : notations){ %>
                                        <option value="<%=no[0] %>"><%=no[1] %></option>
                                        <%} %>
                                    </select>
                                </span>
                            </div>
                        </div>
                        <div id="cont">
                            <button>수정완료</button>
                            <a href="notationqnaDetail.jsp">취소</a>
                        </div>
                    </form>
                </div>
            </div>
            <div id="aside">
            </div>
        </div>
        <%@include file="../module/footer.jsp" %>
</div>
</body>
</html>