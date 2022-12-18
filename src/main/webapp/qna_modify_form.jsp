<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@page import="com.itwill.shop.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	Integer q_no = null;
	try {
		q_no = Integer.valueOf(request.getParameter("q_no"));
	} catch (Exception ex) {
	}
	if (q_no == null) {
		response.sendRedirect("qna_list.jsp");
		return;
	}
	Qna qna = QnaService.getInstance().findQna(q_no);
	if (qna == null) {
		response.sendRedirect("qna_list.jsp");
		return;
	}
	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function qnaUpdate() {
		if (f.q_title.value == "") {
			alert("제목을 입력해주세요.");
			f.q_title.focus();
			return false;
		}
		if (f.u_id.value == "") {
			alert("작성자를 입력해주세요.");
			f.u_id.focus();
			return false;
		}
		if (f.q_content.value == "") {
			alert("내용을 입력해주세요.");
			f.q_content.focus();
			return false;
		}

		f.action = "qna_modify_action.jsp";
		f.submit();
	}

	function qnaList() {
		f.action = "qna_list.jsp";
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>내일의집 - 문의 게시판</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> <input
									type="hidden" name="q_no" value="<%=qna.getQ_no()%>" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의 제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="q_title" value="<%=qna.getQ_title()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150"
											readonly="readonly" name="u_id" value="<%=qna.getU_id()%>"><%=qna.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의 내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="q_content"
												style="width: 350px" rows="14"><%=qna.getQ_content().replace("\n", ">>").trim()%></textarea></td>
									</tr>


								</table>
							</form> <!-- 
							<form name="f" method="post">
				
		        	
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<input
								value="[RE]" 
								type="text" style="width: 150" name="title"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<input
								value=""
								type="text" style="width: 150" name="writer"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<textarea
									name="content" style="width:480" rows="15"></textarea>
							</td>
						</tr>
						
						
					</table>
				</form> 
							 --> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<%if(sUserId.equals("admin")){%>
								<tr>
									<td align=center>
									<input type="button" value="수정" onClick="qnaUpdate()"> &nbsp; 
									<input type="button" value="리스트" onClick="qnaList()"></td>
								</tr>
								<%} else if(sUserId.equals(qna.getU_id())){%>
								<tr>
									<td align=center>
									<input type="button" value="수정" onClick="qnaUpdate()"> &nbsp; 
									<input type="button" value="리스트" onClick="qnaList()"></td>
								</tr>
								<%}else if(!sUserId.equals(qna.getU_id())){ %>
									<td align=center>
									<input type="hidden" value="수정" onClick="qnaUpdate()"> &nbsp; 
									<input type="button" value="리스트" onClick="qnaList()"></td>
								<%}%>
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