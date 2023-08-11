package kr.or.ddit.service.ljy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ljy.PoMngMapper;
import kr.or.ddit.mapper.ljy.RemainMngMapper;
import kr.or.ddit.vo.ljy.PoMngVO;
import kr.or.ddit.vo.ljy.RemainMngVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PoScheduler {
	
	@Autowired
	private RemainMngMapper remainMapper;
	
	@Autowired
	private PoMngMapper poMapper;
	
	//@Scheduled(cron = "*/5 * * * * *")
	//@Scheduled(fixedDelay = 5000)
	public void autoPoReq() {
		log.info("자동발주 시작");
		List<RemainMngVO> remainDangerList = remainMapper.remainDangerList();// 6개
		List<PoMngVO> poWaitingList = poMapper.poWaitingList();// 34개
		for (RemainMngVO remainMngVO : remainDangerList) {
			for (PoMngVO poMngVO : poWaitingList) {
			//log.info("remainMngVO" + "");
				if(poMngVO.getBook_no().equals(remainMngVO.getBook_no())) {
					log.info(remainMngVO + "이미 대기목록 존재");
					break;
				} 
				PoMngVO newPoMngVO = new PoMngVO();
				newPoMngVO.setBook_no(remainMngVO.getBook_no());
				newPoMngVO.setPub_nm(remainMngVO.getPub_nm());
				int book_qty = remainMngVO.getBm_bsc_cnt() - remainMngVO.getBm_cnt();
				newPoMngVO.setBook_qty(book_qty);
				log.info("newPoMngVO 자동발주 insert" + newPoMngVO);
				//poMapper.poAuto(poMngVO);
			}
		}
	}
}
