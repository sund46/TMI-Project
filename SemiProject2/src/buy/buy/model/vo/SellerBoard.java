package buy.buy.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SellerBoard implements Serializable{
   private static final long serialVersionUID = 1L;

   private int bno;                   //판매글 번호(PK)
   private int sno;                   //판매자 번호(FK)
   private String btitle;                //제목
   private String bcontent;             //상세 설명
   private String erecontent;             //수정 및 재진행 안내
   private String request;             //작업 전 요청사항
   private String category1_code;          //상위 카테고리
   private String category2_code;          //하위 카테고리
   private int price;                   //가격
   private int bevaluation;             //평점
   private String images;                //이미지들
   private int editablecount;             //수정 횟수
   private int duedate;                //작업 기간
   private int speed;                   //빠른 작업(옵션)
   private int plusedit;                //추가 수정(옵션)
   private String ad;                   //광고여부[Y,N]
   private int adexpire;                //광고 만료일
   private Date bdate;                //작성일
   private String state;                //진행 상태
   private int extradate1;             //빠른 작업 일수
   private int extradate2;             //추가 수정 회수
   private String introtext;			//seller소개
   private int cpcount;					//seller 작업갯수
   private int sevaluation;				//seller 평점
   private String nickname;			//닉네임
   
   
   
   

	
   public SellerBoard(int bno, int sno, String btitle, String bcontent, String erecontent, String request,
		String category1_code, String category2_code, int price, int bevaluation, String images, int editablecount,
		int duedate, int speed, int plusedit, String ad, int adexpire, Date bdate, String state, int extradate1,
		int extradate2, String introtext, int cpcount, int sevaluation, String nickname) {
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
	this.bdate = bdate;
	this.state = state;
	this.extradate1 = extradate1;
	this.extradate2 = extradate2;
	this.introtext = introtext;
	this.cpcount = cpcount;
	this.sevaluation = sevaluation;
	this.nickname = nickname;
}

public String getNickname() {
	return nickname;
}

public void setNickname(String nickname) {
	this.nickname = nickname;
}

public SellerBoard(int bno, int sno, String btitle, String bcontent, String erecontent, String request,
		String category1_code, String category2_code, int price, int bevaluation, String images, int editablecount,
		int duedate, int speed, int plusedit, String ad, int adexpire, Date bdate, String state, int extradate1,
		int extradate2, String introtext, int cpcount, int sevaluation) {
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
	this.bdate = bdate;
	this.state = state;
	this.extradate1 = extradate1;
	this.extradate2 = extradate2;
	this.introtext = introtext;
	this.cpcount = cpcount;
	this.sevaluation = sevaluation;
}

public String getIntrotext() {
	return introtext;
}

public void setIntrotext(String introtext) {
	this.introtext = introtext;
}

public int getCpcount() {
	return cpcount;
}

public void setCpcount(int cpcount) {
	this.cpcount = cpcount;
}

public int getSevaluation() {
	return sevaluation;
}

public void setSevaluation(int sevaluation) {
	this.sevaluation = sevaluation;
}

public SellerBoard() {
      super();
   }

   //사용자가 직접 입력하는 것을 따로 받음
   public SellerBoard(String btitle, String bcontent, String erecontent, String request, String category1_code,
         String category2_code, int price, String images, int editablecount, int duedate, int speed, int plusedit, int extradate1, int extradate2) {
      super();
      this.btitle = btitle;
      this.bcontent = bcontent;
      this.erecontent = erecontent;
      this.request = request;
      this.category1_code = category1_code;
      this.category2_code = category2_code;
      this.price = price;
      this.images = images;
      this.editablecount = editablecount;
      this.duedate = duedate;
      this.speed = speed;
      this.plusedit = plusedit;
      this.extradate1 = extradate1;
      this.extradate2 = extradate2;
   }
   
   
   public SellerBoard(int bno, int sno, String btitle, String bcontent, String erecontent, String request,
         String category1_code, String category2_code, int price, int bevaluation, String images, int editablecount,
         int duedate, int speed, int plusedit, String ad, int adexpire, Date bdate, String state) {
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
      this.bdate = bdate;
      this.state = state;
   }

   @Override
public String toString() {
	return "SellerBoard [bno=" + bno + ", sno=" + sno + ", btitle=" + btitle + ", bcontent=" + bcontent
			+ ", erecontent=" + erecontent + ", request=" + request + ", category1_code=" + category1_code
			+ ", category2_code=" + category2_code + ", price=" + price + ", bevaluation=" + bevaluation + ", images="
			+ images + ", editablecount=" + editablecount + ", duedate=" + duedate + ", speed=" + speed + ", plusedit="
			+ plusedit + ", ad=" + ad + ", adexpire=" + adexpire + ", bdate=" + bdate + ", state=" + state
			+ ", extradate1=" + extradate1 + ", extradate2=" + extradate2 + ", introtext=" + introtext + ", cpcount="
			+ cpcount + ", sevaluation=" + sevaluation + "]";
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

   public Date getBdate() {
      return bdate;
   }

   public void setBdate(Date bdate) {
      this.bdate = bdate;
   }

   public String getState() {
      return state;
   }

   public void setState(String state) {
      this.state = state;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   public int getExtradate1() {
      return extradate1;
   }

   public void setExtradate1(int extradate1) {
      this.extradate1 = extradate1;
   }

   public int getExtradate2() {
      return extradate2;
   }

   public void setExtradate2(int extradate2) {
      this.extradate2 = extradate2;
   }
}