package com.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jang.MysqlWork;

public class LoginInsertContainer extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		LoginDao loginDao = new LoginDao();
		LoginDto bean = loginDao.getOne(id);
		
		req.setCharacterEncoding("UTF-8");
		if(bean==null) {
			String pw = req.getParameter("pw");
			String name = req.getParameter("name");
			String tell = req.getParameter("tell");
			String authority = "C";
			
			req.setAttribute("fail", "x");
			loginDao.setConnection();
			int result = loginDao.pushList(id, pw, name, tell, authority);
			
			PrintWriter out=null;
			try {
				 out = resp.getWriter();
				 out.print("<script type=\"text/javascript\" >alert('가입을 축하드립니다.');</script>");
				 resp.sendRedirect("/login/login.jsp");
			}finally {
				if(out!=null)out.close();
			}
			
			
			resp.sendRedirect("login.jsp");
		}else {
			req.setAttribute("fail", "o");
			resp.sendRedirect("join.jsp");
		}
	}
}

