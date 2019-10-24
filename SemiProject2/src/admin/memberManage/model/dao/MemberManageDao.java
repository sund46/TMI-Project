package admin.memberManage.model.dao;

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
import static member.common.JDBCTemplete.*;

import member.model.vo.ClientRequest;
import member.model.vo.Member;

public class MemberManageDao {
		
		Properties prop = null;
		
	public MemberManageDao() {

			prop = new Properties();
			String filePath = MemberManageDao.class.getResource("/config/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
			}
	}
	
	public ArrayList<Member> selectMember(Connection con){
		Member m = null;
		ArrayList<Member> mList = new ArrayList<Member>();
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				m = new Member();
				m.setEmail(rset.getString("email"));
				m.setUserName(rset.getString("nickName"));
				m.setEnrollDate(rset.getDate("enrolldate"));
				m.setIsValid(rset.getString("ISVALID"));
				m.setIsAlive(rset.getString("ISALIVE"));
				m.setIsAdmin(rset.getString("ISADMIN"));
				mList.add(m);
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return mList;
	}

	public void deleteMember(String email, Connection con) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");		
		
		try {
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
	}

	public void sendRequest(ClientRequest cr, Connection con) {
			
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("sendRequest");
			System.out.println(sql);
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cr.getEmail());
				pstmt.setString(2, cr.getNickName());
				pstmt.setString(3, cr.getrTitle());
				pstmt.setString(4, cr.getrContent());
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		
		
	}

	public ArrayList<ClientRequest> selectRequestList(Connection con) {
		ClientRequest cr = null;
		ArrayList<ClientRequest> crList = new ArrayList<ClientRequest>();
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectRequestList");
		
		try {
		
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				cr = new ClientRequest();
				cr.setRno(rset.getInt("rno"));
				cr.setEmail(rset.getString("email"));
				cr.setNickName(rset.getString("nickName"));
				cr.setrTitle(rset.getString("rTitle"));
				cr.setrContent(rset.getString("rContent"));
				cr.setrDate(rset.getDate("rDate"));
				cr.setReply(rset.getString("reply"));
				crList.add(cr);
			}
	
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return crList;
	}

	public void deleteRequest(int rno, Connection con) {
			
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRequest");		
		
		try {
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		
	}

	public void invalidateMember(Connection con, String email) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("invalidateMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
	}

	public void validateMember(Connection con, String email) {
		PreparedStatement pstmt = null;
	
		String sql = prop.getProperty("validateMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	}

	public void replyRequest(Connection con,ClientRequest cr) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("requestReply");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cr.getrTitle());
			pstmt.setString(2, cr.getrContent());
			pstmt.setInt(3,cr.getRno());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
	}

}
