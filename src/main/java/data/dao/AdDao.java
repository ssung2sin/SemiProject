package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.DBConnect;

public class AdDao {
	DBConnect db=new DBConnect();
	//로그인시 아이디와 비번체크
	
		public boolean ADisIdPass(String id,String pass) {
			boolean b=false;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from admin where a_id=? and a_pass=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					b=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return b;
		}
		
		
		
		
}
