package com.itwill.shop.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Order {
/*
	이름      널?       유형            
	------- -------- ------------- 
	O_NO    NOT NULL NUMBER(10)    
	O_DESC           VARCHAR2(100) 
	O_DATE           DATE          
	O_PRICE          NUMBER(10)    
	U_ID             VARCHAR2(50) 	(fk)
 */
	private int o_no;
	private String o_desc;	// orderItemList.get(1).getProduct.getP_name();
	private Date o_date;
	private int o_price;
	
	private String u_id;	
	
	private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
	//private List<OrderItem> orderItemList=new List<OrderItem>();
	
	public Order() {

	}
	public Order(int o_no, String o_desc, Date o_date, int o_price, String u_id, List<OrderItem> orderItemList) {
		super();
		this.o_no = o_no;
		this.o_desc = o_desc;
		this.o_date = o_date;
		this.o_price = o_price;
		this.u_id = u_id;
		this.orderItemList = orderItemList;
	}
	
	
	public int getO_no() {
		return o_no;
	}
	
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_desc() {
		return o_desc;
	}
	public void setO_desc(String o_desc) {
		this.o_desc = o_desc;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_desc=" + o_desc + ", o_date=" + o_date + ", o_price=" + o_price
				+ ", u_id=" + u_id + ", orderItemList=" + orderItemList + "]";
	}
	
	
	
	
}
