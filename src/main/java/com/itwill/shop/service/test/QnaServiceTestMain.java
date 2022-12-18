package com.itwill.shop.service.test;

import com.itwill.shop.dto.qna.Qna;
import com.itwill.shop.service.QnaService;

public class QnaServiceTestMain {

	public static void main(String[] args) throws Exception {
		
		QnaService qnaService = new QnaService();
		Qna qna = new Qna(15, "7","7",null,null,0,0,0,0,"test5");
		
		
		System.out.println(qnaService.createQna(qna));
		
		System.out.println(qnaService.updateQna(qna));
		
		System.out.println(qnaService.removeQna(15));
		
		System.out.println(qnaService.findQna(14));
		
	}

}
