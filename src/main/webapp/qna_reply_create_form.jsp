<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@page import="com.itwill.shop.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(request.getParameter("q_no")==null){
		response.sendRedirect("qna_list.jsp");
		return;
	}
	int q_no = Integer.parseInt(request.getParameter("q_no"));
	Qna qna=QnaService.getInstance().findQna(q_no);
	if(qna==null){
		response.sendRedirect("qna_list.jsp");
		return;
	}
	String pageno="1";
	if(request.getParameter("pageno")!=null){
		pageno = request.getParameter("pageno");
	}
%>    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function QnaReplayCreate() {
		if (f.q_title.value == "") {
			alert("제목을 입력해주세요.");
			f.q_title.focus();
			return false;
		}
		if (f.u_id.value == "") {
			alert("작성자를 입력해주세요.");
			f.writer.focus();
			return false;
		}
		if (f.q_content.value == "") {
			alert("내용을 입력해주세요.");
			f.q_content.focus();
			return false;
		}
		f.action = "qna_reply_create_action.jsp";
		f.method='POST';
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

									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 문의 게시판</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno"  value="<%=pageno%>" />
		        				<input type="hidden" name="q_no" value="<%=qna.getQ_no()%>"/>

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">답글 제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="[RE]<%=qna.getQ_title()%>"  type="text" style="width: 150"
											name="q_title">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="<%=qna.getU_id()%>" type="text" style="width: 150"
											name="u_id">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">답글 내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<textarea name="q_content" class="textarea" style="width: 350px" rows="14">>><%=qna.getQ_content().replace("\n",">>").trim()%></textarea>
										</td>
									</tr>


								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="답글쓰기"
										onClick="QnaReplayCreate()"> &nbsp; <input
										type="button" value="리스트" onClick="qnaList()"></td>
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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>