package com.prod.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Emp2;


@WebServlet("/prod/prod.do")
public class ProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");


		if ("search".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String bean_contry = req.getParameter("bean_contry");
				String proc = req.getParameter("proc");
				String roast = req.getParameter("roast");
				String others = req.getParameter("others");
				if(roast=="0"){
					roast = "極淺焙"	;	
				} else if (roast=="1"){
					roast = "淺焙";
				}else if (roast=="2"){
					roast = "中焙";
				}else if (roast=="3"){
					roast = "中深焙";
				}else if (roast=="4"){
					roast = "城市烘焙";
				}else if (roast=="5"){
					roast = "深焙";
				}else if (roast=="6"){
					roast = "法式烘焙";
				}else if (roast=="7"){
					roast = "重焙";
				}

				
				/***************************2.開始查詢資料*****************************************/

				// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
				Map<String, String[]> map = new TreeMap<String, String[]>();
				map.put("bean_contry", new String[] {bean_contry});
				map.put("proc", new String[] { proc });
				map.put("roast", new String[] {roast });

//				map.put("action", new String[] { "searchProds" }); // 注意Map裡面會含有action的key

				Map<String, String[]> map2 = new TreeMap<String, String[]>();
				map2.put("prod_no", new String[] {others });
				map2.put("store_no", new String[] {others });
				map2.put("prod_name", new String[] {others });
				map2.put("bean_type", new String[] {others });
				map2.put("bean_grade", new String[] {others });
				map2.put("bean_region", new String[] {others });
				map2.put("bean_farm", new String[] {others });
				map2.put("bean_farmer", new String[] {others });
				map2.put("bean_aroma", new String[] {others });
				map2.put("prod_stat", new String[] {others });
				

				String finalSQL = "select * from prod "
						          + jdbcUtil_CompositeQuery_Emp2.get_WhereCondition(map)
						          + "and ("
						          + jdbcUtil_CompositeQuery_Emp2.get_ElseCondition(map2)
						          + ")"
						          + "order by prod_no desc";
				System.out.println(finalSQL);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("reviewVO", reviewVO); // 資料庫取出的empVO物件,存入req
//				String url = "/review/listOneReview.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/review/select_page.jsp");
//				failureView.forward(req, res);
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
