package income.model.vo;

import java.sql.Date;

public class Income {
	private String iccode;
	private int bno;
	private String btitle;
	private int sno;
	private int icmoney;
	private Date icdate;
	private String ichistory;
	private int allincome;
	private int beforeincome;
	private int afterincome;
	private int rownum;
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getAllincome() {
		return allincome;
	}
	public Income(int allincome, int beforeincome, int afterincome) {
		super();
		this.allincome = allincome;
		this.beforeincome = beforeincome;
		this.afterincome = afterincome;
	}
	public void setAllincome(int allincome) {
		this.allincome = allincome;
	}
	public int getBeforeincome() {
		return beforeincome;
	}
	public void setBeforeincome(int beforeincome) {
		this.beforeincome = beforeincome;
	}
	public int getAfterincome() {
		return afterincome;
	}
	public void setAfterincome(int afterincome) {
		this.afterincome = afterincome;
	}
	public Income() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Income(String iccode, int bno, String btitle, int sno, int icmoney, Date icdate, String ichistory) {
		super();
		this.iccode = iccode;
		this.bno = bno;
		this.btitle = btitle;
		this.sno = sno;
		this.icmoney = icmoney;
		this.icdate = icdate;
		this.ichistory = ichistory;
	}
	public String getIccode() {
		return iccode;
	}
	public void setIccode(String iccode) {
		this.iccode = iccode;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getIcmoney() {
		return icmoney;
	}
	public void setIcmoney(int icmoney) {
		this.icmoney = icmoney;
	}
	public Date getIcdate() {
		return icdate;
	}
	public void setIcdate(Date icdate) {
		this.icdate = icdate;
	}
	public String getIchistory() {
		return ichistory;
	}
	public void setIchistory(String ichistory) {
		this.ichistory = ichistory;
	}
	@Override
	public String toString() {
		return "Income [iccode=" + iccode + ", bno=" + bno + ", btitle=" + btitle + ", sno=" + sno + ", icmoney="
				+ icmoney + ", icdate=" + icdate + ", ichistory=" + ichistory + "]";
	}
	
	
	
	
}
