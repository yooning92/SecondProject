package com.itwill.shop.dao.test;

import com.itwill.shop.dao.QnaDao;
import com.itwill.shop.dto.qna.Qna;

public class QnaDaoTestMain {

	public static void main(String[] args) throws Exception{
		QnaDao qnaDao = new QnaDao();
		System.out.println(qnaDao.createQna(new Qna()));
		
		//System.out.println(qnaDao.findQnaList(0,1));
		
		System.out.println(qnaDao.removeQna(1));
		System.out.println(qnaDao.updateQna(new Qna(2, "update","update",null,null,0,0,0,0,"update")));
	}

}
