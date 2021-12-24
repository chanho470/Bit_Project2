package org.global.beans;

public class Product {
	private int indexNo;
	private String proName;
	private Integer price;
	private String continent;
	private String nation;
	private String address;
	private String date;
	private String tel;
	private String text;
	private String detailtext;
	private String hashTag;
	private String mapurl;
	private String img_root;
	private String option;

	public Product() {

	}

	public Product(int indexNo, String proName, String text) {
		super();
		this.indexNo = indexNo;
		this.proName = proName;
		this.text = text;
	}

	public Product(int indexNo, String proName, Integer price, String address, String date, String tel, String text,
			String detailtext, String hashTag, String mapurl, String img_root, String option) {
		this.indexNo = indexNo;
		this.proName = proName;
		this.price = price;
		this.address = address;
		this.date = date;
		this.tel = tel;
		this.text = text;
		this.detailtext = detailtext;
		this.hashTag = hashTag;
		this.mapurl = mapurl;
		this.img_root = img_root;
		this.option = option;
	}

	public Product(Integer indexNo, String proName, Integer price, String continent, String nation, String address,
			String date, String tel, String text, String detailtext, String hashTag, String mapurl, String img_root) {
		this.indexNo = indexNo;
		this.proName = proName;
		this.price = price;
		this.continent = continent;
		this.nation = nation;
		this.address = address;
		this.date = date;
		this.tel = tel;
		this.text = text;
		this.detailtext = detailtext;
		this.hashTag = hashTag;
		this.mapurl = mapurl;
		this.img_root = img_root;
	}

	public Product(String proName, Integer price, String continent, String nation, String address,
			String date, String tel, String text, String detailtext, String hashTag, String mapurl, String img_root, String option) {
		this.proName = proName;
		this.price = price;
		this.continent = continent;
		this.nation = nation;
		this.address = address;
		this.date = date;
		this.tel = tel;
		this.text = text;
		this.detailtext = detailtext;
		this.hashTag = hashTag;
		this.mapurl = mapurl;
		this.img_root = img_root;
		this.option = option;
	}

	public int getIndexNo() {
		return indexNo;
	}

	public void setIndexNo(int indexNo) {
		this.indexNo = indexNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDetailtext() {
		return detailtext;
	}

	public void setDetailtext(String detailtext) {
		this.detailtext = detailtext;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	public String getMapurl() {
		return mapurl;
	}

	public void setMapurl(String mapurl) {
		this.mapurl = mapurl;
	}

	public String getImg_root() {
		return img_root;
	}

	public void setImg_root(String img_root) {
		this.img_root = img_root;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

}
