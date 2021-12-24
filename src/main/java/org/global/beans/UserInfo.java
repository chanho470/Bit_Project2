package org.global.beans;

public class UserInfo {
	private String name;
	private String userId;
	private String userPwd;
	private String email;	
	private String phoneNo;
	private String address;
	
	public UserInfo() {}
	public UserInfo(String name, String userId, String userPwd, String phoneNo, String address , String email) {
		this.name = name;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phoneNo = phoneNo;
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
