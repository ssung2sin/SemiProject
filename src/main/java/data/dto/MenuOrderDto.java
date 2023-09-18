package data.dto;

import java.sql.Timestamp;

public class MenuOrderDto {
	private String num;
	private String total_price;
	private Timestamp order_time;
	private String s_id;
	private String receipt;
	private String u_id;
	private String prepare_time;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public Timestamp getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Timestamp order_time) {
		this.order_time = order_time;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPrepare_time() {
		return prepare_time;
	}
	public void setPrepare_time(String prepare_time) {
		this.prepare_time = prepare_time;
	}
	
	
}
