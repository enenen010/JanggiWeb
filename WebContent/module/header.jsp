<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" rel="stylesheet">
</style>
<script type="text/javascript" >
    window.onload=function(){
    	
    	<%if(session.getAttribute("id")!=null){%>
        var lo = document.querySelector('#login>a');
        lo.setAttribute('href','./login/logout');
        lo.innerText='로그아웃';
    	<%}%>

    	if(location.pathname!='/JanggiWeb/'){
            var a = document.querySelector('#login>a');
            a.setAttribute('href','.'+a.getAttribute('href'));
        }

    	var urlarr= [];
        var navs = document.querySelectorAll('#nav>ul>li');
        
        navs.forEach(function(me){
            var menus=me.querySelectorAll('ul>li>a');
            menus.forEach(function(a){
                if(location.pathname!='/JanggiWeb/'){
                    a.setAttribute('href','.'+a.getAttribute('href'));
                }
            });
        });
    }
</script>
</head>
<body>
    <div>
        <h1>12K-Chess</h1>
        <div id="login"><a href="./login/login.jsp">로그인</a></div>
    </div>
    <div id="nav">
		<ul>
            <li>
                <ul>경기
                    <li><a href="#">경기현황</a></li>
                </ul>
            </li>
            <li>
                <ul>집계
                    <li><a href="#">랭킹</a></li>
                </ul>
            </li>
            <li>
                <ul>Q & A
                    <li><a href="./qna/notationqna.jsp">기보 Q & A</a></li>
                    <li><a href="#">자유 Q & A</a></li>
                </ul>
            </li>
            <li>
                <ul>정보
                    <li><a href="#">게임 룰</a></li>
                    <li><a href="#">경기신청</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>