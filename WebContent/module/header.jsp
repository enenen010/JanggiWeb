<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%String root=request.getContextPath(); %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" rel="stylesheet">
	div>span{
		float: left;
	}
	div>span>a>h1{
        text-indent: -9999px;
        width: 140px;
        height: 70px;
        background-image: url('<%=root %>/imgs/logo.png');
	}
	#login{
		float: right;
		width: 140px;
        height: 50px;
	}
    #login>a{
    	display:inline-block;
        width: 140px;
        height: 50px;
        text-indent: -9999px;
    }
    .login{
    	background-image: url('<%=root %>/imgs/login.png');
    }
    .logout{
        background-image: url('<%=root %>/imgs/logout.png');
    }

    #nev{height: 35px;}
    #nev>ul{margin: 0px auto; padding: 0px; width: 440px;}
    #nev>ul>li{}
    #nev>ul>li>ul{}
    #new>ul>li>ul>li{}
    
</style>
<script type="text/javascript" src="<%=root %>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
    window.onload=function(){
    	
    	<%if(session.getAttribute("id")!=null){%>
        var lo = document.querySelector('#login>a');
        lo.setAttribute('href','<%=root %>/login/logout');
        lo.innerText='로그아웃';
        lo.parentElement.classList.replace('login','logout');
    	<%}%>
    }

    $(function(){
	    $('ul>li:eq(2)')
		//.click(function(){return false;})
		.mouseenter(function(){
			$(this).find('ol').show();
		})
		.mouseleave(function(){
			$(this).find('ol').hide();
		});
    });
</script>
</head>
<body>
    <div>
        <span><a href="<%=root %>"><h1>12K-Chess</h1></a></span>
        <span id="login" class="login"><a href="<%=root %>/login/login.jsp">로그인</a></span>
    </div>
    <div id="nav">
		<ul>
            <li>
                <ul>경기
                    <li><a href="<%=root %>">경기현황</a></li>
                </ul>
            </li>
            <li>
                <ul>집계
                    <li><a href="<%=root %>">랭킹</a></li>
                </ul>
            </li>
            <li>
                <ul>Q & A
                    <li><a href="<%=root %>/qna/notationqna.jsp">기보 Q & A</a></li>
                    <li><a href="<%=root %>">자유 Q & A</a></li>
                </ul>
            </li>
            <li>
                <ul>정보
                    <li><a href="<%=root %>">게임 룰</a></li>
                    <li><a href="<%=root %>">경기신청</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>