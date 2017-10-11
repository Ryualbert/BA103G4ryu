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
	
	public void addMsgVO (String mem_sen, String mem_rec, String msg_cont){
		MsgVO msgVO = new MsgVO();
		msgVO.setMem_sen(mem_sen);
		msgVO.setMem_rec(mem_rec);
		msgVO.setMsg_cont(msg_cont);
		msgVO.setMsg_stat("未讀");
		dao.insert(msgVO);
	}
}
