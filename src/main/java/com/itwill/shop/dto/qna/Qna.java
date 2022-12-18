package com.itwill.shop.dto.qna;

import java.util.Date;

/*
이름         널?       유형            
---------- -------- ------------- 
Q_NO        NOT NULL NUMBER(10)     
Q_TITLE              VARCHAR2(200)  
Q_CONTENT            VARCHAR2(3000) 
Q_DATE               DATE           
Q_CATEGORY           VARCHAR2(100)  
Q_READCOUNT          NUMBER(10)     
Q_GROUPNO            NUMBER(10)     
Q_STEP               NUMBER(10)     
Q_DEPTH              NUMBER(10)     
U_ID                 VARCHAR2(50)   
 */
public class Qna {
	private int q_no;
	private String q_title;
	private String q_content;
	private Date q_date;
	private String q_category;
	private int q_readcount;
	private int q_groupno;
	private int q_step;
	private int q_depth;
	private String u_id;
	
	public Qna() {
		
	}

	public Qna(int q_no, String q_title, String q_content, Date q_date, String q_category, int q_readcount,
			int q_groupno, int q_step, int q_depth, String u_id) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_category = q_category;
		this.q_readcount = q_readcount;
		this.q_groupno = q_groupno;
		this.q_step = q_step;
		this.q_depth = q_depth;
		this.u_id = u_id;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public int getQ_readcount() {
		return q_readcount;
	}

	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}

	public int getQ_groupno() {
		return q_groupno;
	}

	public void setQ_groupno(int q_groupno) {
		this.q_groupno = q_groupno;
	}

	public int getQ_step() {
		return q_step;
	}

	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}

	public int getQ_depth() {
		return q_depth;
	}

	public void setQ_depth(int q_depth) {
		this.q_depth = q_depth;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
	
}
