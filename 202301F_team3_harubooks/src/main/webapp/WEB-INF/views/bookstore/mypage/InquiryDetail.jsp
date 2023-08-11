<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" id="_csrf" content="${_csrf.token }"/>
<style>
#myModal{
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 3000px; /* Full height */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

#con{
	 background-color: #fefefe;
     margin: 0.5% auto; /* 15% from the top and centered */
     padding: 15px;
     border: 1px solid #888;
     width: 1000px; /* Could be more or less, depending on screen size */
     height : 670px;
     border-radius: 10px;
     padding : 30px;
}

#close{
	border : none;
	background-color: #fefefe;
	font-size: 20px;
	float : right;
}
#star1{
	font-weight:bold;
	margin-right: 100px;
	color : green;
}
#star2{
	font-weight:bold;
	margin-right: 128px;
	color : green;
}

#word{
	margin-left : 10px;
	font-size : 14px;
	font-weight : bold;
	font: sans-serif;
}

#select1{
	width : 80%;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
}
#inContent{
	width : 80%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	margin-bottom: 15px;
	font-size: 14px;
}

#tarea{
	margin-left : 185px;
	width : 80%;
	height : 180px;
	padding : 13px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	margin-bottom: 10px;
	font-size: 14px;
	z-index: -1;
}
#tarea-container {
    position: relative;
  }
  
#test_cnt {
  position: absolute;
  right: 10px;
  bottom: 25px;
  font-size: 14px;
}

#error-message{
	margin-left: 190px;
	font-size : 13px;
	font-weight: bold;
	white-space: nowrap;
	margin-top: 10px;
}
#imageCounter{
	margin-right : 88px;
	font-size : 14px;
}

#inqu1{
	height:50px;
	width : 200px;
	border : none;
	color : white;
	background-color: gray;
	border-radius: 7px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

#inUp{
	height:50px;
	width : 200px;
	border : none;
	color : white;
	background-color: #6A5ACD;;
	border-radius: 7px;
	font-weight: bold;
	font-family: sans-serif;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

th{
	text-align: center;
	border-top:1px solid #d5d5d5;
	border-bottom:1px solid #d5d5d5;
	padding: 10px;
}

#emptyIn{
	text-align: center;
	font-size : 18px;
	font-family: 'Orbit', sans-serif;
}
#inImg{
	filter: invert(87%) sepia(0%) saturate(83%) hue-rotate(148deg) brightness(90%) contrast(85%);
	width: 35px; height:35px;
}
#inSel{
	background: #33b052;
	margin-left : 10px;
	color : white;
	width : 100px;
	line-height : 33px;
	border-radius: 20px;
	display: inline-block;
	text-align: center;
	font-size: 15px;
}
.faq_q{
position: relative;
	width: 24px;
	height: 24px;
	color: #fff;
	background-color: #5055b1;
	border-radius: 50%;
	font-family: "Roboto", sans-serif;
	text-align: center;
	line-height: 24px;
}
.faq_q2{
position: relative;
	width: 24px;
	height: 24px;
	color: #fff;
	background-color: orange;
	border-radius: 50%;
	font-family: "Roboto", sans-serif;
	text-align: center;
	line-height: 24px;
}
.faq_circle{
position: relative;
	width: 24px;
	height: 24px;
	color: #fff;
	background-color: #5055b1;
	border-radius: 50%;
	font-family: "Roboto", sans-serif;
	font-weight : bold;
	text-align: center;
	line-height: 24px;
}
.faq_circle2{
position: relative;
	width: 24px;
	height: 24px;
	color: #fff;
	background-color: orange;
	border-radius: 50%;
	font-family: "Roboto", sans-serif;
	font-weight : bold;
	text-align: center;
	line-height: 24px;
}
#inDel, #inButton{
	border: 0;
  	background-color: transparent;
  	font-size: 14px;
  	color : gray;
}

</style>
<body>
<!-- 유저 아이디 -->
<input type="hidden" value="<sec:authentication property="name"/>" id="ae_id" name="ae_id">
	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex; flex-direction: column;">
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
		<form id="pageForm" name="pageForm">
			<input type="hidden" name="page" id="page"/>
			<sec:csrfInput/>
		</form>
		<div id="content">
			<div>
				<p style="font-size: 18px;font-weight: bold;">1:1문의</p>
			</div>
			<div id="prodInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;">나의 문의</p>
				</div>
				<div id="inquiryDetail">
					<div style="display: flex; flex-direction: column; border-bottom:1px solid lightgray;">
						<p style="font-size: 16px; font-weight: bold; margin-right: 30px; padding-bottom: 7px; font-family: 'Noto Sans KR', sans-serif;" class="semi-title">문의 상세보기</p>
						
					</div>
					<!-- 상세보기 페이지 구현 -->
					<div style="margin-top: 20px; padding-left: 20px;">
					<form id="inquiryForm" method="post">
						<input type="hidden" name="inq_no" id="inq_no" value="${inquiry.inquiry_no}"/>
						<input type="hidden" name="ua_no" id="ua_no" value="${inquiry.ua_no}"/>
						<span style="font-size : 15px;">${inquiry.ccg_i001}</span> &nbsp; <span style="color:lightgray">|</span> <div id="inSel">${inquiry.ccg_i002}</div> <br/><br/>
						<c:choose>
							<c:when test="${inquiry.ccg_i001 eq '문의완료'}">
								<div style="display:inline-block;" class="faq_q2"><span class="faq_circle2" aria-hidden="true">A</span></div>
							</c:when>
							<c:otherwise>
								<div style="display:inline-block;" class="faq_q"><span class="faq_circle" aria-hidden="true">Q</span></div>
							</c:otherwise>
						</c:choose>
						<span style="font-weight: bold; font-size: 16px; font-family: 'Noto Sans KR', sans-serif;">
						${inquiry.inquiry_title}</span> 
						<span style="font-size: 14px; color:gray; float:right; margin-right: 25px;">${inquiry.inquiry_ymd}</span> <br/><br/>
						<div style="background: #f7f7f7; padding:14px; border-radius: 15px; width: 950px; line-height: 100%;">
						<div style="font-size:14px; padding-left:17px; padding-top: 10px;"><pre style="font-size: 17px;">${inquiry.inquiry_content}</pre></div><br/><br/>
						<div style="display:inline-block; padding-left:3px;" id="fileDisp">첨부 파일이 없습니다.</div><br/>
					<div style="margin-top: 20px; text-align:right; padding-bottom: 7px;">
					<c:choose>
							<c:when test="${inquiry.ccg_i001 eq '문의완료'}">
							</c:when>
							<c:otherwise>
								<input type="button" id="inButton" onclick="fmodalOpen()" value="수정"/> <span style="color:lightgray">|</span>
							</c:otherwise>
					</c:choose>
					<input type="button" id="inDel" name="inDel" value="삭제"/> <span style="color:lightgray">|</span>
					<input type="button" id="inButton" onclick="location.href='/inquiry/list'" value="목록"/>
					</div>
					</div>
					<sec:csrfInput/>
					</form>
					</div>
					<c:choose>
							<c:when test="${inquiry.ccg_i001 eq '문의완료'}">
								<div style="background: rgba(80, 85, 177, 0.06); margin-left:18px; margin-top:20px; padding:14px; border-radius: 15px; width: 950px; line-height: 100%;">
									<div style="padding-left:13px; padding-top:11px; padding-bottom:10px; font-size: 14px;">
										${inquiry.inquiry_reply}
									</div>
									<div style="font-size: 14px; color:gray; padding-top:10px; padding-left:13px; padding-bottom: 11px;">${inquiry.inquiry_ymd}</div>
								</div>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
						</div>
						</div>
					</div>
				</div>
			<!-- 모달창 만들기 -->
			<div id="myModal">
				<!--  모달창 내용  -->
				<div id="con">
					<!-- x를 누르면 모달창 닫힘  -->
					<div id="menu"><button id="close" onclick="fmodalClose()">x</button></div>
					<!-- 등록 모달창 제목  -->
					<div style="border-bottom: 1px solid black; margin-bottom: 25px;"><h4 style="font-weight: bold; margin-bottom: 30px;">문의 상세 수정</h4></div>
					<!-- 폼으로 수정하기 -->
					<form id = "form-name">
						<input type="hidden" name="inqNo" id="inqNo" value="${inquiry.inquiry_no}"/>
						<input type="hidden" name="uaNo" id="uaNo" value="${inquiry.ua_no}"/>
						<span id="word">문의유형</span><span id="star1">*</span>
						&nbsp;<select id="select1" name="select1">
							<!-- 제일 첫번째 셀렉트 옵션에 selected value="" 설정을 해줌으로써 선택하지 않으면 경고창이 뜸 -->
						    <option selected value="">&nbsp;&nbsp;문의 유형을 선택해주세요.</option>
						    <option value="일반문의">&nbsp;&nbsp;일반 문의</option>
						    <option value="상품문의">&nbsp;&nbsp;상품 문의</option>
						</select>
					<!-- 내용 입력 창들 -->
					<div style="margin-top : 10px;">
					<span id="word">내용</span> <span id="star2">*</span>
					<!--  제목 입력  -->
						<input type="text" id="inContent" name="inContent" placeholder="제목을 입력해주세요."/>
						<!--  내용 입력  -->
						<div id="tarea-container">
						  <textarea id="tarea" name="tarea" style="resize: none" maxlength="500" placeholder="빠른 답변을 위해 10자 이상의 문의 내용을 입력해 주세요."></textarea>
						  <div id="test_cnt">0 / 500</div>
						</div>
					</div>
					<!--  사진 썸네일 추가  -->
					<span id="word">사진첨부</span> <span id="imageCounter">0/3</span>
					<span style="font-size: 13px">빠른 답변을 위해 이미지를 첨부해주세요.</span>
					<div style="margin-top : 10px; margin-left: 180px;">
						<!--  사진 추가버튼을 이미지로 대체  -->
						<label for="imageInput" id="imageAddButton">
							<img src="/resources/assets/img/이미지추가.png" style="width:100px; height:100px; cursor: pointer;">
						</label>
						<!--  파일 업로드 기능만 하고 실제로는 이미지로 대체 원래 파일폼 숨김  -->
						<input type="file" id="imageInput" name="imageInput" onchange="previewImage(this, 'View_area')" style="display: none;" accept="image/jpg, image/jpeg, image/png, image/gif" multiple="multiple"/>
						<label>
						<!--  이미지가 보여지는 칸  -->
						<span id="View_area" style="position:releative; color: black; border: 0px solid black;">
						</span>
						</label>
						<!--  파일 업로드는 3장만 할 수 있게 막아놨음 파일은 업로드 안됨  -->
						<div style="font-size: 13px;">* JPG, PNG, GIF 파일만 최대 3장 업로드 가능합니다.</div>
					</div>
					</form>
					<!--  취소 버튼을 누르면 1:1 문의창으로 넘어가고 문의 접수를 누르면 문의 접수가 되고 1:1 문의창으로 넘어감  -->
					<div style="text-align: center; margin-top: 20px;"><button id="inqu1" name="inqu1" type="button" onclick="location.href='/inquiry/list'">목록</button> 
					&nbsp;&nbsp;<button type="button" id="inUp" name="inUp">수정</button></div>
					<sec:csrfInput/>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" charset="utf-8"></script>

<!--결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
//이미지 각 inquiry_no에 따른 이미지 썸네일 보여주기
const url = document.location.href;
// "/"마다 고유의 객체로 받아올 수 있다.(params)
const params = new URLSearchParams(new URL(url).search);
// inq_no => params안의 inquiry_no를 고유한 값으로 받아온다.
const inq_no = params.get("inquiry_no");

console.log(inq_no); // 출력: inquiry_no

let fileDisp = document.querySelector("#fileDisp");

var ae_id = document.querySelector("#ae_id").value;
var inquiryForm = document.querySelector("#inquiryForm");
var mModal = document.querySelector("#myModal"); 
var inqu1 = document.querySelector("#inqu1");
var inqu2 = document.querySelector("#inqu2");
const select1 = document.querySelector("#select1");
const inContent = document.querySelector("#inContent");
const tarea = document.querySelector("#tarea");
const imageInput = document.querySelector("#imageInput");
const inqNo = document.querySelector("#inqNo");
const uaNo = document.querySelector("#uaNo");


//1:1 문의접수를 누르면 모달 오픈
function fmodalOpen(){
	mModal.style.display = "block";
}
// 모달 오픈됬을 때 x를 누르면 모달창이 닫힌다
function fmodalClose(){
	mModal.style.display = "none";
}

//문의 내용 작성 할 때 글자수 카운트
$(document).ready(function() {
    var maxLength = 500;

    $('#tarea').on('input', function() {
        var currentLength = $(this).val().length;
        $('#test_cnt').html(currentLength + " / " + maxLength);

        if (currentLength > maxLength) {
            $(this).val($(this).val().substring(0, maxLength));
            $('#test_cnt').html(maxLength + " / " + maxLength);
            alert("글자수가 최대로 입력되었습니다");
        }
    });
});

// 모달 닫힐 때 내용 초기화 함수
	function resetTextareaCounter() {
	    $('#tarea').val(''); // 텍스트 영역의 내용을 지웁니다.
	    $('#test_cnt').html('0 / 500'); // 카운터를 0으로 초기화합니다.
	}

	$("#inUp").on("click", function() {
		  if (select1.value.trim() === "") {
		    Swal.fire({
		      title: '문의 유형을 선택해주세요',
		      icon: 'error'
		    });
		    return false;
		  }

		  if (inContent.value.trim() === "") {
		    Swal.fire({
		      title: '문의 제목을 입력해주세요',
		      icon: 'error'
		    });
		    return false;
		  }

		  if (tarea.value.trim() === "") {
		    Swal.fire({
		      title: '문의 내용을 입력해주세요',
		      icon: 'error'
		    });
		    return false;
		  }

		 if (imageInput.value.trim() === "") {
		    Swal.fire({
		      title: '사진은 최소 1장 이상 넣어주세요',
		      icon: 'error'
		    });
		    return false;
		  }

		  Swal.fire({
		    title: "문의한 사항을 수정하시겠습니까?",
		    icon: "question",
		    showDenyButton: true,
		    confirmButtonText: "네",
		    denyButtonText: "아니요",
		  }).then(function(result) {
		    if (result.isConfirmed) {
		      var form = new FormData();
			  form.append("inquiry_no", inqNo.value);
		      form.append("ccg_i002", select1.value);
		      form.append("inquiry_title", inContent.value);
		      form.append("inquiry_content", tarea.value);
		      for (var i = 0; i < imageInput.files.length; i++) {
		        form.append("imgFile", imageInput.files[i]);
		      }
		      form.append("ae_id", ae_id);
			  //form.append("ua_no", uaNo.value);
		      
		      $.ajax({
		        type: "post",
		        url: "/inquiry/modify",
		        data: form,
		        processData: false,
		        contentType: false,
		        beforeSend: function(xhr) {
		          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        success: function(res) {
		          if (res === 'fail') {
		            Swal.fire({
		              title: '수정 실패했습니다.',
		              text: '다시 시도해주세요.',
		              icon: 'error',
		              confirmButtonText: '확인'
		            }).then(function(result) {
		              if (result.isConfirmed) {
		                location.href = "/inquiry/list"; // 문의 완료 후 이동
		              }
		            });
		          } else {
		            Swal.fire({
		              title: '수정 되었습니다!',
		              icon: 'success',
		              confirmButtonText: '확인'
		            }).then(function(result) {
		              if (result.isConfirmed) {
		                // 확인 버튼을 클릭한 경우
		                location.href = "/inquiry/list";
		              }
		            });
		          }
		        }
		      });
		    }
		  });
		});
  
	// 성공적인 응답을 처리하는 함수 정의
	function handleSuccessResponse(res) {
	  console.log(res);
	  if (res === "fail") {
	    Swal.fire(
	      '삭제 실패하였습니다.',
	      '다시 시도해주세요.',
	      'error'
	    );
	  } else {
	    Swal.fire({
	      title: "삭제 성공",
	      text: "성공적으로 삭제되었습니다.",
	      icon: "success",
	    }).then(() => {
	      // 성공 메시지를 표시한 후 삭제 처리를 위한 form 설정
	      inquiryForm.setAttribute("method", "post");
	      inquiryForm.setAttribute("action", "/inquiry/delete");
	      inquiryForm.submit();
	    });
	  }
	}

	// 클릭 이벤트 핸들러
	$("#inDel").on("click", function() {
	  Swal.fire({
	    title: "문의한 사항을 삭제하시겠습니까?",
	    icon: "question",
	    showDenyButton: true,
	    confirmButtonText: "네",
	    denyButtonText: "아니요",
	  }).then((result) => {
	    if (result.isConfirmed) {
	      // handleSuccessResponse 함수를 호출하여 성공 응답을 처리합니다.
	      handleSuccessResponse("success");
	      // 삭제 성공 시 SweetAlert를 띄웁니다.
	    }
	  });
	});

// 사진 첨부할 때 썸네일 출력
	var fileArr;
    var fileInfoArr = [];
    var maxImageLimit = 3;

    // 사진 첨부시 카운트 표시
    function updateImageCounter() {
    if (fileInfoArr.length === 0) {
        $("#imageCounter").text("0/" + maxImageLimit);
    } else {
        var counterText = fileInfoArr.length + "/" + maxImageLimit;
        $("#imageCounter").text(counterText);
    }
}
    
    // 사진 첨부 최대가 3개이고 3개가 되면 사진 추가버튼이 사라짐
    function updateAddButtonVisibility() {
        if (fileInfoArr.length >= maxImageLimit) {
            $("#imageAddButton").hide();
        } else {
            $("#imageAddButton").show();
        }
    }

    // 사진을 선택하면 지워짐
    function fileRemove(index) {
        console.log("index: " + index);
        fileInfoArr.splice(index, 1);

        var imgId = "#img_id_" + index;
        $(imgId).remove();
        console.log(fileInfoArr);

        updateImageCounter();
        updateAddButtonVisibility();
    }
	
    // 썸네일 사진 표시
    function previewImage(targetObj, View_area) {
    var files = targetObj.files;
    fileArr = Array.prototype.slice.call(files);

    var preview = document.getElementById(View_area); //div id

    // 자를 이미지 개수 계산
    var imagesToRemove = fileInfoArr.length + fileArr.length - maxImageLimit;
    
    if (imagesToRemove > 0) {
        // 이미지를 자른다.
        for (var i = 0; i < imagesToRemove; i++) {
            fileInfoArr.shift();
        }
        // 화면에서도 이미지를 제거한다.
        var images = document.getElementsByClassName("addImg");
        for (var i = 0; i < imagesToRemove; i++) {
            preview.removeChild(images[i].parentNode);
        }
    }

    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        fileInfoArr.push(file);

        var imageType = /image.*/; //이미지 파일일 경우만 뿌려줍니다.
        if (!file.type.match(imageType)) continue;

        var span = document.createElement('span');
        span.id = "img_id_" + i;
        span.style.width = '100px';
        span.style.height = '100px';
        preview.appendChild(span);

        var img = document.createElement("img");
        img.className = "addImg";
        img.classList.add("obj");
        img.file = file;
        img.style.width = '100px';
        img.style.height = '100px';
        img.style.cursor = 'pointer';
        const idx = i;
        img.onclick = () => fileRemove(idx); //이미지를 클릭했을 때.
        span.appendChild(img);

        if (window.FileReader) {
            var reader = new FileReader();
            reader.onloadend = (function (aImg) {
                return function (e) {
                    aImg.src = e.target.result;
                };
            })(img);
            reader.readAsDataURL(file);
        } else {
            alert('FileReader를 지원하지 않는 브라우저입니다.');
        }
    }

    updateImageCounter();
    updateAddButtonVisibility();
}
	
	$(function(){
		fInquiryOne(inq_no);
		
	});
	
	// inquiry_no는 고유한 값 즉 기본키가 적용된 값이므로 중복이 되지 않으므로 그에 따른 이미지들을 불러올 수 있다.
function fInquiryOne(inq_no){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/inquiry/detail2/" + inq_no, true);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let inqOne = JSON.parse(xhr.responseText);
			console.log(inqOne);
			
			// inq_no의 파일 넘버 즉 ua_no를 불러온다.
			if(inqOne.ua_no != "0"){
				fFileList(inqOne.ua_no);
			} 
		}
	}
	// 보내준다.
	xhr.send();
}
	// ua_no의 파일리스트안에 저장된 파일 즉 이미지를 불러온다.
function fFileList(ua_no){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/inquiry/fileList/" +ua_no, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			fileDisp.innerHTML = "";
			let fileList = JSON.parse(xhr.responseText);
			for(let i=0; i<fileList.length; i++){
				// 다운로드 가능한 a태그
				let aTag = document.createElement("a");
				// 썸네일을 보여줄 이미지태그
				let imgTag = document.createElement("img");
				// setAttribute로 이미 불러오고 다운하고 다 함
				imgTag.setAttribute("alt", ua_no+"_"+i);
				imgTag.setAttribute("src", "/upload/images/" + fileList[i].ua_stre_nm);
				imgTag.setAttribute("style", "width:160px; height:160px; border-radius:10px; margin-left:15px;");
				// 파일의 길이만큼 불러오고 즉 이미지가 3개면 3개 불러오고 다운로드 가능.
				aTag.href = "/upload/images/" + fileList[i].ua_stre_nm;	
				aTag.download = fileList[i].ua_nm;
				aTag.appendChild(imgTag);
				$("#fileDisp").append(aTag);
			}
		}
	}
	xhr.send();
}
	
	
	
$(function(){
	var pageForm = $("#pageForm");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		pageForm.find("#page").val(pageNo);
		pageForm.submit();
	});
})
</script>
</body>
