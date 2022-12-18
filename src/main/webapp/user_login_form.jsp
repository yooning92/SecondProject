<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/********************************************/
String msg1=(String)request.getAttribute("msg1");
if(msg1==null)msg1="";
String msg2=(String)request.getAttribute("msg2");
if(msg2==null)msg2="";
UserInfo fuser=(UserInfo)request.getAttribute("fuser");
if(fuser==null)fuser=new UserInfo("","","","","","");
/*********************************************/

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript">
	function userCreateForm() {
		location.href = "user_write_form.jsp";
	}
	function login() {
		if (document.f.u_id.value == "") {
			alert("아이디를 입력해주세요.");
			document.f.u_id.focus();
			return;
		}
		if (document.f.u_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			f.u_pw.focus();
			return;
		}
		document.f.action = "user_login_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	function userFindForm(){
		var left = Math.ceil(( window.screen.width)/3);
		var top = Math.ceil(( window.screen.height)/3); 
		console.log(left);
		console.log(top);
		var cartWin = window.open("about:blank","cartForm","width=420,height=200,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
		document.add_cart_form.action = 'user_find_action_popup_window.jsp';
		document.add_cart_form.method = 'POST';
		document.add_cart_form.submit();
	}
}
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
			<jsp:include page="include_common_top.jsp"></jsp:include>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
				<jsp:include page="include_common_left.jsp"></jsp:include>
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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 로그인</b></td>
								</tr>
							</table> <!-- login Form  -->
							<form name="f" method="post" >
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 150" name="u_id" value="">&nbsp;&nbsp;<font color="red"></font></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="password"
											style="width: 150" name="u_pw" value="">&nbsp;&nbsp;<font color="red"></font></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="로그인"	onClick="login();"> &nbsp; 
									<input type="button" value="회원가입" onClick="userCreateForm()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"></jsp:include>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>