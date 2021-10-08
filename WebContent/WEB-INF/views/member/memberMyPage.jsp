<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#insertForm input[type=text], #insertForm input[type=password], #insertForm input[type=email]{
		width:200px;
		margin:5px;
	}
	#insertForm tr>td:nth-child(1){text-align:right;}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="outer">
		<br>
		<h1 align="center">마이 페이지</h1>
		<br>
		
		<form id="updateForm" action="updateForm.me" method="post">
			
			<div class="btns" align="center">
				<button >수정하기</button>
			</div>
		</form>
		<br><br>
		<form id="deleteForm" action="delete.me" method="post">
			
			<div class="btns" align="center">
				<button >탈퇴하기</button>
			</div>
		</form>
		<br><br>
	</div>
	

</body>
</html>