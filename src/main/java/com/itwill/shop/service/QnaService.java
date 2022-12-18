package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.QnaDao;
import com.itwill.shop.dto.qna.PageMaker;
import com.itwill.shop.dto.qna.Qna;
import com.itwill.shop.dto.qna.QnaListPageMaker;

public class QnaService {
	private static QnaService _instance;
		
		private QnaDao qnaDao;
		public QnaService() throws Exception{
			qnaDao=new QnaDao();
		}
		
		public static QnaService getInstance() throws Exception{
			if(_instance==null) {
				_instance=new QnaService();
			}
			return _instance;
		}
	/*
	 * 게시물생성
	 */
	public int createQna(Qna qna) throws Exception{
		return qnaDao.createQna(qna);
	}
	/*
	 * 게시물삭제
	 */
	public int removeQna(int q_no) throws Exception{
		return qnaDao.removeQna(q_no);
	}
	/*
	 * 게시물수정
	 */
	public int updateQna(Qna qna) throws Exception{
		return qnaDao.updateQna(qna);
	}
	/*
	 * 게시물 1개
	 */
	public Qna findQna(int q_no)throws Exception{
		Qna qna=qnaDao.findQna(q_no);
		return qna;
	}
	public void updateHitCount(int q_no) throws Exception{
		qnaDao.increaseReadCount(q_no);
	}
	/*
	 * 게시물리스트
	 */
	public QnaListPageMaker findQnaList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = qnaDao.getQnaCount();
		//2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
		
		//3.게시물데이타 얻기
		List<Qna> qnaList=
				qnaDao.findQnaList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		QnaListPageMaker pageMakerQnaList=new QnaListPageMaker();
		pageMakerQnaList.totRecordCount=totalRecordCount;
		pageMakerQnaList.itemList=qnaList;
		pageMakerQnaList.pageMaker=pageMaker;
		return pageMakerQnaList;
	}
	public int createReply(Qna qna) throws Exception{
		return qnaDao.createQnaReply(qna);
	}
}
