package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ClientRequest implements Serializable{
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 5000L;

	public ClientRequest() {
	
	}
	
	
		private int rno;
		private String email;
		private String rTitle;
		private String rContent;
		private String NickName;
		private Date rDate;
		private String reply;
		private String replyTitle;
		private String replyContent;
		
		public ClientRequest(String email, String rTitle, String rContent, String nickName, Date rDate) {
			super();
			this.email = email;
			this.rTitle = rTitle;
			this.rContent = rContent;
			NickName = nickName;
			this.rDate = rDate;
		}


		public ClientRequest(String email, String rTitle, String rContent, String nickName) {
			super();
			this.email = email;
			this.rTitle = rTitle;
			this.rContent = rContent;
			NickName = nickName;
		}
		
		
		


		public ClientRequest(int rno, String rTitle, String rContent) {
			super();
			this.rno = rno;
			this.rTitle = rTitle;
			this.rContent = rContent;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getrTitle() {
			return rTitle;
		}


		public void setrTitle(String rTitle) {
			this.rTitle = rTitle;
		}


		public String getrContent() {
			return rContent;
		}


		public void setrContent(String rContent) {
			this.rContent = rContent;
		}


		public String getNickName() {
			return NickName;
		}


		public void setNickName(String nickName) {
			NickName = nickName;
		}


		public Date getrDate() {
			return rDate;
		}


		public void setrDate(Date rDate) {
			this.rDate = rDate;
		}

		
		

		public String getReply() {
			return reply;
		}


		public void setReply(String reply) {
			this.reply = reply;
		}

		
		
		
		



		public int getRno() {
			return rno;
		}


		public void setRno(int rno) {
			this.rno = rno;
		}
		
		
		
		


		public String getReplyTitle() {
			return replyTitle;
		}


		public void setReplyTitle(String replyTitle) {
			this.replyTitle = replyTitle;
		}


		public String getReplyContent() {
			return replyContent;
		}


		public void setReplyContent(String replyContent) {
			this.replyContent = replyContent;
		}


		@Override
		public String toString() {
			return "ClientRequest [email=" + email + ", rTitle=" + rTitle + ", rContent=" + rContent + ", NickName="
					+ NickName + ", rDate=" + rDate + "]";
		}
		
		
		
		
		

}
