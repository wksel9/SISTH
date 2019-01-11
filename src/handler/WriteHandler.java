package handler;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bb2.BoardDBBean;
import bb2.BoardDataBean;


public class WriteHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/writeForm.jsp";
	
	
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
		

		int num=0, ref=1, re_step=0, re_level=0;
		String pageNum = "";
		if(request.getParameter("num")!=null){
			num=Integer.parseInt(request.getParameter("num"));
			ref=Integer.parseInt(request.getParameter("ref"));
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
		}
		
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);	
		

		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse res){
		HttpSession session = request.getSession();	
		String encType = "EUC-KR";
		int maxSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext();
		String  realFolder = context.getRealPath("fileSave");
		MultipartRequest multi = null;
		
			try {
				
				multi = new MultipartRequest(request, realFolder, maxSize, encType,
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				
				String filename ="";
				int filesize = 0;
				File file = null;
				
				if(files.hasMoreElements()){
					String name = (String) files.nextElement();
					filename = multi.getFilesystemName(name);
					 file = multi.getFile(name);
				}
				BoardDataBean article = new BoardDataBean();
				
				article.setNum(Integer.parseInt(multi.getParameter("num")));
				article.setRef(Integer.parseInt(multi.getParameter("ref")));
				article.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
				article.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
				article.setSubject(multi.getParameter("subject"));
				article.setPasswd(multi.getParameter("passwd"));
				article.setContent(multi.getParameter("content"));
				article.setId((String)session.getAttribute("id"));
				article.setBoardid("1");
				article.setIp(request.getRemoteAddr());
				article.setFilename(filename);
				if(file != null){
					filesize = (int)file.length();
				}
				article.setFilesize(filesize);
				
				BoardDBBean dbPro = BoardDBBean.getInstance();
				
				dbPro.insertArticle(article, "1");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return "/WEB-INF/view/writePro.jsp";
		
	}


}
