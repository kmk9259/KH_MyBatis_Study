<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#updateForm input[type=text], #updateForm input[type=password], #updateForm input[type=email]{
		width:200px;
		margin:5px;
	}
	#updateForm tr>td:nth-child(1){text-align:right;}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="outer">
		<br>
		<h1 align="center">회원 정보 수정</h1>
		<br>
		
		<form id="updateForm" action="update.me" method="post">
		<c:if test="${ !empty sessionScope.loginUser }">
			<table align="center">
				<tr>
					<td>* ID : </td>
					<td><input type="text" name="userId" required value=${ sessionScope.loginUser.userId }></td>
				</tr>
				<tr>
					<td>* PWD : </td>
					<td><input type="password" name="userPwd" required value=${ sessionScope.loginUser.userPwd }></td>
				</tr>
				<tr>
					<td>* NAME : </td>
					<td><input type="text" name="userName" required value=${ sessionScope.loginUser.userName }></td>
				</tr>
				<tr>
					<td>EMAIL : </td>
					<td><input type="email" name="email" value=${ sessionScope.loginUser.email }></td>
				</tr>
				<tr>
					<td>BIRTHDAY : </td>
					<td><input type="text" name="birthday" placeholder="생년월일(6자리)" value=${ sessionScope.loginUser.birthday }></td>
				</tr>
				<tr>
					<td>GENDER : </td>
					<td>
					<c:if test="${sessionScope.loginUser.gender eq 'M' || sessionScope.loginUser.gender eq'F'}">
						<c:set var="checked" value="checked" />
					</c:if>
						<input type="radio" name="gender" value="M" ${ checked }> 남 
						<input type="radio" name="gender" value="F" ${ checked }> 여 
					</td>
				</tr>
				<tr>
					<td>PHONE : </td>
					<td><input type="text" name="phone" placeholder="(-포함)" value=${ sessionScope.loginUser.phone }></td>
				</tr>
				<tr>
					<td>ADDRESS : </td>
					<td><input type="text" name="address" value=${ sessionScope.loginUser.address }></td>
				</tr>
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<button onclick="history.back()">이전으로</button>
				<button type="submit">수정하기</button>
			</div>
		</c:if>
		</form>
		<br><br>
	</div>
	

</body>
</html>