package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.ExpressDto;
import mysql.db.DBConnect;

public class ExpressDao {

	DBConnect db=new DBConnect();
	
	public void insertExpress(ExpressDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into express values(?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getB_id());
			pstmt.setString(2, dto.getB_pass());
			pstmt.setString(3, dto.getB_name());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getB_hp());
			pstmt.setString(6, dto.getS_hp());
			pstmt.setString(7, dto.getImage());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public ExpressDto getData(String b_id) {
		ExpressDto dto=new ExpressDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from express where b_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setB_id(rs.getString("b_id"));
				dto.setB_name(rs.getString("b_name"));
				dto.setAddr(rs.getString("addr"));
				dto.setB_hp(rs.getString("b_hp"));
				dto.setB_pass(rs.getString("b_pass"));
				dto.setS_hp(rs.getString("s_hp"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	public int b_idCheck(String b_id)
	{
		int isid=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from express where b_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b_id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				isid=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
}
