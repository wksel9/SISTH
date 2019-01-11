package handler;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import bb2.BpBean;
import bb2.BpDBBean;


public class BbstHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/bbst.jsp";
	
	
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

		BpDBBean bd = BpDBBean.getInstance();
		BpBean bb = new BpBean();

		String url ="http://yagujango.com/yagudjango/5";
		String line ="";
		
		try {
			bb = bd.getBp(bno);
			
			Document doc;
			doc = Jsoup.connect(url).get();
			Elements medial = doc.select(".stadium_price_tbody ");
			//60°³
			int index=0;
		for(Element src : medial){
				String templine = src.text();
				index++;
					
				line+=templine;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	  String str[] = line.split(" ");
	  
		request.setAttribute("str", str);
		request.setAttribute("bb",bb);
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res){
		return null;
		
	}


}
