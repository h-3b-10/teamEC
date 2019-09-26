package com.internousdev.olive.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.olive.dao.CartInfoDAO;
import com.internousdev.olive.dao.DestinationInfoDAO;
import com.internousdev.olive.dto.CartInfoDTO;
import com.internousdev.olive.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class SettlementConfirmAction extends ActionSupport implements SessionAware{

	private List<DestinationInfoDTO> destinationInfoDTOList;
	private Map<String, Object> session;
	public String execute(){
		String result = "login";
		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		List<CartInfoDTO> cartInfoDTOList = new ArrayList<CartInfoDTO>();
		String userId = null;

		int logined = Integer.parseInt(session.get("logined").toString());

		//ログイン済みの場合
		if(logined == 1) {
			// ログインしている場合、ユーザーIDを取得
			userId = session.get("userId").toString();

			// ユーザーに紐づくカート情報を取得
			cartInfoDTOList = cartInfoDAO.getCartInfoDTOList(userId);
			session.put("cartInfoDTOList", cartInfoDTOList);

			// ユーザーに紐づく情報
			DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfo(session.get("userId").toString());

			result = SUCCESS;
		}
		//未ログインの場合
		else{
			session.put("cartFlag","1");
		}
		return result;
	}
	public List<DestinationInfoDTO> getDestinationInfoDTOList(){
		return destinationInfoDTOList;
	}
	public void setDestinationInfoDTOList(List<DestinationInfoDTO> destinationInfoDTOList){
		this.destinationInfoDTOList = destinationInfoDTOList;
	}
	public Map<String, Object> getsession(){
		return session;
	}
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
}