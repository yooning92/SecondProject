package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.UserInfoDao;
import com.itwill.shop.dto.UserInfo;
import com.itwill.shop.dto.UserInfoListPageMakerDto;
import com.itwill.shop.dto.review.PageMaker;


public class UserInfoService {
	private UserInfoDao userInfoDao;

	public UserInfoService() throws Exception {
		userInfoDao = new UserInfoDao();
	}
	/*
	 * 회원가입
	 */
	public int create(UserInfo userinfo)throws Exception{
		/*
		 * -1:아이디 중복
		 *  1:회원 가입 성공
		 */
		//1.아이디 중복 체크
		if(userInfoDao.existedUserInfo(userinfo.getU_id())) {
			//아이디 중복
			return -1;
		}else {
			//아이디 중복X
			//2.회원가입
			int insertRowCount=userInfoDao.create(userinfo);
			return insertRowCount;
		}
		
	}

	/*
	 * 회원 로그인
	 */
	public int login(String u_id,String u_pw) throws Exception{
		int result=-1;
		//1.아이디존재여부
		UserInfo userinfo=userInfoDao.findUser(u_id);
		//아이디존재안함
		if(userinfo==null) {
			result=0;
			//아이디존재함
		}else {
			//1:로그인성공
			if(userinfo.isMatchPassword(u_pw)) {
				result=1;
				//패스워드 불일치
			}else {
				result=2;
			}
		}
		
		return result;
	}

	/*
	 * 회원 전체 리스트
	 */
	public UserInfoListPageMakerDto findUserInfoList(int pageno) throws Exception {
		// 1.전체회원수
		int totalRecordCount =userInfoDao.getUserInfoCount();
		// 2.paging 계산 (PageMaker 유틸클레스)
		PageMaker pageMaker = 
				new PageMaker(totalRecordCount, pageno);
		PageMaker.BLOCK_SCALE=4;
		PageMaker.PAGE_SCALE=4;
		
		// 3. 유저정보 얻기 
		List<UserInfo> userInfoList = userInfoDao.findUserInfoList(pageMaker.getPageBegin(),pageMaker.getPageEnd());
		UserInfoListPageMakerDto pageMakerUserInfoList = new UserInfoListPageMakerDto();
		pageMakerUserInfoList.totRecordCount = totalRecordCount;
		pageMakerUserInfoList.itemList = userInfoList;
		pageMakerUserInfoList.pageMaker =pageMaker;
		return pageMakerUserInfoList;
	}

	/*
	 * 회원 1명 보기
	 */
	public UserInfo findUser(String u_id) throws Exception {
		return userInfoDao.findUser(u_id);
	}
	public UserInfo findUserByEmail(String u_email)throws Exception{
		return userInfoDao.findUserByEmail(u_email);
	}

	/*
	 * 회원 정보 수정
	 */
	public int update(UserInfo userinfo) throws Exception {
		return userInfoDao.update(userinfo);
	}

	/*
	 * 회원 탈퇴
	 */
	public int remove(String u_id) throws Exception {
		return userInfoDao.remove(u_id);
	}

	/*
	 * 아이디 중복 체크
	 */
	public boolean isDuplicateId(String u_id) throws Exception {
		boolean isExist = userInfoDao.existedUserInfo(u_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}

}
