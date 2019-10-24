package admin.serviceManage.model.dao;

import static member.common.JDBCTemplete.close;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import sellerboard.model.vo.SellerBoard;


public class ServiceManageDao {
		Properties prop = null;
		
	public ServiceManageDao() {
		prop = new Properties();
		String filePath = ServiceManageDao.class.getResource("/config/admin-query.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
			}
	}
	
	
	
	public ArrayList<SellerBoard> selectServiceList(Connection con) {
			
		ArrayList<SellerBoard> sList = new ArrayList<SellerBoard>();
		SellerBoard sb = null;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectServiceList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				sb = new SellerBoard();
				sb.setBno(rset.getInt("bno"));
				sb.setBtitle(rset.getString("Btitle"));
				sb.setBdate(rset.getDate("BDATE"));
				sb.setBcontent(rset.getString("NickName"));
				
				sList.add(sb);
			}
		
			
			
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return sList;
	}



	public void refuseService(int bno, Connection con) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("refuseService");		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
	}



	public ArrayList<SellerBoard> selectDocList(String email,Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDocList");
		SellerBoard sb = null;
		ArrayList<SellerBoard> docList = new ArrayList<SellerBoard>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				sb = new SellerBoard();

				sb.setBno(rset.getInt("bno"));
				sb.setBtitle(rset.getString("BTITLE"));
				sb.setCategory1_name(rset.getString("Category1_name"));
				sb.setCategory2_name(rset.getString("Category2_name"));
				sb.setBdate(rset.getDate("BDATE"));
			
				docList.add(sb);
				
			}

			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		
	
		return docList;
	}



	public void approveService(int bno, Connection con) {
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("approveService");
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
				
	}
		
}

	

