package sellerboard.model.vo;

public class Top5 {
	private String Top1;
	private String Top2;
	private String Top3;
	private String nickname;
	private int income;
	private int rownum;
	private String cate;
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTop1() {
		return Top1;
	}
	public void setTop1(String top1) {
		Top1 = top1;
	}
	public String getTop2() {
		return Top2;
	}
	public void setTop2(String top2) {
		Top2 = top2;
	}
	public String getTop3() {
		return Top3;
	}
	public void setTop3(String top3) {
		Top3 = top3;
	}
	public String getNickname() {
		return nickname;
	}
	public Top5(String top1, String top2, String top3) {
		super();
		Top1 = top1;
		Top2 = top2;
		Top3 = top3;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "Top5 [Top1=" + Top1 + ", Top2=" + Top2 + ", Top3=" + Top3 + ", nickname=" + nickname + ", income="
				+ income + ", rownum=" + rownum + "]";
	}
	public Top5(String nickname, int income, int rownum) {
		super();
		this.nickname = nickname;
		this.income = income;
		this.rownum = rownum;
	}
	public Top5() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
