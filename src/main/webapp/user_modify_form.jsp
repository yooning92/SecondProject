<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

	UserInfoService userInfoService=new UserInfoService();
	UserInfo loginUser=userInfoService.findUser(sUserId);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript">
	function userModify() {
		if (document.f.u_pw.value == "") {
			alert("비밀번호를 입력하세요.");
			document.f.u_pw.focus();
			return false;
		}
		if (document.f.u_pw2.value == "") {
			alert("비밀번호 확인을 입력하세요.");
			document.f.u_pw2.focus();
			return false;
		}
		if (document.f.u_name.value == "") {
			alert("이름을 입력하세요.");
			document.f.u_name.focus();
			return false;
		}
		if (document.f.u_email.value == "") {
			alert("이메일 주소를 입력하세요.");
			document.f.u_email.focus();
			return false;
		}
		if (document.f.u_pw.value != f.u_pw2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.f.u_pw.focus();
			document.f.u_pw.select();
			return false;
		}
		if (document.f.u_address.value == "") {
			alert("주소를 입력해주세요.");
			document.f.u_address.focus();
			return false;
		}
		if (document.f.u_phone.value == "") {
			alert("전화번호를 입력해주세요.");
			document.f.u_phone.focus();
			return false;
		}

		document.f.action = "user_modify_action.jsp";
		document.f.submit();
	}
	function userMain() {
		document.f.action = "shop_main.jsp";
		document.f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">

				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 내 정보 수정</b></td>
								</tr>
							</table> <!-- update Form  -->
							<form name="f" method="post">

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=loginUser.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="u_pw" value="<%=loginUser.getU_pw()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="u_pw2" value="<%=loginUser.getU_pw()%>"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_name" value="<%=loginUser.getU_name()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_email" value="<%=loginUser.getU_email()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_address" value="<%=loginUser.getU_address()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="u_phone" value="<%=loginUser.getU_phone()%>"></td>
									</tr>
								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="내정보수정"
										onClick="userModify()"> &nbsp; <input type="button"
										value="메인" onClick="userMain()"></td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
