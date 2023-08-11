<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- content wrapper -->
	<div class="content-wrapper" style="padding : 10px;">
		<div class="row" style=" padding : 10px;">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="card-title-wrapper">
							<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">주문 내역</h4>
							<p class="card-description">
								전체 <code id="total"></code>건
                  			</p>	
						</div>
						<div class="table-responsive" id="tblDisp" style="max-width : 1100px;">
						</div>
					</div>
					<div id="pagingArea" style="margin-bottom: 20px;"></div>
				</div>
			</div>
		</div>
	</div>

<button id="orderModal" type="button" class="btn btn-primary" data-toggle="modal" data-target=".orderModal-bg" style="display : none;" >modalShow</button>

<div class="modal fade orderModal-bg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="">
	<div class="modal-content" style="margin : 0 auto; width: 1100px; top: -35px;">
		<div class ="modal-header">
			<h4>주문 상세 내역</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body" style="display: flex; max-height: 700px; padding : 10px 10px;">
			<div style="float: left; /* border : 1px solid black; */ width: 38%;">
				<div id="orderOneDisp" >
				</div>
				<div id="payDisp">
				</div>
			</div>
			<div style="float :left; width : 2%; /* border: 1px solid black; */" ></div>
			<div style="float: right; /* border : 1px solid black;  */width: 60%;">
				<div id="purchsDisp">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-outline-primary" data-dismiss="modal">확인</button>
		</div>
	</div>
	</div>
</div>
<script>
const tblDisp = document.querySelector("#tblDisp");
const orderOneDisp = document.querySelector("#orderOneDisp");
const purchsDisp = document.querySelector("#purchsDisp");
const payDisp = document.querySelector("#payDisp");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;

$(function(){
	fOrderList();

	// 페이징 
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");
			
			fOrderList();
		}
	});

})

function fOrderList(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/order/list?page=" + page, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let orderList = JSON.parse(xhr.responseText);
			console.log(orderList);
			let tblstr = "";
			tblDisp.innerHTML = "";
			tblstr +="<table class='table table-hover' style='width:1100px;'> ";
			tblstr +="	<thead>                       ";
			tblstr +="		<tr class='table-primary'>";
            tblstr +="			<th style='width : 5%;'>번호</th>           ";
            tblstr +="			<th style='width : 15%;'>주문번호</th>         ";
            tblstr +="			<th style='width : 10%;'>주문일자</th>         ";
            tblstr +="			<th style='width : 15%;'>주문자</th>          ";
			tblstr +="			<th style='word-wrap: break-word; white-space: pre-wrap; height : auto;'>상품내역</th> ";
            tblstr +="			<th style='width : 10%;'>주문금액</th>         ";
			tblstr +="			<th style='width : 5%'>결제방법</th>         ";
			tblstr +="      </tr>                      ";
			tblstr +="  </thead>                       ";
			tblstr +="<tbody>                          ";
			if(orderList.dataList == null || orderList.totalRecord == 0){
				tblstr +="<tr><td colspan='7'>주문 내역이 존재하지 않습니다.</td></tr>";
			} else {
				for (let i = 0; i < orderList.dataList.length; i++) {
					let totalprice = 0;
					let purchsList = orderList.dataList[i].purchsMngList;
					console.log(purchsList);
					for(let j=0; j<purchsList.length; j++){
						totalprice += purchsList[j].book_ntsl_amt * purchsList[j].pl_cnt;
						console.log(totalprice);
					}			
					tblstr +=`<tr onclick="fOrderOne('\${orderList.dataList[i].order_no}')">`
					tblstr +=   `<td style="text-align : center;">\${orderList.startRow + i}</td>`
					tblstr +=	`<td>\${orderList.dataList[i].order_no}</td>`
					tblstr +=	`<td>\${orderList.dataList[i].order_ymd}</td>`
					tblstr +=	`<td>\${orderList.dataList[i].ae_id}</td>`
					tblstr += 	`<td>\${orderList.dataList[i].purchsMngList[0].book_title}`
					if(orderList.dataList[i].purchsMngList.length == 1){
						tblstr += `</td>`
					} else {
						tblstr +='&nbsp; 이외</td>'
					}
						
					tblstr +=	`<td style="text-align : right;">\${totalprice.toLocaleString()}원</td>`
					tblstr +=	`<td style="text-align : center;">\${orderList.dataList[i].ccg_o001}</td>`
					tblstr +=`</tr>`
				}
			}
			tblstr += "</tbody></table>";			
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = orderList.totalRecord;
			
			pagingArea.innerHTML = orderList.pagingHTML;
		}
	}
	xhr.send();
}

function fOrderOne(order_no){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/order/detail/"+order_no, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let orderOne = JSON.parse(xhr.responseText);
			console.log(orderOne);
			let orderstr = "";
			orderstr += `<table class='table' style="width : 100%;">
							<thead>
								<tr class='table-primary'>
									<th colspan="2" style="font-size:1.125rem;">
										주문정보
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="width : 20%;">주문번호</th>
									<td>\${orderOne.order_no}</td>
								</tr>
								<tr>
									<th>주문자</th>
									<td>\${orderOne.ae_id}</td>
								</tr>
								<tr>
									<th>주문일자</th>
									<td>\${orderOne.order_ymd}</td>
								</tr>
								<tr>
									<th rowspan="2">배송지</th>
									<td>\${orderOne.deliveryMngVO.user_addr}</td>
								</tr>
								<tr>
									<td>\${orderOne.deliveryMngVO.user_daddr}</td>
								</tr>
								<tr>
									<th>배송상태</th>
									<td>\${orderOne.deliveryMngVO.ccg_d001}</td>
								</tr>
								<tr>
									<th>배송일자</th>
									<td>\${orderOne.deliveryMngVO.delivery_end_ymd}</td>
								</tr>
							</tbody>
						</table><br>`
			orderOneDisp.innerHTML = orderstr;
			
			let totalsum = 0;
			let purchstr = "";
			purchstr += `<table class='table' style="width : 100%; ">
							<thead>
								<tr class='table-primary'>
									<th colspan="5" style="font-size:1.125rem;">
										상품정보
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>제목</th>
									<th style="width:20%;">출판사</th>
									<th style="width:5%;">수량</th>
									<th style="width:10%;">가격</th>
									<th style="width:10%; text-align : center;">환불여부</th>
								</tr>`
			for(let i=0; i<orderOne.purchsMngList.length;i++){
				totalsum += orderOne.purchsMngList[i].pl_cnt * orderOne.purchsMngList[i].book_ntsl_amt;
				purchstr += `<tr>
								<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">[\${orderOne.purchsMngList[i].ccg_b001}]&nbsp;\${orderOne.purchsMngList[i].book_title}</td>
								<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${orderOne.purchsMngList[i].pub_nm}</td>
								<td>\${orderOne.purchsMngList[i].pl_cnt}권</td>
								<td>\${orderOne.purchsMngList[i].book_ntsl_amt.toLocaleString()}원</td>`
				if(orderOne.purchsMngList[i].pl_refund_yn == "환불미정"){
					purchstr += `<td><label class="badge badge-secondary">\${orderOne.purchsMngList[i].pl_refund_yn}</label></td>`
				} else if(orderOne.purchsMngList[i].pl_refund_yn == "환불대기"){
					purchstr += `<td><label class="badge badge-warning">\${orderOne.purchsMngList[i].pl_refund_yn}</label></td>`
				} else if(orderOne.purchsMngList[i].pl_refund_yn == "환불완료"){
					purchstr += `<td><label class="badge badge-info">\${orderOne.purchsMngList[i].pl_refund_yn}</label></td>`
				} else {
					purchstr += `<td><label class="badge badge-danger">\${orderOne.purchsMngList[i].pl_refund_yn}</label></td>`
				}
				purchstr+= "</tr>"
			}					
			purchstr += `<tr>
							<th colspan="3" style="text-align : center;">총 가격</th>
							<td colspan="2" style="text-align : left; padding-right : 20px; width : 20%;">\${totalsum.toLocaleString()}원</td>
						</tr>
					</tbody>
				</table>`
			
			purchsDisp.innerHTML = purchstr;
			
			let paystr ="";
			paystr += `<table class='table' style="width : 100%;">
							<thead>
								<tr class='table-primary'>
									<th colspan="2" style="font-size:1.125rem;">
										결제정보
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="width : 20%;">결제수단</th>
									<td>\${orderOne.ccg_o001}</td>
								</tr>
								<tr>
									<th style="width : 20%;">사용마일리지</th>
									<td>\${orderOne.order_mileage.toLocaleString()}원</td>
								</tr>
							</tbody>
						</table>`
			payDisp.innerHTML = paystr;
			$("#orderModal").click();
		}
	}
	xhr.send();	
}

</script>
