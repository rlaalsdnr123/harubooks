<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하루북스</title>
    <link rel="shortcut icon" href="/resources/assets/img/로고1.png">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        #container {
            width: 500px;
            height: 700px;
            margin: 5% auto;
            display: flex;
            flex-direction: column;
            align-content: center;
        }

        #logo {
            width: 150px;
            height: 110px;
            align-items: center;
        }

        #main-logo {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-item {
            margin-top: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .input-items {
            width: 80%;
            text-decoration: none;
        }

        .input-info {
            border: 1px solid #d5d5d5;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        #join-title{
            border-bottom: 1px solid black;
            margin-bottom: 20px;
        }
        #phone-form{
            display: flex;
        }
        .input-phone{
            width: 100%;
            height: 40px;
            border: 1px solid #d5d5d5;
            border-radius: 10px;
            margin-bottom: 20px;
            margin-right: 5%;
        }
    </style>
</head>

<body>
<form action="/login/signup.do?${_csrf.parameterName }=${_csrf.token}" method="post" id="joinForm">          
    <div id="container">
        <div id="main-logo"><img src="/resources/asset/image/logo1.png" alt="" id="logo"></div>
        <div class="form-item">
            <div class="input-items" id="join-title">
                <h3>회원가입</h3>
            </div>
            
	            <div class="input-items" style="display: flex;">
	                <input type="text" name="ae_id" class="input-info" placeholder="아이디를 입력해주세요" id="id"><button type="button" id="idChkBtn" style="width: 25%; height: 54px; margin-left: 10px; background-color: #3cb454; color: white; border: none; border-radius: 10px;">중복확인</button>
	            </div>
	            <div id="idCheckBox" style="display:flex; justify-content: center; align-content: center; display: none; margin-bottom: 20px">
	                
	            </div>
	            <div class="input-items">
	                <input type="password" name="ae_pw" class="input-info" placeholder="비밀번호를 입력해주세요" id="password">
	            </div>
	            <div class="input-items">
	                <input type="password" class="input-info" placeholder="다시 비밀번호를 입력해주세요" id="password2">
	            </div>
	            <div class="input-items">
	                <input type="text" name="user_nm" class="input-info" placeholder="이름을 입력해주세요" id="name">
	            </div>
	            <div class="input-items" style="margin-bottom: 20px;">
	                <h3>성별</h3>
	                <input type="radio" name="mbr_gender"  value="남자">남자
	                <input type="radio" name="mbr_gender"  value="여자">여자
	            </div>
	            <div class="input-items">
	                <h3>연락처</h3>
	                <div id="phone-form">
	                    <input type="text" name="mbr_telNo" class="input-phone" placeholder="010-1234-1234" id="mbr_telno">  
	                </div>
	            </div>
	
	            <div class="input-items">
	                <h3>배송지 주소</h3>
	            </div>
	            <div class="input-items" style="display: flex;">
	                <input type="text" name="mbr_zip" class="input-info" placeholder="우편번호찾기" id="postcode" ><button id="postcodeBtn" onclick="daumPostcode()" type="button" style="width: 35%; height: 54px; margin-left: 10px; background-color: #3cb454; color: white; border: none; border-radius: 10px;">우편번호찾기</button>
	            </div>
	            <div class="input-items">
	                <input type="text" name="mbr_addr" class="input-info" placeholder="주소를 입력해주세요" id="address" >
	            </div>
	            <div class="input-items">
	                <input type="text" name="mbr_dAddr" class="input-info" placeholder="상세주소를 입력해주세요" id="detailAddress" >
	            </div>
	            <div class="input-items">
	                <h3>생년월일</h3>
	                <input type="date" name="mbr_brdt" class="input-info" id="birth">
	            </div>
	            <div class="input-items">
	                <h3>이메일</h3>
	                <input type="text" name="mbr_email" class="input-info" placeholder="이메일을 입력해주세요" id="email">
	            </div>
	            <div class="input-items">
	                <div class="input-info">
	                    <button class="input-info" type="submit" id="joinBtn"
	                        style="background-color: white; border: 1px solid #3cb454; color: #3cb454; font-weight: bold; font-size: 1.2em;">회원가입</button>
	                </div>
	                <div class="input-info">
	                    <button class="input-info" type="button" onclick="location.href='/login/signinForm'"
	                        style="background-color: white; border: 1px solid #767676; color:#767676 ; font-weight: bold; font-size: 1.2em;">로그인하기</button>
	                </div>
	            </div>
        </div>
    </div>
   </form>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>   
    var idChkBtn = document.querySelector('#idChkBtn');
	var idCheckBox = document.querySelector('#idCheckBox');
    idChkBtn.addEventListener('click', function (event) {
        event.preventDefault();
        var idVal = document.querySelector('#id').value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/login/idCheck");
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = xhr.responseText;
                if(response === 'ok'){
                	// 중복이 아닐 경우
                    var message = "사용 가능한 아이디입니다.";
                    var color = "green";
                }else{
                	// 중복일 경우
                    var message = "중복된 아이디입니다.";
                    var color = "red";
                }
                // 동적으로 메시지 출력
                var span = document.createElement("span");
                span.style.color = color;
                span.style.fontSize = "small";
                span.textContent = message;
                idCheckBox.innerHTML = ""; // 기존 내용 초기화
                idCheckBox.appendChild(span); // 메시지 추가
                idCheckBox.style.display = "block";
            }
        }
        
        xhr.send(idVal);
    });
    
    // 회원가입 버튼클릭시 이벤트
    var joinForm = document.querySelector('#joinForm');
    var joinBtn = document.querySelector('#joinBtn');
    joinBtn.addEventListener('click',function(){
        event.preventDefault();
        let id = document.querySelector('#id').value;
        let password = document.querySelector('#password').value;
        let password2 = document.querySelector('#password2').value;
        let name = document.querySelector('#name').value;
        let tel = document.querySelector('#mbr_telno').value;
        let postcode = document.querySelector('#postcode').value;
        let address = document.querySelector('#address').value;
        let detailAddress = document.querySelector('#detailAddress').value;
        let birth = document.querySelector('#birth').value;
        let email = document.querySelector('#email').value;

        if(id == "" || id == null){
            swal('아이디를 입력해주세요', '', 'warning'); 
            return false;
        }
        if(password != password2){
            swal('비밀번호가 일치하지 않습니다 다시 입력해주세요', '', 'warning'); 
            return false;
        }
        if((password == "" || password == null) ||(password2 == "" && password2 == null)){
            swal('비밀번호를 입력해주세요', '', 'warning'); 
            return false;
        }
        if(name == "" || name == null){
            swal('이름을 입력해주세요', '', 'warning'); 
            return false;
        }
        if(tel == "" || tel == null){
            swal('연락처를 입력해주세요', '', 'warning'); 
            return false;
        }
        if((postcode ==  "" || postcode == null) || (address ==  "" || address == null) || (detailAddress ==  "" || detailAddress == null)){
            swal('주소를 입력해주세요', '', 'warning'); 
            return false;
        }
        if(birth == "" || birth == null){
            swal('생년월일을 입력해주세요', '', 'warning'); 
            return false;
        }
        if(email == "" || email == null){
            swal('이메일을 입력해주세요', '', 'warning'); 
            return false;
        }
        joinForm.submit();
    });

    // 다음 주소API
    var postcode = document.querySelector("#postcode");
    var postcodeBtn = document.querySelector('#postcodeBtn');
    var address = document.querySelector('#address');
    var detailAddress = document.querySelector('#detailAddress');
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                   
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                postcode.value = data.zonecode;
                address.value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                detailAddress.focus();
            }
       }).open();
    }
    </script>
</body>

</html>