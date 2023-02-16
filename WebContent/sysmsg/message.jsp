<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12K-Chese</title>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.jang.MysqlWork" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<style type="text/css" rel="stylesheet">  
	body{
	height:100%;
	background-color: rgb(50,50,50);
	}
	#container{
		width: 100%;
        height: 800px;
        margin: 0px auto;
        background-color: rgb(35,35,35);
        border: 0px solid;
        border-radius: 10px;
        padding-top: 100px;
	}
    #alert{
        position: fixed;
        display: none;
        background-color: rgba(0,0,0,0.3); 
        justify-content:center; 
  		align-items:center;     
  		position:fixed;         
  		top:0;
  		left:0;
  		right:0;
  		bottom:0;               
    }
    #alert>div{
        width: 500px;
        height: 300px;
        background-color: rgb(50, 50, 50);
        border: 2px solid gray;
        border-radius: 20px;
    }
    #alert>div>div:first-child{
        color: aliceblue;
        width: 500px;
        height: 250px;
        text-align: center;
        line-height: 250px;
        font-size: 15pt;
        font-weight: 3pt;
    }
    #alert>div>div:last-child{}
    #alert>div>div:last-child>a{
    	margin: 0px auto;
        background-color: saddlebrown;
        border: 2px solid gray;
        border-radius: 10px;
        color: aliceblue;
        display: block;
        width: 100px;
        height: 35px;
        text-align: center;
        text-decoration: none;
        line-height: 35px;
        font-family : TmonMonsori, "GodoB", "굴림";
    }
    #alert>div>div:last-child>a:hover{
    	background-color: sandybrown;
    }
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
$(function() {
$('#alert').css('display','flex')
.find('div>div')
.first().text(msg)
.next().find('a').click(function(e){
    $(e.target).closest('#alert').hide();
    location.replace('login.jsp');
    return false;
});
});
</script>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
    <div id="container">
        <div id="alert">
            <div>
                <div><%=request.getParameter("msg") %></div>
                <div>
                    <a href="<%=request.getParameter("next") %>">확인</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>