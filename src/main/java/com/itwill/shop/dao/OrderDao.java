package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Order;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.sql.OrderSQL;

public class OrderDao {

	private DataSource dataSource;

	public OrderDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shop/common/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	/***************************
	 * 작성중입니다
	 *********************************************/
	/* ------ order select------ */
	/*
	 * 1-1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	public Order oneOfOrderProductdetailByOrderNo(Order order) throws Exception {
		/*
		 * select * from orders o join orderitem oi on o.o_no = oi.o_no join product p
		 * on oi.p_no = p.p_no where o.u_id = ? and o.o_no=?
		 */
		Order findOrder = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.SELECT_ONE_OF_ORDER_PRODUCT_DETAIL_BY_ORDERNO);
		//pstmt.setString(1, order.getU_id());
		//pstmt.setInt(2, order.getO_no());
		pstmt.setInt(1, order.getO_no());
		rs = pstmt.executeQuery();

		if (rs.next()) {
			findOrder = new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"), rs.getInt("o_price"),
					rs.getString("u_id"), new ArrayList<OrderItem>());
			do {
				findOrder.getOrderItemList()
						.add(new OrderItem(rs.getInt("oi_no"), rs.getInt("oi_qty"), rs.getInt("o_no"),
								new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
										rs.getString("p_image"), rs.getString("p_desc"), rs.getInt("p_click_count"),
										new Category(rs.getInt("cg_no"), null))));
			} while (rs.next());
		}
		con.close();
		return findOrder;
	}

	/*
	 * 1-2.주문상세리스트(특정사용자) - 
	 */
	public List<Order> list_detail(Order order) throws Exception {

		List<Order> orderList = new ArrayList<Order>();

		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		/*
		   public static final String ORDER_LIST_BY_ORDER_NO_USERID
		   ="select * from orders o join order_item oi on o.o_no=oi.o_no"
		   		+ "join  product p on oi.p_no=p.p_no"
		   		+ "where o.u_id=? and o.o_no = ?";
		 */
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_O_NO_LIST);
			pstmt2 = con.prepareStatement(OrderSQL.ORDER_LIST_BY_ORDER_NO_USERID);

			pstmt1.setString(1, order.getU_id());
			ResultSet rs1 = pstmt1.executeQuery();

			while (rs1.next()) {

				int temp_o_no = rs1.getInt("o_no");

				pstmt2.clearParameters();
				pstmt2.setString(1, order.getU_id());
				pstmt2.setInt(2, temp_o_no);

				ResultSet rs2 = pstmt2.executeQuery();

				Order findOrder = null;

				if (rs2.next()) {
					findOrder = new Order(rs2.getInt("o_no"), rs2.getString("o_desc"), rs2.getDate("o_date"),
							rs2.getInt("o_price"), rs2.getString("userId"), new ArrayList<OrderItem>());
					do {
						findOrder.getOrderItemList()
								.add(new OrderItem(rs2.getInt("oi_no"), rs2.getInt("oi_qty"), rs2.getInt("o_no"),
										new Product(rs2.getInt("p_no"), rs2.getString("p_name"), rs2.getInt("p_price"),
												rs2.getString("p_image"), rs2.getString("p_desc"),
												rs2.getInt("p_click_cout"), new Category(rs2.getInt("cg_no"), null))));
					} while (rs2.next());

					/*
					 * orderItem리스트는 
					 * Order객체 내부에 null
					 * List<OrderItem> orderItemList=new List<OrderItem>();
					 * orderItemList.add(rs..);
					 * order.setOrderItemList(orderItemList) 해도 됨.
					 * 
					 */
				} // end if
				orderList.add(order);
			} // end while
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		}
		con.close();
		return orderList;
	}
	
	public ArrayList<Order> orderNoListByUserId(Order order) throws Exception{
		ArrayList<Order> orderList = new ArrayList<Order>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.ORDER_O_NO_LIST);
		pstmt.setString(1, order.getU_id());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			orderList.add(new Order(rs.getInt("o_no"), null, null,
					0, null, null));
		}
		con.close();
		return orderList;
	}

	/*
	 * 2. 고객1명(특정사용자)의 주문 전체 목록
	 */
	public ArrayList<Order> orderListByUserId(Order order) throws Exception {
		ArrayList<Order> orderList = new ArrayList<Order>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.SELECT_ORDER_LIST_BY_USERID);
		pstmt.setString(1, order.getU_id());
		rs = pstmt.executeQuery();
		/*
		 * 1 책상 외 2종 2022/08/01 200000 test1
		 * 2 선반 외 1종 2022/08/01 450000 test1
		 */
		while (rs.next()) {
			orderList.add(new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"),
					rs.getInt("o_price"), rs.getString("u_id"), null));
		}
		con.close();
		return orderList;
	}

	/* <<미완성>>
	 * 3. test3 고객 주문 & 주문 상세 전체 목록 -> [어디에 필요하지?]
	 */
	public ArrayList<Order> allOfOrderProductdetailByUserId(Order order) throws Exception {
		/*
		 select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id=?";
		 */
		ArrayList<Order> orderList = new ArrayList<Order>();
		// orderList.set(5, new ArrayList<OrderItem>());

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.SELECT_ORDER_ORDERITEM_PRODUCT_LIST_BY_USERID);
		pstmt.setString(1, order.getU_id());
		rs = pstmt.executeQuery();
		/*
		 * rs객체사용
		 */
		con.close();
		return orderList;
	}

	/*
	 * 4.멤버1명(로그인상태)의 주문번호 4번의 주문 정보 -> [order_list.jsp]
	 */
	public Order orderByOrderNo(Order order) throws Exception {

		Order findOrder = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		//// select * from orders where o_no = 4;
		pstmt = con.prepareStatement(OrderSQL.SELECT_ORDER_BY_ORDER_NO);

		pstmt.setInt(1, order.getO_no());
		rs = pstmt.executeQuery();

		if (rs.next()) {
			findOrder = new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"), rs.getInt("o_price"),
					rs.getString("u_id"), null);
		}
		con.close();
		return findOrder;
	}

	/*
	 * 5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]
	 */
	public ArrayList<OrderItem> orderItemByOrderNo(Order order) throws Exception {
		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.SELECT_ORDERITEM_BY_ORDER_NO);
		pstmt.setInt(1, order.getO_no());
		rs = pstmt.executeQuery();
		/*
			private int p_no; 		   // 상품번호
			private String p_name;     // 상품이름
			private int p_price;       // 상품가격
			private String p_image;    // 상품이미지
			private String p_desc;     // 상품설명
			private int p_click_count; // 상품클릭수
			private Category category; // 상품카테고리
		 */
		while (rs.next()) {
			orderItemList.add(new OrderItem(rs.getInt("oi_no"), rs.getInt("oi_qty"), rs.getInt("o_no"),
					new Product(rs.getInt("p_no"), null, 0, null, null, 0, null)));
		}
		con.close();
		return orderItemList;
	}
	/* <<미완성>>
	 * 6.주문 & 주문 상세 전체 목록 (관리자)
	//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;
		public final static String SELECT_ALL_ORDER_ORDERITEM_PRODUCT
		="select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no";
	 */
	public ArrayList<Order> selectAllOrderDetail() throws Exception {
		ArrayList<Order> orderList = new ArrayList<Order>();
		//Order findOrder = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(OrderSQL.SELECT_ONE_OF_ORDER_PRODUCT_DETAIL_BY_ORDERNO);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			orderList.add(new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"), rs.getInt("o_price"),
					rs.getString("u_id"), new ArrayList<OrderItem>()));
			} 
		con.close();
		return orderList;
	}
	
	
	

	/* ------ order insert------ */
	// 카트 -> 주문으로 옮겨올때에 관해서는 service에서 작성한다.
	/*<<단일주문건 생성에 해당 - 상품detail에서 주문시 사용>>
	7-1. 주문 생성(insert - orders) -> [order_create_action]
	insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
	7-2. 주문 생성(insert - orderitem)
	insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
	 */
	public int create(Order order) throws Exception {

		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		con = dataSource.getConnection();

		pstmt1 = con.prepareStatement(OrderSQL.INSERT_ORDER);
		pstmt1.setString(1, order.getO_desc());
		pstmt1.setInt(2, order.getO_price());
		pstmt1.setString(3, order.getU_id());
		int orderInsertResult = pstmt1.executeUpdate();

		pstmt2 = con.prepareStatement(OrderSQL.INSERT_ORDER_ITEM);
		for (OrderItem orderItem : order.getOrderItemList()) {
			pstmt2.setInt(1, orderItem.getOi_qty());
			pstmt2.setInt(2, orderItem.getProduct().getP_no());
			pstmt2.executeUpdate();
		}
		con.close();
		return orderInsertResult;
	}

	/******** 주문내역 삭제는 일어나지 않는다. 단지 주문상태만 바뀔 뿐이다. *************/
	/*
	8.주문번호 3번 삭제 -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?
	--on delete cascade -> order 삭제시, 연관된 orderitem 삭제
	*/
	public int deleteByOrderNo(Order order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		con = dataSource.getConnection();
		con.setAutoCommit(false);
		pstmt = con.prepareStatement(OrderSQL.DELETE_ORDER_BY_ORDER_NO);
		pstmt.setInt(1, order.getO_no());
		rowCount = pstmt.executeUpdate();

		con.close();

		return rowCount;
	}

	/*
	8.주문번호 3번 삭제 -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?
	--on delete cascade(아닐 경우)
		8-1.(주문상세삭제)delete from orderitem where o_no=3;
		8-2.(주문1개삭제)delete from orders where o_no=3;
	 */
	public int delete(Order order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		con = dataSource.getConnection();

		pstmt1 = con.prepareStatement(OrderSQL.DELETE_ORDER_BY_ORDER_NO);
		pstmt2 = con.prepareStatement(OrderSQL.DELETE_ORDERITEM_BY_ORDER_NO);
		pstmt1.setInt(1, order.getO_no());
		pstmt2.setInt(1, order.getO_no());
		int rowCount1 = pstmt1.executeUpdate();
		int rowCount2 = pstmt2.executeUpdate();

		con.close();

		return rowCount1 * rowCount2;
	}

	/*
	 * 따라서, 주문 전체삭제 등도 필요없다. -> 필요시 구현한다.
	 */
	/*
	 10. 주문취소(cancel)를 위한 select-update
	 */
	/*
		public final static String CANCEL_ORDERS_BY_ORDER_NO
			="update orderitem set oi_qty=0 where o_no=?";
		public final static String CANCEL_ORDER_ITEM_BY_ORDER_NO
			="update orders set o_desc='주문취소' where o_no=?";
	*/
	
	public int cancelOrder(Order order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		con = dataSource.getConnection();

		pstmt = con.prepareStatement(OrderSQL.CANCEL_ORDERS_BY_ORDER_NO);
		pstmt.setInt(1, order.getO_no());
		int orderCancelResult = pstmt.executeUpdate();
		/*
				pstmt2 = con.prepareStatement(OrderSQL.CANCEL_ORDER_ITEM_BY_ORDER_NO);
				pstmt2.setInt(1, order.getO_no());
				int orderItemCancelResult = pstmt2.executeUpdate();
				*/
		con.close();
		return orderCancelResult;
	}
	
	public int confirmOrder(Order order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		int orderCancelResult = 0;
		
		con = dataSource.getConnection();
		pstmt1 = con.prepareStatement(OrderSQL.CONFIRM_ORDERS_BY_ORDER_NO);
		pstmt1.setInt(1, order.getO_no());
		orderCancelResult = pstmt1.executeUpdate();
		
		con.close();
		return orderCancelResult;
	}
	
	/*
	 11-2. 주문내역삭제(jsp에서 안보여줌)를 위한 updqte
	 */
	/*
	 * public final static String HIDE_ORDERS_BY_ORDER_NO
	 * ="update orders set o_desc='[구매확정]'||o_desc where o_no=?";
	 */
	public int hideOrder(Order order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		
		int orderHideResult = 0;
		
		con = dataSource.getConnection();
		pstmt1 = con.prepareStatement(OrderSQL.HIDE_ORDERS_BY_ORDER_NO);
		pstmt1.setInt(1, order.getO_no());
		orderHideResult = pstmt1.executeUpdate();
		
		con.close();
		return orderHideResult;
	}
	
	/*
	 * orderItem번호로 Product 정보 얻기
	 */
	public Product findProductByOrderItemNo(int oi_no)throws Exception{
		Product product = null;
		Connection con = null;
		ResultSet rs = null;

		PreparedStatement pstmt = null;
		con = dataSource.getConnection();

		pstmt = con.prepareStatement(OrderSQL.FIND_PRODUCT_BY_ORDER_ITEM_NO);
		pstmt.setInt(1, oi_no);
		rs = pstmt.executeQuery();

		if(rs.next()) {
			product = new Product(rs.getInt("p_no"),
									rs.getString("p_name"),
									rs.getInt("p_price"),
									rs.getString("p_image"),
									rs.getString("p_desc"),
									rs.getInt("p_click_count"),
									new Category(rs.getInt("cg_no"),null)
								);
		}
		
		con.close();
		
		return product;
	}
	
	public Order findOrderDetailByOrderItemNo(int oi_no)throws Exception{
		Order order = null;
		OrderItem orderItem = null;
		
		Connection con = null;
		ResultSet rs = null;

		PreparedStatement pstmt = null;
		con = dataSource.getConnection();

		pstmt = con.prepareStatement(OrderSQL.FIND_ORDER_DETAIL_BY_ORDER_ITEM_NO);
		pstmt.setInt(1, oi_no);
		rs = pstmt.executeQuery();

		if(rs.next()) {
			order = new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"),
								rs.getInt("o_price"), rs.getString("u_id"),
								new ArrayList<OrderItem>()
								);
			order.getOrderItemList().add(new OrderItem(rs.getInt("oi_no"), rs.getInt("oi_qty"), rs.getInt("o_no"),
														new Product(rs.getInt("p_no"),
																rs.getString("p_name"),
																rs.getInt("p_price"),
																rs.getString("p_image"),
																rs.getString("p_desc"),
																rs.getInt("p_click_count"),
																new Category(rs.getInt("cg_no"),null)
																)));
		}
		
		con.close();
		
		return order;
	}
	
}
