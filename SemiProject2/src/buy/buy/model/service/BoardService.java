package buy.buy.model.service;

import static buy.buy.common.JDBCTemplate.*;


import java.sql.Connection;


import buy.buy.model.dao.BoardDao;
import buy.buy.model.exception.BoardException;
import buy.buy.model.vo.SellerBoard;


public class BoardService {
	
	private BoardDao bDao = new BoardDao();


	public SellerBoard buyOne(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	public SellerBoard selectOne(int bno) throws BoardException {
		Connection con = getConnection();
		
		SellerBoard b= bDao.selectOne(con, bno);
		System.out.println(bno);
		close(con);
		return b;
	}


}
