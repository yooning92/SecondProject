package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.CategoryDao;
import com.itwill.shop.dto.Category;

public class CategoryService {
	private CategoryDao categoryDao;
	
	public CategoryService() throws Exception {
		categoryDao = new CategoryDao();
	}

	
	//카테고리 번호로 찾기
	public Category categoryListByNo(int no)throws Exception {
		return categoryDao.categoryByNo(no);
	}
	/* 이름을 이용하여 찾을 상황이 없어서 주석처리
	//카테고리 이름으로 찾기
	public Category categoryListByName(String name)throws Exception{
		return categoryDao.CategoryByName(name);
	}
	*/
	/*****************관리자용*********************************/
	//카테고리 리스트 
	public List<Category> categoryList ()throws Exception{
		return categoryDao.selectAll();
	}
	
	//카테고리 추가
	public int categoryInsert(Category category)throws Exception {
		return categoryDao.insertCategory(category);
	}
	//카테고리 변경
	public int  categoryUpdate(Category category)throws Exception {
		return categoryDao.categoryUpdate(category);
	}
	//카테고리 삭제
	public int categoryDelete(Category category)throws Exception {
		return categoryDao.categoryDelete(category);
	}
	
	
	
	
	
}
