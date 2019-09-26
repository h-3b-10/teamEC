<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/form.css">
<link rel="stylesheet" href="./css/error.css">
<link rel="stylesheet" href="./css/table.css">
<title>決済確認画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<script src="./js/settlementConfirm.js"></script>
	<div id="contents">
		<h1>決済確認画面</h1>
		<s:if
			test="destinationInfoDTOList!=null && destinationInfoDTOList.size()>0">

			<div class="info">宛先情報を選択してください。</div>
			<s:form id="settlementConfirmForm">
				<table class="horizontal-list">
					<thead>
						<tr>
							<th><s:label value="#" /></th>
							<th><s:label value="姓" /></th>
							<th><s:label value="名" /></th>
							<th><s:label value="ふりがな" /></th>
							<th><s:label value="住所" /></th>
							<th><s:label value="電話番号" /></th>
							<th><s:label value="メールアドレス" /></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="destinationInfoDTOList" status="st">
							<tr>
								<td><s:if test="#st.index == 0">
										<input type="radio" name="id" checked="checked"
											value="<s:property value='id'/>" />
									</s:if> <s:else>
										<input type="radio" name="id" value="<s:property value='id'/>" />
									</s:else></td>
								<td><s:property value="familyName" /></td>
								<td><s:property value="firstName" /></td>
								<td><s:property value="familyNameKana" /><span> </span> <s:property
										value="firstNameKana" /></td>
								<td><s:property value="userAddress" /></td>
								<td><s:property value="telNumber" /></td>
								<td><s:property value="email" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="submit_button">
					<s:submit class="button" value="決済"
						onClick="goSettlementCompleteAction()" />
				</div>
				<div class="submit_button">
					<s:submit class="button" value="削除"
						onClick="goDeleteDestinationAction()" />
				</div>
			</s:form>
		</s:if>

		<!-- 宛先情報が１件も存在しない場合 -->
		<s:else>
			<div class="info">宛先情報がありません。</div>
		</s:else>

		<!-- 新規宛先登録ボタンが押下された場合、宛先情報入力画面に遷移 -->
		<s:form action="CreateDestinationAction">
			<div class="submit_button">
				<s:submit class="button" value="新規宛先登録" />
			</div>
		</s:form>
	</div>
</body>
</html>