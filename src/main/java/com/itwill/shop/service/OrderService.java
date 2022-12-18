package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dao.OrderDao;
import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.CartItem;
import com.itwill.shop.dto.Order;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;

public class OrderService {

	private OrderDao orderDao;
	private CartDao cartDao;
	private ProductDao productDao;

	public OrderService() throws Exception {
		orderDao = new OrderDao();
		cartDao = new CartDao();
		productDao = new ProductDao();
	}

	/* ------ order select------ */
	/*
	 * 1. 고객1명의 주문 1개 & 주문상세, 상품 정보 모두 보기
	 */
	public Order oneOfOrderProductdetailByOrderNo(Order order) throws Exception {
		return orderDao.oneOfOrderProductdetailByOrderNo(order);
	}

	/*
	 * 1-2.주문상세리스트(특정사용자) --- JSP에서 실행안됨...
	 */
	public List<Order> list_detail(Order order) throws Exception {
		return orderDao.list_detail(order);
	}

	/*
	 * 고객1명의 주문번호 List.......(1-2번이 JSP에서 실행이 안되서 서비스를 쪼개봄) 
	 */
	public ArrayList<Order> orderNoListByUserId(Order order) throws Exception {
		return orderDao.orderNoListByUserId(order);
	}

	/*
	 * 2. 고객1명(특정사용자)의 주문 전체 목록
	 */
	public ArrayList<Order> orderListByUserId(Order order) throws Exception {
		return orderDao.orderListByUserId(order);
	}

	/* ------ order insert------ */
	/*
	 * 상품detail에서 직접주문
	 */
	public int create(String u_id, int p_no, int oi_qty) throws Exception {
		// int p_no=order.getOrderItemList().get(0).getProduct().getP_no();
		// int oi_qty=order.getOrderItemList().get(0).getOi_qty();
		// String u_id=order.getU_id();
		Product product = new Product(p_no, null, 0, null, null, oi_qty, null);

		product = productDao.productSelectByNo(product);

		List<OrderItem> newOrderItemList = new ArrayList<OrderItem>();
		newOrderItemList.add(new OrderItem(0, oi_qty, 0, product));

		Order newOrder = new Order(0, newOrderItemList.get(0).getProduct().getP_name() + "외 " + (oi_qty - 1) + "개",
				null, product.getP_price() * oi_qty, u_id, newOrderItemList);
		return orderDao.create(newOrder);
	}

	/*
	 * cart에서 주문
	 */
	public int createOrderByCart(String u_id) throws Exception {
		ArrayList<CartItem> cartList = (ArrayList)cartDao.getCartItem(u_id);
		
		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		
		int o_total_price = 0;
		int oi_total_count = 0;
		
		for (CartItem cartItem : cartList) {
			OrderItem orderItem = new OrderItem(0, cartItem.getC_qty(), 0, cartItem.getProduct());
			orderItemList.add(orderItem);
			
			o_total_price += orderItem.getOi_qty() * orderItem.getProduct().getP_price();
			oi_total_count += orderItem.getOi_qty();
		}
		
		String o_desc = orderItemList.get(0).getProduct().getP_name() + "외 " + (oi_total_count - 1) + " 개";
		Order newOrder = new Order(0, o_desc, null, o_total_price, u_id, orderItemList);
		// order생성-> cart삭제
		orderDao.create(newOrder);
		cartDao.deleteCart(u_id);

		return 0;	//return 값은 무의미
	}
	
	/*
	 * cart에서 선택주문 -> cartDao에 cartNo로 select하는 메소드가 필요함!
	 */
	
	public int createOrderByCartSelect(String u_id, String[] cart_item_noStr_array) throws Exception{

		ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
		
		int o_total_price = 0;
		int oi_total_count = 0;
		
		for (int i = 0; i < cart_item_noStr_array.length; i++) {
			//		-> cartDao에 cartNo로 select하는 메소드가 필요함!	
			CartItem cartItem = cartDao.getCartItemByCNo(Integer.parseInt(cart_item_noStr_array[i]));
			OrderItem orderItem = new OrderItem(0, cartItem.getC_qty(), 0, cartItem.getProduct());
			orderItemList.add(orderItem);
			
			o_total_price += orderItem.getOi_qty() * orderItem.getProduct().getP_price();
			oi_total_count += orderItem.getOi_qty();
		}
		String o_desc = orderItemList.get(0).getProduct().getP_name() + "외 " + (oi_total_count - 1) + " 개";
		Order newOrder = new Order(0, o_desc, null, o_total_price, u_id, orderItemList);
		// order생성-> cart삭제
		orderDao.create(newOrder);
		for (int i = 0; i < cart_item_noStr_array.length; i++) {
			cartDao.deleteCartByNo(Integer.parseInt(cart_item_noStr_array[i]));
		}
		return 0;	//return 값은 무의미
	}


	public int cancelOrder(Order order)throws Exception{
		return orderDao.cancelOrder(order);
	}
	
	public int confirmOrder(Order order) throws Exception {
		return orderDao.confirmOrder(order);
	}
	/*
	 11-2. 주문내역삭제(jsp에서 안보여줌)를 위한 updqte
	 */
	/*
	 * public final static String HIDE_ORDERS_BY_ORDER_NO
	 * ="update orders set o_desc='[구매확정]'||o_desc where o_no=?";
	 */
	public int hideOrder(Order order) throws Exception {
		return orderDao.hideOrder(order);
	}
	
	public Product findProductByOrderItemNo(int oi_no)throws Exception{
		return orderDao.findProductByOrderItemNo(oi_no);
	}
	
	public Order findOrderDetailByOrderItemNo(int oi_no)throws Exception{ 
		return orderDao.findOrderDetailByOrderItemNo(oi_no);
	}
}
