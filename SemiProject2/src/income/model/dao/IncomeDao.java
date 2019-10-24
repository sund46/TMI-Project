package income.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import income.model.exception.IncomeException;
import income.model.vo.Income;
import static member.common.JDBCTemplete.*;
public class IncomeDao {

	public ArrayList<Income> selectIncome(Connection con, int sno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT ROWNUM, I.* FROM (SELECT * FROM INCOME WHERE SNO = ? ORDER BY ICDATE DESC) I";
		
		ArrayList<Income> list = new ArrayList<Income>();
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, sno);
			
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				Income i = new Income();
				
				i.setRownum(rset.getInt("ROWNUM"));
				i.setIcmoney(rset.getInt("ICMONEY"));
				i.setIcdate(rset.getDate("ICDATE"));
				i.setIchistory(rset.getString("ICHISTORY"));
				
				list.add(i);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int withdraw(Connection con, int sno, int wdMoney) throws IncomeException {
		PreparedStatement pstmt = null;
		int result = -1;
		
		String sql = "INSERT INTO INCOME VALUES(SEQ_ICCODE.NEXTVAL,?,NULL,?,DEFAULT,'출금')";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, sno);
			pstmt.setInt(2, wdMoney);
			
			
			
			result=pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new IncomeException(e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateincome(Connection con, int sno, int wdMoney) {
		int result = -1;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE SELLER SET INCOME=(INCOME-?) WHERE SNO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wdMoney);
			pstmt.setInt(2, sno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
