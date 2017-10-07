package com.memlogin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;

/**
 * Servlet implementation class MemLoginServlet
 */
@WebServlet("/memlogin/memlogin.do")
public class MemLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		

		if ("login".equals(action)) { // 來自select_page.jsp的請求

			Map<String,String> errorMsgs = new HashMap<>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			HttpSession session = req.getSession();
			session.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String mem_ac = req.getParameter("mem_ac");
				String mem_pwd = req.getParameter("mem_pwd");
				
				MemService memSvc = new MemService();
				MemVO memVO_login = memSvc.findPwdByPK(mem_ac);

				System.out.println(memVO_login+"memVO");
				
				if(memVO_login==null){
					errorMsgs.put("login_err","無此帳號");
					
					try {   
				         String location = (String) session.getAttribute("location");
				         System.out.println(location+"無此帳號");
				         if (location != null) {
				           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				           res.sendRedirect(location);            
				           return;
				         }
				       }catch (Exception ignored) { }

				    res.sendRedirect(req.getContextPath()+"/FrontEnd/index/index.jsp");
				    return;
				}
				
				//fail
				if(!mem_pwd.equals(memVO_login.getMem_pwd())){
					errorMsgs.put("login_err","密碼錯誤");
	   					
					try {   
				         String location = (String) session.getAttribute("location");
				         System.out.println(location+"密碼");
				         if (location != null) {
				           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				           res.sendRedirect(location);            
				           return;
				         }
				       }catch (Exception ignored) { }

				    res.sendRedirect(req.getContextPath()+"/FrontEnd/index/index.jsp");
				    return;
				    
				//success
				} else {
					
					session.setAttribute("mem_ac",memVO_login.getMem_ac());
					
					try {     
//						 String location = req.getRequestURI();		 
				         String location = (String) session.getAttribute("location");
				         System.out.println(location+"success");
				         if (location != null) {
				           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				           res.sendRedirect(location);            
				           return;
				         }
				       }catch (Exception ignored) { }

				    res.sendRedirect(req.getContextPath()+"/FrontEnd/index/index.jsp");
				}
				
			} catch (Exception e) {
				errorMsgs.put("login_err",e.getMessage()+"xxx");	
					
				try {     
//				  	 String location = req.getRequestURI();
			         String location = (String) session.getAttribute("location");
			         System.out.println(location+"ex");
			         if (location != null) {
			           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
			           res.sendRedirect(location);            
			           return;
			         }
			       }catch (Exception ignored) { }

			    res.sendRedirect(req.getContextPath()+"/FrontEnd/index/index.jsp");
			}
			
		}
	
	}

}
