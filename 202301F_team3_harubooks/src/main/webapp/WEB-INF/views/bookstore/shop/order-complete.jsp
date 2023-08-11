<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<body>
	<div id="container">
		<div id="container-1" style="width: 100%;">
			<div class="info-content" style="margin-top: 60px; border: none;">
				<p style="font-size: 25px; font-weight: bold;">구매 내역</p>
			</div>

				<div class="info-content" style="background-color: #f7f7f7;">
					<div style="margin-top: 30px;">
						<p style="font-size: 20px; color: #595959; text-align: center;font-weight: bold;">"주문이 성공적으로 완료되었습니다!"</p>
					</div>
					<div style="display: flex; align-items: center; justify-content: center; margin-bottom: 30px;">
						<button onclick="location.href='/harubooks/myPage/orderList?status=order'" id="signupBtn" style="margin-right: 20px; width: 132px; height: 44px; border: 1px solid #5055b1; border-radius: 15px; background-color: white;"><span style="color: #5055b1; font-weight: bold;">구매목록 이동</span></button> 
						<button onclick="location.href='/harubooks/main'" id="signinBtn" style="margin-left: 20px; width: 120px; height: 44px; border: 1px solid #5055b1; background-color: #5055b1; border-radius: 15px;"><span style="color: white; font-weight: bold;">홈으로 이동</span></button>
					</div>
				</div>

			<div class="info-content" id="prodInfo">
				<div style="border-bottom:1px solid #d5d5d5; display: flex; flex-direction: column;">
					<p style="font-size: 18px; font-weight: bold; margin-right: 100px;"class="semi-title">주문상품</p>
				</div>
				<div style="display: flex;flex-direction: column;">
					<!--JSTL로 반복문 사용하여 주문상품 내역 출력하기-->	
					<c:forEach items="${orderList }" var="orderBook">
						<div style="width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;">
							<div style="width: 90px;height: 100%;"><img style="width: 100%; height: 90%" alt="" src="${orderBook.book_cover }"></div>
							<div class="bookInfo" style="width: 45%;font-size: 14px;font-weight: bold;">
								<p>[주문 번호]${orderBook.order_no }</p>
							</div>
							<div class="bookInfo" style="width: 45%;font-size: 14px;font-weight: bold;">
								<p>[${orderBook.ccg_b001 }] ${orderBook.book_title }</p>
							</div>
							<div class="bookInfo" style="width: 15%; font-size: 14px;">
								<p>${orderBook.pl_cnt }개</p>
							</div>
							<div class="bookInfo" style="width: 30%;font-weight: bold;font-size: 14px;">
								<p><fmt:formatNumber value="${orderBook.book_ntsl_amt *orderBook.pl_cnt }" pattern="#,###" />원</p>								
							</div>
						</div>			
					</c:forEach>
				</div>
			</div>
		</div>	
	</div>
</body>

<script>
	
</script>
