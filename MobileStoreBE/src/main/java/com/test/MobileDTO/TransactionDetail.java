package com.test.MobileDTO;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TransactionDetail implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	@Id
	private String Transaction_id ;
	
	private String name ;
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	private String mobile;
	private double Total ;
	private String user_mail;
	private Date date ;
	public String getTransaction_id() {
		return Transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		Transaction_id = transaction_id;
	}
	public String getMobile() {
		return mobile;
	}
	public double getTotal() {
		return Total;
	}
	public void setTotal(double total) {
		Total = total;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	

}
