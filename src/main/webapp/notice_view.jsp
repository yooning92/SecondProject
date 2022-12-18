<%@page import="com.itwill.shop.dto.Notice"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String sUserId= (String)session.getAttribute("sUserId");
NoticeService noticeService =new NoticeService();
Notice noticeDetail =new Notice();

/* 공지사항번호로 1개 출력 */
String noStr = request.getParameter("n_no");
if(noStr==null || noStr.equals("")){
	response.sendRedirect("notice_list.jsp");
	return;
}

noticeDetail = noticeService.selectByNoNotice(Integer.parseInt(noStr));

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
	function noticeUpdate(){
		f.action = "notice_modify_form.jsp";
		f.submit();
	}
	function noticeList(){
		f.action = "notice_list.jsp"
		f.submit();
	}
	function noticeDelete(){
		if(confirm("정말 삭제 하시겠습니까?")){
		f.action="notice_delete_action.jsp"
		}
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>내일의집 - 공지 게시판 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->

							<form name="f" method="post">
								<input type="hidden" name="n_no" value="<%=noticeDetail.getN_no() %>">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지 일자</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_date()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지 제목</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">공지 내용</td>
										<td width=490 bgcolor="ffffff" align="left" style="padding-left: 10"><%=noticeDetail.getN_content()%></td>
										
									</tr>
								</table>
							</form>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<%if(sUserId==null){ %>
								<tr>
									<td align=center>
									<input type="hidden" value="수정" onClick="noticeUpdate()">&nbsp; 
									<input type="hidden" value="삭제" onClick="noticeDelete()">&nbsp; 
									<input type="button" value="리스트" onClick="noticeList()"></td>
								</tr>
								<%}else if(sUserId.equals("admin")){ %>
								<tr>
									<td align=center>
									<input type="button" value="수정" onClick="noticeUpdate()">&nbsp; 
									<input type="button" value="삭제" onClick="noticeDelete()">&nbsp; 
									<input type="button" value="리스트" onClick="noticeList()"></td>
								</tr>
								<% }else{ %>
								<tr>
									<td align=center>
									<input type="hidden" value="수정" onClick="noticeUpdate()">&nbsp; 
									<input type="hidden" value="삭제" onClick="noticeDelete()">&nbsp; 
									<input type="button" value="리스트" onClick="noticeList()"></td>
								</tr>
								<% } %>
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