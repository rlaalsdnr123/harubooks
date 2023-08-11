package kr.or.ddit.service.omn.books;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.file.UploadFileUtils;
import kr.or.ddit.mapper.omn.books.PubBookRequestMapper;
import kr.or.ddit.service.FileService;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.omn.MngPaginationInfoVO;
import kr.or.ddit.vo.omn.NewBookRequestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PubBookRequestServiceImpl implements IPubBookRequestService{
	
	// 첨부 파일 저장 경로 - root-context.xml에 설정
	@Resource(name="uploadImg")
	private String uploadPath;
	
	@Inject
	private PubBookRequestMapper mapper;
	
	@Inject
	private FileService fileService;
	
	@Override
	public List<NewBookRequestVO> requestList() {
		return mapper.requestList();
	}

	@Override
	public int requestCount(MngPaginationInfoVO<NewBookRequestVO> pagingVO) {
		return mapper.requestCount(pagingVO);
	}

	@Override
	public int requestAllCount(String nbr_no) {
		return mapper.requestAllCount(nbr_no);
	}

	@Override
	public List<NewBookRequestVO> selectRequestList(MngPaginationInfoVO<NewBookRequestVO> pagingVO) {
		return mapper.selectRequestList(pagingVO);
	}

	@Override
	public int bookRequestInsert(NewBookRequestVO newBookRequestVO) {
		try {
			if(newBookRequestVO.getBook_file_cover() != null) {
				MultipartFile bookFileCover = newBookRequestVO.getBook_file_cover();
				log.info("file.name" + bookFileCover.getOriginalFilename());	// 파일 이름
				String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, bookFileCover.getOriginalFilename(), bookFileCover.getBytes());
				String savedName = uploadedFileName.substring(uploadedFileName.lastIndexOf("/") + 1) ;
				log.info("savedName" + savedName);	// 저장 이름 : uuid_파일 이름
				log.info("uploadedFileName : " + uploadedFileName);	// 저장 경로 + 저장 이름
				log.info("uploadPath : " + uploadPath);
				String destPath = uploadedFileName;
				log.info("destPath : " + destPath);
				String fileType = bookFileCover.getOriginalFilename().substring(bookFileCover.getOriginalFilename().lastIndexOf(".") + 1);// 확장자
				log.info("fileType : " + fileType);
				bookFileCover.transferTo(new File(destPath));
				log.info(FilenameUtils.getExtension(bookFileCover.getOriginalFilename()));	// 확장자 추출하는 방법
				log.info("파일 복사 성공");
				
				// 파일 업로드
				FileVO fileVO = new FileVO();
				fileVO.setUa_sn("1");
				fileVO.setUa_type("NEW_BOOK_REQUEST");
				fileVO.setUa_path(destPath);
				fileVO.setUa_nm(bookFileCover.getOriginalFilename());
				fileVO.setUa_stre_nm(savedName);
				fileVO.setUa_file_type(fileType);
				fileVO.setUa_size(bookFileCover.getSize());
				String id = SecurityContextHolder.getContext().getAuthentication().getName();
				fileVO.setUa_regist_id(id);
				int cnt = fileService.fileInsert(fileVO);
				
				if(cnt > 0) {  // 파일 등록 성공
					newBookRequestVO.setNbr_cover("/upload/images/" + savedName);
				}
			}
		} catch (IllegalStateException | IOException e) {
			log.error("{}", e);
		}
		return mapper.bookRequestInsert(newBookRequestVO);
	}
}
