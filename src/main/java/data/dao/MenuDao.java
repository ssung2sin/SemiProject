package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import data.dto.MenuDto;
import data.dto.MenuOrderDto;
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
		}catch (SQLException e) {
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
				dto.setPrice(rs.getInt("price"));
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
	
	//메뉴카트 추가
	public void insertOrderMenu(MenuOrderDto dto,String now) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into order_menu values(?,?,?,?,?,?,null,0)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getTotal_price());
			pstmt.setString(3, now);
			pstmt.setString(4, dto.getS_id());
			pstmt.setString(5, dto.getReceipt());
			pstmt.setString(6, dto.getU_id());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//주문메뉴 조회
	public List<MenuOrderDto> selectMyOrder(String u_id,String selectId) {
		List<MenuOrderDto> list=new ArrayList<MenuOrderDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from order_menu where "+selectId+"=? order by order_time desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MenuOrderDto dto=new MenuOrderDto();
				
				dto.setNum(rs.getString("num"));
				dto.setOrder_time(rs.getTimestamp("order_time"));
				dto.setReceipt(rs.getString("receipt"));
				dto.setS_id(rs.getString("s_id"));
				dto.setU_id(rs.getString("u_id"));
				dto.setTotal_price(rs.getString("total_price"));
				dto.setPrepare_time(rs.getTimestamp("prepare_time"));
				dto.setCompletion(rs.getInt("completion"));
				
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
	
	//메뉴준비시간 추가
	public void updatePrepareTime(String time,String num){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		System.out.println("시간 : "+time+", 주문번호 : "+num);
		
		String sql="update order_menu set prepare_time=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, time);
			pstmt.setString(2, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}	
	}
	
	//남은시간 계산
	public int subTime(String prepare) {
		int subTime=0;

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
		
		LocalDateTime now=LocalDateTime.now();
		String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));		//현재 시간
		
		Date today;
		Date prepareTime;
		try {
			today = sdf.parse(sdfNow);
			prepareTime=sdf.parse(prepare);
			
			subTime = (int)((prepareTime.getTime()-today.getTime())/(60*1000));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				//string을 date로 변환

		return subTime;
	}
	
	//주문삭제
	public void deleteOrder(String num) {
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
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//주문완료
	public void orderComplete(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		//System.out.println("시간 : "+time+", 주문번호 : "+num);
		
		String sql="update order_menu set completion=1 where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
