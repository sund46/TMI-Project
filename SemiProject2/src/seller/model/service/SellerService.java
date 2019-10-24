package seller.model.service;

import static member.common.JDBCTemplete.close;
import static member.common.JDBCTemplete.commit;
import static member.common.JDBCTemplete.getConnection;
import static member.common.JDBCTemplete.rollback;

import java.sql.Connection;


import seller.model.dao.SellerDao;
import seller.model.exception.SellerException;
import seller.model.vo.Seller;


public class SellerService {
	
	SellerDao sDao = new SellerDao();
	Connection con;
	
	public Seller selectSeller(String email) throws SellerException {
		con = getConnection();
		
		Seller result = sDao.selectSeller(con, email);
		
		close(con);
		
		return result;
	}
	public int insertSeller(Seller s) throws SellerException {
		//Dao = data access object
		con = getConnection();
		int result = sDao.insertSeller(con,s);
		//실행하면 숫자가 나오는데 숫자만 돌려주면 된다.		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int findMno(String email) throws SellerException{
		con = getConnection();
		
		int result = sDao.findMno(con, email);
		
		close(con);
		
		System.out.println("SellerService에서 값 잘받아왔는지 확인" + result);
		
		if(result == 0) throw new SellerException("Mno를 가져오는 과정에서 문제발생");
		
		return result;
	}
	public int changeIsseller(int mno) throws SellerException{
		// TODO Auto-generated method stub
		//System.out.println("isSeller service 무사히 접근 넘겨주는 mno는"+mno);
		con = getConnection();
		
		int result = sDao.changeIsseller(con, mno);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		//System.out.println("SellerService에서 값 잘받아왔는지 확인" + result);
		
		if(result == 0) throw new SellerException("Mno를 가져오는 과정에서 문제발생");
		
		return result;
	}
	public String phoneNB(String email) throws SellerException {
		con = getConnection();
		
		String result = sDao.phoneNB(con, email);
		
		close(con);
		
		System.out.println("SellerService에서 값 잘받아왔는지 확인" + result);
		
		if(result == null) throw new SellerException("phone를 가져오는 과정에서 문제발생");
		
		return result;
	}


}
