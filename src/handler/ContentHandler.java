package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb2.BoardDBBean;
import bb2.BoardDataBean;


public class ContentHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/content.jsp";
	
	
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

		int num = Integer.parseInt(request.getParameter("num"));
		String no = request.getParameter("no");

		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = new BoardDataBean();
		try {
			article = dbPro.getArticle(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("article", article);
		request.setAttribute("no", no);
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		return null;
		
	}


}
