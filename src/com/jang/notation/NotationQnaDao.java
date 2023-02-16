package com.jang.notation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.jang.sql.MysqlConnection;
import com.login.LoginDto;

public class NotationQnaDao {
	java.util.logging.Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public NotationQnaDao() {
		conn=MysqlConnection.getConnection();
	}
	
	public void setConnection() {
		conn=MysqlConnection.getConnection();
	}
	
	public NotationQnaDto getOne(String nqid) {
		String sql="select * from notation_qna where nqid=?";
		NotationQnaDto bean=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nqid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean = new NotationQnaDto();
				bean.setNqID(rs.getString("nqid"));
				bean.setContent(rs.getString("content"));
				bean.setImg(rs.getString("img"));
				bean.setSub(rs.getString("sub"));
				bean.setMycolor(rs.getString("mycolor"));
				bean.setNkey(rs.getString("nkey"));
				bean.setId(rs.getString("id"));
				bean.setWdate(rs.getDate("wdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bean;
	}
	
	public int pushList(String nqid,String content,String img,String sub,String mycolor,String nkey,String id) {
		String sql="insert into notation_qna (nqid,content,img,sub,mycolor,nkey,id,wdate) ";
		sql+= "values (?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nqid);
			pstmt.setString(2, content);
			pstmt.setString(3, img);
			pstmt.setString(4, sub);
			pstmt.setString(5, mycolor);
			pstmt.setString(6, nkey);
			pstmt.setString(7, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			log.severe(e.toString());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				log.severe(e.toString());
			}
		}
		return 0;
	}
	
	public int UpdateOne(String nqid,String content,String img,String sub,String mycolor,String nkey) {
		String sql="update notation_qna SET "
				+ "content=?,"
				+ "img=?,"
				+ "sub=?,"
				+ "mycolor=?,"
				+ "nkey=? "
				+ "where nqid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, img);
			pstmt.setString(3, sub);
			pstmt.setString(4, mycolor);
			pstmt.setString(5, nkey);
			pstmt.setString(6, nqid);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			log.severe(e.toString());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				log.severe(e.toString());
			}
		}
		return 0;
	}
	
	public int DeleteOne(String nqid) {
		String sql="delete from notation_qna where nqid = ?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nqid);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			log.severe(e.toString());
		}
		finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return 0;
		
	}

	public List<NotationQnaDto> getList(){
		String sql="select * from notation_qna";
		List<NotationQnaDto> list=new ArrayList<NotationQnaDto>();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				NotationQnaDto bean=new NotationQnaDto();
				bean.setNqID(rs.getString("nqid"));
				bean.setContent(rs.getString("content"));
				bean.setImg(rs.getString("img"));
				bean.setSub(rs.getString("sub"));
				bean.setMycolor(rs.getString("mycolor"));
				bean.setNkey(rs.getString("nkey"));
				bean.setId(rs.getString("id"));
				bean.setWdate(rs.getDate("wdate"));
				list.add(bean);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				log.severe(e.toString());
			}
		}
		return list;
	}
}
