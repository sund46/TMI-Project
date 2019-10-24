package buyingctrl.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import buyingctrl.model.exception.buyingctrlException;
import buyingctrl.model.vo.DealMng;
import charge.model.dao.CashRechargeDao;
import member.model.vo.Member;

import static member.common.JDBCTemplete.*;


public class DealMngDao {

	private Properties prop;
	private String progressing = "진행중";
	private String fin = "완료";
	private String cc = "취소";
	
	public DealMngDao() {
		prop = new Properties();
		
		String filePath
		   = DealMngDao.class
		   .getResource("/config/dealManage-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {

			e.printStackTrace();
			
		}
	}

	
	//전체 구매내역 조회
	public ArrayList<DealMng> nrqselectList(Connection con, int currentPage, int limit, Member m) throws buyingctrlException {
		
		ArrayList<DealMng> nreqList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nreqselectList");
		
		try {
			nreqList = new ArrayList<DealMng>();
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1; //현재가 1페이지면 게시글1부터, 현재가 2페이지면 게시글 11부터~
			int endRow = startRow + limit -1; // startRow가 1일 때 endRow는 10, startRow가 11일 때 endRow는 20~

			pstmt.setInt(1, m.getMno());
			pstmt.setString(2, m.getNickName());
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setProgress(rset.getString("progress"));
				dm.setPrice(rset.getInt("price"));
				
				
				
				
				nreqList.add(dm);
				System.out.println("구매 내역 전체 조회 리스트(DealMngDao) : "+ nreqList);
				
			}
			
		} catch(SQLException e) {
			throw new buyingctrlException("전체 구매 내역 에러");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return nreqList;
	}

	
	
	
	
	
	
	//진행중 조회
	public ArrayList<DealMng> ingselectList(Connection con, Member m) throws buyingctrlException  {
		
		ArrayList<DealMng> dingList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	
		
		String sql = prop.getProperty("ingselectList");
		
		try {
			dingList = new ArrayList<DealMng>();
			
			
			pstmt = con.prepareStatement(sql);
			System.out.println("sql: " + sql);
			 pstmt.setInt(1, m.getMno());

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setsNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setPrice(rset.getInt("price"));
				dm.setProgress(rset.getString("progress"));
				dm.setSno(rset.getInt("sno"));
				dingList.add(dm);
				System.out.println("진행중인 구매내역 조회 리스트(DealMngDao) : "+ dingList);
				
			}
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
			throw new buyingctrlException("진행중 조회 에러");
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dingList;
		
		
	}

	
	//구매 전체 내역에서 검색
	public ArrayList<DealMng> searchAllList(Connection con, String keyword, Member m) throws buyingctrlException {
		
		ArrayList<DealMng> nreqList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searAllselect");
		
		try {
			
			nreqList = new ArrayList<DealMng>();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, keyword);
			rset = pstmt.executeQuery();
			while(rset.next()){
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setProgress(rset.getString("progress"));
				dm.setPrice(rset.getInt("price"));
				
				nreqList.add(dm);
				System.out.println("검색 내용(DealMngDao) : " + nreqList);
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
			throw new buyingctrlException("구매 전체 내역 검색 에러");
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return nreqList;
	}

	
//페이징, 개수 세어보는 부분
	public int getListCount(Connection con, Member m) {
		
		// 총 게시글 수
		int listCount = 0;
			// 총 게시글 수를 쿼리로 만들어놓음(board-query.properties에)
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		
		String sql = prop.getProperty("listCount");
	
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMno());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //결과값이 나왔다면
				listCount = rset.getInt(1); //결과는 숫자형 딱 1개 나옴.(개수를 조회하는거니깐)
			}

		} catch (SQLException e) {
		
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
		
	}


	public ArrayList<DealMng> selectDeal(Connection con, int sno) throws buyingctrlException {
		ArrayList<DealMng> list = new ArrayList<DealMng>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT D.*,M.NICKNAME,B.BTITLE,B.IMAGES FROM DEALMANAGER D JOIN MEMBER M ON (D.MNO = M.MNO) JOIN SELLERBOARD B ON (D.BNO = B.BNO) WHERE D.SNO = ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			System.out.println(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				System.out.println("진입");
				
				dm.setBno(rset.getInt("BNO"));
				dm.setBtitle(rset.getString("btitle"));
				dm.setNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setProgress(rset.getString("progress"));
				dm.setPrice(rset.getInt("price"));
				dm.setImages(rset.getString("IMAGES"));
				
				
				System.out.println(dm.getBtitle());
				
				System.out.println(dm.getBno());
				
				list.add(dm);
			}
			
		} catch (SQLException e) {
			throw new buyingctrlException("페이징 에러");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int updateProgress(Connection con, String progress, String dmcode) throws buyingctrlException {
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE DEALMANAGER SET PROGRESS = ? WHERE DMCODE = ?";
		int result = -1;
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, progress);
			pstmt.setString(2, dmcode);
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new buyingctrlException(e.getMessage());
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}


	public void dealComplete(int mno, int bno, int sno, Connection con,int cp) {
			
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("dealComplete");
			System.out.println(sql);
			
			try {
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bno);
				pstmt.setInt(2, mno);
				pstmt.setInt(3, sno);
				pstmt.setInt(4, cp);
				
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
	}


	public void makeIncome(int bno, int sno, int cp, Connection con) {
			
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("makeIncome");
			
			try {
				pstmt = con.prepareStatement(sql);
				System.out.println(sql);
				pstmt.setInt(1, sno);
				pstmt.setInt(2, bno);
				pstmt.setDouble(3, Math.round(cp*0.9));
				
				pstmt.executeUpdate();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
		
		
	}


	public void makeIncomeToSeller(int sno, int cp, Connection con) {
			
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("makeIncomeToSeller");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, Math.round(cp*0.9));
			pstmt.setInt(2, sno);
	
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		
		
	}


	public ArrayList<DealMng> selectAllList(Connection con, Member m) {
		ArrayList<DealMng> dingList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

	
		
		String sql = prop.getProperty("selectAllList");
		
		try {
			dingList = new ArrayList<DealMng>();
			
			
			pstmt = con.prepareStatement(sql);
			System.out.println("sql: " + sql);
			 pstmt.setInt(1, m.getMno());
			 

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setsNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setPrice(rset.getInt("price"));
				dm.setProgress(rset.getString("progress"));
				dingList.add(dm);
				System.out.println("진행중인 구매내역 조회 리스트(DealMngDao) : "+ dingList);
				
			}
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dingList;
	}


	public ArrayList<DealMng> selectFinList(Connection con, Member m) {
		ArrayList<DealMng> dingList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		
		String sql = prop.getProperty("selectFinList");
		
		try {
			dingList = new ArrayList<DealMng>();
			
			
			pstmt = con.prepareStatement(sql);
			System.out.println("sql: " + sql);
			 pstmt.setInt(1, m.getMno());
		

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setsNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setPrice(rset.getInt("price"));
				dm.setProgress(rset.getString("progress"));
				dm.setSno(rset.getInt("sno"));
				dingList.add(dm);
				System.out.println("진행중인 구매내역 조회 리스트(DealMngDao) : "+ dingList);
				
			}
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dingList;
	}


	public ArrayList<DealMng> selectCancelList(Connection con, Member m) {
		ArrayList<DealMng> dingList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCancelList");
		
		try {
			dingList = new ArrayList<DealMng>();
			
			
			pstmt = con.prepareStatement(sql);
			System.out.println("sql: " + sql);
			 pstmt.setInt(1, m.getMno());
	

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				DealMng dm = new DealMng();
				
				dm.setBtitle(rset.getString("btitle"));
				dm.setsNickname(rset.getString("nickName"));
				dm.setDmcode(rset.getInt("dmcode"));
				dm.setDealdate(rset.getDate("dealdate"));
				dm.setPrice(rset.getInt("price"));
				dm.setProgress(rset.getString("progress"));
				dm.setSno(rset.getInt("sno"));
				dingList.add(dm);
				System.out.println("진행중인 구매내역 조회 리스트(DealMngDao) : "+ dingList);
				
			}
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dingList;
	}


	
	
	

	

	
	
	
	
	
	
	
	
	
}
