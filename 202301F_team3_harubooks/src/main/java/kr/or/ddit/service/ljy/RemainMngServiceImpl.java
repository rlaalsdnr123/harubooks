package kr.or.ddit.service.ljy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.ljy.excel.ExcelUtils;
import kr.or.ddit.mapper.ljy.PoMngMapper;
import kr.or.ddit.mapper.ljy.PubMngMapper;
import kr.or.ddit.mapper.ljy.RemainMngMapper;
import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.PubMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RemainMngServiceImpl implements RemainMngService {
	
	@Resource(name="uploadExcel")
	private String filePath;
	
	@Autowired
	private RemainMngMapper remainMapper;
	@Autowired
	private PoMngMapper poMapper;
	@Autowired
	private PubMngMapper pubMapper;
	
	
	@Override
	public List<RemainMngVO> remainList(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO) {
		return remainMapper.remainList(mngPaginationInfoVO);
	}

	@Override
	public int remainListCnt(MngPaginationInfoVO<RemainMngVO> mngPaginationInfoVO) {
		return remainMapper.remainListCnt(mngPaginationInfoVO);
	}

	@Override
	public int poOne(PoMngVO poMngVO) {
		return poMapper.poOne(poMngVO);
	}

	@Override
	public RemainMngVO remainOne(String book_no) {
		return remainMapper.remainOne(book_no);
	}

	@Override
	public int poListCnt(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO) {
		return poMapper.poListCnt(mngPaginationInfoVO);
	}

	@Override
	public List<PoMngVO> poList(MngPaginationInfoVO<PoMngVO> mngPaginationInfoVO) {
		return poMapper.poList(mngPaginationInfoVO);
	}
	
	// 관리자 발주 요청 -> 관리자 발주서 생성
	@Override
	public String poReqList(List<PoMngVO> poList) {
		String pub_nm = poList.get(0).getPub_nm();
		PubMngVO pubMngVO = pubMapper.getPub(pub_nm);
		List<PoMngVO> excelList = new ArrayList<PoMngVO>();
		int cnt = 0;
		String rslt = "";
		for (int i = 0; i < poList.size(); i++) {
			PoMngVO poMngVO = poList.get(i);
			int res = poMapper.poOne(poMngVO);
			if(res > 0 ) {
				cnt++;
			} else {
				rslt += poList.get(i).getBook_no()+ "_" + poList.get(i).getBook_qty() + "_" + poList.get(i).getAe_id() + "/";
			}
		}
		if(cnt == poList.size()) {
			rslt = "success";
			for(int i=0; i<poList.size(); i++) {
				PoMngVO poMngVO = poList.get(i);
				PoMngVO excelVO = poMapper.getPo(poMngVO.getBr_no());
				excelList.add(excelVO);
			}
			try {
				ExcelUtils.createPoExcel(filePath, pubMngVO, excelList);
				log.info("excelutil 실행");
			} catch (IOException e) {
				log.error("수동 발주 발주서 저장 실패" + excelList);
			}
		} else {
			rslt += "fail";
		}
		return rslt;
	}

	@Override
	public List<RemainMngVO> remainPubList(RemainMngVO remainMngVO) {
		return remainMapper.remainPubList(remainMngVO);
	}

	@Override
	public List<PoMngVO> poPubList(PoMngVO poMngVO) {
		return poMapper.poPubList(poMngVO);
	}

	// 출판사 발주 승인 -> 발주서 승인 처리
	@Override
	public String poReqPub(List<PoMngVO> poreqPubList) {
		Map<String,String> map = new HashMap<String, String>();
		Map<String,String> statmap = new HashMap<String, String>();
		statmap.put("status", "승인");
		int cnt = 0;
		String rslt = "";
		for (int i = 0; i < poreqPubList.size(); i++) {
			PoMngVO poMngVO = poreqPubList.get(i);
			int res = poMapper.updatePoReqPub(poMngVO);
			map.put("book_no", poMngVO.getBook_no());
			map.put("book_qty", poMngVO.getBook_qty()+"");
			remainMapper.updateBmCnt(map);
			log.info("Excel 수정 실행");
			if(res > 0 ) {
				cnt++;
				try {
					ExcelUtils.modifyPoExcel(filePath, poMngVO, statmap);
				} catch (IOException e) {
					log.error("수동 발주 발주서 저장 실패" + poMngVO);
				}
			} else {
				rslt += poreqPubList.get(i).getBook_no()+ "_" + poreqPubList.get(i).getBook_qty() + "_" + poreqPubList.get(i).getAe_id() + "/";
			}
		}
		if(cnt == poreqPubList.size()) {
			rslt = "success";
		} else {
			rslt += "fail";
		}
		return rslt;
	}

	@Override
	public String poRejPub(List<PoMngVO> porejPubList) {
		int cnt = 0;
		String rslt = "";
		Map<String,String> statmap = new HashMap<String, String>();
		statmap.put("status", "거절");
		for (int i = 0; i < porejPubList.size(); i++) {
			PoMngVO poMngVO = porejPubList.get(i);
			int res = poMapper.updatePoRejPub(poMngVO);
			if(res > 0 ) {
				cnt++;
				try {
					ExcelUtils.modifyPoExcel(filePath, poMngVO, statmap);
				} catch (IOException e) {
					log.error("수동 발주 발주서 저장 실패" + poMngVO);
				}
			} else {
				rslt += porejPubList.get(i).getBook_no()+ "_" + porejPubList.get(i).getBook_qty() + "_" + porejPubList.get(i).getAe_id() + "/";
			}
		}
		if(cnt == porejPubList.size()) {
			rslt = "success";
		} else {
			rslt += "fail";
		}
		return rslt;
	}

	@Override
	public int remainPubListCnt(RemainMngVO remainMngVO) {
		return remainMapper.remainPubListCnt(remainMngVO);
	}
	
	@Override
	public int waitCnt(PoMngVO poMngVO) {
		return poMapper.waitCnt(poMngVO);
	}

	@Override
	public int acceptCnt(PoMngVO poMngVO) {
		return poMapper.acceptCnt(poMngVO);
	}

	@Override
	public int refuseCnt(PoMngVO poMngVO) {
		return poMapper.refuseCnt(poMngVO);
	}

	@Override
	public PoMngVO getPo(String br_no) {
		return poMapper.getPo(br_no);
	}

	@Override
	public List<PoMngVO> poSearch(Map<String, String> poSearchMap) {
		return poMapper.poSearch(poSearchMap);
	}
}
