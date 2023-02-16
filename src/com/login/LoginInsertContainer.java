package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

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
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		if(bean==null) {
			String pw = req.getParameter("pw");
			String name = req.getParameter("name");
			String tell = req.getParameter("tell");
			String authority = "C";
			
			loginDao.setConnection();
			int result = loginDao.pushList(id, pw, name, tell, authority);
			
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("가입을 축하드립니다.", "UTF-8")+"&"
					+"next="+"../login/login.jsp"+"&"
					);
		}else {
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("중복된 ID 입니다.", "UTF-8")+"&"
					+"next="+"../login/join.jsp"+"&"
					);
		}
	}
}

