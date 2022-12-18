<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	
	String noStr= request.getParameter("n_no");

	if(noStr==null || noStr.equals("")){
		response.sendRedirect("notice_list.jsp");
		return;
	}
	
	NoticeService noticeService = new NoticeService();
	Notice notice=noticeService.selectByNoNotice(Integer.parseInt(noStr));	
 	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script>
	function noticeUpdate() {
		if (f.n_title.value == "") {
			alert("제목을 입력해주세요.");
			f.title.focus();
			return false;
		}
		if (f.n_content.value == "") {
			alert("내용을 입력해주세요.");
			f.content.focus();
			return false;
		}

		f.action = "notice_modify_action.jsp";
		f.method = "post"
		f.submit();
	}
	function noticeView() {
		f.action = "notice_list.jsp";
		f.submit();
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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>내일의집 - 공지 게시판</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="n_no" value="<%=notice.getN_no()%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지 제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" name="n_title"
											value=<%=notice.getN_title()%>></td>
									</tr>
									<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">공지 내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="n_content"
												style="width: 350px" rows="14"><%=notice.getN_content()%> </textarea></td>
									</tr>
								</table>
							</form>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<input type="button" value="수정" onClick="noticeUpdate()"> &nbsp; 
									<input type="button" value="취소" onClick="noticeView()"> &nbsp;
									</td>
								</tr>
							</table>
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