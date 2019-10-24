package seller.model.vo;

import java.io.Serializable;

public class Seller implements Serializable {

	private static final long serialVersionUID = 1000L;

	private int sno;					//판매자번호(PK)
    private int mno;					//회원 번호(FK)
    private String abletime;			//연락가능시간
    private String bankname;			//계좌은행
    private String banknumber;			//계좌번호
    private int income;					//수익금
    private String careerdate1;			//경력기간1
    private String careerdate2;			//경력기간2
    private String careerdate3;			//경력기간3
    private String career1;				//경력사항1
    private String career2;				//경력사항2
    private String career3;				//경력사항3
    private String certificat1;			//자격증1
    private String certificat2;			//자격증2
    private String certificat3;			//자격증3
    private String introtext;			//소개글
    private int cpcount;				//작업 완료 건수
    private int sevaluation;			//판매자 평점
	
    
    //참고사항 - 자격증(certificate)는 이미 DB에서 사용되고있는 이름이어서 e를 뺏다.
    
    public Seller() {
	}

    //사용자가 직접 입력하는 것을 따로 받음
	public Seller(int mno, String abletime, String bankname, String banknumber, String careerdate1, String careerdate2, String careerdate3,
			String career1, String career2, String career3, String certificat1, String certificat2, String certificat3, String introtext) {
		super();
		this.mno=mno;
		this.abletime=abletime;
		this.bankname = bankname;
		this.banknumber = banknumber;
		this.careerdate1 = careerdate1;
		this.careerdate2 = careerdate2;
		this.careerdate3 = careerdate3;
		this.career1 = career1;
		this.career2 = career2;
		this.career3 = career3;
		this.certificat1 = certificat1;
		this.certificat2 = certificat2;
		this.certificat3 = certificat3;
		this.introtext = introtext;
	}

	public Seller(int sno, int mno, String abletime, String bankname, String banknumber, int income, String careerdate1,
			String careerdate2, String careerdate3, String career1, String career2, String career3, String certificat1,
			String certificat2, String certificat3, String introtext, int cpcount, int sevaluation) {
		super();
		this.sno = sno;
		this.mno = mno;
		this.abletime=abletime;
		this.bankname = bankname;
		this.banknumber = banknumber;
		this.income = income;
		this.careerdate1 = careerdate1;
		this.careerdate2 = careerdate2;
		this.careerdate3 = careerdate3;
		this.career1 = career1;
		this.career2 = career2;
		this.career3 = career3;
		this.certificat1 = certificat1;
		this.certificat2 = certificat2;
		this.certificat3 = certificat3;
		this.introtext = introtext;
		this.cpcount = cpcount;
		this.sevaluation = sevaluation;
	}


	//객체 이름으로 모든 내용 조회하기
	@Override
	public String toString() {
		return "Seller [sno=" + sno + ", mno=" + mno + ", abletime=" + abletime + ", bankname=" + bankname
				+ ", banknumber=" + banknumber + ", income=" + income + ", careerdate1=" + careerdate1
				+ ", careerdate2=" + careerdate2 + ", careerdate3=" + careerdate3 + ", career1=" + career1
				+ ", career2=" + career2 + ", career3=" + career3 + ", certificat1=" + certificat1 + ", certificat2="
				+ certificat2 + ", certificat3=" + certificat3 + ", introtext=" + introtext + ", cpcount=" + cpcount
				+ ", sevaluation=" + sevaluation + "]";
	}
	
	
	//필드 변수에 대한 Getter Setter
	public int getSno() {
		return sno;
	}


	

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	
	public String getAbletime() {
		return abletime;
	}

	public void setAbletime(String abletime) {
		this.abletime = abletime;
	}

	
	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getBanknumber() {
		return banknumber;
	}

	public void setBanknumber(String banknumber) {
		this.banknumber = banknumber;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public String getCareerdate1() {
		return careerdate1;
	}

	public void setCareerdate1(String careerdate1) {
		this.careerdate1 = careerdate1;
	}

	public String getCareerdate2() {
		return careerdate2;
	}

	public void setCareerdate2(String careerdate2) {
		this.careerdate2 = careerdate2;
	}

	public String getCareerdate3() {
		return careerdate3;
	}

	public void setCareerdate3(String careerdate3) {
		this.careerdate3 = careerdate3;
	}

	public String getCareer1() {
		return career1;
	}

	public void setCareer1(String career1) {
		this.career1 = career1;
	}

	public String getCareer2() {
		return career2;
	}

	public void setCareer2(String career2) {
		this.career2 = career2;
	}

	public String getCareer3() {
		return career3;
	}

	public void setCareer3(String career3) {
		this.career3 = career3;
	}

	public String getCertificat1() {
		return certificat1;
	}

	public void setCertificat1(String certificat1) {
		this.certificat1 = certificat1;
	}

	public String getCertificat2() {
		return certificat2;
	}

	public void setCertificat2(String certificat2) {
		this.certificat2 = certificat2;
	}

	public String getCertificat3() {
		return certificat3;
	}

	public void setCertificat3(String certificat3) {
		this.certificat3 = certificat3;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
