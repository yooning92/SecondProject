package com.itwill.shop.dao.test;

import com.itwill.shop.dao.UserInfoDao;

import com.itwill.shop.dto.UserInfo;


public class UserInfoDaoTestMain {

	public static void main(String[] args) throws Exception{
		UserInfoDao userInfoDao=new UserInfoDao();
		//회원 등록
//		System.out.println("1.insert:"+
//				userInfoDao.create(new UserInfo("kims", "1111", "김하림","kims@gmail.com","구리시", "010-0000-1111")));
		//회원 정보 수정
//		UserInfo updateUserInfo = new UserInfo("kims", "1111", "김수정", "kim3change@gmail.com", "구리시", "010-7777-6666");
//		System.out.println("2.update:"+userInfoDao.update(updateUserInfo));
//		//ID로 회원 검색
//		System.out.println("3.findUserInfo:"+userInfoDao.findUser("test4"));
//		//회원 삭제
//		System.out.println("4.remove:"+userInfoDao.remove("kims"));
//		//전체 회원 검색
//		System.out.println("5.findUserInfoList:"+userInfoDao.findUserInfoList());
		//ID로 회원 중복 체크
		System.out.println("6.existedUserInfo:"+userInfoDao.existedUserInfo("test1"));
		System.out.println("6.existedUserInfo:"+userInfoDao.existedUserInfo("test2"));
		System.out.println("6.existedUserInfo:"+userInfoDao.existedUserInfo("test3"));
		System.out.println("7. find user info by email"+userInfoDao.findUserByEmail("kim1@tmrw_house.com"));
		
		
	}

}
