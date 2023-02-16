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
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setCharacterEncoding("UTF-8"); %>
<%
	
	//String id=(String)session.getAttribute("id");
	MysqlWork mysqlWork = new MysqlWork();
	String sql="";
	String sql2="";
	
	sql="SELECT CAST(NUM AS signed integer), NQID, SUB, MYCOLOR, ID "+
		 "FROM (SELECT @RNUM:= @RNUM +1 AS NUM, A.* "+
		 "FROM  notation_qna A, (SELECT @RNUM := 0) B"+
		 ") A WHERE 1=1 ";
	
	sql2="SELECT COUNT(NQID) FROM notation_qna WHERE 1=1 ";
	
	
	String sel = request.getParameter("sel");
	String val = request.getParameter("val");
	if(!(sel==null || val==null)){
		switch(sel){
			case "sub": 
				sql+="AND SUB LIKE '%"+val+"%'";
				sql2+="AND SUB LIKE '%"+val+"%'"; 
			
				break;
			case "id": 
				sql+="AND ID LIKE '%"+val+"%'";
				sql2+="AND ID LIKE '%"+val+"%'";
				break;
		}
	}
	
	
	
	int pageLength=10;
	String pageNum = request.getParameter("page");
	int pageStart=0; 
	if(pageNum == null) {pageStart=0;}
	else{pageStart=Integer.parseInt(pageNum)*pageLength;}
	sql+="LIMIT "+pageStart+","+pageLength+";";
	
	List<Object[]> list = mysqlWork.executeQuery(sql, 5);
	
	
	
			
	int maxPage = (int)((long)mysqlWork.executeQueryOne(sql2, 1)[0]);
	maxPage = maxPage/pageLength;
%>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/pop.css" rel="stylesheet" type="text/css" />
<style type="text/css" rel="stylesheet">
    #container #section{}
    #container #section>#article{}
    #container #section>#article>h2{
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
	#container #section>#article table{
		display: block;
		width: 800px;
		height: 550px;
        clear: both;
        margin: 0px auto;
        border-radius: 10px;
        border: 3px solid gray;
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
    #container #section>#article table>tbody>tr>td:nth-child(1){width: 150px;}
    #container #section>#article table>tbody>tr>td:nth-child(2){width: 400px;}
    #container #section>#article table>tbody>tr>td:nth-child(3){width: 50px;}
    #container #section>#article table>tbody>tr>td:nth-child(4){width: 200px;}
    #container #section>#article table>tbody>tr>td>a{
    	display:block;
        width: 650px;
        height: 35px;
        color: rgb(200,200,200);
        text-align: center;
        text-decoration: none;
        border: 0px solid;
        border-radius: 10px;
        padding-top: 10px;
    }
    #container #section>#article table>tbody>tr>td>a:hover{background-color: orange;}
    .page{
        display: table;
    	margin: 0px auto;
    }
    .page>a{
    	display: inline-block;
    	width: 30px;
    	height: 20px;
    	background-color: gray;
    	border: 0px solid;
    	border-radius: 3px;
    	text-decoration: none;
    	text-align: center;
    	margin-top: 20px;
    	margin-right: 5px;
        color: rgb(200,200,200);
    }
    .page>a:hover{background-color: orange;}
    .page+div{
    	display:block;
    	margin: 0px auto;
    }
    .page+div>form{
    	padding-top: 10px;
    	display: block;
    	width: 600px;
    	margin: 0px auto;
    }
    .page+div>form select{
        width: 150px;
        height: 35px;
        background-size: 20px;
        padding: 5px 30px 5px 10px;
        border-radius: 4px;
        outline: 0 none;
    }
    .page+div>form select option{
        background: black;
        color: #fff;
        padding: 3px 0;
    }
    .page+div>form input{
        width: 300px;
        height: 23px;
        background-size: 20px;
        padding: 5px 30px 5px 10px;
        border-radius: 4px;
        outline: 0 none;
    }

    .page+div>form button{
        margin-top: 0px;
        padding: 0px;
        display: inline-block;
        width: 60px;
        height: 35px;        
        border-radius: 4px;
        outline: 0 none;
    }
    

</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" >
	$(function(){
        var maxPage=<%=maxPage%>;
        
        
        var queStr = location.search.substr(1).split('&').filter(function(ele){
            			return ele.indexOf('page=')==-1;
        			}).join('&');

        for(var i=0; i<maxPage; i++){
            $('.page')
            .append($('<a/>')
            		.attr('href','notationqna.jsp?page='+i+'&'+queStr)
            		.text((i+1)));
        }
        
        $('form').attr('action',location.pathname+'?page=0&');
        
        <%if(session.getAttribute("id")==null){%>
        $('tbody>tr>td>a').on('click',function(e){
                showAlert('이 게시물의 확인에는 로그인이 필요합니다');
                return false;
        });
        $('#article>div>a').on('click',function(e){
            showAlert('글쓰기에는 로그인이 필요합니다');
            return false;
    	});
        <%}%>
    });
</script>
</head>
<body>
    <div id="container">
        <div>
            <div id="header">
            <jsp:include page="../module/header.jsp"></jsp:include>
            </div>
            <div id="section">
                <div id="article">
                    <h2>기보 Q & A</h2>
                	<div>
                        <a href="notationqnaAdd.jsp">글쓰기</a>
                    </div>
                    <table>
                        <thead>
                            <th>NO.</th>
                            <th>제목</th>
                            <th>색</th>
                            <th>작성자</th>
                        </thead>
                        <tbody>
                        <%for(Object[] row : list){%>
                            <tr>
                                <td><%=row[0] %></td>
                                <td><a href="notationqnaDetail.jsp?key=<%=(String)row[1] %>"><%=(String)row[2] %></a></td>
                                <td><%=(String)row[3] %></td>
                                <td><%=(String)row[4] %></td>
                            </tr>
                        <%} %>
                        </tbody>
                    </table>
                    <div class="page"></div>
                    <div>
                        <form>
                            <select name="sel">
                                <option value="sub">제목</option>
                                <option value="id">작성자</option>
                             </select>
                             <input type="text" name="val">
                             <button>검색</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id="aside">
            <%@include file="../module/sideBar.jsp" %>
            </div>
        </div>
        <%@include file="../module/footer.jsp" %>
        </div>
	<%@include file="../module/alert.jsp" %>
</body>
</html>