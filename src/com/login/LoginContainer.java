package com.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.jang.*;

public class LoginContainer extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out;
		LoginDao loginDao = new LoginDao();
		LoginDto bean = loginDao.getOne(req.getParameter("id"));
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		out = resp.getWriter();
		
		try {
			if(bean==null) {
				out.println("<script>");
				out.println("alert('아이디 혹은 패스워드가 잘못되었습니다.')");
				out.println("location.replace(\"login.jsp\")");
				out.println("</script>");
			}else{
				if(bean.getPw().equals(req.getParameter("pw"))) {
					req.getSession().setAttribute("id", req.getParameter("id"));
					resp.sendRedirect(req.getContextPath());
				}else {
					out.println("<script>");
					out.println("alert('패스워드가 잘못되었습니다.')");
					out.println("location.replace(\"login.jsp\")");
					out.println("</script>");
				}
			}
		}finally {
			 if(out!=null)out.close();
		}
	}
}
