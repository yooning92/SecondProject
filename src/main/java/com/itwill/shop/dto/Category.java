package com.itwill.shop.dto;

public class Category {
	private int cg_no;
	private String cg_name;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int cg_no, String cg_name) {
		super();
		this.cg_no = cg_no;
		this.cg_name = cg_name;
	}

	public int getCg_no() {
		return cg_no;
	}

	public void setCg_no(int cg_no) {
		this.cg_no = cg_no;
	}

	public String getCg_name() {
		return cg_name;
	}

	public void setCg_name(String cg_name) {
		this.cg_name = cg_name;
	}

	@Override
	public String toString() {
		return "Category [cg_no=" + cg_no + ", cg_name=" + cg_name + "]";
	}
	
	
	
}
