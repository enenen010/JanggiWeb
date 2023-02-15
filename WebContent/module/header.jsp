<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%String root=request.getContextPath(); %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" rel="stylesheet">
	#headline{
    }
	#headline>span{
	}
	#headline>span>a>h1{
        text-indent: -9999px;
        width: 140px;
        height: 70px;
        background-image: url('<%=root %>/imgs/logo.png');
	}

    #nav{
        padding: 0px;
        clear: both;
        position:fixed;
        width: 200px;
        height: 100%;
        left: 0px;
        top: 0px;
        background-color: rgb(35, 35, 35);
        align-content: center;
    }
    #nav>ul{
        padding: 0px;
        margin: 0px 0px 0px 0px;
        list-style: none;
        display: block;
        width: 200px;
        margin-left: 0px;
    }
    #nav>ul>li{
        margin-left: 0px;
        padding: 0px;
        background-color: rgb(35, 35, 35);
    }
    #nav>ul>li>a,
    #nav>ul>li>ul>li>a{
        line-height: 35px;
        text-align: center;
        display: block;
        text-decoration: none;
        color: aliceblue;
        width: 200px;
        height: 35px;
        margin-right: 3px;
    }
    #nav>ul>li>a:hover{
        background-color: rgb(25, 25, 25);
    }
    #nav>ul>li>ul{
        display: block;
        padding: 0px;
        list-style: none;
        position: absolute;
        width: 200px;
        height: 100%;
        left: 196px;
        top: 0px;
        background-color: rgb(25, 25, 25);
    }
    #nav>ul>li>ul>li{
        padding: 0px;
        background-color: rgb(25, 25, 25);
    }
    #nav>ul>li>ul>li>a:hover{
        background-color: rgb(15, 15, 15);
    }

    #nav>div:nth-child(3){
		width: 140px;
        height: 50px;
        border: 0px solid;
        border-radius: 20px;
        margin: 30px auto;
	}
    #nav>div:nth-child(3)>a{
    	display:inline-block;
        width: 200px;
        height: 50px;
        text-indent: -9999px;
    }
    .login{background-image: url('<%=root %>/imgs/login.png');}
    .logout{background-image: url('<%=root %>/imgs/logout.png');}

    
</style>
<script type="text/javascript" src="<%=root %>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
    window.onload=function(){
    	
    	<%if(session.getAttribute("id")!=null){%>
        var lo = document.querySelector('.login>a');
        lo.setAttribute('href','<%=root %>/login/logout');
        lo.innerText='로그아웃';
        lo.parentElement.classList.replace('login','logout');
    	<%}%>
    }

    $(function(){
        $('#nav>ul>li').find('ul').hide()
        .on('mouseleave', function(e){
            $('#nav>ul>li').css('backgroundColor','rgb(35, 35, 35)')
            .find('ul').hide();
        })
        .end()
        .on('mouseenter', function(e){
            $(e.target).next().show()
            .parent().css('backgroundColor','rgb(25, 25, 25)');
        })
        .on('mouseleave', function(e){
            $(e.target).next().hide()
            .parent().css('backgroundColor','rgb(35, 35, 35)');
        
        });
        
    });
</script>
</head>
<body>
    <div id="navBtn"></div>
    <div id="nav">
    <div id="headline">
        <span><a href="<%=root %>"><h1>12K-Chess</h1></a></span>
    </div>
		<ul>
            <li>
                <a href="#">경기</a>
                <ul>
                    <li><a href="<%=root %>">경기현황</a></li>
                </ul>
            </li>
            <li>
                <a href="#">집계</a>
                <ul>
                    <li><a href="<%=root %>">랭킹</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Q & A</a>
                <ul>
                    <li><a href="<%=root %>/qna/notationqna.jsp">기보 Q & A</a></li>
                    <li><a href="<%=root %>">자유 Q & A</a></li>
                </ul>
            </li>
            <li>
                <a href="#">정보</a>
                <ul>
                    <li><a href="<%=root %>/info/rule.jsp">게임 룰</a></li>
                    <li><a href="<%=root %>">경기신청</a></li>
                </ul>
            </li>
        </ul>
        <div class="login"><a href="<%=root %>/login/login.jsp">로그인</a></div>
    </div>
</body>
</html>
