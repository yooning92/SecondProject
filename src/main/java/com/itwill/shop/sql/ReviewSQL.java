package com.itwill.shop.sql;
/*
--test1의 모든 리뷰 리스트
select * from review where u_id = 'test1';

--test1의 1번 상품 리뷰 한 개 출력
select * from review r join orderitem o on r.oi_no = o.oi_no where r.u_id='test1' and o.p_no=1;

--test1의 주문상세 1번 상품 리뷰 한 개 변경
update review set r_title='리뷰1 제목 변경', r_content='리뷰1 내용 변경' where u_id = 'test1' and oi_no=1;

--test1의 모든 리뷰 삭제
delete from review where u_id='test1';

--test1의 상품 번호 1번 리뷰 삭제
delete from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no=1) where u_id='test1';
 */

public class ReviewSQL {
	
	/* ------ review insert------ */
	//8.리뷰 작성
	//insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no)
	//values(REVIEW_R_NO_SEQ.nextval, '좋아요'||REVIEW_R_NO_SEQ.currval, '추천해요! 너무너무 만족스러운 구매였어요! 후회하지 않으실꺼에요! 절대로! 꼭사세요!'||REVIEW_R_NO_SEQ.currval, sysdate-7, 5, null, 3, 'test1', 1);
	/*
		 이름            널? 유형             
		------------- -- -------------- 
		R_NO             NUMBER(10)     
		R_TITLE          VARCHAR2(100)  
		R_CONTENT        VARCHAR2(1000) 
		R_DATE           DATE           
		R_RATING         NUMBER(10)     
		R_IMAGE          VARCHAR2(50)   
		R_CLICK_COUNT    NUMBER(10)     
		U_ID             VARCHAR2(50)   
		OI_NO            NUMBER(10)   
	 */
	public static final String CREATE_REVIEW =
			"insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no)\n"
			+ "values(REVIEW_R_NO_SEQ.nextval, ?, ?, sysdate, ?, ?, 0, ?, ?)";
	
	//9.리뷰 작성시, 기존에 작성된 리뷰가 있는지 orderItem_no로 체크
	 //-> u_id & p_no조합은, 고객이 상품을 여러번 샀을 수도있다.
	//select count(*) from review where oi_no=11;
	public static final String IS_EXISTED_REVIEW_BY_ORDER_ITEM_NO =
			"select count(*) from review where oi_no=?";
	
	
	/* ------ review select------ */
	//0.(관리자페이지-리뷰list)
	//select * from review where u_id = 'test6';
	public static final String SELECT_ALL_REVIEW =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no order by oi.o_no desc";
	
	
	//1.(마이페이지-리뷰list) 로그인한 회원이 마이페이지?에서 리뷰를 모아서 볼 수 있음 -> u_id로 review 선택
	//select * from review where u_id = 'test6';
	public static final String SELECT_ALL_BY_USER_ID =
			"select * from review where u_id = ? order by oi_no desc";
	
	
	//2.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=22;
	
	public static final String SELECT_BY_ORDER_ITEM_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=? order by oi.o_no desc";
	
	
	//3.(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no로 접근
	//select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=1;
	
	public static final String SELECT_BY_PRODUCT_NO =
			"select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=? order by oi.o_no desc";
		
	//3.(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no,cg_no로 접근
	public static final String SELECT_BY_PRODUCT_NO_CGNO =
			"select * from orderitem oi join(select * from product where p_no= ? and cg_no= ?)s on oi.p_no =s.p_no join review r on oi.oi_no = r.oi_no";
	
	//4.(상품detail-리뷰detail) 리뷰list에서 r_no로 접근
	//select * from review where r_no=26;
	
	public static final String SELECT_BY_REVIEW_NO =
			"select * from review where r_no=? order by oi_no desc";
	
	/*
	 11-2. 구매확정(리뷰삭제불가)를 위한 count_select
	 */
	/*
	 * select count(*) from review r
		join orderitem oi on r.oi_no=oi.oi_no
		join orders o on oi.o_no=o.o_no
		where o.o_no=7;
	 */
	public final static String COUNT_REVIEW_BY_ORDER_NO
	="select count(*) from review r"
			+ "		join orderitem oi on r.oi_no=oi.oi_no"
			+ "		join orders o on oi.o_no=o.o_no"
			+ "		where o.o_no=?";
	
	
	
	/* ----- review update ----*/
	
	//-- update는 후기목록에서 선택할테니, pk이인 r_no로 접근해야하는건 아닌가?
	//update review set r_title = '9번 리뷰 제목_수정', r_content = '9번 리뷰 내용_수정' where r_no= 9;
	//5.후기detail에서 r_no로 후기 업데이트
	public static final String UPDATE_BY_REVIEW_NO =
			"update review set r_title = ?, r_content = ?, r_rating=?,r_image=? where r_no= ?";
	
	public static final String UPDATE_CLICK_COUNT_BY_REVIEW_NO =
			"update review set r_click_count=r_click_count+1 where r_no = ?";
	
	
	/* ----- review delete ----*/
	//6. u_id로 후기 전체삭제
	//delete from review where u_id = 'test1';
	
	public static final String DELETE_BY_USER_ID =
			"delete from review where u_id = ?";
	
	//7.r_no로 후기 1개삭제
	//select * from review where r_no=26;
	
	public static final String DELETE_BY_REVIEW_NO =
			"delete from review where r_no=?";

	//8.o_no로 연관후기들 삭제
	//delete from review r join orderitem oi on r.oi_no = oi.oi_no where oi.o_no = 7
	/*public static final String DELETE_BY_ORDER_NO =
			"delete from review r join orderitem oi on r.oi_no = oi.oi_no where oi.o_no = ?";
	*/
}
