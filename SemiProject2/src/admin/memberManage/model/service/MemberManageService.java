package admin.memberManage.model.service;

import java.sql.Connection;

import java.util.ArrayList;

import admin.memberManage.model.dao.MemberManageDao;
import member.model.vo.ClientRequest;
import member.model.vo.Member;
import static member.common.JDBCTemplete.*;

public class MemberManageService {
		// 필드 변수
		Connection con = null;
		MemberManageDao mDao = new MemberManageDao();
	

	public ArrayList<Member> selectMember() {
			ArrayList<Member> mList = null;
		try {
			con = getConnection();
			mList = mDao.selectMember(con);
			close(con);
		}catch(Exception e) {
			close(con);
			e.printStackTrace();
		}
		
		
		
		return mList;
	}


	public void deleteMember(String email) {
		
		try {
			con = getConnection();
			mDao.deleteMember(email,con);
			commit(con);
			close(con);
		}catch(Exception e) {
			rollback(con);
			close(con);
			e.printStackTrace();
			
		}
	}


	public void sendRequest(ClientRequest cr) {
		con = getConnection();
		try {
			mDao.sendRequest(cr,con);
			commit(con);
			close(con);
		}catch(Exception e) {
			e.printStackTrace();
			rollback(con);
			close(con);
		}
		
	}


	public ArrayList<ClientRequest> selectRequestList() {
		ArrayList<ClientRequest> crList = null;
		
		try {
			con = getConnection();
			crList = mDao.selectRequestList(con);
			close(con);
		
		}catch(Exception e) {
			e.printStackTrace();
			close(con);
		}
		
		return crList;
	}


	public void deleteRequest(int rno) {
		try {
			con = getConnection();
			mDao.deleteRequest(rno,con);
			commit(con);
			close(con);
		}catch(Exception e) {
			rollback(con);
			close(con);
			e.printStackTrace();
			
		}
		
	}


	public void invalidateMember(String email) {
		con = getConnection();
		try {
			mDao.invalidateMember(con,email);
			commit(con);
			close(con);
		}catch(Exception e) {
			e.printStackTrace();
			rollback(con);
			close(con);
		}
	}


	public void validateMember(String email) {
		con = getConnection();
		try {
			mDao.validateMember(con,email);
			commit(con);
			close(con);
		}catch(Exception e) {
			e.printStackTrace();
			rollback(con);
			close(con);
		}
		
	}


	public void replyRequest(ClientRequest cr) {
		con = getConnection();
		try {
			mDao.replyRequest(con,cr);
			commit(con);
			close(con);
		}catch(Exception e) {
			rollback(con);
			close(con);
			e.printStackTrace();
		}
		
	}

	
	
	
	
}
