package com.jang.notation;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qna/NotationQnaDeleteOne")
public class NotationQnaDelete extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		java.util.logging.Logger log = Logger.getGlobal();
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String nqid = req.getParameter("key");
		
		NotationQnaDao dao = new NotationQnaDao();
		int result = dao.DeleteOne(nqid);
		
		if(result==0) {			
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("글이 삭제되지 않았습니다. 문의 부탁드립니다.", "UTF-8")+"&"
					+"next="+"../qna/notationqna.jsp"+"&"
					);
		}else {
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("글이 삭제되었습니다", "UTF-8")+"&"
					+"next="+"../qna/notationqna.jsp"+"&"
					);
		}
	}
}
