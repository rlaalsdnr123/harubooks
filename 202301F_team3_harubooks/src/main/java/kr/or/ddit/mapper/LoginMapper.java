package kr.or.ddit.mapper;

import kr.or.ddit.vo.UserInfoVO;
import kr.or.ddit.vo.kmw.OrderVO;

public interface LoginMapper {

	public int idCheck(String idVal);

	public void insertAllEmplyr(UserInfoVO user);

	public void insertUsers(UserInfoVO user);

	public void insertAuthor(String ae_id);

	public int insertMember(UserInfoVO user);

	public UserInfoVO readByUserId(String username);

	public UserInfoVO selectUser(String username);

	public String findId(UserInfoVO vo);

	public int findPw(UserInfoVO vo);

	public void resetPw(UserInfoVO vo);

	public void resetRole(String id);

	public void resetTempRole(String id);

	public void insertAllNonMem(OrderVO vo);

	public void insertNonMem(OrderVO vo);

	public int insertNonMember(OrderVO vo);

	public void insertNonMemAuthor(String ae_id);

	public void insertHaruterMember(String ae_id);

}
