package org.global.beans;

public class Air {
	private int indexNo;
	private String imgurl;
	private String toair;
	private String formair;
	private String boardingTime;
	private String departureTime;
	private String classAir;
	private int price;

	public Air() {

	}

	public Air(int indexNo, String imgurl, String toair, String formair, String boardingTime, String departureTime, String classAir, int price) {
		this.indexNo =indexNo;
		this.imgurl = imgurl;
		this.toair = toair;
		this.formair = formair;
		this.boardingTime = boardingTime;
		this.departureTime = departureTime;
		this.classAir = classAir;
		this.price = price;
	}

	public Air(String imgurl, String toair, String formair, String boardingTime, String departureTime, String classAir, int price) {
		this.imgurl = imgurl;
		this.toair = toair;
		this.formair = formair;
		this.boardingTime = boardingTime;
		this.departureTime = departureTime;
		this.classAir = classAir;
		this.price = price;
	}

	public int getIndexNo() {
		return indexNo;
	}

	public void setIndexNo(int indexNo) {
		this.indexNo = indexNo;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getToair() {
		return toair;
	}

	public void setToair(String toair) {
		this.toair = toair;
	}

	public String getFormair() {
		return formair;
	}

	public void setFormair(String formair) {
		this.formair = formair;
	}

	public String getBoardingTime() {
		return boardingTime;
	}

	public void setBoardingTime(String boardingTime) {
		this.boardingTime = boardingTime;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getClassAir() {
		return classAir;
	}

	public void setClassAir(String classAir) {
		this.classAir = classAir;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
