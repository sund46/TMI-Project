package member.model.vo;
import java.io.Serializable;
import java.sql.Date;

// VO : 데이터 전달용 바구니

public class Member implements Serializable {

	private static final long serialVersionUID = 1000L;
	
	/* DB 테이블 명
	USERID , PASSWORD, USERNAME, GENDER, AGE, EMAIL, PHONE
	ADDRESS,HOBBY, ENROLLDATE */
	
	// 1. 필드변수(멤버변수)
	
	private String email; // 이메일
	private String userPwd; // 사용자 비밀번호
	private String userName; // 사용자 이름
	private String memberSSN; // 사용자 주민번호
	private String nickName;
	private String phone; // 전화번호
	
	private Date enrollDate; // 가입날짜(java.sql.Date ==> DB로 보내기 위한 Date 클래스)
	private String emailVerification;
	private int cash;
	private String isSeller;
	private String profileImage;
	private String callTime;
	private String isAlive;
	private String coupon;
	private String isSNS;
	private int documentCnt;
	private int mno;
	private String isValid;
	private String isAdmin;
	
	
	// 2. 생성자
	public Member() {};
	
	
	// 3-1 로그인용 생성자
	public Member(String email, String userPwd) {
		super();
		this.email = email;
		this.userPwd = userPwd;
	}

	
	
	
	

	// 3-2 회원 가입용 생성자
	public Member(String email, String userPwd, String userName, String nickName, String phone, String memberSSN, String isSNS) {
		super();
		this.email = email;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.memberSSN = memberSSN;
		this.isSNS = isSNS;
		this.nickName = nickName;
	}
	
	
	

	// 3-4 회원의 전체 데이터를 가져오기 위한 생성자
	// 사용하나?
	public Member(String email, String userPwd, String userName, String memberSSN, String phone, Date enrollDate,
			String emailVerification, int cash, String isSeller, String profileImage, String callTime, String isAlive,
			String coupon, String nickName) {
		super();
		this.email = email;
		this.userPwd = userPwd;
		this.userName = userName;
		this.memberSSN = memberSSN;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.emailVerification = emailVerification;
		this.cash = cash;
		this.isSeller = isSeller;
		this.profileImage = profileImage;
		this.callTime = callTime;
		this.isAlive = isAlive;
		this.coupon = coupon;
		this.nickName = nickName;
	}

	
	
	// 회원 정보 수정할 때 사용할 생성자
	public Member(String email, String userPwd, String phone) {
		super();
		this.email = email;
		this.userPwd = userPwd;
		this.phone = phone;
	}

	// 캐시 충전할 때 사용할 생성자
		public Member(int cash) {
			super();
			this.cash = cash;
		}
	


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}
	
	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getEmailVerification() {
		
		return emailVerification;
	}

	
	public String getMemberSSN() {
		return memberSSN;
	}

	public void setMemberSSN(String memberSSN) {
		this.memberSSN = memberSSN;
	}
	
	public String getIsSNS() {
		return isSNS;
	}

	public void setIsSNS(String isSNS) {
		this.isSNS = isSNS;
	}


	
	


	public int getDocumentCnt() {
		return documentCnt;
	}


	public void setDocumentCnt(int documentCnt) {
		this.documentCnt = documentCnt;
	}


	@Override
	public String toString() {
		return "Member [email=" + email + ", userPwd=" + userPwd + ", userName=" + userName + ", memberSSN=" + memberSSN
				+ ", nickName=" + nickName + ", phone=" + phone + ", enrollDate=" + enrollDate + ", emailVerification="
				+ emailVerification + ", cash=" + cash + ", isSeller=" + isSeller + ", profileImage=" + profileImage
				+ ", callTime=" + callTime + ", isAlive=" + isAlive + ", coupon=" + coupon + ", isSNS=" + isSNS
				+ ", mno=" + mno + "]";
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	public void setEmailVerification(String emailVerification) {
		this.emailVerification = emailVerification;
	}
	
	public void setSid(String userName, String memberSSN) {  // 아이디 찾기용 메소드
		this.userName = userName;
		this.memberSSN = memberSSN;
	}
	
	public void setSpwd(String email, String userName, String memberSSN) { // 비밀번호 찾기용 메소드
		this.email = email;
		this.userName = userName;
		this.memberSSN = memberSSN;
	}


	public int getCash() {
		return cash;
	}


	public void setCash(int cash) {
		this.cash = cash;
	}


	public String getIsSeller() {
		return isSeller;
	}


	public void setIsSeller(String isSeller) {
		this.isSeller = isSeller;
	}


	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getCallTime() {
		return callTime;
	}


	public void setCallTime(String callTime) {
		this.callTime = callTime;
	}


	public String getIsAlive() {
		return isAlive;
	}


	public void setIsAlive(String isAlive) {
		this.isAlive = isAlive;
	}


	public String getCoupon() {
		return coupon;
	}


	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	
	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getIsValid() {
		return isValid;
	}


	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}


	public String getIsAdmin() {
		return isAdmin;
	}


	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	
	
	
	
	
}
