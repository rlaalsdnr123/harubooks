package kr.or.ddit.service.omn.mbr;

import java.util.List;

import kr.or.ddit.vo.omn.MngMbrVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;

public interface IMngMbrService {
	public List<MngMbrVO> mbrList();
	public List<MngMbrVO> selectMbrList(MngPaginationInfoVO<MngMbrVO> pagingVO);
	public int mbrCount(MngPaginationInfoVO<MngMbrVO> pagingVO);
	public int mbrAllCount(String ae_id);
	public MngMbrVO mbrInfo(String ae_id);
	public int mbrUpdate(MngMbrVO mngMbrVO);
	public int mbrDelete(String ae_id);
}
