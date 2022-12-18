package com.itwill.shop.sql;

public class UserInfoSQL {
	//회원 추가 <USER_INSERT>
	public final static String USER_INSERT=
	"insert into userinfo(u_id,u_pw,u_name,u_email,u_address,u_phone) values(?,?,?,?,?,?)";
	//회원 정보 수정 <USER_UPDATE>
	public final static String USER_UPDATE=
	"update  userinfo set u_pw=?,u_name=?,u_email=?,u_address=?,u_phone=? where u_id=?";
	//회원 탈퇴 <USER_DELETE>
	public final static String USER_DELETE=
	"delete userinfo where u_id=?";
	//ID로 회원 찾기 <USER_SELECT_BY_ID>
	public final static String USER_SELECT_BY_ID=
	"select u_id,u_pw,u_name,u_email,u_address,u_phone from userinfo where u_id=?";
	//모든 회원 찾기 <USER_SELECT_ALL><페이징>
	public final static String USER_SELECT_ALL=
	"select * from ( select rownum idx, s.*  FROM ( SELECT * from userinfo) s )WHERE idx >= ? AND idx <= ?";
	//userInfo 전체 인원 카운트 
	public final static String USER_SELECT_COUNT=
			"SELECT Count(*) u_count from userinfo";
	//ID로 중복 체크 <USER_SELECT_BY_ID_COUNT>
	public final static String USER_SELECT_BY_ID_COUNT=
	"select count(*) cnt from userinfo where u_id=?";
	//email로 아이디 찾기
	public final static String USER_SELECT_BY_EMAIL=
			"select * from userinfo where u_email=?";
	 
}
