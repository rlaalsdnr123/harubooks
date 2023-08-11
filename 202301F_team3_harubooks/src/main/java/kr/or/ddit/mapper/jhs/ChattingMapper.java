package kr.or.ddit.mapper.jhs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.bmk.BoardVO;
import kr.or.ddit.vo.bmk.ReplyVO;
import kr.or.ddit.vo.jhs.Chat_MemVO;
import kr.or.ddit.vo.jhs.Chat_RoomVO;
import kr.or.ddit.vo.jhs.ChattingVO;

@Mapper
public interface ChattingMapper {

	public int insertChat(Chat_RoomVO vo);

	public int insertChatMem(Chat_RoomVO vo);

	public List<Chat_RoomVO> getChatList(Chat_RoomVO vo);

	public Chat_RoomVO getChatOne(Chat_RoomVO vo);

	public String checkPw(Chat_RoomVO vo);

	public int chattingRoomIn(Chat_RoomVO vo);

	public int addChatNope(Chat_RoomVO vo);

	public Chat_MemVO checkUser(Chat_RoomVO vo);

	public Chat_MemVO getChatMem(Chat_MemVO vo);

	public List<Chat_MemVO> getChatMemList(Chat_RoomVO vo);

	public int deleteChatMem(Chat_RoomVO vo);

	public int deleteChatRoom(Chat_RoomVO vo);

	public int updateChatRoom(Chat_RoomVO vo);

	public void updateChatMemState(Chat_MemVO member);

	public void updateChatRoomState(Chat_MemVO member);

	public void updateChatMemStateDown(Chat_MemVO member);

	public void updateChatRoomStateDown(Chat_MemVO member);

	public void insertChatInfo(Chat_MemVO member);

	public List<ChattingVO> getChatting(String cr_no);

	public int deleteChatting(Chat_RoomVO vo);

	public int outUser(Chat_MemVO vo);

	public int outRoom(Chat_MemVO vo);

	public int deleteUser(Chat_MemVO vo);

	public int deleteUserChatting(Chat_MemVO vo);

	public List<Chat_RoomVO> getChatRoomNo(String ae_id);

	public int createChatBoard(BoardVO bvo);

	public int createDedateBoard(BoardVO bvo);

	public List<BoardVO> getChatBoardList(BoardVO bvo);

	public BoardVO getChatBoardOne(BoardVO bvo);

	public List<ReplyVO> getChatBoardReplyList(BoardVO bvo);

	public int insetChat(ReplyVO rvo);

	public List<ReplyVO> getChatBoardSubReplyList(ReplyVO rvo);

	public void updateCnt(BoardVO bvo);

	public int updateChatBoard(BoardVO rvo);

	public int deleteChatBoard(BoardVO rvo);

	public int deleteChatReply(BoardVO rvo);

	public int deleteChatDedateBoard(BoardVO rvo);

	public int chatBoatdReplyUpdate(ReplyVO rvo);

	public List<Chat_RoomVO> getMyChatList(Chat_RoomVO vo);

	public int chatBoardBellInsert(ReplyVO rvo);

	public String getWriterUserId(String board_no);

	public int updateEcho(BoardVO vo);

	public int chatBoardReplyBellDelete(ReplyVO rvo);

	public int chatBoardReplyDelete(ReplyVO rvo);

	public int deleteChatBell(BoardVO rvo);

}
