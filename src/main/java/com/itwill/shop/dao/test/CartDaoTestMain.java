package com.itwill.shop.dao.test;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dto.CartItem;
import com.itwill.shop.dto.Product;

public class CartDaoTestMain {

	public static void main(String[] args)throws Exception {
		CartDao cartDao = new CartDao();
		
		System.out.println("1.test2의 카트리스트 불러오기");
		System.out.println(cartDao.getCartItem("test2"));
		/*
		System.out.println("2.test2의 카트리스트 안 제품 5번의 존재여부 불러오기");
		System.out.println(cartDao.cartProductCount(
											new CartItem(0, 0, "test2", 
																	new Product(5, null, 0, null, null, 0, null))));
		System.out.println("3.test1의 카트리스트에 제품 1번 한개 insert");
		/*
		System.out.println(cartDao.add(new CartItem(0, 1, "test1", 
												new Product(1, null, 0, null, null, 0, null))));
		*/
		//System.out.println("4.test1의 카트리스트에 제품 1번 3개 update");
		//System.out.println(cartDao.update(new CartItem(0, 3, "test1", new Product(1, null, 0, null, null, 0, null))));
		//System.out.println("5.test1의 카트리스트 전체삭제");
		//System.out.println(cartDao.deleteCart("test1"));
		//System.out.println("6.test2의 카트리스트에 카트넘버 3번 삭제");
		//System.out.println(cartDao.deleteCartByNo(3));
		//System.out.println("7.c_no로 물건하나 선택");
		//System.out.println(cartDao.getCartItemByCNo(5));

	}

}
