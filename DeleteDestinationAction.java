package com.internousdev.olive.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.olive.dao.DestinationInfoDAO;
import com.internousdev.olive.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteDestinationAction extends ActionSupport implements SessionAware{
	private String id;
	private List<DestinationInfoDTO> destinationInfoDTOList;
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
		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
		int count = destinationInfoDAO.deleteDestination(id);

		if(count > 0) {
			destinationInfoDTOList = destinationInfoDAO.getDestinationInfo(session.get("userId").toString());
			result=SUCCESS;
		}
		return result;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<DestinationInfoDTO> getDestinationInfoDTOList() {
		return destinationInfoDTOList;
	}
	public void setDestinationInfoDTOList(List<DestinationInfoDTO> destinationInfoDTOList) {
		this.destinationInfoDTOList = destinationInfoDTOList;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
