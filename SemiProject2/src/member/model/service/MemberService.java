package member.model.service;

import static member.common.JDBCTemplete.close;

import static member.common.JDBCTemplete.commit;
import static member.common.JDBCTemplete.getConnection;
import static member.common.JDBCTemplete.rollback;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.exception.MemberException;
import member.model.vo.Member;
		
			
// Service : 
//  Controller인 서블릿에서 
//  전달한 정보를 업무 수행로직(비즈니스 로직)에 따라 가공하여 DAO에게 전달하는 역할

public class MemberService {
	// 필드변수
		MemberDao mDao = new MemberDao();
		Connection con;
		
	
	// 회원 가입을 위한 메소드
	public int insertMember(Member m) {
		
		con = getConnection();
		
		int result = mDao.insertMember(con, m); 
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

		// 로그인을 했으면 그 사용자의 정보를 갖고 있어야한다. 왜? 그래야 서비스 이용할 때 써먹을 수 있으니까(ex. 개인정보 수정 등...) 안그러면 DB 또 갔다와야 함. 
	public Member selectMemeber(Member m) throws Exception {
		
		con = getConnection();
		
		
		Member result = mDao.selectMember(con,m);
		
		
		close(con);
		
		return result;
	}
	
	public int updateMember(Member m) {
	
		con = getConnection();
		
		int result = mDao.updateMember(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	public int deleteMember(String userEmail) {
		
		con = getConnection();
		
		int result = mDao.deleteMember(con,userEmail);
		
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}
	
	public int verifyEmail(String userEmail) {
		
		con = getConnection();
		int result = mDao.verifyEmail(con, userEmail);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int emailDupCheck(String email) throws MemberException {
		int isDup = 0;
		con = getConnection();
		try {
		 isDup = mDao.emailDupCheck(con,email);
		 close(con);
		}catch(MemberException e) {
			e.printStackTrace();
			close(con);
		}
	
		
		return isDup;
	}
	
	public String searchId(Member m) {

		con = getConnection();
		String result = mDao.searchId(con, m);

		close(con);

		return result;
	}

	public String searchPwd(Member m) {
		con = getConnection();
		String result = mDao.searchPwd(con, m);

		if (result != null) commit(con);
		else rollback(con);

		close(con);

		return result;

	}

	public int pwdUpdate(Member m) {
		con = getConnection();
		int result = mDao.pwdUpdate(con, m);
		
		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public int nickNameDupCheck(String nickName) {
		int isDup = 0;
	
		try {
			con = getConnection();
			isDup = mDao.nickNameDupCheck(con,nickName);
			close(con);
		}catch(Exception e) {
			close(con);
				e.printStackTrace();
		}
		
	
		
		return isDup;
	}

	public int getMcount(Member m) {
		int mCount = 0;
		con = getConnection();
		try {
			mCount = mDao.getMcount(m,con);
			close(con);
			
		}catch(Exception e) {
			e.printStackTrace();
			close(con);
		}
		
		
		return mCount;
	}

	public int getBuyCount(Member m) {
		
		int buyCount = 0;
		con = getConnection();
		try {
			buyCount = mDao.getBuyCount(m,con);
			close(con);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			close(con);
		}
		
		
		return buyCount;
	}

	public int getSellCount(Member m) {
		int sellCount = 0;
		con = getConnection();
		try {
			sellCount = mDao.getSellCount(m,con);
			close(con);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			close(con);
		}
		
		
		return sellCount;
	}
	
	
}
