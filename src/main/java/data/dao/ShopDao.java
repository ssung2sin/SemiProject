package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ShopDto;
import mysql.db.DBConnect;

public class ShopDao {

	DBConnect db=new DBConnect();
	
	//select
	public List<ShopDto> getAllShops(){
		List<ShopDto> list=new ArrayList<ShopDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ShopDto dto=new ShopDto();
				
				dto.setS_id(rs.getString("s_id"));
				dto.setS_pass(rs.getString("s_pass"));
				dto.setS_name(rs.getString("s_name"));
				dto.setShop_name(rs.getString("shop_name"));
				dto.setShop_addr(rs.getString("shop_addr"));
				dto.setS_phone(rs.getString("s_phone"));
				dto.setB_id(rs.getString("b_id"));
				dto.setShop_hp(rs.getString("shop_hp"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public String getName(String s_id) {
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select shop_name from shop where s_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}
	
	public ShopDto getData(String s_id) {
		ShopDto dto=new ShopDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop where s_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setS_id(rs.getString("s_id"));
				dto.setB_id(rs.getString("b_id"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_pass(rs.getString("s_pass"));
				dto.setS_phone(rs.getString("s_phone"));
				dto.setShop_addr(rs.getString("shop_addr"));
				dto.setShop_hp(rs.getString("shop_hp"));
				dto.setShop_name(rs.getString("shop_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	 public void insertShop(ShopDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into shop(s_id,s_pass,s_name,shop_name,shop_addr,shop_hp,s_phone,b_id,s_image) values(?,?,?,?,?,?,?,?,?)";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getS_id());
				pstmt.setString(2, dto.getS_pass());
				pstmt.setString(3, dto.getS_name());
				pstmt.setString(4, dto.getShop_name());
				pstmt.setString(5, dto.getShop_addr());
				pstmt.setString(6, dto.getShop_hp());
				pstmt.setString(7, dto.getS_phone());
				pstmt.setString(8, dto.getB_id());
				pstmt.setString(9, dto.getS_image());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		public int s_idCheck(String s_id)
		{
			int isid=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from shop where s_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, s_id);
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
