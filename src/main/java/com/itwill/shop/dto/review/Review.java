package com.itwill.shop.dto.review;

import java.util.Date;

import com.itwill.shop.dto.OrderItem;

public class Review {
	/*
	이름            널?       유형             
	------------- -------- -------------- 
	r_no          NOT NULL NUMBER(10)     
	r_title                VARCHAR2(100)  
	r_content              VARCHAR2(1000) 
	
	r_date                 DATE           
	r_rating               NUMBER(10)     
	r_image                VARCHAR2(50)   
	r_click_count          NUMBER(10)   
	  
	u_id                   VARCHAR2(50)   
	oi_no                  NUMBER(10) 
	 */
	private int r_no;
	private String r_title;
	private String r_content;
	
	private Date r_date;
	private int r_rating;
	private String r_image;
	private int r_click_count;
	
	private String u_id;
	
	private OrderItem orderItem;	// oi_no
	/*
		private int oi_no;
		private int oi_qty;
		private int o_no;
		
		private Product product;
	 */
	
	public Review() {
		
	}

	public Review(int r_no, String r_title, String r_content, Date r_date, int r_rating, String r_image,
			int r_click_count, String u_id, OrderItem orderItem) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_rating = r_rating;
		this.r_image = r_image;
		this.r_click_count = r_click_count;
		this.u_id = u_id;
		this.orderItem = orderItem;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_rating() {
		return r_rating;
	}

	public void setR_rating(int r_rating) {
		this.r_rating = r_rating;
	}

	public String getR_image() {
		return r_image;
	}

	public void setR_image(String r_image) {
		this.r_image = r_image;
	}

	public int getR_click_count() {
		return r_click_count;
	}

	public void setR_click_count(int r_click_count) {
		this.r_click_count = r_click_count;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_title=" + r_title + ", r_content=" + r_content + ", r_date=" + r_date
				+ ", r_rating=" + r_rating + ", r_image=" + r_image + ", r_click_count=" + r_click_count + ", u_id="
				+ u_id + ", orderItem=" + orderItem + "]";
	}

	
}
