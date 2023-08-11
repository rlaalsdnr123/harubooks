<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- content wrapper -->
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">재고 내역</h4>
						<div style="float:left;">
							<p class="card-description">
								전체 <code id="total"></code>건
							</p>
							<div style="width : 15px; height: 15px; border-radius: 100%; border : #ff4747; background-color: #ff4747; display: inline-block;"></div>&nbsp;위험&nbsp;&nbsp;
							<div style="width : 15px; height: 15px; border-radius: 100%; border : #ffc100; background-color: #ffc100; display: inline-block;"></div>&nbsp;경고&nbsp;&nbsp;
						</div>	
						<div class="row dropdown" style="float:right; margin-bottom: 5px; margin-right : 8px;">
							<select id="option" name="searchType" style="width: 100px; border: 1px solid lightgray;">
								<option value="title" selected>도서명</option>
								<option value="author">저자</option>
								<option value="publisher">출판사</option>
							</select>
							<ul class="navbar-nav mr-lg-2">
								<li class="nav-item nav-search d-none d-lg-block">
									<div class="input-group">
										<input type="text" class="form-control" name="searchWord" id="searchWord" placeholder="검색" aria-label="search" aria-describedby="search"/>
										<div class="input-group-prepend hover-cursor" id="navbar-search-icon">
											<button type="button" id="search" style="width: 100px; border: 1px solid lightgray;">검색
												<i class="icon-search"></i>
											</button>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="table-responsive" style="width : 1100px;">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="width : 5%;">번호</th>
									<th style="width : 10%;">상품번호</th>
									<th style="width : 10%;">카테고리</th>
									<th>도서명</th>
									<th style="width : 14%;">저자</th>
									<th style="width : 12%;">출판사</th>
									<th style="width : 10%;">
										<select id="remain" style="border : none; width: 95%; background-color: #cdcce8; font-weight: 600; font-size: .875rem; text-align: center;">
											<option value="all">재고</option>
											<option id="red" value="red">위험</option>
											<option id="yellow" value="yellow">경고</option>
										</select>
									</th>
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
<script>
const tblDisp = document.querySelector("#tblDisp");
const search = document.querySelector("#search");	// 검색 btn
const option = document.querySelector("#option");	// select 박스
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
const searchInput = document.querySelector("#searchWord");		// 검색 input

let page = 1;

$(function(){
	fRemainList();
	let searchType = option.value;
	let searchWord = searchInput.value;
	
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");

			if($("#yellow").is(":checked")){
				fRemainListCntStatus(2);
			} else if($("#red").is(":checked")){
				fRemainListCntStatus(1);
			} else {
				fRemainList();
			}
		}
	});
	
	search.addEventListener("click", function(){
		page = 1;
		fRemainList();
	});

	$(document).ready(function(){
		$("#remain").on("change", function(){
			if($(this).val() == "red"){
				tblDisp.innerHTML = "";
				page = 1;
				fRemainListCntStatus(1);
			} else if($(this).val() == "yellow"){
				tblDisp.innerHTML = "";
				page = 1;
				fRemainListCntStatus(2);
			} else {
				fRemainList();
			}
		});

	});
});
// 재고리스트
function fRemainList(){
	var searchType = option.value;
	var searchWord = searchInput.value;
	
	$.ajax({
		url : "/mng/remain/list",
		type : "get",
		data : {
			searchType : searchType,
			searchWord : searchWord,
			page : page
		},
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			let tblstr = "";
			console.log(res);
			for(let i= 0; i<res.mngPaginationInfoVO.dataList.length; i++){
				tblstr += `<tr><td>\${res.mngPaginationInfoVO.startRow + i}</td>`
				tblstr +=		`<td>\${res.mngPaginationInfoVO.dataList[i].book_no}</td>`
				tblstr +=		`<td>\${res.mngPaginationInfoVO.dataList[i].ccg_b003}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_title}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_author}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].pub_nm}</td>`
				if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 1){
					tblstr += 	`<td style="background-color : #ff4747; color : white; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				} else if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 2){
					tblstr += 	`<td style="background-color : #ffc100; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				} else {
					tblstr += 	`<td style="text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				}			
				tblstr += "</tr>"
			}
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = res.mngPaginationInfoVO.totalRecord;
			
			pagingArea.innerHTML = res.mngPaginationInfoVO.pagingHTML;
		}
	});
}
// 재고 yellow, red 리스트
function fRemainListCntStatus(bm_cnt_status){
	$.ajax({
		url : "/mng/remain/list/"+bm_cnt_status,
		type : "get",
		data : {
			bm_cnt_status : bm_cnt_status,
			page : page
		},
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			let tblstr = "";
			console.log(res);
			for(let i= 0; i<res.mngPaginationInfoVO.dataList.length; i++){
				tblstr += `<tr><td>\${res.mngPaginationInfoVO.startRow + i}</td>`
				tblstr +=		`<td>\${res.mngPaginationInfoVO.dataList[i].book_no}</td>`
				tblstr +=		`<td>\${res.mngPaginationInfoVO.dataList[i].ccg_b003}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_title}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_author}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].pub_nm}</td>`
				if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 1){
					tblstr += 	`<td style="background-color : #ff4747; color : white; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				} else if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 2){
					tblstr += 	`<td style="background-color : #ffc100; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				} else {
					tblstr += 	`<td style="text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
				}			
				tblstr += "</tr>"
			}
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = res.mngPaginationInfoVO.totalRecord;
			
			pagingArea.innerHTML = res.mngPaginationInfoVO.pagingHTML;
		}
	});
}


</script>
	<!-- content wrapper End-->