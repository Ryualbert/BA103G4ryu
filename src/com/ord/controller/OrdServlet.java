package com.ord.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart_list.model.Cart_listService;
import com.ord.model.OrdService;
import com.ord.model.OrdVO;
import com.ord_list.model.Ord_listVO;
import com.prod.model.ProdService;
import com.store.model.StoreService;


@WebServlet("/ord/ord.do")
public class OrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("toOrd".equals(action)) {
			Map<String,String> errorMsgs = new HashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				String mem_ac = req.getParameter("mem_ac");
				String store_no = req.getParameter("store_no");
				int count = Integer.parseInt(req.getParameter("count"));
				String[] prod_noAry = new String[count];
				String[] amountAry = new String[count];
				for(int i = 0 ; i < count; i++){
					prod_noAry[i]=req.getParameter("prod_no"+(i+1));
					amountAry[i]=req.getParameter("amount"+(i+1));
				}
				
				
				ProdService prodSvc = new ProdService();
				StoreService storeSvc = new StoreService();
				
				//cal total and find send_fee
				int total_pay=0;
				int send_fee=0;
				for(int i = 0; i< count; i++){
					total_pay +=(prodSvc.getOneProd(prod_noAry[i]).getProd_price())*(Integer.parseInt(amountAry[i]));
					send_fee = (send_fee>prodSvc.getOneProd(prod_noAry[i]).getSend_fee())? send_fee : prodSvc.getOneProd(prod_noAry[i]).getSend_fee();
				}
				send_fee = (total_pay>=storeSvc.getOneStore(store_no).getStore_free_ship())?0:send_fee;
				total_pay+=send_fee;
				
				//OrdVO
				OrdVO ordVO = new OrdVO();
				ordVO.setMem_ac(mem_ac);
				ordVO.setSend_fee(send_fee);
				ordVO.setTotal_pay(total_pay);
				
				//Set<Ord_listVO>
				Set<Ord_listVO> ord_listSet = new LinkedHashSet<Ord_listVO>();
				for(int i=0; i<count; i++){
					Ord_listVO ord_listVO = new Ord_listVO();
					ord_listVO.setProd_no(prod_noAry[i]);
					ord_listVO.setAmont(Integer.parseInt(amountAry[i]));
					ord_listSet.add(ord_listVO);
				}

				//Success
				req.setAttribute("ordVO", ordVO);
				req.setAttribute("ord_listVOs", ord_listSet);
				String url = "/FrontEnd/order/order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				
			} catch (Exception e){
				errorMsgs.put("err","買單失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/cart/cart.jsp");
				failureView.forward(req, res);

			}
			
		}
		
		
		if ("newOrd".equals(action)) {
			Map<String,String> errorMsgs = new HashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			OrdVO ordVO = new OrdVO();
			Set<Ord_listVO> ord_listSet = new LinkedHashSet<Ord_listVO>();
			try {

				String mem_ac = req.getParameter("mem_ac");
				String store_no = req.getParameter("store_no");
				String ord_name = req.getParameter("ord_name");			
				String ord_add = req.getParameter("ord_add");
				String ord_phone = req.getParameter("ord_phone");

				if (ord_name == null || (ord_name.trim()).length() == 0) {
					errorMsgs.put("errName","請輸入收件人姓名");
				}
				if (ord_add == null || (ord_add.trim()).length() == 0) {
					errorMsgs.put("errAdd","請輸入收件地址");
				}
				if (ord_phone == null || (ord_phone.trim()).length() == 0) {
					errorMsgs.put("errPhone","請輸入手機");
				}
				
				int count = Integer.parseInt(req.getParameter("count"));
				String[] prod_noAry = new String[count];
				String[] amountAry = new String[count];
				for(int i = 0 ; i < count; i++){
					prod_noAry[i]=req.getParameter("prod_no"+(i+1));
					amountAry[i]=req.getParameter("amount"+(i+1));
				}
				
				ProdService prodSvc = new ProdService();
				StoreService storeSvc = new StoreService();
				
				//cal total and find send_fee
				int total_pay=0;
				int send_fee=0;
				for(int i = 0; i< count; i++){
					total_pay +=(prodSvc.getOneProd(prod_noAry[i]).getProd_price())*(Integer.parseInt(amountAry[i]));
					send_fee = (send_fee>prodSvc.getOneProd(prod_noAry[i]).getSend_fee())? send_fee : prodSvc.getOneProd(prod_noAry[i]).getSend_fee();
				}
				send_fee = (total_pay>=storeSvc.getOneStore(store_no).getStore_free_ship())?0:send_fee;
				total_pay+=send_fee;
				
				//OrdVO
				ordVO.setMem_ac(mem_ac);
				ordVO.setSend_fee(send_fee);
				ordVO.setTotal_pay(total_pay);
				ordVO.setOrd_name(ord_name);
				ordVO.setOrd_add(ord_add);
				ordVO.setOrd_phone(ord_phone);
				
				
				//Set<Ord_listVO>
				for(int i=0; i<count; i++){
					Ord_listVO ord_listVO = new Ord_listVO();
					ord_listVO.setProd_no(prod_noAry[i]);
					ord_listVO.setAmont(Integer.parseInt(amountAry[i]));
					ord_listSet.add(ord_listVO);
				}
				
				if(errorMsgs.size()!=0){

					req.setAttribute("errorMsgs", errorMsgs);
					req.setAttribute("ordVO", ordVO);
					req.setAttribute("ord_listVOs", ord_listSet);
					String url = "/FrontEnd/order/order.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					failureView.forward(req, res);
					return;
				}
				
				//insert
				OrdService ordSvc = new OrdService();
				String ord_no = ordSvc.newAnOrder(ordVO, ord_listSet);
				
				//success
				//delCart
				Cart_listService cart_listSvc = new Cart_listService();
				for(int i =0; i<count;i++){
					cart_listSvc.deleteCart_list(prod_noAry[i], mem_ac);
				}

				//forward
				String url = "/FrontEnd/buyerorder/buyerorder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				
			} catch (Exception e){
				errorMsgs.put("err","新增訂單失敗:"+e.getMessage());
				req.setAttribute("ordVO", ordVO);
				req.setAttribute("ord_listVOs", ord_listSet);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/FrontEnd/order/order.jsp");
				failureView.forward(req, res);

			}
			
		}
		

		
		
		

		
		
	}

}
