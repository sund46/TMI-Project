package sellerboard.model.vo;

public class Talent {
	private String talent1;
	private String talent2;
	private String talent1code;
	private String talent2code;
	
	
	public Talent(String talent1, String talent2) {
		super();
		this.talent1 = talent1;
		this.talent2 = talent2;
	}
	public String getTalent1code() {
		return talent1code;
	}
	public void setTalent1code(String talent1code) {
		this.talent1code = talent1code;
	}
	public String getTalent2code() {
		return talent2code;
	}
	public void setTalent2code(String talent2code) {
		this.talent2code = talent2code;
	}
	public Talent() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTalent1() {
		return talent1;
	}
	public void setTalent1(String talent1) {
		this.talent1 = talent1;
	}
	public String getTalent2() {
		return talent2;
	}
	public void setTalent2(String talent2) {
		this.talent2 = talent2;
	}
	@Override
	public String toString() {
		return "Talent [talent1=" + talent1 + ", talent2=" + talent2 + ", talent1code=" + talent1code + ", talent2code="
				+ talent2code + "]";
	}
	
	
	
	

}
