package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.MenuDto;
import mysql.db.DBConnect;

public class MenuDao {
	DBConnect db=new DBConnect();
	
	//메뉴 기입
	public void insertMenu(MenuDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into menu values(null,?,?,?,0,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMenu());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getS_id());
			pstmt.setString(4, dto.getM_image());
			pstmt.setString(5, dto.getCategory());
			pstmt.setString(6, dto.getEng_category());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//각 s_id의 상품들 select
		public List<MenuDto> selectMenu(String s_id){
			List<MenuDto> list=new ArrayList<MenuDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from menu where s_id=? order by sang_num";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, s_id);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					MenuDto dto=new MenuDto();
					
					dto.setSang_num(rs.getString("sang_num"));
					dto.setMenu(rs.getString("menu"));
					dto.setPrice(rs.getInt("price"));
					dto.setS_id(rs.getString("s_id"));
					dto.setM_score(rs.getDouble("m_score"));
					dto.setM_image(rs.getString("m_image"));
					dto.setCategory(rs.getString("category"));
					
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
	
	//메뉴 1개 가져오기
	public MenuDto getData(String sang_num) {
	      MenuDto dto=new MenuDto();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from menu where sang_num=?";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, sang_num);
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            dto.setSang_num(rs.getString("sang_num"));
	            dto.setMenu(rs.getString("menu"));
	            dto.setPrice(rs.getInt("price"));
	            dto.setS_id(rs.getString("s_id"));
	            dto.setM_score(rs.getDouble("m_score"));
	            dto.setM_image(rs.getString("m_image"));
	            dto.setCategory(rs.getString("category"));
	         }
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      
	      return dto;
	   }
	
	public void updateStarScore(double avg,String sang_num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update menu set m_score=? where sang_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setDouble(1, avg);
			pstmt.setString(2, sang_num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//카테고리 종류 출력
		public List<String> getCategory(String s_id){
			List<String> list=new ArrayList<String>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select distinct eng_category from menu where s_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, s_id);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					list.add(rs.getString("eng_category"));
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
		
		//카테고리별 상품 출력
		public List<MenuDto> seperateCategory(String eng_category){
			List<MenuDto> list=new ArrayList<MenuDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from menu where eng_category=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, eng_category);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					MenuDto dto=new MenuDto();
					
					dto.setSang_num(rs.getString("sang_num"));
					dto.setM_image(rs.getString("m_image"));
					dto.setMenu(rs.getString("menu"));
					dto.setM_score(rs.getDouble("m_score"));
					
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
		
		public List<String[]> selectCategory(String s_id) {
			List<String[]>list=new ArrayList<String[]>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select distinct category,eng_category from menu where s_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, s_id);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					
					String category[]=new String[2];
					category[0]=rs.getString("category");
					category[1]=rs.getString("eng_category");
					
					list.add(category);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
}
