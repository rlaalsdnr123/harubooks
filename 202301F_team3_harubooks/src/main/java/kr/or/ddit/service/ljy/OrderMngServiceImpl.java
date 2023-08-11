package kr.or.ddit.service.ljy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ljy.OrderMngMapper;
import kr.or.ddit.vo.ljy.OrderMngVO;
import kr.or.ddit.vo.ljy.PurchsMngVO;

@Service
public class OrderMngServiceImpl implements OrderMngService {
	
	@Autowired
	private OrderMngMapper orderMapper;
	
	@Override
	public List<OrderMngVO> orderList(OrderMngVO orderMngVO) {
		return orderMapper.orderList(orderMngVO);
	}

	@Override
	public OrderMngVO orderOne(String order_no) {
		return orderMapper.orderOne(order_no);
	}

	@Override
	public int refundOne(PurchsMngVO purchsMngVO) {
		return orderMapper.refundOne(purchsMngVO);
	}

	@Override
	public int orderListCnt(OrderMngVO orderMngVO) {
		return orderMapper.orderListCnt(orderMngVO);
	}

	@Override
	public int countOrderToday() {
		return orderMapper.countOrderToday();
	}

}
