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
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setCharacterEncoding("UTF-8"); %>
<style type="text/css" rel="stylesheet">  
	body{
	height:100%;
	background-color: rgb(50,50,50);
	padding-left: 200px;
	}
	#container{
		width: 800px;
        height: 800px;
        margin: 0px auto;
        background-color: rgb(35,35,35);
        border: 0px solid;
        border-radius: 10px;
        padding-top: 100px;
	}
	#container>div:first-child{
        width: 500px;
        height: 600px;
        margin: 0px auto;
        background-color: rgb(80,80,80);
        border: 0px solid;
        border-radius: 10px;
    }
    h2{
    	display:block;
    	margin: 50px auto;
    	padding-top: 50px;
    	width: 150px;
    	font-size: 50px;
    	height: 35px;
    	color: rgb(30,30,30);
    }
    form{
    	display: block;
    	width: 400px;
    	margin: 0px auto;
    }
    form>div:first-child{
    	line-height: 100px;
    }
    form label{
    	display:inline-block;
    	width:150px;
    	padding-bottom: 10px;
    	font-size: 20pt;
    	color: gray;
    }
    form input{
    	display:inline-block;
    	width:200px;
    	height:35px;
    	margin-bottom: 10px;
    	background-color: rgb(120,120,120);
    	border: 2px solid rgb(200,200,200);
    	border-radius: 10px;
    }
    form>div:last-child{
    	margin: 50px auto;
    }
    form>div:last-child>button {
		display:inline-block;
    	width:100px;
    	height:35px;
    	background-color: #66CC66;
    	border: 2px solid rgb(200,200,200);
    	border-radius: 10px;
	}
	form>div:last-child>a {
		display:inline-block;
    	width:100px;
    	height:35px;
    	float:right;
    	background-color: #336699;
    	border: 2px solid rgb(200,200,200);
    	border-radius: 10px;
    	text-decoration: none;
    	color: rgb(200,200,200);
	}
	form>div:last-child>button:hover {
    	background-color: #FFCC66;
    	cursor:pointer;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	<%if(session.getAttribute("id") != null){%>
	history.forward();
	<%}%>
	
    $(function(){
    	
    	<%
    	String fail = (String)session.getAttribute("fail");
    	if(fail != null)
    	if(fail.equals("o")){
    	%>
        	alert("아이디 혹은 패스워드가 잘못되었습니다.");
		<%}%>
    	
    	
		$('form').submit(function(){
            for(input of $('form>div>div>input')){ 
            	$('form>div>div').last().next().remove();
                if($(input).val()==''){
                	$('form>div>div').last().after($('<span/>')
                            .css('color','red')
                            .text($(input).prev().text()+'를 입력하지 않았습니다.'));
                    return false;
                }
             }
        });
    });
</script>
</head>
<body>
            <jsp:include page="../module/header.jsp"></jsp:include>
    <div id="container">
        <div>
            <h2>로그인</h2>
            <div id="section">
                <div id="article">
                    <form action="loginGo" method="post" accept-charset="UTF-8">
                        <div>
                            <div>
                                <label for="id">아이디</label>
                                <input type="text" name="id">
                            </div>
                            <div>
                                <label for="pw">패스워드</label>
                                <input type="password" name="pw">
                            </div>
                        </div>
                        <div>
                            <button type="submit">로그인</button>
                            <button type="reset">초기화</button>
                            <a href="join.jsp">회원가입</a>
                        </div>
                    </form>
                </div>
            </div>
            <div id="aside">
                <%@include file="../module/sideBar.jsp" %>
            </div>
        </div>
    </div>
                <%@include file="../module/footer.jsp" %>
</body>
</html>