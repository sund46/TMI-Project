package income.model.service;

import static member.common.JDBCTemplete.*;

import java.sql.Connection;
import java.util.ArrayList;

import income.model.dao.IncomeDao;
import income.model.exception.IncomeException;
import income.model.vo.Income;

public class IncomeService {
	private Connection con;
	private IncomeDao id = new IncomeDao();
	public ArrayList<Income> selectIncome(int sno) {
		con = getConnection();
		
		ArrayList<Income> list = id.selectIncome(con, sno);
		
		close(con);
		
		return list;
	}
	public int withdraw(int sno, int wdMoney) throws IncomeException {
		con = getConnection();
		
		int result = id.withdraw(con,sno,wdMoney);
		
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}
	public int updateincome(int sno, int wdMoney) {
		con = getConnection();
		
		int result = id.updateincome(con,sno,wdMoney);
		
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}
	
	
	
	
	
	
	
}
