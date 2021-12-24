package org.global.beans;

public class Hotel {
	private int indexNo;
	private String imgurl;
	private String name;
	private String classHotel;
	private String checkin;
	private String checkout;
	private String nation;
	private String address;
	private int price;
	
	public Hotel() {
		
	}
	
	public Hotel(int indexNo, String imgurl, String name, String classHotel, String checkin, String checkout, String nation, String address, int price) {
		this.indexNo = indexNo;
		this.imgurl = imgurl;
		this.name = name;
		this.classHotel = classHotel;
		this.checkin = checkin;
		this.checkout = checkout;
		this.nation = nation;
		this.address = address;
		this.price = price;
	}
	
	public Hotel(String imgurl, String name, String classHotel, String checkin, String checkout, String nation, String address, int price) {
		this.imgurl = imgurl;
		this.name = name;
		this.classHotel = classHotel;
		this.checkin = checkin;
		this.checkout = checkout;
		this.nation = nation;
		this.address = address;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClassHotel() {
		return classHotel;
	}

	public void setClassHotel(String classHotel) {
		this.classHotel = classHotel;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
