package com.itwill.shop.dto;

//cart(c_no,c_qty,u_id,p_no)

public class CartItem {
	private int c_no;
	private int c_qty;
	private String u_id;// FK
	private Product product;
	
	public CartItem() {
		// TODO Auto-generated constructor stub
	}
	public CartItem(int c_no, int c_qty, String u_id, Product product) {
		super();
		this.c_no = c_no;
		this.c_qty = c_qty;
		this.u_id = u_id;
		this.product = product;
		
	}
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getC_qty() {
		return c_qty;
	}
	public void setC_qty(int c_qty) {
		this.c_qty = c_qty;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "CartItem [cart_no=" + c_no + ", cart_qty=" + c_qty + ", userid=" + u_id +", product=" + product 
				+ "]";
	}
	
	
}
