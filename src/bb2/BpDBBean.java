package bb2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BpDBBean {
		private static BpDBBean instance = new BpDBBean();
		
		public static BpDBBean getInstance(){
			return instance;
		}
		
		private BpDBBean(){}
		
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

		public BpBean  getBp(int bno) throws Exception{
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BpBean bb = null;
			System.out.println(bno);
			try{
				
				
				 pstmt=conn.prepareStatement("select * from bp where bno=?");
				 
				 pstmt.setInt(1, bno);
				 rs=pstmt.executeQuery();
				 
				 if(rs.next()){
					 bb = new BpBean();
					 bb.setBno(rs.getInt("bno"));
					 bb.setBname(rs.getString("bname"));
					 bb.setBmap(rs.getString("bmap"));
					 bb.setStname(rs.getString("stname"));
					 bb.setImg1(rs.getString("img1"));
				 }
				
			}catch(Exception ex){ex.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(SQLException ex){}
				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
				if(conn != null)try{conn.close();}catch(SQLException ex){}
			}
			return bb;
		}
}
