<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<header>
	<div id="header-title">Olive</div>
	<div id="header-menu">
		<ul>
			<!-- 未ログイン、ログアウト状態どちらでも表示 商品検索項目 -->
			<s:form action="SearchItemAction">
				<s:if
					test="#session.mCategoryDTOList != null && #session.mCategoryDTOList.size() > 0">

					<!-- DBのカテゴリマスタテーブルの選択肢はカテゴリ名、値はカテゴリIDとする 商品検索-カテゴリ項目 -->

					<li><s:select name="categoryId"
							list="#session.mCategoryDTOList" listValue="categoryName"
							listKey="categoryId" class="cs-div" id="categoryId" /></li>
				</s:if>
				<li><s:textfield name="keywords" class="keywords"
						placeholder="検索ワード" /></li>

				<!-- 商品検索ボタンが押下された場合、検索処理を行う（未ログイン、ログアウトどちらの状態でも表示）-->

				<li><s:submit class="button" value="商品検索" /></li>
			</s:form>
			<s:if test="#session.logined == 1">

				<!-- ログアウトボタンが押下された（1の）場合、ログアウト処理を行う（ログイン状態で表示）-->

				<li><s:form action="LogoutAction">
						<div class="header_button">
							<s:submit class="button" value="ログアウト" />
						</div>
					</s:form></li>
			</s:if>
			<s:else>

				<!--  ログインボタンが押下された（0の）場合、ログイン画面に遷移する（未ログイン状態で表示）-->

				<li><s:form action="GoLoginAction">
						<div class="header_button">
							<s:submit class="button" value="ログイン" />
						</div>
					</s:form></li>
			</s:else>

			<!-- カートボタンが押下された場合、カート画面に遷移する（未ログイン、ログアウトどちらの状態でも表示）-->

			<li><s:form action="CartAction">
					<div class="header_button">
						<s:submit class="button" value="カート" />
					</div>
				</s:form></li>

			<!-- 商品一覧ボタンが押下された場合、商品一覧画面に遷移する（未ログイン、ログアウトどちらの状態でも表示）-->

			<li><s:form action="ProductListAction">
					<div class="header_button">
						<s:submit class="button" value="商品一覧" />
					</div>
				</s:form></li>
			<s:if test="#session.logined == 1">

				<!-- マイページボタンが押下された（1の）場合、マイページ画面に遷移する（ログイン状態で表示）-->

				<li><s:form action="MyPageAction">
						<div class="header_button">
							<s:submit class="button" value="マイページ" />
						</div>
					</s:form></li>
			</s:if>
		</ul>
	</div>
</header>