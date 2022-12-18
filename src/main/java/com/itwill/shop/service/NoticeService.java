package com.itwill.shop.service;

import java.util.List;


import com.itwill.shop.dao.NoticeDao;
import com.itwill.shop.dto.Notice;
import com.itwill.shop.dto.NoticeListPageMakerDto;
import com.itwill.shop.dto.review.PageMaker;


public class NoticeService {
	private NoticeDao noticeDao;
	public NoticeService() throws Exception {
		noticeDao = new NoticeDao();
	}
	//공지사항 전체출력
	
	public List<Notice> selectAllNotice()throws Exception {
		return noticeDao.selectAll();
	}
	//공지사항 한개출력
	public Notice selectByNoNotice(int no)throws Exception {
		return noticeDao.selectByNNo(no);
	}
	//공지사항 추가
	public int insertNotice(Notice notice)throws Exception {
		return noticeDao.insert(notice);
	}
	//공지사항 변경
	public int updateNotice(Notice notice)throws Exception {
		return noticeDao.update(notice);
	}
	//공지사항 삭제
	public int deleteNotice(int no)throws Exception {
		return noticeDao.delete(no);
	}
	
	public NoticeListPageMakerDto findBoardList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = noticeDao.getNoticeCount();
		//2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
		
		
		//3.게시물데이타 얻기
		List<Notice> noticeList=
				noticeDao.findNoticeList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		NoticeListPageMakerDto pageMakerNoticeList=new NoticeListPageMakerDto();
		pageMakerNoticeList.totRecordCount=totalRecordCount;
		pageMakerNoticeList.itemList=noticeList;
		pageMakerNoticeList.pageMaker=pageMaker;
		return pageMakerNoticeList;
	}
}
