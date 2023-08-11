package kr.or.ddit.service.jhs;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.bmk.BoardVO;
import kr.or.ddit.vo.bmk.ReplyVO;
import kr.or.ddit.vo.jhs.Chat_MemVO;
import kr.or.ddit.vo.jhs.Chat_RoomVO;
import kr.or.ddit.vo.jhs.ChattingVO;

public interface IChattingService {

	public String insertChat(Chat_RoomVO vo);

	public List<Chat_RoomVO> getChatList(Chat_RoomVO vo);

	public Chat_RoomVO getChatOne(Chat_RoomVO vo);

	public String chattingRoomIn(Chat_RoomVO vo);

	public Chat_MemVO getChatMem(Chat_MemVO vo);

	public Map<String, Object> getChat(Chat_RoomVO vo);

	public String deleteChatRoom(Chat_RoomVO vo);

	public String updateChatRoom(Chat_RoomVO vo);

	public void updateChatState(Chat_MemVO member);

	public void updateChatStateDown(Chat_MemVO loginuser);

	public void insertChatInfo(Chat_MemVO member);

	public List<ChattingVO> getChatting(String cr_no);

	public String outUser(Chat_MemVO vo);

	public String outChatRoom(Chat_MemVO vo);

	public List<Chat_RoomVO> getChatRoomNo(String ae_id);

	public String createChatBoard(BoardVO bvo);

	public List<BoardVO> getChatBoardList(BoardVO bvo);

	public BoardVO getChatBoardOne(BoardVO bvo);

	public List<ReplyVO> getChatBoardReplyList(BoardVO bvo);

	public String insetChat(ReplyVO rvo);

	public List<ReplyVO> getChatBoardSubReplyList(ReplyVO rvo);

	public String updateChatBoard(BoardVO rvo);

	public String deleteChatBoard(BoardVO rvo);

	public String chatBoatdReplyDelete(ReplyVO rvo);

	public String chatBoatdReplyUpdate(ReplyVO rvo);

	public List<Chat_RoomVO> getMyChatList(Chat_RoomVO vo);

}
