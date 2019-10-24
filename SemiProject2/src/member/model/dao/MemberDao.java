package member.model.dao;

import static member.common.JDBCTemplete.close;



import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.exception.MemberException;
import member.model.vo.Member;

 
public class MemberDao {
	
		Properties prop = null;
		
		// 기본생성자
		public MemberDao() {
			prop = new Properties();
			  // 이 친구의 경로를 찾아서 filePath에 넣어준다.
			String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
			}
		}
	
	
	
	
	
		// 회원가입 메소드
		public int insertMember(Connection con, Member m) {
		
			int result = 0;
			PreparedStatement pstmt = null;
			String sql="";
		
			try {
				// SNS 회원가입이 아니라면?
				if(m.getIsSNS().equals("N")) {
					 sql = prop.getProperty("insertMember");
				}else { // SNS 회원가입이라면?
					 sql = prop.getProperty("insertMemberSNS");
				}
		
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getEmail());
				pstmt.setString(2, m.getUserPwd());
				pstmt.setString(3, m.getUserName());
				pstmt.setString(4, m.getNickName());
				pstmt.setString(5, m.getPhone());
				pstmt.setString(6, m.getMemberSSN());
				
				result = pstmt.executeUpdate();
			
					
 			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
					close(pstmt);
			 }
			
			return result;
		}
		
		// 로그인 DAO
		public Member selectMember(Connection con,Member m) throws Exception {
			
			
			Member result = null; // 결과를 담을 객체
			PreparedStatement pstmt = null; //SQL을 실행할 객체
			ResultSet rset = null; // Select의 결과를 담은 객체
			String sql = "";
			
			try {
				if(m.getIsSNS() == null) {
					sql = prop.getProperty("selectMember");
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m.getEmail());
					
					pstmt.setString(2, m.getUserPwd());
				}else {
					sql = prop.getProperty("selectMemberSNS");
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m.getEmail());
				}
				
				rset = pstmt.executeQuery();
				
				result = new Member();
				if(rset.next()) {
					
					// 위에서 선언한 Member 객체 인스턴스 생성!
					
				
					// 이미 존재하는 값 재활용하기
					result.setEmail(m.getEmail());
					result.setUserPwd(m.getUserPwd());
					
					
					// ResultSet으로부터 결과를 추출하는 방법
					// 1. 결과를 행의 순서대로 가져올 경우( 1, 2, 3 . . .) 
					// 2. 컬럼명으로 직접 선언하여 가져오는 경우
												// 3번째 컬럼 값을 가져온다
					result.setUserName(rset.getString("userName"));
											// 컬럼명으로 가져온다
					result.setNickName(rset.getString("nickName"));
					result.setPhone(rset.getString("phone"));
					result.setEnrollDate(rset.getDate("enrollDate"));
					result.setEmailVerification(rset.getString("emailYN"));
					result.setCash(rset.getInt("cash"));
					result.setIsSeller(rset.getString("isSeller"));
					result.setProfileImage(rset.getString("profileimage"));
					result.setIsValid(rset.getString("isValid"));
					result.setIsAlive(rset.getString("isAlive"));
					result.setIsAdmin(rset.getString("isAdmin"));
					result.setCoupon(rset.getString("coupon"));
					result.setMno(rset.getInt("mno"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			finally {
				close(rset);
				close(pstmt);
			}
			
			return result;
		}
	
		public int updateMember(Connection con,Member m) {
			
			int result = 0;
			PreparedStatement pstmt = null;
		
			
			try {
				
				
				String sql = prop.getProperty("updateMember");
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getUserPwd());
				pstmt.setString(2, m.getPhone());
				pstmt.setString(3, m.getEmail());
				result = pstmt.executeUpdate();
				
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
	
		}
		
		public int deleteMember(Connection con,String userEmail) {
			
			int result = 0;
			PreparedStatement pstmt = null;
		
			try {
			
			String sql = prop.getProperty("deleteMember");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			result = pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int verifyEmail(Connection con, String userEmail) {
			PreparedStatement pstmt = null;
			int result = 0;
			try {
				String sql = prop.getProperty("emailVerify");
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userEmail);
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
					close(pstmt);
			}
			
			return result;
			
		}

		public int emailDupCheck(Connection con, String email) throws MemberException {
			
			int isDup = 1;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try {
				String sql = prop.getProperty("emailDupCheck");
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rset = pstmt.executeQuery();
				
				
				if(rset.next()) {
					int count = rset.getInt("count(*)");
					if(count == 0) isDup = 0; 
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			System.out.println(isDup);
			return isDup;
		}
		
		public String searchId(Connection con, Member m) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String result = null;

			String sql = prop.getProperty("searchId");

			try {

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getUserName());
				pstmt.setString(2, m.getMemberSSN());
				System.out.println(sql);
				rset = pstmt.executeQuery();
				if (rset.next()) {
					result = rset.getString("email");
					System.out.println("result: " + result);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return result;
		}

		public String searchPwd(Connection con, Member m) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String result = null;

			String sql = prop.getProperty("searchPwd");

			try {

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getEmail());
				pstmt.setString(2, m.getUserName());
				pstmt.setString(3, m.getMemberSSN());
				
				rset = pstmt.executeQuery();
				System.out.println(rset);
				if (rset.next()) {
					result = rset.getString("email");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return result;
		}

		public int pwdUpdate(Connection con, Member m) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String sql = prop.getProperty("pwdUpdate");
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, m.getUserPwd());
				pstmt.setString(2, m.getEmail());
				
				result = pstmt.executeUpdate();
			

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
		
			return result;
		}





		public int nickNameDupCheck(Connection con, String nickName) {
			int isDup = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try {
				String sql = prop.getProperty("nickNameDupCheck");
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nickName);
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					int count = rset.getInt("count(*)");
					
					if(count != 0) isDup = 1; 
				}

				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return isDup;
		}





		public int getMcount(Member m, Connection con) {
			int mCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getMcount");
			
			try {
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getEmail());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					mCount = rset.getInt(1);
					
				}
				
				
				System.out.println("mCount : " + mCount);
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			
			
			return mCount;
		}


		public int getBuyCount(Member m, Connection con) {
			int buyCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getBuyCount");
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, m.getMno());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					buyCount = rset.getInt(1);
					
				}
				System.out.println("buyCount : " +buyCount);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			
			
			return buyCount;
		}


		public int getSellCount(Member m, Connection con) {
			int sellCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getSellCount");
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, m.getMno());
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					sellCount = rset.getInt(1);
					
				}
				
				System.out.println("sellCount : " + sellCount);
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			
			
			return sellCount;
		}
	
	
	
	
}