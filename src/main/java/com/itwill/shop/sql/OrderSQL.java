package com.itwill.shop.sql;

public class OrderSQL {
	
	//1.고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기 -> [order_detail.jsp]
	//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id = 'test2' and o.o_no=4
	public final static String SELECT_ONE_OF_ORDER_PRODUCT_DETAIL_BY_ORDERNO
	//	= "select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id = ? and o.o_no=?";
		= "select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.o_no=? order by o.o_no desc";
	 
	//2.고객1명(test2)의 주문 전체 목록 -> [order_list.jsp]
	//select * from orders where u_id = 'test2';
	public final static String SELECT_ORDER_LIST_BY_USERID
	= "select * from orders where u_id = ? order by o_no desc";

	//3. test3 고객 주문 & 주문 상세 전체 목록 -> [어디에 필요하지?]
	//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id='test3';
	public final static String SELECT_ORDER_ORDERITEM_PRODUCT_LIST_BY_USERID
		="select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id=? order by o.o_no desc";
	
	
	
	public static final String ORDER_O_NO_LIST
	="select o_no from orders where u_id=? order by o_no desc";
	
   public static final String ORDER_LIST_BY_ORDER_NO_USERID
		       ="select * from orders o join orderitem oi on o.o_no=oi.o_no"
		       		+ "join  product p on oi.p_no=p.p_no"
		       		+ "where o.u_id=? and o.o_no = ? order by o.o_no desc";
	
	
	
	
	
	
	
	//4.멤버1명(로그인상태)의 주문번호 4번의 주문 정보 -> [order_list.jsp]
	//select * from orders where o_no = 4;
	public final static String SELECT_ORDER_BY_ORDER_NO
		="select * from orders where o_no = ? order by o_no desc";
	
	//5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]
	//select * from orderitem where o_no = 4;
	public final static String SELECT_ORDERITEM_BY_ORDER_NO
		="select * from orderitem where o_no = ? order by o_no desc";

	//6.주문 & 주문 상세 전체 목록 (관리자)
	//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;
	public final static String SELECT_ALL_ORDER_ORDERITEM_PRODUCT
		="select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no order by o.o_no desc";
	
	
	/*
	7-1. 주문 생성(insert - orders) -> [order_create_action]
	insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
	7-2. 주문 생성(insert - orderitem)
	insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
	 */
	public final static String INSERT_ORDER
		="insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, ?, sysdate, ?, ?)";
	public final static String INSERT_ORDER_ITEM
		="insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, ?, orders_o_no_seq.currval, ?)";
	
	

	/*
	8.주문번호 3번 삭제 -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?
	--on delete cascade
	8-1.(주문상세삭제)delete from orderitem where o_no=3;
	8-2.(주문1개삭제)delete from orders where o_no=3;
	 */
	public final static String DELETE_ORDERITEM_BY_ORDER_NO
	="delete from orderitem where o_no=?";
	public final static String DELETE_ORDER_BY_ORDER_NO
	="delete from orders where o_no=?";
	
	/*
	9.test3 고객의 주문 내역 전체 삭제 -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?
	delete from orderitem where o_no=(select o_no from orders where u_id = 'test3');
	delete from orders where u_id = 'test3';
	 */
	public final static String DELETE_ALL_ORDERITEM_BY_ORDER_NO_SELECTED_BY_USERID
	="delete from orderitem where o_no=(select o_no from orders where u_id = ?)";
	public final static String DELETE_ALL_ORDER_BY_USERID
	="delete from orders where u_id = ?";
	
	/*
	 10. 주문취소(cancel)를 위한 update
	 */
	public final static String CANCEL_ORDERS_BY_ORDER_NO
	="update orders set o_desc='[주문취소]'||o_desc where o_no=?";
	/*
	 public final static String CANCEL_ORDER_ITEM_BY_ORDER_NO
	 ="update orderitem set oi_qty=0 where o_no=?";
	 */
	
	/*
	 11-1. 구매확정(리뷰삭제불가)를 위한 updqte
	 */
	public final static String CONFIRM_ORDERS_BY_ORDER_NO
	="update orders set o_desc='[구매확정]'||o_desc where o_no=?";

	/*
	 11-2. 주문내역삭제(jsp에서 안보여줌)를 위한 updqte
	 */
	public final static String HIDE_ORDERS_BY_ORDER_NO
	="update orders set o_desc='[주문내역삭제]'||o_desc where o_no=?";
	
	
	/*
	 * orderItem번호로 Product 정보 얻기
	 */
	public final static String FIND_PRODUCT_BY_ORDER_ITEM_NO
	="select * from orderitem oi join product p on oi.p_no=p.p_no where oi.oi_no=?";
	/*
	 * orderItem번호로 Order, Product 정보 얻기
	 */
	public final static String FIND_ORDER_DETAIL_BY_ORDER_ITEM_NO
	="select * from orders o\r\n"
			+ "join orderitem oi\r\n"
			+ "on o.o_no=oi.o_no\r\n"
			+ "join product p\r\n"
			+ "on oi.p_no=p.p_no\r\n"
			+ "where oi.oi_no=?";
	
}

