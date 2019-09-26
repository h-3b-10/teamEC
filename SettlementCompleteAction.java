package com.internousdev.olive.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.olive.dao.CartInfoDAO;
import com.internousdev.olive.dao.PurchaseHistoryInfoDAO;
import com.internousdev.olive.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementCompleteAction extends ActionSupport implements SessionAware{
	private String id ;
	private Map<String, Object> session;

	public String execute(){
		if(!session.containsKey("tempUserId") && !session.containsKey("userId")){
			return "sessionTimeout";
		}
		int logined = Integer.parseInt(session.get("logined").toString());
		if(logined != 1) {
			return "sessionTimeout";
		}

		String result = ERROR;

		String userId = session.get("userId").toString();


		@SuppressWarnings("unchecked")
		List<CartInfoDTO> cartInfoDTOList = (List<CartInfoDTO>) session.get("cartInfoDTOList");

		PurchaseHistoryInfoDAO purchaseHistoryInfoDAO = new PurchaseHistoryInfoDAO();
		int count = 0;

		//カート情報を購入履歴情報テーブルに登録する
		for (CartInfoDTO dto : cartInfoDTOList) {
			count += purchaseHistoryInfoDAO.regist(userId, dto.getProductId(), dto.getProductCount(), Integer.parseInt(id), dto.getPrice());
		}

		//カート情報を削除する
		if(count > 0) {
			CartInfoDAO cartInfoDAO = new CartInfoDAO();
			count = cartInfoDAO.allDelete(session.get("userId").toString());
			if(count > 0) {
				result = SUCCESS;
			}
		}
		return result;
	}

	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public Map<String, Object> getsession(){
		return session;
	}
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}
