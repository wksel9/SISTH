package bb2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//½Ì±ÛÅæ
public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance(){
		return instance;
	}
	private BoardDBBean(){}
	
	private static Connection getConnection() throws Exception{
		Connection con = null;
		try{
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "scott";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	
	
	public void temp() throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
	}
	
	public void insertArticle(BoardDataBean article, String boardid) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number = 0;
		String sql = "";
		System.out.println(article);
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		
		
		try{
			pstmt = conn.prepareStatement("select boardSer.nextval from dual");
			rs = pstmt.executeQuery();
			if(rs.next())
				number = rs.getInt(1);
			
			//´ä±Û
			if(num != 0	){
				sql = "update board set re_step=re_step+1 where ref=? and re_step > ? and boardid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.setString(3, "1");
				pstmt.executeUpdate();
				
				re_step = re_step + 1;
				re_level = re_level + 1;
			}else{
				//»õ±Û
				ref = number;
				re_step = 0;
				re_level = 0;
			}
				
			
			sql = "insert into board(num, id,  subject, passwd, re_date, ref, re_step, re_level, content, ip, boardid ,filename ,filesize ) "
					+"values(?,?,?,?,sysdate,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8,article.getContent());
			pstmt.setString(9,article.getIp());
			pstmt.setString(10, "1");
			pstmt.setString(11,article.getFilename());
			pstmt.setInt(12, article.getFilesize());
			pstmt.executeUpdate();
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
	}
	
	
	public int getArticleCount(String boardid) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try{
			pstmt =conn.prepareStatement("select nvl(count(*),0) from board where boardid = ?");
			pstmt.setString(1, "1");
			rs = pstmt.executeQuery();
			
			if(rs.next()){x = rs.getInt(1);}
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return x;
	}
	
	
	public List getArticleList(int start, int end, String boardid) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List articleList = null;
		try{
			query = "select * from "
					+"(select rownum rnum, a.* "
					+"from (select num, id,  subject, passwd,"
					+"re_date, readcount, ref, re_step, re_level, content, ip "
					+" from board where boardid = ? order by ref desc,re_step) a)"
					+" where rnum between ? and ? ";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "1");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				articleList = new ArrayList();
				do{
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setId(rs.getString("id"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setRe_date(rs.getTimestamp("re_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
					
				}while(rs.next());
			}
			
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return articleList;
	}
	
	public BoardDataBean getArticle(int num) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try{
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setRe_date(rs.getTimestamp("re_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setFilename(rs.getString("filename"));
				article.setFilesize(rs.getInt("filesize"));
			}
			pstmt = conn.prepareStatement("update board set readcount = readcount + 1 where num =?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return article;
	}
	
	public BoardDataBean getUpdate(int num) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try{
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setRe_date(rs.getTimestamp("re_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
			
			
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return article;
	}
	
	public int updateArticle(BoardDataBean article) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		String sql = "";
		int x = -1;
		try{
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next())dbPasswd = rs.getString(1);
			
			if(dbPasswd.equals(article.getPasswd())){
			
				sql="update board set id=?,subject=?,passwd=?,content=? where num=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, article.getId());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setString(5, article.getContent());
			pstmt.setInt(6, article.getNum());
			pstmt.executeUpdate();
			x=1;
			}else{x=0;}
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	public int deleteArticle(int num, String passwd) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		String sql = "";
		int x = -1;
		try{
			pstmt = conn.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next())dbPasswd = rs.getString(1);
			if(dbPasswd.equals(passwd)){
			
				sql="delete from board where num=?";
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x=1;
			}else{x=0;}
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
}
