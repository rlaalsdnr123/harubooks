package kr.or.ddit.vo.kmw;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RefundVO {
	private String order_no;	// 주문 번호
	private String book_no;		// 책 번호
	private String ae_id;		// 사용자 아이디
	private String rr_actno;	// 환불계좌
	private String rr_ymd;		// 환불요청일자
	private String rr_content;	// 요청내용
	private String ua_no;		// 통합 첨부파일 번호
	private String rr_bank;		// 환불 은행
	private String ccg_i001;	// 1.환불 대기, 2.환불 완료
	private String fileName;	// uuid포함 파일이름
	private MultipartFile refund_file; // 첨부파일
}
