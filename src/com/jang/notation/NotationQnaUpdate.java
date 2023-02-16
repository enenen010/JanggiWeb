package com.jang.notation;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qna/NotationQnaUpdateOne")
public class NotationQnaUpdate  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nqid = req.getParameter("nqid");
		NotationQnaDao notationQnaDao = new NotationQnaDao();
		NotationQnaDto bean = notationQnaDao.getOne(nqid);
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String content = req.getParameter("content");
		String img = "/";
		String sub = req.getParameter("sub");
		String mycolor = req.getParameter("mycolor");
		String nkey = req.getParameter("nkey");
		String id = req.getParameter("id");
		
		
		notationQnaDao.setConnection();
		if(bean.getId().equals(id)) {
			int result = notationQnaDao.UpdateOne(nqid, content, img, sub, mycolor, nkey);
			if(result==0) {
				resp.sendRedirect("../sysmsg/message.jsp?"
						+"msg="+URLEncoder.encode("수정이 실패했습니다. 문의부탁드립니다.", "UTF-8")+"&"
						+"next="+"../qna/notationqnaDetail.jsp?key="+nqid+"&"
						);
			}else {
				resp.sendRedirect("../sysmsg/message.jsp?"
						+"msg="+URLEncoder.encode("수정이 완료되었습니다.", "UTF-8")+"&"
						+"next="+"../qna/notationqnaDetail.jsp?key="+nqid+"&"
						);
			}
		}else {
			resp.sendRedirect("../sysmsg/message.jsp?"
					+"msg="+URLEncoder.encode("작성자와 상이합니다 관리자에게 문의하세요", "UTF-8")+"&"
					+"next="+"../qna/notationqnaDetail.jsp?key="+nqid+"&"
					);
		}
	}
}
