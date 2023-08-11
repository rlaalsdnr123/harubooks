package kr.or.ddit.vo.omn;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MngPaginationInfoVO<T> {
	private int allRecord;			// 총 도서/회원 수
	private int totalRecord;		// 검색 조건에 맞는 도서/회원 수
	private int totalPage;			// 총 페이지 수
	private int currentPage;		// 현재 페이지
	private int screenSize = 10;	// 한 페이지 당 보여지는 도서/회원 수
	private int blockSize = 5;		// 페이지 블록 수
	private int startRow;			// 한 페이지 내 시작 도서/회원
	private int endRow;				// 한 페이지 내 끝 도서/회원
	private int startPage;			// 시작 페이지
	private int endPage;			// 끝 페이지
	private List<T> dataList;		// 검색 결과 list
	private String searchType;		// 검색 타입
	private String searchWord;		// 검색어
	private String book_no;			// 도서번호
	private String ae_id;			// 아이디
	private String order_no;		// 주문번호
	private int bm_cnt_status;		// 재고 상태
	private String nbr_no;			// 요청번호
	
	public MngPaginationInfoVO() {}
	
	public MngPaginationInfoVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (int)Math.ceil(totalRecord / (double)screenSize);
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow =  endRow - (screenSize - 1);
		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
	      
	      html.append("<ul class='pagination m-0 justify-content-center'>");
	      if(startPage >1) {
	         html.append("<li class='page-item'><a href='' class='page-link' data-page='"+(startPage - blockSize) + "'>"
	               + "<</a></li>");
	      }
	      for(int i = startPage; i<= (endPage < totalPage ? endPage : totalPage); i++) {
	         if(i == currentPage) {
	            html.append("<li class='page-item active'><span class='page-link'>"+i+"</span></li>");
	         } else {
	            html.append("<li class='page-item'><a href='' class='page-link' data-page='"+i+"'>"+i+"</a></li>");
	         }
	      }
	      if(endPage < totalPage) {
	         html.append("<li class='page-item'><a href='' class='page-link' data-page='"+(endPage+1)+"'>"
	               + "></a></li>");
	      }
	      html.append("</ul>");
	      return html.toString();
	}
}
