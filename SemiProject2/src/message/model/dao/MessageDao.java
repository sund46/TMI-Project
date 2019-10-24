package message.model.dao;


import static member.common.JDBCTemplete.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import member.model.vo.ClientRequest;


public class MessageDao {
		private Properties prop; 
	
		public MessageDao() {
			prop = new Properties();
			String filePath = MessageDao.class.getResource("/config/message-query.properties").getPath();
				try {
					prop.load(new FileReader(filePath));	
				}catch(Exception e) {
					e.printStackTrace();
				}
			
		}
	
	
	
	
	public int listCount(Connection con, String email) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}




	public ArrayList<ClientRequest> selectList(String email, Connection con, int currentPage, int limit) {
		ArrayList<ClientRequest> requestList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			
			// 2. 첫 행의 번호
			
			
			int startRow = (currentPage -1) * limit +1; // 현재 페이지가 1이라면  --> 1번글,  현재 페이지가 2라면--> 11번글
			int endRow = startRow + limit -1; // 10 , 20
		
			pstmt.setString(1, email);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			requestList = new ArrayList<ClientRequest>();
			
			while(rset.next()) {
				ClientRequest cr = new ClientRequest();
				cr.setRno(rset.getInt("RNO"));
				cr.setReplyTitle(rset.getString("replyTitle"));
				cr.setReplyContent(rset.getString("replyContent"));
				
				requestList.add(cr);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		

		
		return requestList;
	}

	
	
}
