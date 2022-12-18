package com.itwill.shop.dto;
/*
이름        널?       유형             
--------- -------- -------------- 
N_NO      NOT NULL NUMBER(10)     
N_TITLE            VARCHAR2(100)  
N_CONTENT          VARCHAR2(1000) 
N_DATE             DATE  
*/

import java.util.Date;

public class Notice {
	private int n_no;
	private String n_title;
	private String n_content;
	private Date n_date;
	
	public Notice() {
		
	}

	public Notice(int n_no, String n_title, String n_content, Date n_date) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	@Override
	public String toString() {
		return "notice [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ "]";
	}
	
	
}
