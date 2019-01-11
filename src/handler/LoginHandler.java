package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bb2.MemberBean;
import bb2.MemberDBBean;


public class LoginHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/index.jsp";
	
	
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
	
	private String processForm(HttpServletRequest req, HttpServletResponse res){
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse res){
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		

		
		
		int x = 0;
		MemberDBBean dblogin = MemberDBBean.getInstance();
		try {
			 x = dblogin.loginArticle(id, passwd);
			 session.setAttribute("id", id);
			System.out.println(x);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("x", x);
		
		return "/WEB-INF/view/loginPro.jsp";
		
	}


}
