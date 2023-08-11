package kr.or.ddit.service;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.vo.UserInfoVO;
import kr.or.ddit.vo.kmw.OrderVO;

public interface LoginService {

	public ResultStatus idCheck(String idVal);

	public ResultStatus insertMember(UserInfoVO user);

	public UserInfoVO selectUser(String username);

	public String findId(UserInfoVO vo);

	public ResultStatus findPw(UserInfoVO vo);

	public void resetPw(UserInfoVO vo);

	public void resetRole(String id);

	public void resetTempRole(String id);

	public String insertNonMember(OrderVO vo);
	
}
