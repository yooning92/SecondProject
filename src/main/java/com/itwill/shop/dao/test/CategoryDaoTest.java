package com.itwill.shop.dao.test;

import com.itwill.shop.dao.CategoryDao;
import com.itwill.shop.dto.Category;

public class CategoryDaoTest {
	public static void main(String[] args) throws Exception {
		CategoryDao categoryDao = new CategoryDao();
		
		//카테고리 전체 검색
		System.out.println(categoryDao.selectAll());
		
		//카테고리 이름으로 검색 -객체 
		System.out.println(categoryDao.CategoryByName(new Category(0, "강풍기")));
		//카테고리 이름으로 검색 -파라메타
		System.out.println(categoryDao.CategoryByName("수납"));

		//카테고리 번호로 검색 -객체
		System.out.println(categoryDao.CategoryByNo(new Category(1, null)));
		//카테고리 번호로 검색 -파라메타
		System.out.println(categoryDao.categoryByNo(1));
		
		
		/**********관리자 사용 ************************/
		//카테고리 추가<<insert>> -객체
		System.out.println("카테고리추가");
		categoryDao.insertCategory(new Category(27,"커튼"));
		//카테고리 추가<<insert>> -파라메타
		System.out.println("카테고리추가");
		categoryDao.insertCategory(28,"가림판");
		
		//카테고리 수정<<update>> -객체
		System.out.println(">>카테고리 수정");
		System.out.println(categoryDao.categoryUpdate(new Category(1,"강풍기")));
		//카테고리 수정<<update>> -파라메타
		System.out.println(">>카테고리 수정");
		System.out.println(categoryDao.categoryUpdate("약풍기",1));
		
		//카테고리 삭제<<delete>> -객체
		System.out.println(">>카테고리 삭제");
		categoryDao.categoryDelete(new Category(27, null));
		//카테고리 삭제<<delete>> -파라메타
		System.out.println(">>카테고리 삭제");
		categoryDao.categoryDelete(27);
		
		
	}

}
