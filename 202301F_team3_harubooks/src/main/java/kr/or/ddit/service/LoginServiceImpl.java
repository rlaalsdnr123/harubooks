package kr.or.ddit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ResultStatus;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.vo.UserInfoVO;
import kr.or.ddit.vo.kmw.OrderVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Inject 
	private LoginMapper mapper;

	@Override
	public ResultStatus idCheck(String idVal) {
		ResultStatus result = null;
		int cnt = mapper.idCheck(idVal);
		if(cnt > 0) {
			result = ResultStatus.FAIL;
		}else {
			result = ResultStatus.OK;
		}
		return result;
	}

	@Override
	public ResultStatus insertMember(UserInfoVO user) {
		ResultStatus result = null;
		mapper.insertAllEmplyr(user);
		mapper.insertUsers(user);
		mapper.insertAuthor(user.getAe_id());
				
		int rslt = mapper.insertMember(user);
		mapper.insertHaruterMember(user.getAe_id());
		if(rslt > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		return result;
	}

	@Override
	public UserInfoVO selectUser(String username) {
		return mapper.selectUser(username);
	}

	@Override
	public String findId(UserInfoVO vo) {
		return mapper.findId(vo);
	}

	@Override
	public ResultStatus findPw(UserInfoVO vo) {
		ResultStatus result = null;
		int res = mapper.findPw(vo);
		if(res > 0) {
			result = ResultStatus.OK;
		}else {
			result = ResultStatus.FAIL;
		}
		return result;
	}

	@Override
	public void resetPw(UserInfoVO vo) {
		mapper.resetPw(vo);
		
	}

	@Override
	public void resetRole(String id) {
		mapper.resetRole(id);
		
	}

	@Override
	public void resetTempRole(String id) {
		mapper.resetTempRole(id);
		
	}

	@Override
	public String insertNonMember(OrderVO vo) {
		String res = null;
		mapper.insertAllNonMem(vo);
		mapper.insertNonMemAuthor(vo.getAe_id());
		mapper.insertNonMem(vo);
		int cnt = mapper.insertNonMember(vo);
		if(cnt > 0) {
			res = "OK";
		}else {
			res = "FAIL";
		}
		return res;
	}

}
