<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "login_check.jspf" %>    
<%

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">

<script type="text/javascript">
	function qnaCreate() {
		if (f.q_title.value == "") {
			alert("제목을 입력해주세요.");
			f.q_title.focus();
			return false;
		}
		if (f.q_content.value == "") {
			alert("내용을 입력해주세요.");
			f.q_content.focus();
			return false;
		}

		f.action = "qna_write_action.jsp";
		f.method = "POST";
		f.submit();
	}

	function qnaList() {
		f.action = "qna_list.jsp"
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 문의 게시판</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의 제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="q_title"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="hidden" style="width: 150" readonly="readonly" name="u_id" value="<%=sUserId%>"><%=sUserId%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">문의 내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="q_content" class="textarea"
												style="width: 350px" rows="14"></textarea></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									
									<%if(sUserId.equals("admin")){%> 
									<input type="button" value="쓰기" onClick="qnaCreate()"> &nbsp; 
									<input type="button" value="수정" onClick="qnaUpdate()"> &nbsp;
									<input type="button" value="목록" onClick="qnaList()"></td>
									<% }else if(sUserId!=null) { %>
									<input type="button" value="쓰기" onClick="qnaCreate()"> &nbsp;
									<input type="button" value="수정" onClick="qnaUpdate()"> &nbsp;
									<input type="button" value="목록" onClick="qnaList()"></td>
									<% }else { %>
									<input type="button" value="목록" onClick="qnaList()"></td>
									 <%} %>
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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>