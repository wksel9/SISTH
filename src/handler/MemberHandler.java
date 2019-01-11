package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb2.BpBean;
import bb2.MemberBean;
import bb2.MemberDBBean;


public class MemberHandler implements CommandHandler{
	
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
		

		MemberBean article = new MemberBean();
		article.setId(request.getParameter("id"));
		article.setPasswd(request.getParameter("passwd"));
		article.setName(request.getParameter("name"));
		article.setEmail(request.getParameter("email"));
		article.setPhone(request.getParameter("phone"));
		
		/*article.setId(id);*/
		MemberDBBean dbPro = MemberDBBean.getInstance();
		try {
			dbPro.insertArticle(article);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/WEB-INF/view/memberPro.jsp";
		
	}


}
