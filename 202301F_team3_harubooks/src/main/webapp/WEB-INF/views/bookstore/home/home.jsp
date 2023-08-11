<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<!-- ====== 메인컨텐츠 ====== -->
	
	<section class="space-bottom-3" style="margin-top: 20px;">
		<div>
			<div class="container">
				<div class=""
					data-pagi-classes="text-center u-slick__pagination position-absolute right-0 left-0 mb-n8 mb-lg-4 bottom-0">
					<div class="js-slide">
						<div style="width: 100%;display: flex;flex-direction: column;margin-top: 30px;">
							<div style="width: 100%; height: 40%;" >
								<p style="font-size: 28px; font-weight: bold;color: #5055b1;" class="bannerText">올여름 무더위를 날릴 </p>
								<div style="display: flex;">
									<p style="font-size: 18px; font-weight: bold; "class="bannerText">쿨~ 한 독서 여행<span style="font-size: 44px;font-weight: bold;color: #3cb454;">하루북스</span>와 같이 북캉스 가자!!</p>
									<button id="buyBtn" class="bannerImg" style="width: 20%; color: white;font-weight: bold; font-size: 18px;border: 1px solid #5055b1;background: #5055b1;border-radius: 10px;" onclick="goBuy()">북캉스 가기</button>
								</div>
							</div>
							<div style="width: 100%; height: 60%;overflow: hidden;">
								<img class="bannerImg" alt="" src="https://contents.kyobobook.co.kr/display/i_1624_450_2_ae1b78b3adae4aa2ab467f5d18a1cdb0.jpg" >
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="space-bottom-3">
		<div class="container">
			<header
				class="mb-5 d-md-flex justify-content-between align-items-center">
				<h2 class="font-size-7 mb-3 mb-md-0" style="font-family: 'Orbit', sans-serif;">카테고리</h2>
				<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=소설" class="h-primary d-block">더 보기 <i
					class="glyph-icon flaticon-next"></i></a>
			</header>
			<ul
				class="list-unstyled my-0 row row-cols-md-2 row-cols-lg-3 row-cols-xl-4 row-cols-wd-5">
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/소설.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">소설</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=소설" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>

				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/시에세이.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">시/에세이</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=시/에세이" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/소설.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">인문</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=인문" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/경제경영1.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">경제/경영</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=경제/경영" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/정치사회.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">정치/사회</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=정치/사회" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div
							class="product-category__icon font-size-12 text-primary-indigo">
							<img alt="" src="/resources/assets/img/컴퓨터.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">컴퓨터/IT</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=컴퓨터/IT" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div class="product-category__icon font-size-12 text-tangerine">
							<img alt="" src="/resources/assets/img/음식.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">요리</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=요리" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div class="product-category__icon font-size-12 text-chili">
							<img alt="" src="/resources/assets/img/과학.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">과학</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=과학" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div class="product-category__icon font-size-12 text-carolina">
							<img alt="" src="/resources/assets/img/건강.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">건강/스포츠</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=건강/스포츠" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
				<li class="product-category col mb-4 mb-xl-0 d-xl-none d-wd-block ">
					<div class="product-category__inner px-6 py-5 m-2 categoryTitle">
						<div class="product-category__icon font-size-12 text-punch">
							<img alt="" src="/resources/assets/img/외국어.png" style="width: 50px; height: 40px;">
						</div>
						<div class="product-category__body">
							<h3 class="text-truncate font-size-3">외국어</h3>
							<a href="/harubooks/category?ccg_b002=국내도서&ccg_b003=외국어" class="stretched-link text-dark">바로가기</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<section class="space-bottom-3">
		<div class="container">
			<header
				class="mb-5 d-md-flex justify-content-between align-items-center">
				<h2 class="font-size-7 mb-3 mb-md-0" style="font-family: 'Orbit', sans-serif;">베스트셀러</h2>
			</header>

			<div
				class="js-slick-carousel products no-gutters border-top border-left border-right"
				data-pagi-classes="d-xl-none text-center position-absolute right-0 left-0 u-slick__pagination mt-4 mb-0"
				data-arrows-classes="d-none d-xl-block u-slick__arrow u-slick__arrow-centered--y"
				data-arrow-left-classes="fas fa-chevron-left u-slick__arrow-inner u-slick__arrow-inner--left ml-lg-n10"
				data-arrow-right-classes="fas fa-chevron-right u-slick__arrow-inner u-slick__arrow-inner--right mr-lg-n10"
				data-slides-show="5"
				data-responsive='[{
                   "breakpoint": 1500,
                   "settings": {
                     "slidesToShow": 4
                   }
                },{
                   "breakpoint": 1199,
                   "settings": {
                     "slidesToShow": 3
                   }
                },{
                   "breakpoint": 992,
                   "settings": {
                     "slidesToShow": 2
                   }
                }, {
                   "breakpoint": 768,
                   "settings": {
                     "slidesToShow": 1
                   }
                }, {
                   "breakpoint": 554,
                   "settings": {
                     "slidesToShow": 1
                   }
                }]'>
			<c:forEach items="${bestSellerList }" var="bestSeller">
				<div class="product">
						<div class="product__inner overflow-hidden p-3 p-md-4d875">
							<div
								class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
								<div class="woocommerce-loop-product__thumbnail">
									<a href="/harubooks/detailBook?bookNo=${bestSeller.book_no }&ccg_b002=${bestSeller.ccg_b002 }" class="d-block"><img
										src="${bestSeller.book_cover }"
										class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid"
										alt="image-description"></a>
								</div>
								<div
									class="woocommerce-loop-product__body product__body pt-3 bg-white">
									<div class="text-uppercase font-size-1 mb-1 text-truncate">
										<a href="/harubooks/detailBook?bookNo=${bestSeller.book_no }&ccg_b002=${bestSeller.ccg_b002 }">${bestSeller.ccg_b001 }</a>
									</div>
									<h2
										class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
										<a href="/harubooks/detailBook?bookNo=${bestSeller.book_no }&ccg_b002=${bestSeller.ccg_b002 }">${bestSeller.book_title }</a>
									</h2>
									<div class="font-size-2  mb-1 text-truncate">
										<a href="/harubooks/detailBook?bookNo=${bestSeller.book_no }&ccg_b002=${bestSeller.ccg_b002 }" class="text-gray-700">${bestSeller.book_author }</a>
									</div>
									<div
										class="price d-flex align-items-center font-weight-medium font-size-3">
										<span class="woocommerce-Price-amount amount"><span 
											class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${bestSeller.book_amt }" pattern="#,###" />원</span>
									</div>
								</div>
								<div class="product__hover d-flex align-items-center">
									<a href="../shop/single-product-v1.html"
										class="text-uppercase text-dark h-dark font-weight-medium mr-auto">
										<span class="product__add-to-cart">장바구니 추가</span> <span
										class="product__add-to-cart-icon font-size-4"><i
											class="flaticon-icon-126515"></i></span>
									</a> <a href="../shop/single-product-v1.html"
										class="mr-1 h-p-bg btn btn-outline-primary border-0"> <i
										class="flaticon-switch"></i>
									</a> <a href="../shop/single-product-v1.html"
										class="h-p-bg btn btn-outline-primary border-0"> <i
										class="flaticon-heart"></i>
									</a>
								</div>
							</div>
						</div>					
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	
	<section class="space-bottom-3">
		<div class="container">
			<header
				class="mb-5 d-md-flex justify-content-between align-items-center">
				<h2 class="font-size-7 mb-3 mb-md-0" style="font-family: 'Orbit', sans-serif;">하루북스 추천 책</h2>
			</header>
			<!--하루 북스 책추천 책 넣는곳-->
			<div class="js-slick-carousel u-slick products border"
				data-pagi-classes="text-center u-slick__pagination mt-md-8 mt-4 position-absolute right-0 left-0"
				data-slides-show="3"
				data-responsive='[{
                   "breakpoint": 992,
                   "settings": {
                     "slidesToShow": 2
                   }
                }, {
                   "breakpoint": 768,
                   "settings": {
                     "slidesToShow": 1
                   }
                }, {
                   "breakpoint": 554,
                   "settings": {
                     "slidesToShow": 1
                   }
                }]'>
                <c:forEach items="${koreaBookList }" var="korea">
					<div class="product product__card border-right">
						<div class="media p-3 p-md-4d875">
							<a href="/harubooks/detailBook?bookNo=${korea.book_no }&ccg_b002=${korea.ccg_b002 }" class="d-block"><img
								src="${korea.book_cover }" alt="image-description"></a>
							<div class="media-body ml-4d875">
								<div class="text-uppercase font-size-1 mb-1 text-truncate">
									<a href="/harubooks/detailBook?bookNo=${korea.book_no }&ccg_b002=${korea.ccg_b002 }">${korea.ccg_b001 }</a>
								</div>
								<h2
									class="woocommerce-loop-product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark">
									<a href="/harubooks/detailBook?bookNo=${korea.book_no }&ccg_b002=${korea.ccg_b002 }">${korea.book_title }</a>
								</h2>
								<div class="font-size-2 mb-1 text-truncate">
									<a href="/harubooks/detailBook?bookNo=${korea.book_no }&ccg_b002=${korea.ccg_b002 }" class="text-gray-700">${korea.book_author }</a>
								</div>
								<div
									class="price d-flex align-items-center font-weight-medium font-size-3">
									<span class="woocommerce-Price-amount amount"><span
										class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${korea.book_amt }" pattern="#,###" />원</span>
								</div>
							</div>
						</div>
					</div>               
                </c:forEach>
			</div>
		</div>
		<input type="hidden" value="${msg}" id="msg">
	</section>
	<script>
		var msg = document.querySelector('#msg').value;
		if(msg != ""){
			alert(msg);
		}
		function goBuy(){
			location.href="/harubooks/category?ccg_b002=국내도서";
		}
	</script>
	<!-- ====== END MAIN CONTENT ====== -->

