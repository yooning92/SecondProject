package com.itwill.shop.service.test;

import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Product;
import com.itwill.shop.service.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		ProductService productService = new ProductService();
//		
//	
//		System.out.println(">> 전체출력");
//		System.out.println(productService.productSelectAll());
//	
//		System.out.println(">> 카테고리번호로 해당상품전체출력");
//		System.out.println(productService.selectAllByCgNo(2));
//	
//		System.out.println(">> 상품번호로 1개 출력");		
//		System.out.println(productService.productSelectByNo(new Product(21, null, 0, null, null, 0, null)));
//		
//		System.out.println(">> 상품이름으로 1개 출력");
//		System.out.println(productService.productSelectByName(new Product(0, "신발장", 0, null, null, 0, null)));
//				
		System.out.println(">> 상품검색하기");
		productService.productSearch("의자");
		
		
		
//		/*********************<<관리자 전용>>**************************/
//		
//		System.out.println(">> 상품등록하기");
//		productService.insertProduct(new Product(0, "컴퓨터", 500000, "computer.jsp", "컴퓨터입니다", 0, new Category(3, null)));
//		
//		System.out.println(">> 상품수정하기");
//		productService.updateProduct(new Product(23, "청소기", 150000, "cleaner.jpg", "청소기입니다", 0, new Category(3, null)));
//		
//		System.out.println(">> 상품삭제하기");
//		productService.deleteProduct(new Product(24, null, 0, null, null, 0, null));
	}

}
