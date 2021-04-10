package com.practice.first.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String gender;
	private int age;
	private String phone;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus;
	private String photo;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pwd, String name, String email, String gender, int age, String phone,
			Date enrollDate, Date updateDate, String mStatus, String photo) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.mStatus = mStatus;
		this.photo = photo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", gender=" + gender
				+ ", age=" + age + ", phone=" + phone + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate
				+ ", mStatus=" + mStatus + ", photo=" + photo + ", getId()=" + getId() + ", getPwd()=" + getPwd()
				+ ", getName()=" + getName() + ", getEmail()=" + getEmail() + ", getGender()=" + getGender()
				+ ", getAge()=" + getAge() + ", getPhone()=" + getPhone() + ", getEnrollDate()=" + getEnrollDate()
				+ ", getUpdateDate()=" + getUpdateDate() + ", getmStatus()=" + getmStatus() + ", getPhoto()="
				+ getPhoto() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
