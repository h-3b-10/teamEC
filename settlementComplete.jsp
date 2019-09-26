<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/table.css">
<!-- 3秒後、ホーム画面に自動遷移 -->
<meta http-equiv="refresh" content="3;URL='HomeAction'" />
<title>決済完了画面</title>
</head>
<body>
	<jsp:include page="header2.jsp" />
	<div id="contents">
		<h1>決済完了画面</h1>
		<div id="success">決済が完了しました。</div>
	</div>
</body>
</html>