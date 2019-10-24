package message.model.service;

import static member.common.JDBCTemplete.close;
import static member.common.JDBCTemplete.getConnection;

import java.sql.Connection;
import java.util.ArrayList;


import member.model.vo.ClientRequest;
import message.model.dao.MessageDao;

public class MessageService {
	Connection con = null;
	MessageDao mDao = new MessageDao();
	
	
	
	public int getListCount(String email) {
		con = getConnection();
		int listCount = 0;
		try {
			listCount = mDao.listCount(con,email);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}

		
		return listCount;
	}



	public ArrayList<ClientRequest> selectList(String email,int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<ClientRequest> requestList = null;
		try {
			
		requestList = mDao.selectList(email,con,currentPage,limit);
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}

		
		
		return requestList;

	}

}
