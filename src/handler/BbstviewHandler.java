package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb2.StbpBean;
import bb2.StbpDBBean;


public class BbstviewHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/bbstview.jsp";
	
	
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
		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String g = request.getParameter("g");
		String r = request.getParameter("r");
		String n = request.getParameter("n");
		
		StbpBean st = new StbpBean();
		StbpDBBean bd = StbpDBBean.getInstance();
		try {
			 st = bd.getStbp(bno,g,r,n);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("st",st);
		System.out.println(st);
		request.setAttribute("bno",bno);
		request.setAttribute("g",g);
		request.setAttribute("r",r);
		request.setAttribute("n", n);
		
		

		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		return null;
		
	}


}
