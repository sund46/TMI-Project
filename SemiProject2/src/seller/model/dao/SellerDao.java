package seller.model.dao;

import static member.common.JDBCTemplete.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import seller.model.exception.SellerException;
import seller.model.vo.Seller;

public class SellerDao {
	// SQL을 별도로보관하는  Properties 객체 생성하기
	private Properties prop;
	
	public SellerDao() {
		prop = new Properties();
		
		//properties 경로 연결
		String filePath = SellerDao.class.getResource("/config/seller-query.properties").getPath();
		
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
	
	// 판매자 추가 파트
	public int insertSeller(Connection con, Seller s) throws SellerException {
		// 결과 확인을 위한 변수 result 생성
		int result = 0;
				
		PreparedStatement pstmt = null;
		
				
		try {
			// 준비할 쿼리문 작성하기
			String sql = prop.getProperty("insertSeller");
			
			
			//1. PreparedStatement 객체 생성하기 pstmt는 실행 전에 반드시 쿼리 양식을 들고 있어야 한다.
			//그래서 미리 작성을함 문제는 입력값이 아주 많은데 한꺼번에 다 받아야 하기 때문에 주의가 필요하다.
			
			pstmt = con.prepareStatement(sql);
			
			
			System.out.println("값을 잘전달받는지 확인하기위함");
			System.out.println(s.getMno());
			System.out.println(s.getAbletime());
			System.out.println(s.getBankname());
			System.out.println(s.getBanknumber());
			System.out.println(s.getCareerdate1());
			System.out.println(s.getCareerdate2());
			System.out.println(s.getCareerdate3());
			System.out.println(s.getCareer1());
			System.out.println(s.getCareer2());
			System.out.println(s.getCareer3());
			System.out.println(s.getCertificat1());
			System.out.println(s.getCertificat2());
			System.out.println(s.getCertificat3());
			System.out.println(s.getIntrotext());
			
			// ? 에 해당하는 값을 추가 함
			pstmt.setInt(1, s.getMno());
			pstmt.setString(2, s.getAbletime());
			pstmt.setString(3, s.getBankname());
			pstmt.setString(4, s.getBanknumber());
			pstmt.setString(5, s.getCareerdate1());
			pstmt.setString(6, s.getCareerdate2());
			pstmt.setString(7, s.getCareerdate3());
			pstmt.setString(8, s.getCareer1());
			pstmt.setString(9, s.getCareer2());
			pstmt.setString(10, s.getCareer3());
			pstmt.setString(11, s.getCertificat1());
			pstmt.setString(12, s.getCertificat2());
			pstmt.setString(13, s.getCertificat3());
			pstmt.setString(14, s.getIntrotext());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new SellerException("등록중 DAO에서 에러발생");
			
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Seller selectSeller(Connection con, String email) throws SellerException {
		Seller result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSeller");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			result = new Seller();
			if(rset.next()) {
				
				result.setSno(rset.getInt("SNO"));
				result.setMno(rset.getInt("MNO"));
				result.setAbletime(rset.getString("CALLTIME"));
				result.setBankname(rset.getString("BANKNAME"));
				result.setBanknumber(rset.getString("BANKNUMBER"));
				result.setIncome(rset.getInt("INCOME"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SellerException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int findMno(Connection con, String email) throws SellerException{
		int result = 0; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		try {
			String sql = prop.getProperty("findMno");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			//쿼리를 수행하고 그 결과 받아오기
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt("MNO");
				System.out.println("Dao에서 Mno를 잘받아왓는지 값 확인"+rset.getInt("MNO"));
				//여기까지 문제없이 DB에서 값을 가져왔다.
			}
			
			
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new SellerException("MNO를 가져오는 도중에 문제발생");
		} finally {
			// DB 객체를 반환하는 순서는
			// 선언의 순서와 반드시 정 반대가 되어야 한다.
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int changeIsseller(Connection con, int mno) throws SellerException{
		int result = 0;

		PreparedStatement pstmt = null;
		//System.out.println("isSeller DAO 무사히 접근 받은 mno는"+mno);
		
		try {
			String sql = prop.getProperty("changeIsSeller");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			result = pstmt.executeUpdate();
			
			//System.out.println("DAO에서 끝난 mno값"+mno);
		} catch (SQLException e) {
			 
			//e.printStackTrace();
			throw new SellerException(e.getMessage());
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public String phoneNB(Connection con, String email) throws SellerException {
		String result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		
		try {
			String sql = prop.getProperty("phoneNB");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			//쿼리를 수행하고 그 결과 받아오기
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getString("PHONE");
				System.out.println("Dao에서 폰번호를 잘받아왓는지 값 확인"+result);
				//여기까지 문제없이 DB에서 값을 가져왔다.
			}
			
			
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new SellerException("핸드폰번호를 가져오는 도중 문제발생");
		} finally {
			// DB 객체를 반환하는 순서는
			// 선언의 순서와 반드시 정 반대가 되어야 한다.
			close(rset);
			close(pstmt);
		}
		return result;
	}
}











