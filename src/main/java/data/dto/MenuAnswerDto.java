package data.dto;

import java.sql.Timestamp;

public class MenuAnswerDto {
	
	private String idx;
	private String sang_num;
	private String u_id;
	private String content;
	private int u_star_score;
	private Timestamp writeday;
	
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getSang_num() {
		return sang_num;
	}
	public void setSang_num(String sang_num) {
		this.sang_num = sang_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getU_star_score() {
		return u_star_score;
	}
	public void setU_star_score(int u_star_score) {
		this.u_star_score = u_star_score;
	}
	
	
}
