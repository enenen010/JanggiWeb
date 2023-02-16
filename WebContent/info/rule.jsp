<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12K-Chese</title>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setCharacterEncoding("UTF-8"); %>
<%
	//String id=(String)session.getAttribute("id");
%>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css" rel="stylesheet">
pre{
color: white;
margin-left: 10px;
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
        	<h2>경기 룰</h2>
            <div id="article">
            	
            	<pre>
1. 십이장기는 가로 4칸, 세로 3칸 총 12칸으로 이루어진 게임 판에서 진행되며 플레이어들의 바로 앞쪽 3칸이 각자의 진영이 된다.
2. 결승 진출자 2명에게는 4가지 종류의 말이 1개씩 주어지며 각 말은 지정된 위치에 놓인 상태로 게임을 시작한다.
3. 각 말들은 말에 표시된 방향으로만 이동할 수 있으며 각각의 역할은 다음과 같다.
   -장(將). 자신의 진영 오른쪽에 놓이는 말로 앞, 뒤와 좌, 우로 이동이 가능하다.
   -상(相). 자신의 진영 왼쪽에 놓이며 대각선 4방향으로 이동할 수 있다.
   -왕(王). 자신의 진영 중앙에 위치하며 앞, 뒤, 좌, 우, 대각선 방향까지 모든 방향으로 이동이 가능하다.
   -자(子). 왕의 앞에 놓이며 오로지 앞으로만 이동할 수 있다.
         하지만, 자(子)는 상대 진영에 들어가면 뒤집어서 후(侯)로 사용된다. 후(侯)는 대각선 뒤쪽 방향을 제외한 전 방향으로 이동할 수 있다.
4. 게임이 시작되면 선 플레이어부터 말 1개를 1칸 이동시킬 수 있다. 말을 이동시켜 상대방의 말을 잡은 경우, 해당 말을 포로로 잡게 되며 
       포로로 잡은 말은 다음 턴부터 자신의 말로 사용할 수 있다.
5. 게임 판에 포로로 잡은 말을 내려놓는 행동도 턴을 소모하는 것이며 이미 말이 놓여진 곳이나 상대의 진영에는 말을 내려놓을 수 없다.
6. 상대방의 후(侯)를 잡아 자신의 말로 사용할 경우에는 자(子)로 뒤집어서 사용해야 한다.
7. 게임은 한 플레이어가 상대방의 왕(王)을 잡으면 해당 플레이어의 승리로 종료된다.
8. 만약 자신의 왕(王)이 상대방의 진영에 들어가 자신의 턴이 다시 돌아올 때까지 한 턴을 버틸 경우 해당 플레이어의 승리로 게임이 종료된다.
    또한, 결승전 십이장기는 한 턴을 90초로 제한하며 90초안에 말을 놓아야 한다. 
    만약 90초 안에 아무 말도 놓지 못한다면 해당 플레이어가 패배한다.

※ 모든 말의 방향 회전은 불가능하다.
※ 잡은 말을 사용할 땐 자신이 원하는 턴에 자유롭게 사용가능 하며 원하지 않으면 사용하지 않아도 무관하다.
            	</pre>
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