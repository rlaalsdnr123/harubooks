<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- content wrapper -->
	<div class="content-wrapper" style="padding : 10px;">
		<div class="row" style=" padding : 10px;">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="card-title-wrapper">
							<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">환불 내역</h4>
							<p class="card-description">
								전체 <code id="total"></code>건
						   </p>	
						</div>
						<div class="table-responsive" style="width : 1100px;">
							<table class="table table-hover">
								<thead>
									<tr class="table-primary">
										<th style="width : 5%;">번호</th>
										<th style="width : 15%;">주문번호</th>
										<th style="width : 15%;">상품번호</th>
										<th style="width : 10%;">주문자</th>
										<th>주문내역</th>
										<th style="width : 10%;">주문금액</th>
										<th style="width : 10%;">환불신청일자</th>
										<th style="width : 5%;">답변여부</th>
									</tr>
								</thead>
								<tbody id="tblDisp">
								</tbody>
							</table>
						</div>
					</div>
					<div id="pagingArea" style="margin-bottom: 20px;"></div>
				</div>
			</div>
		</div>
	</div>

<button id="refundModal" type="button" class="btn btn-primary" data-toggle="modal" data-target=".refundModal-bg" style="display : none;" >modalShow</button>

<div class="modal fade refundModal-bg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="">
	<div class="modal-content" style="margin : 0 auto; width: 1100px; top: -35px;">
		<div class ="modal-header">
			<h4>환불 상세 내역</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body" style="display: flex; max-height: 700px; padding : 10px 10px;">
			<div style="float: left; /* border : 1px solid black; */ width: 48%;">
				<div id="refundDisp" >
				</div>
			</div>
			<div style="float :left; width : 2%; /* border: 1px solid black; */" ></div>
			<div style="float: right; /* border : 1px solid black;  */width: 48%;">
				<div id="refundInqDisp" style="overflow : auto;">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-outline-primary" data-dismiss="modal">확인</button>&nbsp;&nbsp;
			<button id="refundRejectBtn" type="button" class="btn btn-danger" style="display : none;">거절</button>&nbsp;&nbsp;
			<button id="refundBtn" type="button" class="btn btn-primary" style="display : none;">승인</button>
		</div>
	</div>
	</div>
</div>	
<script>
const tblDisp = document.querySelector("#tblDisp");
const refundDisp = document.querySelector("#refundDisp");
const refundInqDisp = document.querySelector("#refundInqDisp");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;

$(function(){
	fRefundList();
	
	// 정적으로 생성된 것은 바로 바인딩시켜도 됨.
	$("#refundBtn").on("click", function(){
		fRefundOne(order_no, book_no);
	});
	
	// 페이징 
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");
			
			fRefundList();
		}
	});
});

// 동적바인딩할 때 사용(동적 생성된 item 이벤트 바인딩 시킬 때)
// $(document).on("click", "#refundBtn", function(){
// 	console.log("체킁:",order_no,book_no)
// 	// 모달로 한번 더 확인!
// 	fRefundOne(order_no, book_no);
// });


function fRefundList(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/order/refund/list?page=" + page, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let refundList = JSON.parse(xhr.responseText);
			console.log(refundList);
			let tblstr = "";
			for(let i=0; i<refundList.dataList.length; i++){
				tblstr += `<tr onclick="fRefundDetail('\${refundList.dataList[i].order_no}','\${refundList.dataList[i].book_no}')">`;
				tblstr += 	`<td style="text-align : center;">\${refundList.startRow + i}</td>`
				tblstr += 	`<td>\${refundList.dataList[i].order_no}</td>`
				tblstr += 	`<td>\${refundList.dataList[i].book_no}</td>`
				tblstr += 	`<td>\${refundList.dataList[i].ae_id}</td>`
				tblstr += 	`<td>\${refundList.dataList[i].purchsMngVO.book_title}</td>`
				tblstr +=	`<td style="text-align : right;">\${(refundList.dataList[i].purchsMngVO.book_ntsl_amt*refundList.dataList[i].purchsMngVO.pl_cnt).toLocaleString()} 원</td>`
				tblstr += 	`<td style="text-align : center;">\${refundList.dataList[i].rr_ymd}</td>`
				if(refundList.dataList[i].ccg_i001 == '대기'){
					tblstr += 	`<td style="text-align : center;"><label class="badge badge-warning">\${refundList.dataList[i].ccg_i001}</label></td>`
				} else {
					tblstr += 	`<td style="text-align : center;"><label class="badge badge-info">\${refundList.dataList[i].ccg_i001}</label></td>`
				}
				tblstr += "</tr>"
			}
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = refundList.totalRecord;

			pagingArea.innerHTML = refundList.pagingHTML;
		}
	}
	xhr.send();
}

function fRefundDetail(order_no2, book_no2){
	order_no = order_no2;
	book_no = book_no2;
	console.log("fRefundDetail", order_no, book_no);
	let xhr = new XMLHttpRequest();
	let data = {
		order_no : order_no2,
		book_no : book_no2
	}
	xhr.open("post", "/mng/order/refund/detail", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");// 객체 보낼때 json 문
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let refundDetail = JSON.parse(xhr.responseText);
			console.log(refundDetail);
			console.log(refundDetail.ua_no);
			fFileList(refundDetail.ua_no);

			let refundstr = "";
			refundstr += `<table class='table' style="width : 100%;">
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
									<td>\${refundDetail.order_no}</td>
								</tr>
								<tr>
									<th>주문자</th>
									<td>\${refundDetail.ae_id}</td>
								</tr>
							</tbody>
						</table><br>`
			refundstr += `<table class='table' style="width : 100%;">
							<thead>
								<tr class='table-primary'>
									<th colspan="2" style="font-size:1.125rem;">
										상품정보
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="width : 20%;">제목</th>
									<td>[\${refundDetail.purchsMngVO.ccg_b001}]&nbsp;\${refundDetail.purchsMngVO.book_title}</td>
								</tr>
								<tr>
									<th style="width : 20%;">출판사</th>
									<td>\${refundDetail.purchsMngVO.pub_nm}</td>
								</tr>
								<tr>
									<th style="width : 20%;">수량</th>
									<td>\${refundDetail.purchsMngVO.pl_cnt}권</td>
								</tr>
								<tr>
									<th style="width : 20%;">가격</th>
									<td>\${refundDetail.purchsMngVO.book_ntsl_amt.toLocaleString()}원</td>
								</tr>
							</tbody>
						</table>`
			refundDisp.innerHTML = refundstr;
						
			refundInqstr = "";
			refundInqstr += `<table class='table' style="width : 100%;">
								<thead>
									<tr class='table-primary'>
										<th colspan="2" style="font-size:1.125rem;">
											환불요청정보
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th style="width : 20%;">요청일자</th>
										<td>\${refundDetail.rr_ymd}</td>
									</tr>
									<tr>
										<th style="width : 20%;">환불상태</th>
										<td>\${refundDetail.purchsMngVO.pl_refund_yn}</td>
									</tr>
									<tr>
										<th style="width : 20%;">내용</th>
										<td>\${refundDetail.rr_content}</td>
									</tr>
									<tr>
										<th style="width : 20%;">은행</th>
										<td>\${refundDetail.rr_bank}</td>
									</tr>
									<tr>
										<th style="width : 20%;">계좌번호</th>
										<td>\${refundDetail.rr_actno}</td>
									</tr>
									<tr>
										<th style="width : 20%;">첨부파일</th>
										<td id="fileDisp"></td>
									</tr>
									
								</tbody>
							</table><br>`

			refundInqDisp.innerHTML = refundInqstr;
			if(refundDetail.purchsMngVO.pl_refund_yn == '환불대기'){
				$("#refundBtn").show();
				$("#refundRejectBtn").show();
			} else{
				$("#refundBtn").hide();
				$("#refundRejectBtn").hide();
			}
			$("#refundModal").click();
		}
	}
	xhr.send(JSON.stringify(data));
}


function fRefundOne(order_no1, book_no1){
	order_no = order_no1;
	book_no = book_no1;
	console.log("refundOne", order_no, book_no);
	let data = {
		order_no : order_no1,
		book_no : book_no1
	}
	$.ajax({
    	type : "post",
		url : "/mng/order/refund",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		success : function(res){
			if(res == "fail"){
				Swal.fire(
						  '환불 실패하였습니다.',
						  '다시 시도해주세요.',
						  'error'
						);
			} else {
				Swal.fire({
					title : '환불되었습니다.', 
					text : '환불 내역에서 확인해주세요.', 
					icon : 'success',
					//confirmButtonText: '확인'
				}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						location.href = "/mng/refunds";
						// 모달창 꺼지도록하기
						//$("#refundBtn").hide();
						
					}
				}); 
			}
		}
    });
}

function fFileList(ua_no){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/mng/board/notice/fileList/" + ua_no, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let fileList = JSON.parse(xhr.responseText);
			console.log(fileList);
			for(let i=0; i<fileList.length; i++){
				let aTag = document.createElement("a");
				let imgTag = document.createElement("img");
				imgTag.setAttribute("alt", ua_no+"_"+i);
				imgTag.setAttribute("src", "/upload/images/" + fileList[i].ua_stre_nm);
				imgTag.setAttribute("style", "width:150px; height:150px; border-radius:0");
				aTag.href = "/upload/images/" + fileList[i].ua_stre_nm;	
				aTag.download = fileList[i].ua_nm;
				aTag.appendChild(imgTag);
				$("#fileDisp").append(aTag);
			}
		}
	}
	xhr.send();
}
</script>
	<!-- content wrapper End-->