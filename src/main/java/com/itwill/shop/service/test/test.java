package com.itwill.shop.service.test;

import com.itwill.shop.dao.NoticeDao;

public class test {
	public static void main(String[] args) throws Exception {
		NoticeDao noticeDao = new NoticeDao();
		
		System.out.println(noticeDao.selectAll());
	}
}
