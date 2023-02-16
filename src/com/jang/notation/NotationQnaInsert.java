package com.jang.notation;

import java.io.IOException;

import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.LoginDao;
import com.login.LoginDto;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/qna/NotationQnaInsertOne")
public class NotationQnaInsert  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		NotationQnaDao notationQnaDao = new NotationQnaDao();
		
		String nqid = "NQ01"+new SimpleDateFormat("yyyyMMdd").format(new Date())+new Date().getTime(); 
		String content = req.getParameter("content");
		String img = "/";
		String sub = req.getParameter("sub");
		String mycolor = req.getParameter("mycolor");
		String nkey = req.getParameter("nkey");
		String id = req.getParameter("id");
		
		notationQnaDao.setConnection();
		int result = notationQnaDao.pushList(nqid, content, img, sub, mycolor,nkey,id);
		
		if(result==0) {			
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("글이 동록되지 않았습니다. 문의 부탁드립니다.", "UTF-8")+"&"
					+"next="+"../qna/notationqna.jsp"+"&"
					);
		}else {
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("글이 등록되었습니다", "UTF-8")+"&"
					+"next="+"../qna/notationqna.jsp"+"&"
					);
		}
	}
}

