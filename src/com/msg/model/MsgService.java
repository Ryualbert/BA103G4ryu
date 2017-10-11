package com.msg.model;

import java.util.Set;

public class MsgService {
	private MsgDAO_interface dao;

	public MsgService() {
		dao = new MsgDAO();
	}
	
	public Set<String> getAllPairByMem(String mem_ac){
		return dao.getAllPairByMem(mem_ac);
	}
	
	public Set<MsgVO> getAllByPair (String mem_ac1, String mem_ac2){
		return dao.getAllByPair(mem_ac1,mem_ac2);
	}
}
