package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.dto.CartItem;

public class CartService {
	private CartDao cartDao;
	public CartService() throws Exception{
		cartDao = new CartDao();
	}

	//카트리스트 insert(이미 리스트에 있을 경우 update)
	public int addCart(CartItem cartItem)throws Exception{
		int product_count = cartDao.cartProductCount(cartItem);
		if(product_count==0) {
			cartDao.add(cartItem);
		}else if(product_count==1) {
			cartDao.updateFromProduct(cartItem);
		}
		return 0;
	}
	
	//카트리스트 update
	public int updateCart(CartItem cartItem)throws Exception{
		return cartDao.update(cartItem);
	}
	
	
	//카트리스트 delete all
	public int deleteCartAll(String sU_Id) throws Exception{
		return cartDao.deleteCart(sU_Id);
	}
	
	//카트리스트 하나 삭제
	public int deleteCartOne(int c_no) throws Exception{
		return cartDao.deleteCartByNo(c_no);
	}
	
	//카트리스트 보기
	public List<CartItem> getCartList(String sU_Id) throws Exception{
		return cartDao.getCartItem(sU_Id);
	}
	
	public CartItem getCartItemByNo(int c_no)throws Exception{
		return cartDao.getCartItemByCNo(c_no);
	}
}
