package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.jang.sql.MysqlConnection;

public class LoginDao {
	java.util.logging.Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public LoginDao() {
		conn=MysqlConnection.getConnection();
	}
	
	public void setConnection() {
		conn=MysqlConnection.getConnection();
	}
	
	public LoginDto getOne(String id) {
		String sql="select * from user where id=?";
		LoginDto bean=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean = new LoginDto();
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getDate("birth"));
				bean.setTell(rs.getString("tell"));
				bean.setAuthority(rs.getString("authority"));
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
	
	public int pushList(String id,String pw,String name,String tell,String authority) {
		String sql="insert into user (id,pw,name,birth,tell,authority) ";
		sql+= "values (?,?,?,now(),?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tell);
			pstmt.setString(5, authority);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
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
	
	public int DeleteOne(String id) throws SQLException {
		String sql="delete from user where id = ?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
	}
	
//	public int UpdateOne(String id) throws SQLException {
//		String sql="update user set "
//				+ "where id = ?";
//		
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			return pstmt.executeUpdate();
//		}finally {
//			if(pstmt!=null)pstmt.close();
//			if(conn!=null)conn.close();
//		}
//		
//	}

	public List<LoginDto> getList(){
		String sql="select * from user";
		List<LoginDto> list=new ArrayList<LoginDto>();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				LoginDto bean=new LoginDto();
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setName(rs.getString("name"));
				bean.setBirth(rs.getDate("birth"));
				bean.setTell(rs.getString("tell"));
				bean.setAuthority(rs.getString("authority"));
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
