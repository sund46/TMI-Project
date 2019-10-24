package buyingctrl.model.vo;

import java.sql.Date;

public class DealMng {
	
	private int dmcode;
	private int bno;
	private int mno;
	private int sno;
	private String progress;
	private Date dealdate;
	private int deitcount;
	private String completeyn;
	private Date completedate;
	
	private String images;
	private String btitle;
	private int price;
	private String nickname;
	private String sNickname;
	
	public String getsNickname() {
		return sNickname;
	}








	public void setsNickname(String sNickname) {
		this.sNickname = sNickname;
	}








	public DealMng() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	
	



public DealMng(int dmcode, int bno, int mno, int sno, String progress, Date dealdate, int deitcount,
			String completeyn, Date completedate, String images, String btitle, int price, String nickname) {
		super();
		this.dmcode = dmcode;
		this.bno = bno;
		this.mno = mno;
		this.sno = sno;
		this.progress = progress;
		this.dealdate = dealdate;
		this.deitcount = deitcount;
		this.completeyn = completeyn;
		this.completedate = completedate;
		this.images = images;
		this.btitle = btitle;
		this.price = price;
		this.nickname = nickname;
	}








//조회(전체,진해중,완료,취소)
public DealMng(int dmcode, String progress, Date dealdate, String btitle, int price, String nickname) {
	super();
	this.dmcode = dmcode;
	this.progress = progress;
	this.dealdate = dealdate;
	this.btitle = btitle;
	this.price = price;
	this.nickname = nickname;
}
	


	


	
	







	@Override
public String toString() {
	return "DealMng [dmcode=" + dmcode + ", bno=" + bno + ", mno=" + mno + ", sno=" + sno + ", progress=" + progress
			+ ", dealdate=" + dealdate + ", deitcount=" + deitcount + ", completeyn=" + completeyn + ", completedate="
			+ completedate + ", images=" + images + ", btitle=" + btitle + ", price=" + price + ", nickname=" + nickname
			+ ", sNickname=" + sNickname + "]";
}








	public int getDmcode() {
		return dmcode;
	}


	public void setDmcode(int dmcode) {
		this.dmcode = dmcode;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getProgress() {
		return progress;
	}


	public void setProgress(String progress) {
		this.progress = progress;
	}


	public Date getDealdate() {
		return dealdate;
	}


	public void setDealdate(Date dealdate) {
		this.dealdate = dealdate;
	}


	public int getDeitcount() {
		return deitcount;
	}


	public void setDeitcount(int deitcount) {
		this.deitcount = deitcount;
	}


	public String getCompleteyn() {
		return completeyn;
	}


	public void setCompleteyn(String completeyn) {
		this.completeyn = completeyn;
	}


	public Date getCompletedate() {
		return completedate;
	}


	public void setCompletedate(Date completedate) {
		this.completedate = completedate;
	}
	

	public String getImages() {
		return images;
	}


	public void setImages(String images) {
		this.images = images;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
	
}
