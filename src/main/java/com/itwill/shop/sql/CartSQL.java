package com.itwill.shop.sql;
/*
 --select
--로그인한 test1님의 카트 리스트 불러오기
select * from cart c join product p on c.p_no=p.p_no where c.u_id='test1';

--로그인한 test1님의 카트 리스트에 제품넘버 1번의 존재여부 확인(0일 경우 insert,1이상일 경우 update)
select count(*) product_count from cart c where c.u_id='test1' and c.p_no=1;

--insert
--로그인한 test1님의 카트리스트에 제품 2번 1개 추가
insert into cart(c_no,c_qty,u_id,p_no) values(CART_C_NO_SEQ.nextval,1,'test1',2);

--update
--test1님의 카트리스트에 있는 제품1번의 수량 2개 증가
update cart c set c_qty=c_qty+2 where c.u_id='test1' and c.p_no=1;

--delete
--test1님의 카트리스트에 있는 제품1번 삭제
delete from cart c where c.p_no=1;

--test1님의 카트리스트 전체삭제
delete from cart c where c.u_id = 'test1';

 */

public class CartSQL {
	public static final String CART_LIST_SELECT_BY_USERID=
			"select * from cart c join product p on c.p_no=p.p_no where c.u_id=?";
	public static final String CART_SELECT_COUNT_BY_USERID_P_NO =
			"select count(*) product_count from cart c where c.u_id=? and c.p_no=?";
	public static final String CART_INSERT_LIST =
			"insert into cart(c_no,c_qty,u_id,p_no) values(CART_C_NO_SEQ.nextval,?,?,?)";
	public static final String CART_UPDATE_BY_USERID_C_NO =
			"update cart set c_qty=? where u_id=? and c_no=?";
	public static final String CART_UPDATE =
			"update cart set c_qty=c_qty + ? where u_id=? and p_no=?";
	public static final String CART_DELETE_BY_C_NO=
			"delete from cart where c_no=?";
	public static final String CART_DELETE_BY_USERID =
			"delete from cart where u_id = ?";
	public static final String CART_SELECT_BY_C_No =
			"select * from cart c join product p on c.p_no = p.p_no where c_no=?";
	
}
