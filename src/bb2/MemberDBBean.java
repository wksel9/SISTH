package bb2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class MemberDBBean {
private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance(){
		return instance;
	}
	private MemberDBBean(){}
	
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
	
	public void insertArticle(MemberBean article) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt = conn.prepareStatement(
					"insert into bb values(?,?,?,?,?)");

			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getPasswd());
			pstmt.setString(3, article.getName());
			pstmt.setString(4, article.getEmail());
			pstmt.setString(5, article.getPhone());
			pstmt.executeUpdate();
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
	}
	
	public int loginArticle(String id, String passwd) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String dbPasswd = "";
		
		System.out.println(id);
		System.out.println(passwd);
		try{

			pstmt = conn.prepareStatement("select * from bb where id=?");
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				MemberBean article = new MemberBean();
				article.getId();
				article.getPasswd();
				article.getName();
				article.getEmail();
				article.getPhone();
			
			dbPasswd = rs.getString("passwd");
			 if(dbPasswd.equals(passwd)){
				x=1;
			 }else {
				x=0;
			 }
			}else{
				x=-1;
			}
		
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return x;
	}
}
