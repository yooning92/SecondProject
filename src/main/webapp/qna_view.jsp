<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@page import="com.itwill.shop.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sUserId= (String)session.getAttribute("sUserId");
Integer q_no=null;
int pageno=1;
try{
	q_no=Integer.parseInt(request.getParameter("q_no"));
	pageno=Integer.parseInt(request.getParameter("pageno"));
}catch(Exception e){
	
}
if(q_no==null){
	response.sendRedirect("qna_list.jsp?pageno="+pageno);
	return;
}
Qna qna=QnaService.getInstance().findQna(q_no);
if(qna==null){
	response.sendRedirect("qna_list.jsp?pageno="+pageno);
	return;
}
QnaService.getInstance().updateHitCount(q_no);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function qnaUpdate(){
		f.action = "qna_modify_form.jsp";
		f.submit();
	}
	function qnaList(){
		f.action = "qna_list.jsp"
		f.submit();
	}
	function qnaDelete(){
		if(confirm("정말 삭제 하시겠습니까?")){
		f.action="qna_remove_action.jsp"
		}
		f.submit();
	}
	function reply(){
		f.action="qna_reply_create_form.jsp"
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 내일의집 - 문의 게시판</b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->

							<form name="f" method="post">
								<input type="hidden" name="q_no" value="<%=qna.getQ_no() %>">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의 제목</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=qna.getQ_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=qna.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성일</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=qna.getQ_date()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">문의 내용</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=qna.getQ_content()%></td>
									</tr>
								</table>
							</form>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								
								<%if(sUserId==null||!sUserId.equals("admin") && !sUserId.equals(qna.getU_id())){ %>
								<tr>
									<td align=center>
									<input type="hidden" value="수정" onClick="qnaUpdate()">&nbsp; 
									<input type="hidden" value="삭제" onClick="qnaDelete()">&nbsp; 
									<input type="button" value="리스트" onClick="qnaList()"></td>
								</tr>
								<%} else if(sUserId.equals("admin")){%>
								<td align=center>
								<input type="button" value="수정" onClick="qnaUpdate()">&nbsp; 
								<input type="button" value="삭제" onClick="qnaDelete()">&nbsp; 
								<input type="button" value="답글" onClick="reply()">&nbsp;
								<input type="button" value="리스트" onClick="qnaList()"></td>
								</tr>
								<%}else{%>
								<td align=center>
								<input type="button" value="수정" onClick="qnaUpdate()">&nbsp; 
								<input type="button" value="삭제" onClick="qnaDelete()">&nbsp; 
								<input type="button" value="리스트" onClick="qnaList()"></td>
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