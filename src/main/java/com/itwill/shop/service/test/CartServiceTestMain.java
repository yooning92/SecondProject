package com.itwill.shop.service.test;

import com.itwill.shop.dto.CartItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.service.CartService;

public class CartServiceTestMain {

	
	public static void main(String[] args) throws Exception {
		CartService cartService = new CartService();
		CartItem cartItem = new CartItem(0, 2, "test1", 
										new Product(5, null, 0, null, null, 0, null));

		//cartService.addCart(cartItem);
		
		//cartService.updateCart(cartItem);
		
		System.out.println(cartService.getCartItemByNo(1));
	}

}
