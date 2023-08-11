package kr.or.ddit.vo.ljy;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderMngVO extends PagingVO<OrderMngVO> {
	private String order_no;		// 주문번호
	private String ae_id;			// 사용자 id
	private String order_ymd;		// 주문일자
	private String order_dmnd_nocs;	// 총요청건수
	private String ccg_o001;		// 결제 수단 - 1. 카드, 2. 계좌
	private int order_mileage;		// 마일리지 사용금액
	
	private List<PurchsMngVO> purchsMngList;	// 구매 목록 list
	private DeliveryMngVO deliveryMngVO;	// 배송지vo
}
