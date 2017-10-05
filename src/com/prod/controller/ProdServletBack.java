package com.prod.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prod.model.ProdService;
import com.prod.model.ProdVO;

@WebServlet("/prod/prodBack.do")
public class ProdServletBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Timer timer = new Timer();
	
    @Override
    public void init(){
		timer.schedule(new TimerTask(){
			@Override
			public void run() {
				Date exeTime = new Date(scheduledExecutionTime());
				
				Set<String> countrys = setCountrys();
				ServletContext context = getServletContext();
		    	context.setAttribute("countrys", countrys);

				System.out.println(exeTime+" "+countrys);
			}		
		}, new Date(), 60*60*1000);		
		
		
		timer.schedule(new TimerTask(){
			@Override
			public void run() {
				
				
			}
			
		}, new Date(), 7*24*60*60*1000);
    }
    
    public static Set<String> setCountrys(){
    	Set<String> countrys = new TreeSet<>();
    	ProdService prodSvc = new ProdService();
    	List<ProdVO> prodVOs = prodSvc.getAllNoImg();
    	for(ProdVO prodVO : prodVOs){
    		countrys.add(prodVO.getBean_contry());
    	}
    	System.out.println(countrys);
    	return countrys;
    }
    
    @Override
    public void destroy(){
    	timer.cancel();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
