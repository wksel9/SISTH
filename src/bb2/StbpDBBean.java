package bb2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StbpDBBean {
	private static StbpDBBean instance = new StbpDBBean();
	
	public static StbpDBBean getInstance(){
		return instance;
	}
	
	private StbpDBBean(){}
	
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
	
	

	public StbpBean  getStbp(int bno, String g, String r, String n) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StbpBean st = null;
		System.out.println(bno);
		try{
			
			
			 pstmt=conn.prepareStatement("select * from st where bno=? and g=? and r=? and n=?");
			 
			 pstmt.setInt(1, bno);
			 pstmt.setString(2, g);
			 pstmt.setString(3, r);
			 pstmt.setString(4, n);
			 rs=pstmt.executeQuery();
			 
			 if(rs.next()){
				 st = new StbpBean();
				 st.setBno(rs.getInt("bno"));
				 st.setG(rs.getString("g"));
				 st.setR(rs.getString("r"));
				 st.setN(rs.getString("n"));
				 st.setInfo(rs.getString("info"));
				 st.setImg1(rs.getString("img1"));
				 st.setImg2(rs.getString("img2"));
				 st.setImg3(rs.getString("img3"));
				 st.setImg4(rs.getString("img4"));
			 }
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return st;
	}
}
