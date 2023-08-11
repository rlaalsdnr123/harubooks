package kr.or.ddit.vo.omn;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MngCategoryVO {
	private String ccg_code;	// 공통코드 그룹번호
	private String cc_nm;		// 코드이름
	private String new_cc_nm;	// 새로운 코드이름
	private String cc_yn;		// 사용여부
}
