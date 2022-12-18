package com.itwill.shop.service.test;

import com.itwill.shop.dto.UserInfo;
import com.itwill.shop.service.UserInfoService;

public class UserInfoServiceTest {

	public static void main(String[] args) throws Exception {

		UserInfoService userInfoService = new UserInfoService();
		
		
		System.out.println(">>>>> 회원 가입");
		System.out.println(userInfoService.create(new UserInfo("kim", "1111", "김김김", "kim@gmail.com", "평양시", "010-7878-5656")));
		
		System.out.println(">>>>> 회원 로그인");
		System.out.println(userInfoService.login("test1","pw1"));
		
//		System.out.println(">>>>> 회원 전체 리스트");
//		System.out.println(userInfoService.findUserInfoList());
//		
		System.out.println(">>>>> 회원 1명 보기");
		System.out.println(userInfoService.findUser("test1"));
		
		System.out.println(">>>>> 회원 정보 수정");
		System.out.println(userInfoService.update(new UserInfo("kim", "1111","변경이름","@test.com","평양","010-1111-1111")));
		
		System.out.println(">>>>> 회원 탈퇴");
		System.out.println(userInfoService.remove("kim"));
		
		System.out.println(">>>>> 아이디 중복 체크");
		System.out.println(userInfoService.isDuplicateId("test1"));
		
		
		
		
		
		
		
		
	}

}
