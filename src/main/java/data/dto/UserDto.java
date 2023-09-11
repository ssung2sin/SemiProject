package data.dto;

import java.sql.Timestamp;

public class UserDto {
	private String num;
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_hp;
	private String u_birth;
	private String u_email;
	private Timestamp u_rdate;
	private Timestamp ll_date;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_hp() {
		return u_hp;
	}
	public void setU_hp(String u_hp) {
		this.u_hp = u_hp;
	}
	public String getU_birth() {
		return u_birth;
	}
	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public Timestamp getU_rdate() {
		return u_rdate;
	}
	public void setU_rdate(Timestamp u_rdate) {
		this.u_rdate = u_rdate;
	}
	public Timestamp getLl_date() {
		return ll_date;
	}
	public void setLl_date(Timestamp ll_date) {
		this.ll_date = ll_date;
	}
	
}
