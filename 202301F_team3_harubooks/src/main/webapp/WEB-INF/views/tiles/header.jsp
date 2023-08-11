<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!--===== HEADER CONTENT =====-->
<header id="site-header" class="site-header__v1">
	<div class="topbar border-bottom d-none d-md-block">
		<div class="container-fluid px-2 px-md-5 px-xl-8d75">
			<div
				class="topbar__nav d-md-flex justify-content-between align-items-center">
				<ul class="topbar__nav--left nav ml-md-n3">
				
				</ul>
				<ul class="topbar__nav--right nav mr-md-n3">
					<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
						<li class="nav-item"><a href='/login/signinForm' class="nav-link link-black-100">로그인</a></li>
						<li class="nav-item"><a href='/login/signupForm' class="nav-link link-black-100">회원가입</a></li>		
					</c:if>
					<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT']}">	
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item"><button onclick="location.href='/mng'" style="margin-top: 5px; border: 1px solid #5055b1;border-radius: 10px;background:#5055b1;color: white; ">관리자 페이지 이동</button></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_PUBLISHER')">
							<li class="nav-item"><button onclick="location.href='/pub'" style="margin-top: 5px; border: 1px solid #5055b1;border-radius: 10px;background:#5055b1;color: white; ">출판사 페이지 이동</button></li>
						</sec:authorize>
						<li class="nav-item"><a href='#' class="nav-link link-black-100"><sec:authentication property="name"/>님 </a></li>
						
										
						<!-- 상단 아이콘 -->
						<li class="nav-item" style="position: static;"><a href="#"
							class="nav-link link-black-100"><i class="glph-icon flaticon-pin"></i></a></li>
						<!-- 장바구니 목록보기 -->
						<li class="nav-item">
							<a href="/harubooks/myCart"class="nav-link link-black-100" style="position: relative;">
								<i class="glph-icon flaticon-icon-126515"></i>
								<c:if test="${cartCnt ne 0}">
									<span class="position-absolute  width-16 height-16 rounded-circle d-flex align-items-center justify-content-center text-white font-size-n9  right-10" style="background:#5055b1;color: white; right: 1%;top: 3px;">${cartCnt }</span>								
								</c:if>
							</a>
						</li>
						<!-- 찜목록 보기 -->
						<li class="nav-item">
							<a href="/wish/list"class="nav-link link-black-100" style="position: relative;">
								<i class="glph-icon flaticon-heart"></i>
						<c:if test="${wishCnt ne 0}">
							<span class="position-absolute  width-16 height-16 rounded-circle d-flex align-items-center justify-content-center text-white font-size-n9  right-10" style="background:#5055b1;color: white; right: 1%;top: 3px;">${wishCnt }</span>
						</c:if>
						</a>
						</li>
						<!-- 마이페이지로 이동 -->
						<li class="nav-item">
							<!-- Account Sidebar Toggle Button --> <a id="sidebarNavToggler"
							href="/harubooks/myPage/orderList?status=order" role="button" class="nav-link link-black-100"> <!-- 로그인 아이콘-->
								<i class="glph-icon flaticon-user"></i>
						</a> <!-- End Account Sidebar Toggle Button -->
						</li>
						<!--장바구니-->
						
						<li class="nav-item"><a href='/login/logout' class="nav-link link-black-100">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="masthead border-bottom position-relative"
		style="margin-bottom: -1px;">
		<div class="container-fluid px-3 px-md-5 px-xl-8d75 py-2 py-md-0">
			<div class="d-flex align-items-center position-relative flex-wrap">
				<div class="offcanvas-toggler mr-4 mr-lg-8">
					<a id="sidebarNavToggler2" href="javascript:;" role="button"
						class="cat-menu" aria-controls="sidebarContent2"
						aria-haspopup="true" aria-expanded="false"
						data-unfold-event="click" data-unfold-hide-on-scroll="false"
						data-unfold-target="#sidebarContent2"
						data-unfold-type="css-animation"
						data-unfold-overlay='{
                            "className": "u-sidebar-bg-overlay",
                            "background": "rgba(0, 0, 0, .7)",
                            "animationSpeed": 100
                        }'
						data-unfold-animation-in="fadeInLeft"
						data-unfold-animation-out="fadeOutLeft" data-unfold-duration="100">
					</a>
				</div>
				<div class="site-branding pr-md-4">
					<a href="/harubooks/main" class="d-block mb-1"> <img
						style="width: 80px; height: 60px;"
						src="/resources/assets/img/로고3.png" onclick="location.href='/harubooks/main'" alt="">
					</a>
				</div>
				<!--상단 메뉴 바-->
				<div class="site-navigation mr-auto d-none d-xl-block">
					<ul class="nav">

						<li class="nav-item"><a href="#"
							class="nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium active border-bottom border-primary border-width-2">메인페이지</a></li>

						<li class="nav-item"><a id="featuresDropdownInvoker" href="#"
							class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center"
							aria-haspopup="true" aria-expanded="false"
							data-unfold-event="hover"
							data-unfold-target="#featuresDropdownMenu"
							data-unfold-type="css-animation" data-unfold-duration="200"
							data-unfold-delay="50" data-unfold-hide-on-scroll="true"
							data-unfold-animation-in="slideInUp"
							data-unfold-animation-out="fadeOut"> 모아보기 </a>
							<div id="featuresDropdownMenu"
								class="p-0 dropdown-unfold dropdown-menu megamenu font-size-2 rounded-0 border-gray-900"
								aria-labelledby="featuresDropdownInvoker" style="width: 1100px;">
								<div class="row no-gutters">
									<div class="col-8 px-1">
										<div class="px-5 py-2 pb-5">
											<div class="row">

												<div class="col-3">
													<ul class="menu list-unstyled">
														<li><span
															class=" d-block link-black-100 py-3 font-size-3 font-weight-bold">도서
																분류</span></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서"
															class="d-block link-black-100 py-1">국내 도서</a></li>
														<li><a href="/harubooks/category?ccg_b002=해외도서"
															class="d-block link-black-100 py-1">해외 도서</a></li>
														<li><a href="/harubooks/category?ccg_b002=인터넷도서"
															class="d-block link-black-100 py-1">e-Book</a></li>
														<li><span
															class=" d-block link-black-100 py-3 font-size-3 font-weight-bold">카테고리</span></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=소설"
															class="d-block link-black-100 py-1">소설</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=시/에세이"
															class="d-block link-black-100 py-1">시/에세이</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=인문"
															class="d-block link-black-100 py-1">인문</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=경제/경영"
															class="d-block link-black-100 py-1">경제/경영</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=정치/사회"
															class="d-block link-black-100 py-1">정치/사회</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=컴퓨터/IT"
															class="d-block link-black-100 py-1">컴퓨터/IT</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=요리"
															class="d-block link-black-100 py-1">요리</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=과학"
															class="d-block link-black-100 py-1">과학</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=건강/스포츠"
															class="d-block link-black-100 py-1">건강/스포츠</a></li>
														<li><a href="/harubooks/category?ccg_b002=국내도서&&ccg_b003=외국어"
															class="d-block link-black-100 py-1">외국어</a></li>
													</ul>
												</div>
												<div class="col-3">
													<ul class="menu list-unstyled">
														<li><span
															class=" d-block link-black-100 py-3 font-size-3 font-weight-bold">하루터</span></li>
														<li><a href="/haruter/haruFeed"
															class="d-block link-black-100 py-1">하루터 이동</a></li>
													</ul>
												</div>
												<div class="col-3">
													<ul class="menu list-unstyled">
														<li><span
															class=" d-block link-black-100 py-3 font-size-3 font-weight-bold">고객센터</span></li>
														
														<li><a href="/harubooks/faq"
															class="d-block link-black-100 py-1">FAQ</a></li>
														<li><a href="/harubooks/noticeView"
															class="d-block link-black-100 py-1">공지사항</a></li>
														<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
															<li><a href="/login/signupForm"
																class="btn btn-primary mb-3 mb-md-0 mb-xl-3 mt-4 font-size-2 btn-block"
																style="background-color: #5055b1; border: none;">회원가입</a></li>
															<li><a href="/login/signinForm"
																class="btn btn-secondary font-size-2 btn-block mb-2
																" style=" border: 1px solid 5055b1; color: 5055b1;">로그인</a>
															</li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4 bg-gray-200">
										<div class="banner px-8 py-5">
											<div class="banner__body">
												<h3 class="banner_text m-0">
													<span class="" style="font-size: 18px;font-weight: bold;">이달의 책 </span>
												</h3>
												<div class="banner__image">
													<img src="https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791169850360.jpg" class="img-fluid"
														alt="image-description">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div></li>
						<!--하루터 이동페이지 -->
						<li class="nav-item"><a href="/haruter/haruFeed"
							class="nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium active">하루터</a></li>
						<li class="nav-item dropdown"><a id="pagesDropdownInvoker"
							href="#"
							class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center"
							aria-haspopup="true" aria-expanded="false"
							data-unfold-event="hover" data-unfold-target="#pagesDropdownMenu"
							data-unfold-type="css-animation" data-unfold-duration="200"
							data-unfold-delay="50" data-unfold-hide-on-scroll="true"
							data-unfold-animation-in="slideInUp"
							data-unfold-animation-out="fadeOut"> 고객센터 </a>
							<ul id="pagesDropdownMenu"
								class="dropdown-unfold dropdown-menu font-size-2 rounded-0 border-gray-900"
								aria-labelledby="pagesDropdownInvoker">
								<li><a href="/harubooks/faq"
									class="dropdown-item link-black-100">FAQ</a></li>
								<li><a href="/harubooks/noticeView"
									class="dropdown-item link-black-100">공지사항</a></li>
								
							</ul></li>
						<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT']}">
							<li class="nav-item dropdown"><a id="shopDropdownInvoker"
								href="/harubooks/myPage/orderList?status=order"
								class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center"
								aria-haspopup="true" aria-expanded="false"
								data-unfold-event="hover" data-unfold-target="#shopDropdownMenu"
								data-unfold-type="css-animation" data-unfold-duration="200"
								data-unfold-delay="50" data-unfold-hide-on-scroll="true"
								data-unfold-animation-in="slideInUp"
								data-unfold-animation-out="fadeOut"> 마이페이지 </a>
								<ul id="shopDropdownMenu"
									class="dropdown-unfold dropdown-menu font-size-2 rounded-0 border-gray-900"
									aria-labelledby="shopDropdownInvoker">
																		
									<li><a href="/harubooks/myPage/orderList?status=order"
										class="dropdown-item link-black-100">주문/배송목록</a></li>
									<li><a href="/harubooks/myPage/orderList?status=complete"
										class="dropdown-item link-black-100">구매확정목록</a></li>
									<li><a href="/harubooks/myPage/orderList?status=refund"
										class="dropdown-item link-black-100">환불내역</a></li>
									<li><a href="../shop/v4.html"
										class="dropdown-item link-black-100">찜목록</a></li>
									<li><a href="/harubooks/myCart"
										class="dropdown-item link-black-100">장바구니 목록</a></li>
									<li><a href="/harubooks/myPage/orderList?status=inquiry"
										class="dropdown-item link-black-100">1:1문의</a></li>
									<li><a href="../shop/v7.html"
										class="dropdown-item link-black-100">내 정보 수정</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>

				<ul class="d-md-none nav mr-md-n3 ml-auto">
					<li class="nav-item">
						<!-- Account Sidebar Toggle Button - Mobile --> <a
						id="sidebarNavToggler9" href="javascript:;" role="button"
						class="px-2 nav-link link-black-100"
						aria-controls="sidebarContent9" aria-haspopup="true"
						aria-expanded="false" data-unfold-event="click"
						data-unfold-hide-on-scroll="false"
						data-unfold-target="#sidebarContent9"
						data-unfold-type="css-animation"
						data-unfold-overlay='{
                                    "className": "u-sidebar-bg-overlay",
                                    "background": "rgba(0, 0, 0, .7)",
                                    "animationSpeed": 500
                                }'
						data-unfold-animation-in="fadeInRight"
						data-unfold-animation-out="fadeOutRight"
						data-unfold-duration="500"> <i class="glph-icon flaticon-user"></i>
					</a> <!-- End Account Sidebar Toggle Button - Mobile -->
					</li>
				</ul>

				<div class="site-search ml-xl-0 ml-md-auto w-r-100 my-2 my-xl-0" style="border-radius: 10px;background: white;border: 1px solid #3cb454;width: 35%;">
						<div class="input-group" style="border-radius: 10px;background: white;width: 100%;">
							<div class="input-group-prepend">
								<i class="ri-search-line" style="font-size: 28px;color: #3cb454;;margin-right: 15px;margin-left: 5px;"></i>
							</div>
							<input id="searchWord" type="text" name="searchWord" placeholder="[통합검색] 제목/작가를 검색하세요" aria-label="Search" onkeyup="searchEnter()" style="border: none;width: 78%;">							
							<input id="searchBtn" style="border: none; background: white;border-left: 1px solid #3cb454;;text-align: center;" type="button" value="검색">
						</div>		
				</div>
			</div>
		</div>
	</div>
</header>


<!-- End Account Sidebar Navigation - Desktop -->

<!-- Cart Sidebar Navigation -->
<aside id="sidebarContent1" class="u-sidebar u-sidebar__xl"
	aria-labelledby="sidebarNavToggler1">
	<div class="u-sidebar__scroller js-scrollbar">
		<div class="u-sidebar__container">
			<div class="u-header-sidebar__footer-offset">
				<!-- Toggle Button -->
				<div
					class="d-flex align-items-center position-absolute top-0 right-0 z-index-2 mt-5 mr-md-6 mr-4">
					<button type="button" class="close ml-auto"
						aria-controls="sidebarContent1" aria-haspopup="true"
						aria-expanded="false" data-unfold-event="click"
						data-unfold-hide-on-scroll="false"
						data-unfold-target="#sidebarContent1"
						data-unfold-type="css-animation"
						data-unfold-animation-in="fadeInRight"
						data-unfold-animation-out="fadeOutRight"
						data-unfold-duration="500">
						<span aria-hidden="true">닫기 <i class="fas fa-times ml-2"></i></span>
					</button>
				</div>
				<!-- End Toggle Button -->

				<!-- Content -->
				<div class="u-sidebar__body">
					<div class="u-sidebar__content u-header-sidebar__content">
						<!-- Title -->
						<header class="border-bottom px-4 px-md-6 py-4">
							<h2 class="font-size-3 mb-0 d-flex align-items-center">
								<i class="flaticon-icon-126515 mr-3 font-size-5"></i>장바구니
							</h2>
						</header>
						<!-- End Title -->


						<!--장바구니 목록-->
						<div class="px-4 py-5 px-md-6 border-bottom">
							<div class="media">
								<a href="#" class="d-block"><img
									src="https://placehold.it/100x153" class="img-fluid"
									alt="image-description"></a>
								<div class="media-body ml-4d875">
									<div
										class="text-primary text-uppercase font-size-1 mb-1 text-truncate">
										<a href="#">EX:소설</a>
									</div>
									<h2
										class="woocommerce-loop-product__title h6 text-lh-md mb-1 text-height-2 crop-text-2">
										<a href="#" class="text-dark">장바구니에 담을 책 이름입니다</a>
									</h2>
									<div class="font-size-2 mb-1 text-truncate">
										<a href="#" class="text-gray-700">가격</a>
									</div>
									<div
										class="price d-flex align-items-center font-weight-medium font-size-3">
										<span class="woocommerce-Price-amount amount">2 x <span
											class="woocommerce-Price-currencySymbol">$</span>200
										</span>
									</div>
								</div>
								<div class="mt-3 ml-3">
									<a href="#" class="text-dark"><i class="fas fa-times"></i></a>
								</div>
							</div>
						</div>
						<div
							class="px-4 py-5 px-md-6 d-flex justify-content-between align-items-center font-size-3">
							<h4 class="mb-0 font-size-3">총합:</h4>
							<div class="font-weight-medium">21000원</div>
						</div>

						<div class="px-4 mb-8 px-md-6">
							<button type="submit"
								class="btn btn-block py-4 rounded-0 btn-outline-dark mb-4">장바구니
								목록보기</button>
							<button type="submit"
								class="btn btn-block py-4 rounded-0 btn-dark">결제하기</button>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
		</div>
	</div>
</aside>
<!-- End Cart Sidebar Navigation -->
<script type="text/javascript">
	let searchBtn = document.querySelector("#searchBtn");
	searchBtn.addEventListener('click',function(){
		let searchWord = document.querySelector("#searchWord").value;
		location.href = "/harubooks/category?searchWord="+searchWord;		
	})
	
	function searchEnter(){
		if(window.event.keyCode == 13){
			let searchWord = document.querySelector("#searchWord").value;
			location.href = "/harubooks/category?searchWord="+searchWord;
		}
	}
	
</script>
<!-- Categories Sidebar Navigation -->
<!--===== 헤더 끝!! =====-->