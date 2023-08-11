package kr.or.ddit.controller.bmk.myHaru;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.bmk.IMyDiaryService;
import kr.or.ddit.vo.bmk.DiaryVO;
import kr.or.ddit.vo.bmk.Diary_PageVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/myHaru")
public class MyDiaryController {
	
	@Autowired
	private IMyDiaryService diaryService;
	
	// 나의 일기로 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/mydiary")
	public String myDiary() {
		return "myHaru/myDiary";
	}
	
	// 나의 일기 목록 출력, 페이징, 검색, 최근순/오래된순 출력
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@ResponseBody
	@GetMapping("/mydiarys")
	public Map<String, Object> getDiaryList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "order-young") String searchType,
			@RequestParam(required = false, defaultValue = "") String searchWord,
			String id) {

		Map<String, Object> dMap = new HashMap<>();
		Diary_PageVO<DiaryVO> dvo = new Diary_PageVO<DiaryVO>();
		
		dvo.setSearchType(searchType);
		dvo.setSearchWord(searchWord);
		dMap.put("searchType", searchType);
		dMap.put("searchWord", searchWord);
		
		// 최근 페이지
		dvo.setCurrentPage(currentPage);
		// id 준비
		dvo.setAe_id(id);
		int totalRecord = diaryService.selectDiaryListCount(dvo);
		dvo.setTotalRecord(totalRecord);
		int allRecord = diaryService.selectAllRecord(id); 
		dvo.setAllRecord(allRecord);
		
		
		List<DiaryVO> diaryList = diaryService.getDiaryList(dvo);
		dvo.setDataList(diaryList);
		
		dMap.put("diary", dvo);
		
		return dMap; 
	}
	
	// 나의 일기 상세 조회
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping(value = "detaildiary")
	public String getDetailDiary(@RequestParam String diary_no, Model model) {
		DiaryVO dvo = diaryService.getDetailDiary(diary_no);
		System.out.printf("---------------------------------",diary_no);
		String title = dvo.getDiary_title().toLowerCase().replaceAll("<script>",""); 
		String lastTitle = title.toLowerCase().replaceAll("</script>","");
		String content = dvo.getDiary_content().toLowerCase().replaceAll("<script>",""); 
		String lastContent = content.toLowerCase().replaceAll("</script>",""); 
		dvo.setDiary_title(lastTitle);
		dvo.setDiary_content(lastContent);
		model.addAttribute("dvo", dvo);
		return "myHaru/detail";
	}
	
	// 나의 일기 작성 폼
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping(value = "/insertform")
	public String getInsertDiary() {
		return "myHaru/form";
	}
	
	// 나의 일기 작성
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mydiary", method = RequestMethod.POST)
	public String insertDiary(DiaryVO dvo, Model model) {
		System.out.println(dvo.getAe_id());
		System.out.println(dvo.getDiary_title());
		System.out.println(dvo.getDiary_content());
		String url = "";
		int errors = 0;
		if(StringUtils.isBlank(dvo.getDiary_title())) {
			errors++;
		}
		if(StringUtils.isBlank(dvo.getDiary_content())) {
			errors++;
		}
		int result = diaryService.insertDiary(dvo);
		if(errors > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("dvo", dvo);
			url = "myHaru/form";
		}else {
			url = "redirect:/myHaru/detaildiary?diary_no="+dvo.getDiary_no();
		}
		return url;
	}
	
	// 나의 일기 수정 폼
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping(value = "/updateform")
	public String getUpdateDiary(String diary_no, Model model) {
		DiaryVO dvo = diaryService.getDetailDiary(diary_no);
		System.out.println(dvo.getDiary_no()+"------------------------"); 
		System.out.println(dvo.getAe_id()+"------------------------"); 
		System.out.println(dvo.getDiary_title()+"------------------------"); 
		System.out.println(dvo.getDiary_content()+"------------------------"); 
		model.addAttribute("dvo", dvo);
		model.addAttribute("status", "u");
		return "myHaru/form";
	}
	
	// 나의 일기 수정
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/updatediary", method = RequestMethod.POST)
	public String updateDiary(DiaryVO dvo, Model model) {
		String url = "";
		int result = diaryService.updateDiary(dvo);
		if(result < 1) {
			model.addAttribute("dvo", dvo);
			model.addAttribute("status", "u");
			url = "myHaru/form";
		}else {
			url = "redirect:/myHaru/detaildiary?diary_no="+dvo.getDiary_no();
		}
		return url;
	}
	
	// 나의 일기 삭제
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/deletediary", method = RequestMethod.POST)
	public String deleteDiary(String diary_no , Model model) {
		String url = "";
		int result = diaryService.deleteDiary(diary_no);
		if(result < 1) {
			url = "redirect:/myHaru/detaildiary?diary_no="+diary_no;
		}else {
			url = "redirect:/myHaru/mydiary";
		}
		return url;
	}
}
