package data.dto;

public class MenuDto {
	private String sang_num;
	private String menu;
	private int price;
	private String s_id;
	private double m_score;
	private String m_image;
	private String category;
	private String eng_category;
	private String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEng_category() {
		return eng_category;
	}
	public void setEng_category(String eng_category) {
		this.eng_category = eng_category;
	}
	public String getSang_num() {
		return sang_num;
	}
	public void setSang_num(String sang_num) {
		this.sang_num = sang_num;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public double getM_score() {
		return m_score;
	}
	public void setM_score(double m_score) {
		this.m_score = m_score;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
