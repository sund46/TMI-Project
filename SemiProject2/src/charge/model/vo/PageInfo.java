package charge.model.vo;

import java.io.Serializable;

	public class PageInfo implements Serializable {

		private int currentPage; //현재 페이지
		private int listCount;
		private int limit; //제한
		private int maxPage;
		private int startPage;
		private int endPage;
		
		// 기본 생성자
		public PageInfo() {	}

		// 매개변수 전부 받는 생성자
		public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
			super();
			this.currentPage = currentPage;
			this.listCount = listCount;
			this.limit = limit;
			this.maxPage = maxPage;
			this.startPage = startPage;
			this.endPage = endPage;
		}

		// Getter & Setter
		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getListCount() {
			return listCount;
		}

		public void setListCount(int listCount) {
			this.listCount = listCount;
		}

		public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}

		public int getMaxPage() {
			return maxPage;
		}

		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endpage) {
			this.endPage = endpage;
		}
}
