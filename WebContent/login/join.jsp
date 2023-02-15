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
    	width: 200px;
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
    	line-height: 30px;
    }
    form label{
    	display:inline-block;
    	width:150px;
    	padding-bottom: 10px;
    	font-size: 20pt;
    	color: gray;
    }
    form input{
    	margin-bottom:5px;
    	display:inline-block;
    	width:200px;
    	height:35px;
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
    $(function(){
    	$('form').submit(function(){
            for(input of $('form>div>div>input')){ 
                $(input).next().remove();
                if($(input).val()==''){
                    $(input).after($('<span/>')
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
        	<h2>회원가입</h2>
            <div id="section">
                <div id="article">
                    <form action="loginIsert" method="post" accept-charset="utf-8">
                        <div>
                            <div>
                                <label for="id">아이디</label>
                                <input type="text" name="id">
                            </div>
                            <div>
                                <label for="pw">패스워드</label>
                                <input type="password" name="pw">
                            </div>
                            <div>
                                <label for="name">이름</label>
                                <input type="text" name="name">
                            </div>
                            <div>
                                <label for="birth">생년월일</label>
                                <input type="date" name="birth">
                            </div>
                            <div>
                                <label for="tell">연락처</label>
                                <input type="number" name="tell">
                            </div>
                        </div>
                        <div>
                            <button type="submit">가입</button>
                            <button type="reset">초기화</button>
                            <a href="login.jsp">로그인 화면</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>