<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- content wrapper -->
	<div class="content-wrapper" style="padding : 10px;">
		<div class="row" style=" padding : 10px;">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="card-title-wrapper">
							<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">공지사항</h4>
							<p class="card-description">
                   				전체 <code id="total"></code>건
                  			</p>	
						</div>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr class="table-primary">
										<th style="width : 10%">번호</th>
										<th style="width : 50%">제목</th>
										<th style="width : 15%">작성자</th>
										<th style="width : 15%">작성일</th>
										<th style="width : 10%">조회수</th>
									</tr>
								</thead>
								<tbody id="nTbody">
								</tbody>
							</table>
						</div>
					</div>
				<div id="pagingArea"></div>
				<div style="margin-bottom: 20px; ">
					<div style="float: right; padding-right : 20px; ">
						<button type="button" class="btn btn-primary" id="noticeBtn" onclick="fNoticeForm()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
const nTbody = document.querySelector("#nTbody");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;

$(function(){
	fNoticeList();
	
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			nTbody.innerHTML = "";
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");

			fNoticeList();
		}
	});
});

function fNoticeList(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/board/notice?page=" + page, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let noticeList = JSON.parse(xhr.responseText);
			console.log(noticeList);
			for(let i = 0; i < noticeList.dataList.length; i++){
				let no = noticeList.startRow + i;
				let notice_no = noticeList.dataList[i].notice_no; 
				let title = noticeList.dataList[i].notice_title;
				let date = noticeList.dataList[i].notice_writer_ymd;
				let cnt = noticeList.dataList[i].notice_inq_cnt;
				addRow(no, title, date, cnt, notice_no);
			}
			let total = document.querySelector("#total");
			total.innerText = noticeList.dataList.length;
			
			pagingArea.innerHTML = noticeList.pagingHTML;
		}
	}
	xhr.send();
}


function addRow(no, title, date, cnt, notice_no){
	var row = nTbody.insertRow();
	// 문자열 더하기 다른 방법도 다 해보기 + 느낌!!!
	var nNo = row.insertCell(0);
	var nTitle = row.insertCell(1);
	var nWriter = row.insertCell(2);
	var nDate = row.insertCell(3);
	var nCnt = row.insertCell(4);

	nNo.innerHTML = no;
	nTitle.innerHTML = title;
	nWriter.innerHTML = '관리자';
	nDate.innerHTML = date;
	nCnt.innerHTML = cnt;

	row.onclick = function(){
		fNoticeDetail(notice_no);
	}
}

function fNoticeDetail(notice_no){
	location.href="/mng/notice/" + notice_no;
}

function fNoticeForm(){
	location.href="/mng/noticeForm";
}
// 시작하자마자 출력
//window.addEventListener("DOMContentLoaded", fNoticeList);

</script>
	<!-- content wrapper End-->