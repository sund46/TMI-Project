package admin.serviceManage.model.service;

import static member.common.JDBCTemplete.*;


import java.sql.Connection;
import java.util.ArrayList;

import admin.serviceManage.model.dao.ServiceManageDao;
import sellerboard.model.vo.SellerBoard;



public class ServiceManageService {
	// 필드 변수
	Connection con = null;
	ServiceManageDao sDao = new ServiceManageDao();

	public ArrayList<SellerBoard> selectServiceList() {
		
		ArrayList<SellerBoard> sList = null;
		con = getConnection();
		
		try {
			
			sList = sDao.selectServiceList(con);
			close(con);
		}catch(Exception e) {
			close(con);
			e.printStackTrace();
		}
		
		
		return sList;
		
	}

	public void refuseService(int bno) {

		try {
			con = getConnection();
			sDao.refuseService(bno,con);
			commit(con);
			close(con);
		}catch(Exception e) {
			rollback(con);
			close(con);
			e.printStackTrace();
			
		}
		
	}

	public ArrayList<SellerBoard> selectDocList(String email) {
			
		con = getConnection();
		ArrayList<SellerBoard> docList = null;
		try {
			docList = sDao.selectDocList(email,con);
			close(con);
		}catch(Exception e) {
			close(con);
			e.printStackTrace();
		}
		
		return docList;
	}

	public void approveService(int bno) {
		con = getConnection();
		try {
			sDao.approveService(bno,con);
			commit(con);
			close(con);
		}catch(Exception e) {
			rollback(con);
			close(con);
			e.printStackTrace();
		}
		
		
	}
	

	
}