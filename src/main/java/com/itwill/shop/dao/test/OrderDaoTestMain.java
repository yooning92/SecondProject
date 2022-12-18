package com.itwill.shop.dao.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.CartItem;
import com.itwill.shop.dto.Order;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;


public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();
		ProductDao productDao = new ProductDao();
		CartDao cartDao = new CartDao();
		/* ------ order select------ */
		/*
		 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
		 */
		Order findOrder = orderDao.oneOfOrderProductdetailByOrderNo(new Order(6, null, null, 0, "test2", null));
		System.out.println(findOrder);
		for (OrderItem orderItem : findOrder.getOrderItemList()) {
			System.out.println(orderItem);
		}
		
		/*
		 * 2. 고객1명(특정사용자)의 주문 전체 목록
		 */
		System.out.println("고객1명(특정사용자)의 주문 전체 목록");
		List<Order> orderList = orderDao.orderListByUserId(new Order(0, null, null, 0, "test1", null));
		for (Order order : orderList) {
			System.out.println(order);
		}
		
		/* <<미완성>>
		 * 3. test3 고객 주문 & 주문 상세 전체 목록 -> [어디에 필요하지?]
		 */
		
		/*
		 * 4.멤버1명(로그인상태)의 주문번호 4번의 주문 정보 -> [order_list.jsp]
		 */
		findOrder = orderDao.orderByOrderNo(new Order(4, null, null, 0, null, null));
		System.out.println(findOrder);
		
		/*
		 * 5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]
		 */

		System.out.println("\n5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개) -> [order_detail.jsp]");
		List<OrderItem> orderItemList = orderDao.orderItemByOrderNo(new Order(3, null, null,0,"test3",null));
		for (OrderItem orderItem : orderItemList) {
			System.out.println(orderItem);
		}
		/* <<미완성>>
		 * 6.주문 & 주문 상세 전체 목록 (관리자)
		//select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;
		public final static String SELECT_ALL_ORDER_ORDERITEM_PRODUCT
			="select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no";
		
		 */
		
		/***********************************************************/
		/* ------ order insert------ */
		//카트 -> 주문으로 옮겨올때에 관해서는 service에서 작성한다.
		
		/*<<단일주문건 생성에 해당 - 상품detail에서 직접 주문시 사용>>
		
			7-1-(1). 주문 생성(insert - orders) -> [order_create_action]
			insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
			7-1-(2). 주문 생성(insert - orderitem)
			insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
		 */
		System.out.println("7-1.상품detail에서 단일상품 주문");
		int p_no=11;
		int p_qty=7;
		Product product = new Product(11, null, p_no, null, null, p_qty, null);
		List<OrderItem> newOrderItemList=new ArrayList<OrderItem>();
		product = productDao.productSelectByNo(product);
		newOrderItemList.add(new OrderItem(0, p_qty, 0, product));
		/*
			private int o_no;
			private String o_desc;	// orderItemList.get(1).getProduct.getP_name();
			private Date o_date;
			private int o_price;
			
			private String u_id;	
			
			private List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		 */
		Order newOrder = new Order(0,
									newOrderItemList.get(0).getProduct().getP_name()+"외 "+(orderItemList.size()-1)+"종",
									null,
									product.getP_price()*p_qty,
									"test7",
									newOrderItemList);
		orderDao.create(newOrder);
		
		System.out.println("7-2.카트에서 전체주문");
		
		List<CartItem> cartItemList = cartDao.getCartItem("test4");
		int order_price=0;
		for (CartItem cartItem : cartItemList) {
			orderItemList.add(new OrderItem(0, cartItem.getC_qty(), 0, cartItem.getProduct()));
			order_price += cartItem.getC_qty()*cartItem.getProduct().getP_price();
		}
		newOrder = new Order(0,
								orderItemList.get(0).getProduct().getP_name()+"외 "+(orderItemList.size()-1)+"종",
								null,
								order_price,
								"test4",
								orderItemList);
		orderDao.create(newOrder);
		
		cartDao.deleteCart("test4"); //cart에서는 지워주는 cartDao호출~

		
		
	}

}
