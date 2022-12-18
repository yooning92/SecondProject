package com.itwill.shop.sql;

public class CategorySQL {
	//카테고리 전체검색<selectAll>
	public final static String CATEGORAY_SELECTALL 
	="select * from categorys";
	
	//카테고리 번호를 이용하여 상품 찾기<selctByNo>
	public final static String CATEGORAY_SELECTBYNO
	="select * from categorys where cg_no = ?";
	
	//카테고리 이름을 이용하여 상품 찾기<selectByName>
	public final static String CATEGORAY_SLECTBYNAME
	="select * from categorys where cg_name=?";
	
	
	//카테고리 이름과 상품이름을 이용하여 상품찾기<selectbyNameP_Name>
	public final static String CATEGORAY_SLECTBYNAMEP_NAME
	="select * from product p join categorys c on p.cg_no= c.cg_no where c.cg_name=? and p_name=?";
	
	
	
	/*******************관리자(admin) 사용 sql***************/
	
	//카테고리 추가<insert>
	public final static String CATEGORAY_INSERT
	="insert into categorys values(?,?)";
	
	//카테고리 변경<update>
	public final static String CATEGORAY_UPDATE
	="update categorys set cg_name=? where cg_no= ?";
	
	//카테고리 삭제<delect>
	public final static String CATEGORAY_DELETE
	="delete  from categorys where cg_no=?";




}
