package sellerboard.model.dao;

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

import seller.model.dao.SellerDao;
import seller.model.exception.SellerException;
import sellerboard.model.exception.SellerboardException;
import sellerboard.model.vo.SellerBoard;
import sellerboard.model.vo.Talent;
import sellerboard.model.vo.Top5;

public class SellerBoardDao {

	// SQL을 별도로보관하는  Properties 객체 생성하기
		private Properties prop;
		
	public SellerBoardDao() {
		prop = new Properties();
		
		//properties 경로 연결
		String filePath = SellerDao.class.getResource("/config/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Dao부분 file not found");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("Dao부분 IO Exception");
			e.printStackTrace();
		}
		
	}
		
		
	public int insertSellerboard(Connection con, SellerBoard sb) throws SellerboardException{
		// 결과 확인을 위한 변수 result 생성
		int result = 0;
				
		PreparedStatement pstmt = null;
		
		try {
			// 준비할 쿼리문 작성하기
			String sql = prop.getProperty("insertSellerboard");
			
			//1. PreparedStatement 객체 생성하기 pstmt는 실행 전에 반드시 쿼리 양식을 들고 있어야 한다.
			//그래서 미리 작성을함 문제는 입력값이 아주 많은데 한꺼번에 다 받아야 하기 때문에 주의가 필요하다.
			
			pstmt = con.prepareStatement(sql);
			
			
			System.out.println("값을 잘전달받는지 확인하기위함");
			System.out.println("SNO :"+sb.getSno());					//판매자번호
			System.out.println("제목 :"+sb.getBtitle());					//제목
			System.out.println("상세설명 :"+sb.getBcontent());				//상세 설명
			System.out.println("수정및 재진행 :"+sb.getErecontent());				//수정 및 재진행 안내
			System.out.println("작업전 요청 :"+sb.getRequest());				//작업 전 요청사항	
			System.out.println("상위카테 :"+sb.getCategory1_code());			//상위 카테고리
			System.out.println("하위카테 :"+sb.getCategory2_code());			//하위 카테고리
			System.out.println("가격 :"+sb.getPrice());					//가격
			System.out.println("이미지 :"+sb.getImages());					//이미지들
			System.out.println("수정횟수 :"+sb.getEditablecount());			//수정 횟수
			System.out.println("작업기간 :"+sb.getDuedate());				//작업기간
			System.out.println("빠른작업 :"+sb.getSpeed());					//빠른작업(옵션)
			System.out.println("빠른작업세부 :"+sb.getExtradate1());
			System.out.println("추가수정 :"+sb.getPlusedit());				//추가수정(옵션)
			System.out.println("추가수정세부 :"+sb.getExtradate2());
			
			// ? 에 해당하는 값을 추가 함
			pstmt.setInt(1, sb.getSno());					//sno
			pstmt.setString(2, sb.getBtitle());					//제목
			pstmt.setString(3, sb.getBcontent());				//상세 설명
			pstmt.setString(4, sb.getErecontent());				//수정 및 재진행 안내
			pstmt.setString(5, sb.getRequest());				//작업 전 요청사항
			pstmt.setString(6, sb.getCategory1_code());			//상위 카테고리
			pstmt.setString(7, sb.getCategory2_code());			//하위 카테고리
			pstmt.setInt(8, sb.getPrice());						//가격
			pstmt.setString(9, sb.getImages());					//이미지들
			pstmt.setInt(10, sb.getEditablecount());				//수정 횟수
			pstmt.setInt(11, sb.getDuedate());					//작업기간
			pstmt.setInt(12, sb.getSpeed());					//빠른작업(옵션)
			pstmt.setString(13, sb.getExtradate1());				//빠른작업(옵션)
			pstmt.setInt(14, sb.getPlusedit());					//추가수정(옵션)
			pstmt.setString(15, sb.getExtradate2());				//추가수정(옵션)
			
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new SellerboardException("서비스 등록에 실패하였습니다.");
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int getListCount(Connection con,String cCode, String code) throws SellerboardException {
		int listCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		System.out.println(cCode);
		try {
			if(code.equals("0")) {
				sql = "SELECT COUNT(*) FROM SELLERBOARD WHERE STATE = 'B2' AND CATEGORY1_CODE = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cCode);
			}else {
				sql = "SELECT COUNT(*) FROM SELLERBOARD WHERE STATE = 'B2' AND CATEGORY1_CODE = ?  AND CATEGORY2_CODE = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cCode);
				pstmt.setString(2, code);
			}	
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch(SQLException e) {
			throw new SellerboardException("서비스리스트 불러오기 오류");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return listCount;
	}


	public ArrayList<SellerBoard> selectList(Connection con, int currentPage, int pageLimit, int boardLimit, String cCode, String code) throws SellerboardException {
		ArrayList<SellerBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		if(code.equals("0")) {
			sql = prop.getProperty("selectList");
		} else {
			sql = prop.getProperty("selectList2");
		}
		try {
			
			pstmt = con.prepareStatement(sql);
		
			int startRow = (currentPage - 1)*boardLimit +1;
			int endRow = startRow+boardLimit-1;		
			
			System.out.println(startRow);
			System.out.println(endRow);
			
			
			if(code.equals("0")) {
				pstmt.setString(1, cCode);
				pstmt.setInt(2, endRow);
				pstmt.setInt(3, startRow);
			} else {
				pstmt.setString(1, cCode);
				pstmt.setString(2, code);
				pstmt.setInt(3, endRow);
				pstmt.setInt(4, startRow);
			}
					
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList<SellerBoard>();
			
			while(rset.next()) {
				SellerBoard b = new SellerBoard();
				b.setBno(rset.getInt("BNO"));
				b.setSno(rset.getInt("SNO"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setErecontent(rset.getString("ERECONTENT"));
				b.setRequest(rset.getString("REQUEST"));
				b.setCategory1_code(rset.getString("CATEGORY1_CODE"));
				b.setCategory2_code(rset.getString("CATEGORY2_CODE"));
				b.setPrice(rset.getInt("PRICE"));
				b.setBevaluation(rset.getInt("BEVALUATION"));
				b.setImages(rset.getString("IMAGES"));
				b.setEditablecount(rset.getInt("EDITABLECOUNT"));
				b.setDuedate(rset.getInt("DUEDATE"));
				b.setSpeed(rset.getInt("SPEED"));
				b.setExtradate1(rset.getString("EXTRADATE1"));
				b.setPlusedit(rset.getInt("PLUSEDIT"));
				b.setExtradate2(rset.getString("EXTRADATE2"));
				b.setAd(rset.getString("AD"));
				b.setAdexpire(rset.getInt("ADEXPIRE"));
				b.setBdate(rset.getDate("BDATE"));
				b.setState(rset.getString("STATE"));
				b.setNickName(rset.getString("USERNAME"));

				list.add(b);
			}
			
			
		} catch (SQLException e) {
			throw new SellerboardException("서비스 불러오기 오류");
		}finally {
			close(rset);
			close(pstmt);	
		}		
		return list;
	}



	public ArrayList<SellerBoard> myBoardSelect(Connection con, int sno) throws SellerboardException {
		ArrayList<SellerBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = sql = prop.getProperty("myBoardSelect");

		try {
	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<SellerBoard>();
			
			while(rset.next()) {
				SellerBoard b = new SellerBoard();
				b.setBno(rset.getInt("BNO"));
				b.setSno(rset.getInt("SNO"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setErecontent(rset.getString("ERECONTENT"));
				b.setRequest(rset.getString("REQUEST"));
				b.setCategory1_code(rset.getString("CATEGORY1_CODE"));
				b.setCategory2_code(rset.getString("CATEGORY2_CODE"));
				b.setPrice(rset.getInt("PRICE"));
				b.setBevaluation(rset.getInt("BEVALUATION"));
				b.setImages(rset.getString("IMAGES"));
				b.setEditablecount(rset.getInt("EDITABLECOUNT"));
				b.setDuedate(rset.getInt("DUEDATE"));
				b.setSpeed(rset.getInt("SPEED"));
				b.setExtradate1(rset.getString("EXTRADATE1"));
				b.setPlusedit(rset.getInt("PLUSEDIT"));
				b.setExtradate2(rset.getString("EXTRADATE2"));
				b.setAd(rset.getString("AD"));
				b.setAdexpire(rset.getInt("ADEXPIRE"));
				b.setBdate(rset.getDate("BDATE"));
				b.setState(rset.getString("STATE"));
				
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			throw new SellerboardException("나의 서비스 불러오기 오류");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}


	public int findSno(Connection con, String email) throws SellerboardException {
		int result = 0; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		try {
			String sql = prop.getProperty("findSno");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			//쿼리를 수행하고 그 결과 받아오기
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt("SNO");
				System.out.println("Dao에서 Sno를 잘받아왓는지 값 확인"+rset.getInt("SNO"));
				//여기까지 문제없이 DB에서 값을 가져왔다.
			}
			
			
		} catch (SQLException e) {
			throw new SellerboardException("판매자 식별 오류");
		} finally {
			// DB 객체를 반환하는 순서는
			// 선언의 순서와 반드시 정 반대가 되어야 한다.
			close(rset);
			close(pstmt);
		}
		return result;
	}


	public String SelectTalent1(Connection con, String cCode) throws SellerboardException {
		String t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		String sql=prop.getProperty("selecttalent1");
		System.out.println("Dao의 cCode: " + cCode);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cCode);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				t=rset.getString(1);
			}
			
		} catch (SQLException e) {
			throw new SellerboardException("카테고리 정보를 가져오지 못했습니다.");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}


	public String SelectTalent2(Connection con, String code) throws SellerboardException {
		String t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		String sql=prop.getProperty("selecttalent2");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				t=rset.getString(1);
			}
			
		} catch (SQLException e) {
			throw new SellerboardException("카테고리 정보를 불러오지 못했습니다.");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}


	public ArrayList<String> selectTop3(Connection con) throws SellerboardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = new ArrayList<String>();
		System.out.println("들어감");
		String sql = "SELECT ROWNUM, C.CATE FROM (SELECT T.CATEGORY1_NAME CATE,SUM(D.PRICE) FROM DEALMANAGER D JOIN SELLERBOARD S ON(D.BNO=S.BNO) JOIN TALENT1 T ON(S.CATEGORY1_CODE = T.CATEGORY1_CODE) GROUP BY T.CATEGORY1_NAME ORDER BY 1 DESC) C WHERE ROWNUM < 4";
		try {
			pstmt=con.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				String str = "";
				
				str = rset.getString(2);
				
				list.add(str);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new SellerboardException("게시물 랭킹을 가져오지 못했습니다.");
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Top5> selectTop5(Connection con, Top5 t) throws SellerboardException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("Top5select");
		ArrayList<Top5> list = new ArrayList<Top5>();
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, t.getTop1());
			pstmt.setString(2, t.getTop2());
			pstmt.setString(3, t.getTop3());
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Top5 to = new Top5();
				
				to.setNickname(rset.getString(1));
				to.setIncome(rset.getInt(2));
				to.setCate(rset.getString(3));
				
				
				
				
				list.add(to);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new SellerboardException("랭킹 정보를 가져오지 못했습니다.");
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	

	public int getSearchedListCount(String searchWord, Connection con) throws SellerboardException {
		int searchedListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSearchedListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				searchedListCount = rset.getInt(1);
				
			}
			
		}catch(Exception e) {
			
			throw new SellerboardException("검색목록을 불러오지 못했습니다.");
	
		}finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		
		
		return searchedListCount;
	}


	public ArrayList<SellerBoard> searchedList(int currentPage, int pageLimit, int boardLimit, String searchWord, Connection con) throws SellerboardException {
		ArrayList<SellerBoard> searchedList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT BO.*, (SELECT M.NICKNAME FROM MEMBER M JOIN SELLER S ON (M.MNO = S.MNO) WHERE S.SNO= BO.SNO) USERNAME FROM (SELECT ROWNUM RNUM, B.* FROM (SELECT * FROM SELLERBOARD WHERE STATE='B2' AND BTITLE LIKE CONCAT(CONCAT('%',?),'%') ORDER BY BNO DESC) B WHERE ROWNUM <= ?) BO WHERE RNUM >= ?";
	
		try {
			
			pstmt = con.prepareStatement(sql);
		
			int startRow = (currentPage - 1)*boardLimit +1;
			int endRow = startRow+boardLimit-1;	
			System.out.println(startRow);
			System.out.println(endRow);
				System.out.println(sql);
				System.out.println(searchWord);
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, endRow);
				pstmt.setInt(3, startRow);

			   rset = pstmt.executeQuery();
			
			searchedList = new ArrayList<SellerBoard>();
			
			while(rset.next()) {
				SellerBoard b = new SellerBoard();
				b.setBno(rset.getInt("BNO"));
				b.setSno(rset.getInt("SNO"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setErecontent(rset.getString("ERECONTENT"));
				b.setRequest(rset.getString("REQUEST"));
				b.setCategory1_code(rset.getString("CATEGORY1_CODE"));
				b.setCategory2_code(rset.getString("CATEGORY2_CODE"));
				b.setPrice(rset.getInt("PRICE"));
				b.setBevaluation(rset.getInt("BEVALUATION"));
				b.setImages(rset.getString("IMAGES"));
				b.setEditablecount(rset.getInt("EDITABLECOUNT"));
				b.setDuedate(rset.getInt("DUEDATE"));
				b.setSpeed(rset.getInt("SPEED"));
				b.setExtradate1(rset.getString("EXTRADATE1"));
				b.setPlusedit(rset.getInt("PLUSEDIT"));
				b.setExtradate2(rset.getString("EXTRADATE2"));
				b.setAd(rset.getString("AD"));
				b.setAdexpire(rset.getInt("ADEXPIRE"));
				b.setBdate(rset.getDate("BDATE"));
				b.setState(rset.getString("STATE"));
				b.setNickName(rset.getString("USERNAME"));
				
				searchedList.add(b);
			}
			
			
		} catch (SQLException e) {
			throw new SellerboardException("검색을 실패하였습니다.");
		}finally {
			close(rset);
			close(pstmt);	
		}		
		return searchedList;
	}

	
	
	
	

}
