<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<body>
	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex;flex-direction: column;">
					<div style="display: flex;margin: 0 auto; flex-direction: column;">
						<p style="font-size: 18px;color: white;margin: 5px;font-weight: bold;">${userInfo.user_nm }님</p>
						<div style="background-color: #3cb454;height: 24px;border-radius: 15px;"><p style="margin-bottom: 0px;color: white;text-align: center;font-weight: bold;">${userInfo.rank_name }</p></div>
					</div>
					<div id="info-1" style="display: flex;flex-direction: column;width: 90%;margin: 0 auto;margin-top: 20px;">
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">보유 마일리지</p><p style="font-size: 15px;color: white;font-weight: bold;">${userInfo.mbr_mileage }P</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">찜 목록</p><p style="font-size: 15px;color: white;font-weight: bold;">${wishCnt }개</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">장바구니</p><p style="font-size: 15px;color: white;font-weight: bold;">${cartCnt }개</p>
						</div>
					</div>
				</div>
			</div>
			<div id="category">
				<div class="categoryInfo">
					<p>쇼핑내역</p>
					<a href="/harubooks/myPage/orderList?status=order">주문/배송목록</a>
					<a href="/harubooks/myPage/orderList?status=complete" >구매확정목록</a>
					<a href="/harubooks/myPage/orderList?status=refund">환불내역</a>
					<a href="/wish/list" >찜 목록</a>
					<a href="/harubooks/myCart">장바구니 목록</a>
				</div>
				<div class="categoryInfo">
					<p>문의 내역</p>
					<a href="/inquiry/list" >1:1문의</a>
				</div>
				<div class="categoryInfo">
					<p>나의 정보</p>
					<a href="/mypage/agree" >내 정보 수정</a>
				</div>
			</div>
		</div>
		<div id="content">
			<div>
				<p style="font-size: 18px;font-weight: bold;">주문/배송 목록</p>
			</div>
			<div id="contentInfo">
				<div class="deliveryInfo" style="width: 24%;">
					<div>
						<p class="di-1">주문내역</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=order" style="color: #767676;">주문/배송안내</a></p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${preparedDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송 준비중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${DeliveringCnt }</p>
					</div>
					<div>
						<p class="di-2">배송중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${finishDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송완료</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%; border: none;">
					<div>
						<p class="di-1">${refundCnt }</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=refund">환불</a></p>
					</div>
				</div>
			</div>
			<div id="prodInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;">최근 구매한 책</p>
				</div>
				<div id="currentPurchase">
					<div style=" display: flex; flex-direction: column;">
						<p style="font-size: 16px; font-weight: bold; margin-right: 100px;"class="semi-title">주문상품</p>
					</div>
					<div id="printCurrentProd" style="display: flex;flex-direction: column;">						
					</div>
				</div>
			</div>
			<div id="prodInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;">배송 완료된 책</p>
				</div>
				<div id="completeDelivery">
					<div style="border-bottom:1px solid #d5d5d5; display: flex; flex-direction: column;">
						<p style="font-size: 16px; font-weight: bold; margin-right: 100px;"class="semi-title">배송상품</p>
					</div>
					<div id="printCompleteDelivery" style="display: flex;flex-direction: column;"></div>
				</div>
			</div>
			<div id="prodInfo" style="border: 1px solid #f7f7f7;background-color: #f7f7f7;height: 180px;border-radius: 10px;display: flex;align-items: center;">
				<div style="width: 90%;margin: 0 auto;">
					<p style="font-weight: bold;">유의사항</p>
					<span>구매 확정일이 지난 이후에는 환불이 불가능합니다.</span><br>
					<span>상품구입 후 구매확정이된 이후에 마일리지 적립이 가능합니다.</span><br>
					<span>마일리지를 사용하여 상품을 구매 시 마일리지 적립이 되지 않습니다.</span><br>
					<span>e-Book구매 시 환불이 불가능합니다.</span><br>
				</div>
			</div>
		</div>
	</div>
	<!--모달창 만들기-->
	<div id="modalWrap"style="display: none;">
		<div id="modalBody" >
			<div style="width: 100%;">
				<span id="closeBtn">&times;</span>
			</div>
			<div style=" width: 90%;margin: 0 auto;margin-top: 50px;">
				<form method="post" action="/harubooks/myPage/refundRegister?${_csrf.parameterName }=${_csrf.token}" enctype="multipart/form-data" id="refundForm">
					<div style='display: flex; flex-direction: column;'>
						<div style="display: flex;font-size: 24px;color: #5055b1;font-weight: bold;">
							<p>환불하기</p>
						</div>
						<div>
							<p class="modalText">주문번호</p>
							<input class="modalInput" type="text" id="refundOrderNo" value="" name="order_no" readonly>	
						</div>
						<div>
							<p class="modalText">사용자 아이디</p>
							<input class="modalInput" type="text" id="userId" value="<sec:authentication property='name'/>" name="ae_id" readonly>	
						</div>
						<div>
							<p class="modalText">책번호</p>
							<input class="modalInput" type="text" id="refundBookNo" value="" name="book_no" readonly>	
						</div>
						<div>
							<p class="modalText">환불계좌</p>
							<div>
								<select name="rr_bank" style="border-radius: 10px; font-size: 14px;color: #767676;">
									<option value="우리은행">우리은행</option>
									<option value="국민은행">국민은행</option>
									<option value="농협">농협</option>
									<option value="기업은행">기업은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</select>
								<input class="modalInput" id="actNoInput" type="text" name="rr_actno" placeholder="계좌번호를 입력해주세요(숫자만 입력가능)" style="width:50%; font-size: 12px; border-radius: 10px;">
							</div>
						</div>						
						<div>
							<p class="modalText">환불내용</p>
							<div style="width: 100%;height: 200px; border: 1px solid #d5d5d5;">
								<textarea name="rr_content" id="refundContent" style="width: 100%; height: 100%; resize: none; border: none; outline: none; padding: 10px; box-sizing: border-box;"></textarea>
							</div>	
						</div>
						<div>
							<p class="modalText">첨부파일</p>
							<input type="file" id="userId" value="" name="refund_file" accept=".jpg, .png, .jpeg, .gif">	
						</div>
						<div style="text-align: right;">
							<button type="submit" id="refundRegisterBtn" style="margin-top: 30px;right: 5%;height: 44px;border: 1px solid #5055b1; background-color: #5055b1;border-radius: 10px;color: white;font-size: 16px;font-weight: bold;">환불신청하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	let printCurrentProd = document.querySelector("#printCurrentProd");

	let xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "/harubooks/myPage/currentPurchase", true);
	xhr1.onload = function () {
  	if (xhr1.status === 200) {
    	var data1 = JSON.parse(xhr1.responseText);
    	console.log(data1); // 데이터 전체를 확인해 보세요
    	let code = "";
		if(data1 == '' || data1 == null){
			code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
			code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>주문한 상품이 존재하지 않습니다</p></div>";
			code += "</div>";

		}else{
			for (let i = 0; i < data1.length; i++) {
			code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
			code += "<div class='bookInfo' style='width: 30%;font-size: 14px;font-weight: bold;'><p>" + data1[i].order_no + "</p></div>";
			code += "<div class='bookInfo' style='width: 90px;height: 90%;'><img style='width: 100%; height: 90%' alt='' src='" + data1[i].book_cover + "'></div>";
			code += "<div class='bookInfo' style='width: 55%;font-size: 14px;font-weight: bold;'><p>[" + data1[i].ccg_b001 + "] " + data1[i].book_title + "</p></div>";
			code += "<div class='bookInfo' style='width: 15%; font-size: 14px;'><p>" + data1[i].pl_cnt + "개</p></div>";
			code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><p>" + parseInt(data1[i].book_ntsl_amt * data1[i].pl_cnt).toLocaleString() + "원</p></div>";
			if(data1[i].ccg_b001 == "E북")
				code += "<div class='bookInfo' style='width: 35%;font-weight: bold;font-size: 14px;'><p>[배송상태] -</p></div>";				
			else{
				code += "<div class='bookInfo' style='width: 35%;font-weight: bold;font-size: 14px;'><p>[배송상태]" + data1[i].ccg_d001 + "</p></div>";
			}
			
			code += "</div>";
			}
		}
    	printCurrentProd.innerHTML = code;

 	 } else {
    	console.error(xhr1.status);
  	}
	};
	xhr1.send();

	// 배송 완료된 상품 리스트
	let printCompleteDelivery = document.querySelector('#printCompleteDelivery');
	let existCnt = 0;
	let xhr2 = new XMLHttpRequest();
	xhr2.open("get","/harubooks/myPage/completeDelivery",true);
	xhr2.onload = function(){
		if(xhr2.status == 200){
			var data2 = JSON.parse(xhr2.responseText);
			console.log(data2);
			let code = "";
			if(data2 == '' || data2 == null){
				code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
				code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>배송된 상품이 존재하지 않습니다</p></div>";
				code += "</div>";
			}else{
					for (let i = 0; i < data2.length; i++) {
						if(data2[i].ccg_b001 != "E북"){
							code += "<div style='width: 95%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
							code += "<div class='bookInfo' style='width: 30%;font-size: 14px;font-weight: bold;display:flex; flex-direction:column;'><p>[주문번호]</p><p style='color:#5055b1;'>" + data2[i].order_no + "</p></div>";
							code += "<div class='bookInfo' style='width: 90px;height: 90%;'><img style='width: 100%; height: 90%' alt='' src='" + data2[i].book_cover + "'></div>";
							code += "<div class='bookInfo' style='width: 55%;font-size: 14px;font-weight: bold;'><p>[" + data2[i].ccg_b001 + "] " + data2[i].book_title + "</p></div>";
							code += "<div class='bookInfo' style='width: 15%; font-size: 14px;'><p>" + data2[i].pl_cnt + "개</p></div>";
							code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><p>" + parseInt(data2[i].book_ntsl_amt * data2[i].pl_cnt).toLocaleString() + "원</p></div>";
							code += "<div class='bookInfo' style='width: 35%;font-weight: bold;font-size: 14px; display:flex; flex-direction:column;'><p>[적립 마일리지]</p><span style='color:#3cb454;font-weight:bold;'>" + data2[i].expected_mileage+ "P</span></div>";
							code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><button class='purchaseConfirmBtn' style='background:#5055b1;color:white;border-radius:10px;border:none;font-weight:bold;height:40px;'>구매확정</button></div>";
							if(data2[i].pl_refund_yn == '환불불가'){
								code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><p style='font-size:14px;font-weight:bold;color:red;'>환불불가</p></div>";							
							}else{
								code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><button class='refundBtn' style='background:white;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:40px;color:#5055b1;'>환불하기</button></div>";
							}
							existCnt++;
						}
						code += "</div>";
					}
					if(existCnt == 0){
						code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
						code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>배송된 상품이 존재하지 않습니다</p></div>";
						code += "</div>";
					}
			}
			printCompleteDelivery.innerHTML = code;

			// 구매 확정 버튼 클릭시 이벤트
			let purchaseConfirmBtn = document.querySelectorAll('.purchaseConfirmBtn');
			for(let j=0; j<purchaseConfirmBtn.length; j++){
				purchaseConfirmBtn[j].addEventListener('click',function(){
					let bookNo = data2[j].book_no;
					let orderNo = data2[j].order_no;
					let expectedMileage = data2[j].expected_mileage;
					let plCnt = data2[j].pl_cnt;
					const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger'
                        },
                        buttonsStyling: false
                    })
					Swal.fire({
                        	title: '구매 확정하시겠습니까?',
							text: '구매 확정 시 환불이 불가능합니다. 마일리지는 자동으로 적립됩니다',
                        	icon: 'question',
                        	iconHtml: '?',
                        	confirmButtonText: '네',
                        	cancelButtonText: '아니요',
                        	showCancelButton: true,
                        	showCloseButton: true
                        }).then(function (result) {
                            if (result.isConfirmed) {
								let bookData = {
									"bookNo" : bookNo,
									"orderNO" : orderNo,
									"expectedMileage" : expectedMileage,
									"plCnt" : plCnt
								}
								console.log(bookNo,expectedMileage,orderNo);
								let xhr3 = new XMLHttpRequest();
								xhr3.open("post","/harubooks/myPage/purchaseConfirm",true);
								xhr3.setRequestHeader("Content-Type","application/json;charset=utf-8");
								xhr3.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
								xhr3.onreadystatechange = function(){
									
									if(xhr3.readyState == 4 && xhr3.status == 200){
										let res = xhr3.responseText;
										console.log(res);
										if(res == 'OK'){
											Swal.fire({
												title :'구매 확정되었습니다.',
												icon : 'success',
												confirmButton:'확인',
												showCloseButton: true
											}).then(function(result){
												if(result.isConfirmed){
													location.reload();
												}
											})
										}else{
											swalWithBootstrapButtons.fire(
                                                '구매 확정에 실패했습니다',
                                                '',
                                                'error'
                                            )
										}
									}
								}
								xhr3.send(JSON.stringify(bookData));
							}
						});
						
				})
			}
			// 환불버튼 클릭시 이벤트
			let refundBtn = document.querySelectorAll(".refundBtn");
			for(let j = 0; j < refundBtn.length; j++){
				refundBtn[j].addEventListener('click',function(){
					const modal = document.getElementById('modalWrap');
					const closeBtn = document.getElementById('closeBtn');
					let refundOrderNo = document.querySelector("#refundOrderNo");
					let refundBookNo = document.querySelector("#refundBookNo");
					let userId = document.querySelector("#userId");
					modal.style.display = 'block';	
					refundOrderNo.value = data2[j].order_no;
					refundBookNo.value = data2[j].book_no;		
					closeBtn.onclick = function() {
  					modal.style.display = 'none';
					}
					window.onclick = function(event) {
  						if (event.target == modal) {
    						modal.style.display = "none";
  						}
					}

				})
			}
		}
	}
	xhr2.send();

	// 환불하기 버튼 클릭시 이벤트
	let refundForm = document.querySelector("#refundForm");
	let refundRegisterBtn = document.querySelector("#refundRegisterBtn");
	let actNoInput = document.querySelector("#actNoInput");
	let refundContent = document.querySelector("#refundContent");
	refundRegisterBtn.addEventListener("click",function(){
		event.preventDefault();
		let numericRegex = /^[0-9]+$/;
		
		if(actNoInput == '' || actNoInput == null){
			Swal.fire({
			      title: '계좌번호를 입력해주세요',
			      text: '',
			      icon: 'error',
			      confirmButton: '확인',
			      showCloseButton: true
			    });
			    return false;
		}
		if(refundContent.value == '' || refundContent.value == null){
			Swal.fire({
			      title: '환불 내용을 입력해주세요',
			      text: '',
			      icon: 'error',
			      confirmButton: '확인',
			      showCloseButton: true
			    });
			    return false;
		}
		
		if (!numericRegex.test(actNoInput.value)) {
		    // 입력값이 숫자로만 이루어져 있지 않으면 경고 메시지를 표시하고 처리를 중단합니다.
		    Swal.fire({
		      title: '숫자로만 입력해주세요',
		      text: '계좌번호는 숫자로만 입력가능합니다.',
		      icon: 'error',
		      confirmButton: '확인',
		      showCloseButton: true
		    });
		    return false;
		  }
		let userInput = document.querySelector('#refundContent').value;
        let escapedUserInput = userInput.replace(/[&<>"'/]/g, function (x) {
          return {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;',
            '/': '&#x2F;'
          }[x];
        });

        // 이스케이프된 값을 다시 해당 입력 필드에 출력합니다.
        document.querySelector('#refundContent').value = escapedUserInput;
		Swal.fire({
			title :'환불 신청이 완료되었습니다.',
			icon : 'success',
			confirmButton:'확인',
			showCloseButton: true
		}).then(function(result){
			if(result.isConfirmed){
				refundForm.submit();
			}
		})
		
	})
	
</script>
