package charge.model.dao;

import static member.common.JDBCTemplete.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import charge.model.exception.CashRechargeException;
import charge.model.vo.Cash;
import member.model.vo.Member;

public class CashRechargeDao {

private Properties prop;
private Properties prop2;

private String rc="충전";
private String uc="사용";
	
//	public CashRechargeDao() {
//		prop = new Properties();
//		
//		String filePath
//		   = CashRechargeDao.class
//		   .getResource("/config/member-query.properties").getPath();
//		
//		try {
//		
//			prop.load(new FileReader(filePath));
//			
//		} catch (FileNotFoundException e) {
//
//			e.printStackTrace();
//			
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//			
//		}
//	}

	//캐시 내역에서 '충전'으로 보여줄 부분
public int insertRecharge(Connection con, Cash csh) throws CashRechargeException, FileNotFoundException, IOException{
	
	prop2 = new Properties();
	
	String filePath2
	   = CashRechargeDao.class
	   .getResource("/config/cashList-query.properties").getPath();
	
	prop2.load(new FileReader(filePath2));
	
	int result = 0;
	PreparedStatement pstmt = null;
	
	try {
		//String sql = "INSERT INTO CASH VALUES(SEQ_PAYNO.NEXTVAL,?,?,SYSDATE,?)";
		String sql = prop2.getProperty("insertChargeL");
		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, csh.getMno());
		pstmt.setInt(2, csh.getPayp());
		pstmt.setString(3, csh.getClassify());
		
		result=pstmt.executeUpdate();
		
		
		
	} catch(SQLException e) {
		throw new CashRechargeException("캐시내역 충전 에러");
	} finally {
		close(pstmt);
	}
	
	
	
	
	return result;
}

	
	
	
	
	
//member에서 현재 캐시 +로 들어가는 부분
	public int updateCash(Connection con, Member m) throws CashRechargeException, FileNotFoundException, IOException{
		
		prop = new Properties();
		
		String filePath
		   = CashRechargeDao.class
		   .getResource("/config/member-query.properties").getPath();
		
		prop.load(new FileReader(filePath));
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {

			String sql = prop.getProperty("updateCash");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, m.getCash());
			pstmt.setString(2, m.getEmail());

			result = pstmt.executeUpdate();

		} catch(SQLException e) {
			throw new CashRechargeException("캐시 충전 연결 에러");
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	
	
	// (DB내 캐시가 변경 성공했다면)화면 왼쪽에 변경된 내 캐시 불러오기
	public int selectCash(Connection con, Member m) throws FileNotFoundException, IOException, CashRechargeException {
				
		ResultSet rset = null;
		
		prop = new Properties();

		String filePath
		   = CashRechargeDao.class
		   .getResource("/config/member-query.properties").getPath();
		
		prop.load(new FileReader(filePath));
		
		// Member mCash = null;
		int recentCash = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("selectCash");

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getEmail());

			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				// mCash = new Member();
				
				// mCash.setCash(m.getCash()); //★여기가 바뀐 캐시값이 들어가야하는데 추가되는 값이 들어감,,
				// mCash.setEmail(m.getEmail());

				recentCash = rset.getInt(1);
				
				System.out.println("변경된 내 캐시 확인 : " + recentCash);
			}
			
			
			
		} catch(SQLException e) {
			throw new CashRechargeException("변경된 캐시 확인 에러");
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return recentCash;
	}
	
	
	
	

	//캐시 사용내역 조회 리스트(구매관리)
	public ArrayList<Cash> selectList(Connection con, int currentPage, int limit, Member m) throws CashRechargeException, FileNotFoundException, IOException{
		
		ArrayList<Cash> rechargeList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		prop2 = new Properties();
		
		String filePath2
		   = CashRechargeDao.class
		   .getResource("/config/cashList-query.properties").getPath();
		
		prop2.load(new FileReader(filePath2));
		
		String sql = prop2.getProperty("selectList");
		
		try {
			
			rechargeList = new ArrayList<Cash>();
			
			pstmt = con.prepareStatement(sql);	
			
			int startRow = (currentPage - 1) * limit + 1; //현재가 1페이지면 게시글1부터, 현재가 2페이지면 게시글 11부터~
			int endRow = startRow + limit -1; // startRow가 1일 때 endRow는 10, startRow가 11일 때 endRow는 20~
			
			pstmt.setInt(1, m.getMno());
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Cash cash = new Cash();
				
				cash.setPayno(rset.getInt("payno"));
				cash.setMno(rset.getInt("mno"));
				cash.setPayp(rset.getInt("payp"));
				cash.setPaydate(rset.getDate("paydate"));
				cash.setClassify(rset.getString("classify"));
				
				rechargeList.add(cash);
				System.out.println("dao" + cash);
			}
			
			
		} catch(SQLException e) {
			throw new CashRechargeException("캐시 사용내역 에러");
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rechargeList;
		
	}





	//필터! ('충전','사용','전체')
		public ArrayList<Cash> searchList(Connection con, Member m, String category) throws FileNotFoundException, IOException, CashRechargeException {
			
			ArrayList<Cash> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			prop2 = new Properties();
			
			String filePath2
			   = CashRechargeDao.class
			   .getResource("/config/cashList-query.properties").getPath();
			
			prop2.load(new FileReader(filePath2));
			
			
			String sql = null;
			
			switch(category) {
			case "recharging" :
				sql = prop2.getProperty("searchCashRec");
				break;
			case "sptcash" :
				sql = prop2.getProperty("searchCashspt");
				break;
			case "all" :
				sql = prop2.getProperty("searchx");
			}
			
			try {
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, m.getMno());
				
				if(sql.equals(prop2.getProperty("searchCashRec"))) {
					pstmt.setString(2, "충전");
				} else if(sql.equals(prop2.getProperty("searchCashspt"))) {
					pstmt.setString(3, "사용");
				}
				
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Cash>();
				
				while(rset.next()){
					
					Cash cs = new Cash();
					
					cs.setPayno(rset.getInt(1));
					cs.setMno(rset.getInt(2));
					cs.setPayp(rset.getInt(3));
					cs.setPaydate(rset.getDate(4));
					cs.setClassify(rset.getString(5));
					
					list.add(cs);
					
				}
				
			} catch (SQLException e) {
			
				throw new CashRechargeException("필터");
				
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}





	//캐시 내역에서 '사용'으로 DB에 들어갈 부분
	public int insertsptCash(Connection con, Cash csh) throws FileNotFoundException, IOException, CashRechargeException {
		
		prop2 = new Properties();
		
		System.out.println(csh.getMno());
		
		String filePath2
		   = CashRechargeDao.class
		   .getResource("/config/cashList-query.properties").getPath();
		
		prop2.load(new FileReader(filePath2));
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			//String sql = "INSERT INTO CASH VALUES(SEQ_PAYNO.NEXTVAL,?,?,SYSDATE,?)";
			String sql = prop2.getProperty("insertsptCashL");
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, csh.getMno());
			pstmt.setInt(2, csh.getPayp());
			pstmt.setString(3, csh.getClassify());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch(SQLException e) {
			throw new CashRechargeException("사용으로 들어가는 부분 에러");
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
		
		
		
	}

		//게시글 개수 카운트
		public int getListCount(Connection con, Member m) throws FileNotFoundException, IOException, CashRechargeException {
			// 총 게시글 수
					int listCount = 0;
						// 총 게시글 수를 쿼리로 만들어놓음(board-query.properties에)
					PreparedStatement pstmt = null;
					ResultSet rset = null;

					
					prop2 = new Properties();
					
					String filePath2
					   = CashRechargeDao.class
					   .getResource("/config/cashList-query.properties").getPath();
					
					prop2.load(new FileReader(filePath2));
					
					String sql = prop2.getProperty("listCount");
				
					try {
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, m.getMno());
						
						rset = pstmt.executeQuery();
						
						if(rset.next()) { //결과값이 나왔다면
							listCount = rset.getInt(1); //결과는 숫자형 딱 1개 나옴.(개수를 조회하는거니깐)
						}

					} catch (SQLException e) {
					
						throw new CashRechargeException("게시글 카운트 에러");
					
					} finally {
						close(rset);
						close(pstmt);
					}
					
					return listCount;
		}		



	//member에서 현재 캐시 +로 들어가는 부분
	public int updateSptCash(Connection con, Member m) throws FileNotFoundException, IOException, CashRechargeException {
		
		prop = new Properties();
		
		String filePath
		   = CashRechargeDao.class
		   .getResource("/config/member-query.properties").getPath();
		
		prop.load(new FileReader(filePath));
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {

			String sql = prop.getProperty("updateSptCash");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, m.getCash());
			pstmt.setString(2, m.getEmail());

			result = pstmt.executeUpdate();

		} catch(SQLException e) {
			throw new CashRechargeException("멤버 캐시 + 에러");
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}






	public int CashUpdate(Connection con, int mno, int tprice) throws FileNotFoundException, IOException, SQLException {
		
		prop = new Properties();
		
		String filePath
		   = CashRechargeDao.class
		   .getResource("/config/member-query.properties").getPath();
		
		prop.load(new FileReader(filePath));
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("updateSptCash");
		
		pstmt=con.prepareStatement(sql);
		
		pstmt.setInt(1, tprice);
		pstmt.setInt(2, mno);
		
		result = pstmt.executeUpdate();
		
		
		
		
		
		return result;
	}






	
	//사용내역 불러오기 -> 개수
		public int getsptOnlyListCount(Connection con, Member m) throws FileNotFoundException, IOException, CashRechargeException {
			// 총 게시글 수
			int listCount = 0;
				// 총 게시글 수를 쿼리로 만들어놓음(board-query.properties에)
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			
			prop2 = new Properties();
			
			String filePath2
			   = CashRechargeDao.class
			   .getResource("/config/cashList-query.properties").getPath();
			
			prop2.load(new FileReader(filePath2));
			
			String sql = prop2.getProperty("listSptCount");
		
			try {
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, m.getMno());
				pstmt.setString(2, uc);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) { //결과값이 나왔다면
					listCount = rset.getInt(1); //결과는 숫자형 딱 1개 나옴.(개수를 조회하는거니깐)
				}

			} catch (SQLException e) {
			
				throw new CashRechargeException("사용내역 불러오기 에러");
			
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return listCount;
		}





	//'사용'내역 불러오기
		public ArrayList<Cash> selectSptOnlyList(Connection con, int currentPage, int limit, Member m) throws FileNotFoundException, IOException, CashRechargeException {
			ArrayList<Cash> sptOnlyList = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			prop2 = new Properties();
			
			String filePath2
			   = CashRechargeDao.class
			   .getResource("/config/cashList-query.properties").getPath();
			
			prop2.load(new FileReader(filePath2));
			
			String sql = prop2.getProperty("selectSptList");
			
			try {
				
				sptOnlyList = new ArrayList<Cash>();
				
				pstmt = con.prepareStatement(sql);	
				
				int startRow = (currentPage - 1) * limit + 1; //현재가 1페이지면 게시글1부터, 현재가 2페이지면 게시글 11부터~
				int endRow = startRow + limit -1; // startRow가 1일 때 endRow는 10, startRow가 11일 때 endRow는 20~
				
				pstmt.setInt(1, m.getMno());
				pstmt.setString(2, uc);
				pstmt.setInt(3, endRow);
				pstmt.setInt(4, startRow);
				
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Cash cash = new Cash();
					
					cash.setPayno(rset.getInt("payno"));
					cash.setMno(rset.getInt(m.getMno()));
					cash.setPayp(rset.getInt("payp"));
					cash.setPaydate(rset.getDate("paydate"));
					cash.setClassify(rset.getString("classify"));
					
					sptOnlyList.add(cash);
					System.out.println("dao" + cash);
				}
				
				
			} catch(SQLException e) {
								throw new CashRechargeException("사용내역 불러오기 에러");
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return sptOnlyList;
		}





		//'충전'내역만 불러오기 ->개수
		public int getrcgOnlyListCount(Connection con, Member m) throws FileNotFoundException, IOException, CashRechargeException {
			// 총 게시글 수
						int listCount = 0;
							// 총 게시글 수를 쿼리로 만들어놓음(board-query.properties에)
						PreparedStatement pstmt = null;
						ResultSet rset = null;

						
						prop2 = new Properties();
						
						String filePath2
						   = CashRechargeDao.class
						   .getResource("/config/cashList-query.properties").getPath();
						
						prop2.load(new FileReader(filePath2));
						
						String sql = prop2.getProperty("listrcgOnlyCount");
					
						try {
							
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, m.getMno());
							pstmt.setString(2, rc);
							
							rset = pstmt.executeQuery();
							
							if(rset.next()) { //결과값이 나왔다면
								listCount = rset.getInt(1); //결과는 숫자형 딱 1개 나옴.(개수를 조회하는거니깐)
							}

						} catch (SQLException e) {
						
							throw new CashRechargeException("충전내역 개수 에러");
						
						} finally {
							close(rset);
							close(pstmt);
						}
						
						return listCount;
		}





		//'충전'내역만 불러오기
		public ArrayList<Cash> selectrcgOnlyList(Connection con, int currentPage, int limit, Member m) throws FileNotFoundException, IOException, CashRechargeException {
			ArrayList<Cash> rcgOnlyList = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			prop2 = new Properties();
			
			String filePath2
			   = CashRechargeDao.class
			   .getResource("/config/cashList-query.properties").getPath();
			
			prop2.load(new FileReader(filePath2));
			
			String sql = prop2.getProperty("selectrcgOnlyList");
			
			try {
				
				rcgOnlyList = new ArrayList<Cash>();
				
				pstmt = con.prepareStatement(sql);	
				
				int startRow = (currentPage - 1) * limit + 1; //현재가 1페이지면 게시글1부터, 현재가 2페이지면 게시글 11부터~
				int endRow = startRow + limit -1; // startRow가 1일 때 endRow는 10, startRow가 11일 때 endRow는 20~
				
				pstmt.setInt(1, m.getMno());
				pstmt.setString(2, rc);
				pstmt.setInt(3, endRow);
				pstmt.setInt(4, startRow);
				
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Cash cash = new Cash();
					
					cash.setPayno(rset.getInt("payno"));
					cash.setMno(rset.getInt(m.getMno()));
					cash.setPayp(rset.getInt("payp"));
					cash.setPaydate(rset.getDate("paydate"));
					cash.setClassify(rset.getString("classify"));
					
					rcgOnlyList.add(cash);
					System.out.println("dao" + cash);
				}
				
				
			} catch(SQLException e) {
				throw new CashRechargeException("충전내역 불러오기 에러");
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return rcgOnlyList;
		}
	
	
}
