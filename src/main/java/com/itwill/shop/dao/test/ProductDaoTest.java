package com.itwill.shop.dao.test;

import java.util.List;

import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Product;

public class ProductDaoTest {

	public static void main(String[] args) throws Exception {

		ProductDao productDao = new ProductDao();

		
		/*
		System.out.println(">>상품 전체 출력");
		List<Product> productList = productDao.productSelectAll();
		System.out.println(productList);
		
		System.out.println(">>카테고리번호(cg_no)로 상품전체출력");
		List<Product> producList = productDao.selectAllByCgNo(2);	
		System.out.println(producList);
		
		System.out.println(">>상품번호(p_no)로 출력");
		Product findProductNo = productDao.productSelectByNo(new Product(19, null, 0, null, null, 0, null));
		System.out.println(findProductNo);
		
				
		System.out.println(">>상품이름(p_name)로 출력");
		Product findProductName = productDao.productSelectByName(new Product(0, "의자", 0, null, null, 0, null));
		System.out.println(findProductName);
		
		
		System.out.println(">>새상품추가");
		productDao.insertProduct(new Product(0,
											"우산",
											5000,
											"umbrella.jsp",
											"우산입니다",
											0,
											new Category(1, null)
											)
									);
		//update 상품변경
		System.out.println(productDao.updateProduct
													(new Product(10,
													"조명",						
													4000,
													"바뀐.jpg",
													"좋은조명인가보군요",
													2,
													new Category(4,null))));
				
	    //delete 상품제거 
		System.out.println(productDao.deleteProduct(new Product(15, null, 0, null, null, 0, null)));
		
		//click_count
		System.out.println(productDao.clickCount(new Product(1, null, 0, null, null, 10, null)));
		*/
		
		
		//검색
		System.out.println(">>상품검색");
		List<Product> productSerchList = productDao.productSearch("책");
		for(Product product2 : productSerchList) {
			System.out.println(product2);
		}
		
		
		
	}//
}//