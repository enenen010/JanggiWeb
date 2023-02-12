package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jang.MysqlWork;

public class LoginInsertContainer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MysqlWork mysqlWork = new MysqlWork();
		String sql="SELECT CAST(COUNT(id) AS signed integer) FROM user "+
				   "WHERE id = '"+req.getParameter("id")+"'"+
				   "AND pw = '"+req.getParameter("pw")+"'";
		int loginCnt = (int)((long)mysqlWork.executeQueryOne(sql, 1)[0]);
		
		req.setCharacterEncoding("UTF-8");
		if(loginCnt==0) {
			req.setAttribute("fail", "o");
			resp.sendRedirect("login.jsp");
		}else if(loginCnt==1){
			req.getSession().setAttribute("id", req.getParameter("id"));
			resp.sendRedirect("../");
		}else {
			resp.setStatus(500, "해당 유저의 상태에 이상이 발생하였습니다. 관리자에게 문의하세요");
		}
	}
}
