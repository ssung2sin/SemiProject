package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.dto.MenuAnswerDto;
import mysql.db.DBConnect;

public class MenuAnswerDao {
	
	DBConnect db=new DBConnect(); 
	
	//댓글추가
	public void insertMenuAnswer(MenuAnswerDto dto,String now) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into menu_answer values(null,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSang_num());
			pstmt.setString(2, dto.getU_id());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getU_star_score());
			pstmt.setString(5, now);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//별점 평균내는 함수
	public double totalStarScore(String sang_num) {
		double score=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select u_star_score from menu_answer where sang_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sang_num);
			
			rs=pstmt.executeQuery();
			int cnt=0;
			int tot=0;
			while(rs.next()) {
				cnt++;
				tot+=rs.getInt(1);
			}
			score=tot/(double)cnt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return score;
	}
	
	public List<MenuAnswerDto> getAllAnswers(String sang_num){
		List<MenuAnswerDto>list=new ArrayList<MenuAnswerDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from menu_answer where sang_num=? order by idx desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sang_num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MenuAnswerDto dto=new MenuAnswerDto();
				dto.setIdx(rs.getString("idx"));
				dto.setSang_num(rs.getString("sang_num"));
				dto.setContent(rs.getString("content"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_star_score(rs.getInt("u_star_score"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//댓글 수정
	public void updateAnswer(MenuAnswerDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update menu_answer set content=?,u_star_score=? where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getU_star_score());
			pstmt.setString(3, dto.getIdx());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void deleteAnswer(String idx) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from menu_answer where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
 