package com.itwill.shop.sql;

public class ProductSQL {
	
/* Select문*/	
	
 //product 전체보기 (페이징)
 public final static String PRODUCT_SELECT_ALL
 				= "SELECT * FROM ( SELECT rownum idx, s.*  FROM "
 						+ "				( select * from product order by p_no desc ) s"
 						+ "		 )"
 						+ "WHERE idx >= ? AND idx <= ?";
 
  //product 전체 상품 카운트
 public final static String PRODUCT_SELECT_COUNT
 				="SELECT COUNT(*) p_count FROM product";
 
 
 
 
 //product 전체보기(카테고리별)(페이징)
 public final static String PRODUCT_SELECT_ALL_BY_CATEGORY
  = "SELECT * FROM ( SELECT rownum idx, s.*  FROM ( SELECT * from product where cg_no= ? order by p_no desc ) s) WHERE idx >= ? AND idx <= ? ";
   
  //product 카테고리별 상품 카운트
 public final static String PRODUCT_SELECT_COUNT_CATEGORY
 				="SELECT COUNT(*) p_count FROM product where cg_no=?"; 
 

 
  //검색 전체보기(페이징)
 public final static String PRODUCT_SELECT_ALL_BY_SEARCH
  = "SELECT * FROM ( SELECT rownum idx, s.*  FROM ( SELECT * from product where p_name like ? ) s)  WHERE idx >= ? AND idx <= ? "; 
 
 //검색 상품 카운트
 public final static String PRODUCT_SELECT_COUNT_SEARCH
 =" select count(*) p_count from product where p_name like ? ";
 

 //product 상품번호(p_no)로 1개 보기
 public final static String PRODUCT_SELECT_BY_NO 
 				= "select * from product where p_no = ? ";
//product 상품번호(p_no),카테고리 번호(cg_no)로 1개 보기
public final static String PRODUCT_SELECT_BY_NO_BY_CG_NO 
				= "select * from product where p_no =? and cg_no = ? ";

 
 //product 상품이름(p_name)로 1개 보기
 public final static String PRODUCT_SELECT_BY_NAME
 				= "select * from product where p_name = ?";
 
 //product 카테고리번호(cg_no)로 상품리스트 보기
 public final static String PRODUCT_SELECT_ALL_BY_CG_NO
 				= "select * from product where cg_no = ?";
 
 //product 검색기능
 public final static String PRODUCT_SEARCH
	= "select * from product where p_name like ?";
 
 
 
 /***********************************(관리자전용)****************************************/
 
 /* Update문 (관리자전용) */

 //product 상품번호(p_no)로 수정 -(이름(p_no),가격(p_price),이미지(p_image),상품설명(p_desc),카테고리(cg_no)
 public final static String PRODUCT_UPDATE_BY_NO
 	= "update product set p_name=?, p_price=?, p_image=?, p_desc=?, cg_no=?  where p_no=?";
 
//product 상품번호(p_no)로 수정 -(이름(p_no),가격(p_price),이미지(p_image),상품설명(p_desc),카테고리(cg_no)
public final static String PRODUCT_UPDATE_BY_NOBY_CG_NO
	= "update product set p_name=?, p_price=?, p_image=?, p_desc=?, cg_no=?  where p_no=? and cg_no=?";
 
 
 //product 상품번호(p_no)로 클릭수(p_click_count) 증가
 public final static String PRODUCT_CLICK_COUNT
 	= "update product set p_click_count=p_click_count+? where p_no =?";

 
 /* Delete문 (관리자전용) */

 // product 상품번호(p_no)로 삭제
 public final static String PRODUCT_DELETE_BY_NO
 				= "delete from product where p_no=?";
 
 
 /* Insert문 (관리자전용) */
 
 // product 새상품 추가
 public final static String PRODUCT_INSERT
	="insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values (product_p_no_seq.nextval,?,?,?,?,?,?)";


}