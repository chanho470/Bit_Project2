package org.global.beans;

public class Cart {
	private String proName;
	private String date;
	private String option;
	private int price;
	private String content;

	public Cart() {

	}

	public Cart(String proName, String date, String option, int price, String content) {
		this.proName = proName;
		this.date = date;
		this.option = option;
		this.price = price;
		this.content = content;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
