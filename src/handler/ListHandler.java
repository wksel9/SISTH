package handler;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bb2.BoardDBBean;


public class ListHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/list.jsp";
	
	
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
		
		String boardid = "1";
		HttpSession session = request.getSession();
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
		session.setAttribute(boardid+"pageNum",pageNum); }
		pageNum = (String)session.getAttribute(boardid+"pageNum");
		if(pageNum == null){
			pageNum = "1"; 
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5;
		int start = (currentPage-1)*pageSize +1;
		int end = currentPage * pageSize;
		BoardDBBean dbPro = BoardDBBean.getInstance();
		
		int count = 0;
		List articleList = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int number=0;
		try{
			count = dbPro.getArticleCount(boardid);
			number = count -((currentPage-1)* pageSize);
		if(count > 0){
			articleList = dbPro.getArticleList(start, end, boardid);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		int bottomLine =5;
		int pageCount = count/pageSize+(count % pageSize == 0 ? 0 : 1);
		int startPage = 1+(currentPage -1)/bottomLine * bottomLine;
		int endPage = startPage + bottomLine -1;
		if(endPage > pageCount)endPage = pageCount;

		
		request.setAttribute("count", count);
		request.setAttribute("articleList", articleList);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);

	
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		return FORM_VIEW;
		
	}


}
