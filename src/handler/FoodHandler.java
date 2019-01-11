package handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bb2.FoodBean;
import bb2.FoodDBBean;


public class FoodHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/Food.jsp";
	
	
	public String process(HttpServletRequest req, HttpServletResponse res){
		if(req.getMethod().equalsIgnoreCase("GET")){
			return processForm(req, res);
		}else if(req.getMethod().equalsIgnoreCase("POST")){
			return processSubmit(req,res);
		}else{
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse res){
		HttpSession session = request.getSession();
		  int bno = Integer.parseInt(request.getParameter("bno"));
		  String pageNum = request.getParameter("pageNum");
		  if(pageNum != null){
		  session.setAttribute(bno+"pageNum", pageNum);
		  pageNum =(String) session.getAttribute(bno+"pageNum");
		  }
		  if(pageNum == null){
			  pageNum = "1";
		  }
		  
		  int currentPage = Integer.parseInt(pageNum);
			int pageSize = 6;
			int start = (currentPage-1)*pageSize +1;
			int end = currentPage * pageSize;
		  FoodDBBean fdb = FoodDBBean.getInstance();
		 int count = 0;
		 int number=0;
		 
		  List foodList = null; 
		 
		 try {
			  count = fdb.getFoodCount(bno);
			  number = count -((currentPage-1)* pageSize);
				number++;
			 if(count>0){
				 foodList = fdb.getFoodList(start, end, bno);
			 }
			FoodBean f = fdb.getFoodbp(bno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

			request.setAttribute("count", count);
			request.setAttribute("foodList", foodList);
			request.setAttribute("number", number);
			request.setAttribute("currentPage", currentPage);
			
		
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		return FORM_VIEW;
		
	}


}
