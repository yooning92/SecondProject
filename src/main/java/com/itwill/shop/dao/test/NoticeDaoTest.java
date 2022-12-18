package com.itwill.shop.dao.test;

import com.itwill.shop.dao.NoticeDao;
import com.itwill.shop.dto.Notice;

public class NoticeDaoTest {

	public static void main(String[] args) throws Exception {
			NoticeDao noticeDao = new NoticeDao();
			
			
			
		//selectAll
		System.out.println(noticeDao.selectAll());
		//selectbyno
		System.out.println(noticeDao.selectByNNo(2));
		//insert
		System.out.println(noticeDao.insert(new Notice(7, "공지11", "공지11 내용",null)));
		//update 
		//System.out.println(noticeDao.update(new Notice(7, null, null, null)));
		//delecte
		//System.out.println(noticeDao.delete(7));
			
			
			
	}
}
