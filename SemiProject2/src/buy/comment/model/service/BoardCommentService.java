package buy.comment.model.service;

import static buy.buy.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import buy.comment.model.dao.BoardCommentDao;
import buy.comment.model.vo.BoardComment;

public class BoardCommentService {
private BoardCommentDao bcDao = new BoardCommentDao();
	
	public int insertComment(BoardComment bco) {
		Connection con = getConnection();
		int result = bcDao.insertComment(con, bco);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<BoardComment> selectList(int bno) {
		Connection con = getConnection();
		ArrayList<BoardComment> clist = bcDao.selectList(con, bno);
		
		close(con);
		return clist;
	}
}
