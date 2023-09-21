package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AdDto;
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
		
		//food 주문내역조회
		public List<AdDto> selectOrder(){
			List<AdDto> list=new ArrayList<AdDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from order_menu order by order_time desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					AdDto dto=new AdDto();
					
					dto.setNum(rs.getString("num"));
					dto.setOrder_time(rs.getString("order_time"));
					dto.setReceipt(rs.getString("receipt"));
					dto.setS_id(rs.getString("s_id"));
					dto.setU_id(rs.getString("u_id"));
					dto.setTotal_price(rs.getString("total_price"));

					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		//delete
		public void deleteOrder(String num)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from order_menu where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		//개인 회원 조회
		
		public List<AdDto> selectindiv() {
			List<AdDto> list=new ArrayList<AdDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from user order by u_rdate desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					AdDto dto=new AdDto();
					
					dto.setNum2(rs.getString("num"));
					dto.setU_id2(rs.getString("u_id"));
					dto.setU_pass(rs.getString("u_pass"));
					dto.setU_name(rs.getString("u_name"));
					dto.setU_hp(rs.getString("u_hp"));
					dto.setU_birth(rs.getString("u_birth"));
					dto.setU_email(rs.getString("u_email"));
					dto.setU_rdate(rs.getString("u_rdate"));

					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		//delete
				public void deleteindiv(String num)
				{
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="delete from user where num=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, num);
						pstmt.execute();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						db.dbClose(pstmt, conn);
					}
				}
		
		//휴개소 회원 조회
		
		public List<AdDto> selectmaster() {
			List<AdDto> list=new ArrayList<AdDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from express";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					AdDto dto=new AdDto();
					
					dto.setB_id(rs.getString("b_id"));
					dto.setB_pass(rs.getString("b_pass"));
					dto.setB_name(rs.getString("b_name"));
					dto.setAddr(rs.getString("addr"));
					dto.setB_hp(rs.getString("b_hp"));
					dto.setS_hp(rs.getString("s_hp"));

					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		//delete
				public void deletemaster(String b_id)
				{
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="delete from express where b_id=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, b_id);
						pstmt.execute();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						db.dbClose(pstmt, conn);
					}
				}
		
		//입점주 회원조회
		
		public List<AdDto> selectbusiness() {
			List<AdDto> list=new ArrayList<AdDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from shop";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					AdDto dto=new AdDto();
					
					dto.setS_id2(rs.getString("s_id"));
					dto.setS_pass(rs.getString("s_pass"));
					dto.setS_name(rs.getString("s_name"));
					dto.setShop_name(rs.getString("shop_name"));
					dto.setShop_addr(rs.getString("shop_addr"));
					dto.setShop_hp(rs.getString("shop_hp"));
					dto.setS_phone(rs.getString("s_phone"));
					dto.setB_id2(rs.getString("b_id"));

					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		
		//delete
				public void deletebusiness(String s_id)
				{
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					
					String sql="delete from shop where s_id=?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, s_id);
						pstmt.execute();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						db.dbClose(pstmt, conn);
					}
				}
		
}
