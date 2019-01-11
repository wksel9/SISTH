package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bb2.BoardDBBean;
import bb2.BoardDataBean;


public class DeleteHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/deleteForm.jsp";
	
	
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
	       
	       BoardDBBean dbPro = BoardDBBean.getInstance();
	       BoardDataBean article = new BoardDataBean();
	       try {
	          article = dbPro.getUpdate(num);
	       }catch(Exception e) {
	          e.printStackTrace();
	       }
	       
	       request.setAttribute("article", article);
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse res){
		HttpSession session = request.getSession();
		
		BoardDataBean article = new BoardDataBean();
        article.setNum(Integer.parseInt(request.getParameter("num")));
        article.setId((String)session.getAttribute("id"));
       article.setSubject(request.getParameter("subject"));
       article.setContent(request.getParameter("content"));
       article.setPasswd(request.getParameter("passwd"));
     
     BoardDBBean dbPro = BoardDBBean.getInstance();
     
     int num = Integer.parseInt(request.getParameter("num"));
     String passwd = request.getParameter("passwd");
     
     int x = 0;
     try {
        x = dbPro.deleteArticle(num,passwd);
    } catch (Exception e) {
       // TODO Auto-generated catch block
       e.printStackTrace();
    }
     request.setAttribute("x", x);
     
		return "/WEB-INF/view/deletePro.jsp";
		
	}


}
