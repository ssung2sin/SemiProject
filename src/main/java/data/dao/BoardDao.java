package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.BoardDto;
import mysql.db.DBConnect;

public class BoardDao {

	DBConnect db=new DBConnect();
	
	public void insertUserBoard(BoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into board values(null,0,?,?,?,?,0,0,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getExpress());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void insertAdminBoard(BoardDto dto,int note)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into board values(null,?,?,?,?,?,0,0,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, note);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getExpress());
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	//paging
		public List<BoardDto> getPagingList(int start,int perPage)
		{
			List<BoardDto> list=new ArrayList<BoardDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from board order by num desc limit ?,?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, perPage);
				
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					BoardDto dto=new BoardDto();
					
					dto.setNum(rs.getString("num"));
					dto.setNote(rs.getInt("note"));
					dto.setWriter(rs.getString("writer"));
					dto.setExpress(rs.getString("express"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setView(rs.getInt("view"));
					dto.setRecommend(rs.getInt("recommend"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
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
		
		//전체개수 반환
		
		public int getTotalCount()
		{
			int total=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from board";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					total=rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return total;
		}
		
		//가장 최근에 추가된 글의 num값 얻기
		public int getMaxNum()
		{
			int max=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select max(num) max from board";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					max=rs.getInt("max"); //==rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return max;
		}
		
		public BoardDto getData(String num)
		{
			BoardDto dto=new BoardDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from board where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					dto.setNum(rs.getString("num"));
					dto.setNote(rs.getInt("note"));
					dto.setWriter(rs.getString("writer"));
					dto.setExpress(rs.getString("express"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setView(rs.getInt("view"));
					dto.setRecommend(rs.getInt("recommend"));
					dto.setWriteday(rs.getTimestamp("writeday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
		}
}
