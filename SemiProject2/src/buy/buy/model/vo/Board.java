 package buy.buy.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	private static final long serialVersionUID = 100L;
	
	private int bno;
	private int sno;
	private String btitle;
	private String bcontent;
	private String erecontent;
	private String request;
	private String category1_code;
	private String category2_code;
	private int price;
	private int bevaluation;
	private String images;
	private int editablecount;
	private int duedate;
	private int speed;
	private int plusedit;
	private String ad;
	private int adexpire;
	private Date intbdate;
	
	
	public Board() {

	}


	public Board(int bno, int sno, String btitle, String bcontent, String erecontent, String request,
			String category1_code, String category2_code, int price, int bevaluation, String images, int editablecount,
			int duedate, int speed, int plusedit, String ad, int adexpire, Date intbdate) {
		super();
		this.bno = bno;
		this.sno = sno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.erecontent = erecontent;
		this.request = request;
		this.category1_code = category1_code;
		this.category2_code = category2_code;
		this.price = price;
		this.bevaluation = bevaluation;
		this.images = images;
		this.editablecount = editablecount;
		this.duedate = duedate;
		this.speed = speed;
		this.plusedit = plusedit;
		this.ad = ad;
		this.adexpire = adexpire;
		this.intbdate = intbdate;
	}
	
	

	public Board(int bno, int sno, String btitle, int price, String images, int speed, int plusedit) {
		super();
		this.bno = bno;
		this.sno = sno;
		this.btitle = btitle;
		this.price = price;
		this.images = images;
		this.speed = speed;
		this.plusedit = plusedit;
	}

	// 게시물 상세보기
	public Board(int bno, int sno, String btitle, String bcontent, String erecontent, String request,
			String category1_code, String category2_code, int price, int bevaluation, String images, int editablecount,
			int duedate, int speed, int plusedit) {
		super();
		this.bno = bno;
		this.sno = sno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.erecontent = erecontent;
		this.request = request;
		this.category1_code = category1_code;
		this.category2_code = category2_code;
		this.price = price;
		this.bevaluation = bevaluation;
		this.images = images;
		this.editablecount = editablecount;
		this.duedate = duedate;
		this.speed = speed;
		this.plusedit = plusedit;
	}
	
	
	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public String getErecontent() {
		return erecontent;
	}


	public void setErecontent(String erecontent) {
		this.erecontent = erecontent;
	}


	public String getRequest() {
		return request;
	}


	public void setRequest(String request) {
		this.request = request;
	}


	public String getCategory1_code() {
		return category1_code;
	}


	public void setCategory1_code(String category1_code) {
		this.category1_code = category1_code;
	}


	public String getCategory2_code() {
		return category2_code;
	}


	public void setCategory2_code(String category2_code) {
		this.category2_code = category2_code;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getBevaluation() {
		return bevaluation;
	}


	public void setBevaluation(int bevaluation) {
		this.bevaluation = bevaluation;
	}


	public String getImages() {
		return images;
	}


	public void setImages(String images) {
		this.images = images;
	}


	public int getEditablecount() {
		return editablecount;
	}


	public void setEditablecount(int editablecount) {
		this.editablecount = editablecount;
	}


	public int getDuedate() {
		return duedate;
	}


	public void setDuedate(int duedate) {
		this.duedate = duedate;
	}


	public int getSpeed() {
		return speed;
	}


	public void setSpeed(int speed) {
		this.speed = speed;
	}


	public int getPlusedit() {
		return plusedit;
	}


	public void setPlusedit(int plusedit) {
		this.plusedit = plusedit;
	}


	public String getAd() {
		return ad;
	}


	public void setAd(String ad) {
		this.ad = ad;
	}


	public int getAdexpire() {
		return adexpire;
	}


	public void setAdexpire(int adexpire) {
		this.adexpire = adexpire;
	}


	public Date getIntbdate() {
		return intbdate;
	}


	public void setIntbdate(Date intbdate) {
		this.intbdate = intbdate;
	}


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", sno=" + sno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", erecontent="
				+ erecontent + ", request=" + request + ", category1_code=" + category1_code + ", category2_code="
				+ category2_code + ", price=" + price + ", bevaluation=" + bevaluation + ", images=" + images
				+ ", editablecount=" + editablecount + ", duedate=" + duedate + ", speed=" + speed + ", plusedit="
				+ plusedit + ", ad=" + ad + ", adexpire=" + adexpire + ", intbdate=" + intbdate + "]";
	}
	
	
	
	
	
	
}
