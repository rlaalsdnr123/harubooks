package kr.or.ddit.mapper.jhs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.jhs.Com_MemberVO;
import kr.or.ddit.vo.jhs.Ebook_ManagerVO;
import kr.or.ddit.vo.jhs.Ebook_MemoVO;
import kr.or.ddit.vo.jhs.Ebook_PageVO;
import kr.or.ddit.vo.jhs.Ebook_RecodeVO;

@Mapper
public interface MyLibraryMapper {

	public List<Ebook_ManagerVO> getEbookList(Ebook_PageVO<Ebook_ManagerVO> evo);

	public Ebook_ManagerVO getEbookDetailList(String book_no);

	public int selectEbookListCount(Ebook_PageVO<Ebook_ManagerVO> evo);

	public int selectAllRecord(String id);

	public Com_MemberVO callComMember(String id);

	public Ebook_ManagerVO getEbookManager(Ebook_ManagerVO vo);

	public int updateReadPage(Ebook_ManagerVO vo);

	public int insertBookRecode(Ebook_ManagerVO vo);

	public List<Integer> getEbookRecode(Ebook_ManagerVO evo);

	public void updateReadYmd(Ebook_ManagerVO vo);

	public String checkBookRecode(Ebook_RecodeVO vo);

	public int deleteBookRecode(Ebook_ManagerVO vo);

	public List<String> getBookMarkList(Ebook_RecodeVO vo);

	public String ebookMemoCheck(Ebook_MemoVO vo);

	public int ebookUpdate(Ebook_MemoVO vo);

	public int ebookInsert(Ebook_MemoVO vo);

	public Ebook_MemoVO getEbookMemo(Ebook_MemoVO vo);

	public int updateUser(Com_MemberVO vo);
}
