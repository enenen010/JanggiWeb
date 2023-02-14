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
	String sql="";
	
	sql="SELECT CAST(NUM AS signed integer), NQID, SUB, MYCOLOR, ID "+
		 "FROM (SELECT @RNUM:= @RNUM +1 AS NUM, A.* "+
		 "FROM  notation_qna A, (SELECT @RNUM := 0) B"+
		 ") A WHERE 1=1 ";
	
	String sel = request.getParameter("sel");
	String val = request.getParameter("val");
	if(!(sel==null || val==null)){
		switch(sel){
			case "sub": sql+="AND SUB LIKE '%"+val+"%'"; break;
			case "id": sql+="AND ID LIKE '%"+val+"%'"; break;
		}
	}
	
	
	
	int pageLength=10;
	String pageNum = request.getParameter("page");
	int pageStart=0; 
	if(pageNum == null) {pageStart=0;}
	else{pageStart=Integer.parseInt(pageNum)*pageLength;}
	sql+="LIMIT "+pageStart+","+pageLength+";";
	
	List<Object[]> list = mysqlWork.executeQuery(sql, 5);
	
	
	sql="SELECT COUNT(NQID) FROM notation_qna ";
	int maxPage = (int)((long)mysqlWork.executeQueryOne(sql, 1)[0]);
	maxPage = maxPage/pageLength;
%>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" >
	$(function(){
        var maxPage=<%=maxPage%>;
        for(var i=0; i<maxPage; i++){
            $('.page').append($('<a/>').attr('href','notationqna.jsp?page='+i).text('['+(i+1)+']'));
        }

        $('form').attr('action',location.pathname+'?page=0&');
    });
    
</script>
</head>
<body>
    <div id="container">
        <div id="header">
        <jsp:include page="../module/header.jsp"></jsp:include>
        </div>
        
        <div id="section">
            <div id="article">
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
        <div id="footer">
        <%@include file="../module/footer.jsp" %>
        </div>
    </div>
</body>
</html>