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
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
    $(function(){
        $(':submit').click(function(){
            for(input of $('form>div>div>input')){ 
                $(input).next().remove();
                if($(input).val()==''){
                    $(input).after($('<span/>')
                            .css('color','red')
                            .text($(input).prev().text()+'를 입력하지 않았습니다.'));
                    $('form').submit(function(){return false;});
                }
             }
        });
    });
</script>
</head>
<body>

<div id="header">
<jsp:include page="../module/header.jsp"></jsp:include>
</div>

<div id="section">
    <div id="article">
        <form action="loginIsert">
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
<div id="aside">
<%@include file="../module/sideBar.jsp" %>
</div>
<div id="footer">
<%@include file="../module/footer.jsp" %>
</div>
</body>
</html>