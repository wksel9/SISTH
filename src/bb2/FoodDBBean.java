package bb2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDBBean {
	private static FoodDBBean instance = new FoodDBBean();
	
	public static FoodDBBean getInstance(){
		return instance;
	}
	
	private FoodDBBean(){}
	
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
	
	public FoodBean  getFoodbp(int bno) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FoodBean fd = null;
		System.out.println(bno);
		try{
			
			
			 pstmt=conn.prepareStatement("select * from food where bno=?");
			 
			 pstmt.setInt(1, bno);
			 rs=pstmt.executeQuery();
			 
			 if(rs.next()){
				 fd = new FoodBean();
					fd.setNum(rs.getInt("num"));
					fd.setBno(rs.getInt("bno"));
					fd.setStname(rs.getString("stname"));
					fd.setFname(rs.getString("fname"));
					fd.setFaddr(rs.getString("faddr"));
					fd.setFmg1(rs.getString("fmg1"));
					fd.setFmg2(rs.getString("fmg2"));
					fd.setFmg3(rs.getString("fmg3"));
					fd.setFmg4(rs.getString("fmg4"));
					fd.setFood1(rs.getString("food1"));
					fd.setFood2(rs.getString("food2"));
					fd.setFood3(rs.getString("food3"));
					fd.setPrice1(rs.getString("price1"));
					fd.setPrice2(rs.getString("price2"));
					fd.setPrice3(rs.getString("price3"));
			 }
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return fd;
	}
	
	

	public List getFoodList(int start, int end, int bno) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		List foodList = null;
		try{
			query = "select * from "
					+"(select rownum rnum, a.* "
					+"from (select num, bno, stname,fname,faddr,"
					+"fmg1, fmg2,fmg3,fmg4, food1, food2,food3, price1,price2,price3 "
					+" from food where bno = ? ) a)"
					+" where rnum between ? and ? ";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				foodList = new ArrayList();
				do{
					FoodBean fd = new FoodBean();
					fd.setNum(rs.getInt("num"));
					fd.setBno(rs.getInt("bno"));
					fd.setStname(rs.getString("stname"));
					fd.setFname(rs.getString("fname"));
					fd.setFaddr(rs.getString("faddr"));
					fd.setFmg1(rs.getString("fmg1"));
					fd.setFmg2(rs.getString("fmg2"));
					fd.setFmg3(rs.getString("fmg3"));
					fd.setFmg4(rs.getString("fmg4"));
					fd.setFood1(rs.getString("food1"));
					fd.setFood2(rs.getString("food2"));
					fd.setFood3(rs.getString("food3"));
					fd.setPrice1(rs.getString("price1"));
					fd.setPrice2(rs.getString("price2"));
					fd.setPrice3(rs.getString("price3"));
					
					
					foodList.add(fd);
					
				}while(rs.next());
			}
			
			
		}catch(Exception ex){ex.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return foodList;
	}
	
	public int getFoodCount(int bno) throws Exception{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try{
			pstmt =conn.prepareStatement("select nvl(count(*),0) from food where bno = ?");
			pstmt.setInt(1, bno);
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
	
	
}
