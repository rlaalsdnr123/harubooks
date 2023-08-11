package kr.or.ddit.mapper.ljy;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ljy.RemainMngVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

public interface RemainMngMapper {

	public List<RemainMngVO> remainList(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO);

	public int remainListCnt(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO);

	public RemainMngVO remainOne(String book_no);

	public List<RemainMngVO> remainDangerList();

	public List<RemainMngVO> remainPubList(RemainMngVO remainMngVO);

	public void updateBmCnt(Map<String, String> map);

	public int remainPubListCnt(RemainMngVO remainMngVO);

	public void booksInsert(String book_no);

}
