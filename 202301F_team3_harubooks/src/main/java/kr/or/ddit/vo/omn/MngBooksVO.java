package kr.or.ddit.vo.omn;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MngBooksVO {
	private String book_no;				// 도서번호
	private String book_title;			// 도서명
	private String book_content;		// 내용
	private String book_cover;			// 표지
	private String book_spmt_ymd;		// 출간일
	private String book_author;			// 저자
	private String pub_nm;				// 출판사
	private String book_talt;			// 번역자
	private String book_margin;			// 마진율
	private String book_mileage;		// 마일리지
	private String ccg_b001;			// 도서유형
	private String ccg_b002;			// 도서분류
	private String ccg_b003;			// 도서종류
	private int book_page_cnt;			// 페이지 수
	private int book_amt;				// 가격
	private int book_discount;			// 할인율
	private int book_ntsl_amt;			// 판매가격
	private String book_isbn;			// ISBN
	private String rnum;				// 순서번호
	private MultipartFile book_file;	// 첨부파일
}
