package charge.model.vo;

import java.sql.Date;

public class Cash {

	//필드
	private int payno; //결제코드
	private int mno;	//멤버코드
	private int payp;	//결제금액
	private Date paydate;	//결제일
	private String classify;	//구문(충전|사용|환불)
	private String btitle;
	
	//생성자
	public Cash() {

	}


	public Cash(int mno, int payp, String classify) {
		super();
		this.mno = mno;
		this.payp = payp;
		this.classify = classify;
	}


	public Cash(int payno, int mno, int payp, Date paydate, String classify) {
		super();
		this.payno = payno;
		this.mno = mno;
		this.payp = payp;
		this.paydate = paydate;
		this.classify = classify;
	}
	
	//충전내역 남기는 부분
	public Cash(int payp) {
		super();
		this.payp = payp;
	}

	//재정의

	@Override
	public String toString() {
		return "Cash [payno=" + payno + ", mno=" + mno + ", payp=" + payp + ", paydate=" + paydate + ", classify="
				+ classify + ", btitle=" + btitle + "]";
	}

	//Getter&Setter
	public int getPayno() {
		return payno;
	}

	public void setPayno(int payno) {
		this.payno = payno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPayp() {
		return payp;
	}

	public void setPayp(int payp) {
		this.payp = payp;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	
	
	
	
	
}	
	
	
	
	
	