
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	0  . GET방식요청일때 user_login_form.jsp로 redirection
	1  . 요청객체 인코딩설정
	2  . 파라메타 받기
	3  . UserService객체생성
	4  . UserService.login() 메쏘드실행
	*/
	
	 if(request.getMethod().equalsIgnoreCase("GET")){
	     response.sendRedirect("user_login_form.jsp");		  
		 return;
	 }
	 //request.setCharacterEncoding("UTF-8");
	 
	 String u_id=request.getParameter("u_id");
	 String u_pw=request.getParameter("u_pw");
	 UserInfoService userInfoService = new UserInfoService();
	 int result=userInfoService.login(u_id,u_pw);
	
	 /*
	 회원로그인
	 * 0:아이디 존재 안함
	 * 1:로그인성공
	 * 2:패스워드 불일치
	 */

	 if(result==1){//성공
		 session.setAttribute("sUserId", u_id);

		 response.sendRedirect("shop_main.jsp");
	 }else if(result==0){//아이디없음
		 //response.sendRedirect("user_login_form.jsp");


			out.println("<script>");
			out.println("alert('아이디를 확인 해 주세요.');");
			out.println("location.href='user_login_form.jsp';");
			out.println("</script>");
			
	 }else if(result==2){//패스워드 불일치
		 //response.sendRedirect("user_login_form.jsp");
		  out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='user_login_form.jsp';");
			out.println("</script>");
	 }

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
// 	 if(result==0){
// 		 //0:아이디존재안함
// 		 String msg1 = u_id+" 는 존재하지않는 아이디입니다.";
// 		 /****************case1 script************
// 		 out.println("<script>");
// 		 out.println("alert('"+msg1+"');");
// 		 out.println("location.href='user_login_form.jsp';");
// 		 out.println("</script>");
// 		 */
		 
// 		 /****************case2 forward************/
// 		 request.setAttribute("msg1", msg1);
// 		 UserInfo fuser=new UserInfo(u_id,u_pw,"","","","");
// 		 request.setAttribute("fuser", fuser);
		 
// 		 RequestDispatcher rd=
// 		 	request.getRequestDispatcher("user_login_form.jsp");
// 		 rd.forward(request, response);
// 	 }else if(result==1){
// 		 //1:패쓰워드 불일치
// 		 String msg2 = "패쓰워드가 일치하지 않습니다.";
// 		 /****************case1 script************
// 		 out.println("<script>");
// 		 out.println("alert('"+msg2+"');");
// 		 out.println("location.href='user_login_form.jsp';");
// 		 out.println("</script>");
// 		 */
// 		 /****************case2 forward************/
// 		 request.setAttribute("msg2", msg2);
// 		 UserInfo fuser=new UserInfo(u_id,u_pw,"","","","");
// 		 request.setAttribute("fuser", fuser);
		 
// 		 RequestDispatcher rd=
// 			request.getRequestDispatcher("user_login_form.jsp");
// 		rd.forward(request, response);
// 	 }else if(result==2){
// 		 //2:로그인성공(세션)
// 		session.setAttribute("sUserId", u_id);
// 		response.sendRedirect("shop_main.jsp");		 
// 	 }
		
	
	
	
%>