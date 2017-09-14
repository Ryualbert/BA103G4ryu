<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.review.model.*"%>
<%
ReviewVO reviewVO = (ReviewVO) request.getAttribute("reviewVO");
%>

<html>
<head>
<title>Review資料修改 - update_review_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>Review資料修改 - update_review_input.jsp</h3>
		</td>
		<td>
		   <a href="select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">回首頁</a>
	    </td>
	</tr>
</table>

<h3>資料修改:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="review.do" name="form1">
<table border="0" width='400'>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(reviewVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->


	<tr>
		<td>訂單編號:</td>
		<td><input type="TEXT" name="ord_no" size="11" 
			value="<%=reviewVO.getOrd_no()%>" /></td>
	</tr>
	<tr>
		<td>商品編號:</td>
		<td><input type="TEXT" name="prod_no" size="11"
			value="<%=reviewVO.getProd_no()%>" /></td>
	</tr>
	<tr>
		<td>商品評分:</td>
		<td><input type="number" name="prod_score" min="1" max="5"
			value="<%=reviewVO.getProd_score()%>" /></td>
	</tr>
	<tr>
		<td>沖泡方式:</td>
		<td><input type="TEXT" name="use_way" size="45"
			value="<%=reviewVO.getUse_way()%>" /></td>
	</tr>
		<tr>
		<td>心得敘述:</td>
		<td>
		<textarea style="width:200px;height:100px" name="rev_cont"><%=reviewVO.getRev_cont()%></textarea>
		</td>
	</tr>

	<tr>
		<%java.sql.Date date_SQL = new java.sql.Date(System.currentTimeMillis());%>
		<td>心得記錄時間:</td>
		<td bgcolor="#CCCCFF">
			<input type="date" name="rev_date" value="<%=reviewVO.getRev_date()%>" />
		</td>
	</tr>
	



</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="rev_no" value="<%=reviewVO.getRev_no()%>">
<input type="submit" value="送出修改"></FORM>
</body>

</html>
