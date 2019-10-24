package buy.buy.model.dao;

import static buy.buy.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import buy.buy.model.exception.BoardException;

import buy.buy.model.dao.BoardDao;

import buy.buy.model.vo.SellerBoard;

public class BoardDao {
	
	private Properties prop;
	
	public BoardDao () {
		prop = new Properties();
		
		String filePath = BoardDao.class
				.getResource("/buy/buy/config/board-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch ( IOException e) {
			
		}
		
	}
	
	public SellerBoard selectOne(Connection con, int bno) throws BoardException {
		SellerBoard b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				b = new SellerBoard();
				b.setBno(bno);
				b.setSno(rset.getInt("SNO"));
				b.setBtitle(rset.getString("BTITLE"));
				b.setBcontent(rset.getString("BCONTENT"));
				b.setErecontent(rset.getString("ERECONTENT"));
				b.setRequest(rset.getString("REQUEST"));
				b.setCategory1_code(rset.getString("CATEGORY1_CODE"));
				b.setCategory2_code(rset.getString("CATEGORY2_CODE"));
				b.setPrice(rset.getInt("PRICE"));
				b.setImages(rset.getString("IMAGES"));
				b.setBevaluation(rset.getInt("BEVALUATION"));
				b.setEditablecount(rset.getInt("EDITABLECOUNT"));
				b.setDuedate(rset.getInt("DUEDATE"));
				b.setSpeed(rset.getInt("SPEED"));
				b.setPlusedit(rset.getInt("PLUSEDIT"));
				b.setExtradate1(rset.getInt("EXTRADATE1"));
				b.setExtradate2(rset.getInt("EXTRADATE2"));
				b.setIntrotext(rset.getString("INTROTEXT"));
				b.setCpcount(rset.getInt("CPCOUNT"));
				b.setSevaluation(rset.getInt("SEVALUATION"));
				b.setNickname(rset.getString("NICKNAME"));
				
		
			}
		} catch (SQLException e) {
			
			throw new BoardException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		
		return b;
	}

	public int updateReadCount(Connection con, int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
