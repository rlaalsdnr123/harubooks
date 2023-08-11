<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html lang="en">
                <link rel="stylesheet" href="/resources/assets/css/bookDetail.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
				<link rel="stylesheet" href="/resources/assets/css/modal.css">
				<link rel="stylesheet" href="/resources/assets/css/scroll.css">
                <body class="">


                    <!--헤더 삽입-->
					<c:choose>
					    <c:when test="${(reviewCnt ne 0) or (reviewTotalScore ne 0)}">
					    	<c:set var="averageScoreInt" value="${fn:split((reviewTotalScore/reviewCnt),'.')[0]}"></c:set>
					    	<c:set var="averageScore" value="${reviewTotalScore/reviewCnt}"></c:set>
					    </c:when>
					    <c:otherwise>
					        <c:set var="averageScoreInt" value="0"></c:set>
					        <c:set var="averageScore" value="0"></c:set>
					    </c:otherwise>
					</c:choose>
					

                    <!-- ====== MAIN CONTENT ====== -->
                    <div class="page-header border-bottom">
                        <div class="container">
                            <div class="d-md-flex justify-content-between align-items-center py-4">
                                <h1 class="page-title font-size-3 font-weight-bold m-0 text-lh-lg font-size-9">
                                    ${book.book_title }</h1>
                                    <input type="hidden" value="${book.ccg_b002 }" id="ccg_b002">
                                <nav class="woocommerce-breadcrumb font-size-2">
                                    <a href="/harubooks/category?ccg_b002=${book.ccg_b002 }&ccg_b003=${book.ccg_b003 }"
                                        class="h-primary">${book.ccg_b002 }</a>
                                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                                    <a href="/harubooks/category?ccg_b002=${book.ccg_b002 }&ccg_b003=${book.ccg_b003 }"
                                        class="h-primary">${book.ccg_b003 }</a>

                                </nav>
                            </div>
                        </div>
                    </div>
                    <div id="primary" class="content-area">
                        <main id="main" class="site-main ">
                            <div class="product">
                                <div class="container">
                                    <div id="intro-product">
                                        <div id="intro-1">
                                            <div id="intro-1-1">
                                                <div id="intro-1-1-1">
                                                    <p style="font-weight: bold;">지은이 : ${book.book_author }</p>
                                                    <p style="color:#767676; font-size: small;">${book.pub_nm } ·
                                                        ${book.book_spmt_ymd }</p>
                                                </div>
                                                <div id="intro-1-1-2">
                                                    <div style="flex: 50%; width: 50%; display: flex;">
                                                        <div
                                                            style="width: 90%;margin: 0 auto;display: flex;align-items: center;flex-direction: column;">
                                                            <p
                                                                style="text-align: center;margin-top: 8px;margin-bottom: 5px;color: #3cb454;font-weight: bold;">${averageScore}점</p>
                                                            <div>
                                                            	<c:choose>
                                                            		<c:when test="${averageScoreInt eq 0 }">
			                                                            <c:forEach begin="1" end="5"> 
			 	                                                              <i class="ri-star-line" style="color: #3ec92c;font-size: 16px;margin-right: 0px;"></i>                                                        	 
			                                                            </c:forEach>                                                             			
                                                            		</c:when>
		                                                            <c:otherwise>
		                                                             	<c:forEach begin="1" end="${averageScoreInt }"> 
		 	                                                                <i class="fa-solid fa-star" style="color: #3ec92c;"></i>                                                        	 
		                                                             	</c:forEach> 
		                                                            </c:otherwise>
                                                            	</c:choose>
                                                            </div>
                                                            <span
                                                                style="font-size: small; color:#767676;margin-top: 10px">(${reviewCnt }개의 리뷰)</span>

                                                        </div>
                                                    </div>
                                                    <div
                                                        style="flex: 50%; width: 50%;display: flex;align-items: center;justify-content: center;">
                                                        <div
                                                            style="width: 80%;margin: 0 auto;display: flex;align-items: center;">
                                                            <button id="reviewBtn"
                                                                style="width: 80%;height:50px;border-radius:15px;background:#d5d5d5;font-weight:bold;font-size: 14px;color:white; border:none;  margin:0 auto;">리뷰작성</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div id="intro-2">
                                            <div id="intro-2-1" style="width: 100%;">
                                                <h5
                                                    style="font-weight: bold;text-align: center;color: #595959;margin-top: 30px;">
                                                    ${book.book_title }</h5>
                                            </div>
                                            <div id="intro-2-1"
                                                style="width: 100%; display: flex;align-items: center;margin-top: 20px;">
                                                <img src="${book.book_cover }" alt="Image Description"
                                                    class="mx-auto img-fluid"
                                                    style="width: 200px; height: 352px;image-rendering: -webkit-optimize-contrast;transform: translateZ(0);backface-visibility: hidden;">
                                            </div>
                                            <div
                                                style=" width: 90%;border: 1px solid #d5d5d5;margin: 0 auto;margin-top: 50px; margin-bottom: 20px;border-radius: 15px;display: flex;align-items: center;justify-content: center;">
                                                <p
                                                    style="font-size: 13px;text-align: center;color:#595959; margin-top: 15px; ">
                                                    ${book.book_content }</p>
                                            </div>
                                        </div>
                                        <div id="intro-3">
                                            <div id="intro-3-1" style="display: flex;">
                                                <div style="margin-top: 30px;display: flex; align-items: center;">
                                                    <div
                                                        style="border: 2px solid green;border-radius:15px; width: 80px;height: 30px;">
                                                        <p
                                                            style="text-align: center; font-size: small; font-weight: bold;">
                                                            # ${book.ccg_b001 }</p>
                                                    </div>
                                                    <div
                                                        style="border: 2px solid #595959;border-radius:15px; width: 110px;height: 30px;">
                                                        <p
                                                            style="text-align: center;font-size: small;font-weight: bold;">
                                                            # ${book.ccg_b002 }</p>
                                                    </div>
                                                    <div
                                                        style="border: 2px solid #6528e0;border-radius:15px; width: 100px;height: 30px;">
                                                        <p
                                                            style="text-align: center;font-size: small;font-weight: bold;">
                                                            # ${book.ccg_b003 }</p>
                                                    </div>
                                                    <div
                                                        style="border: 2px solid skyblue;border-radius:15px; width: 85px;height: 30px;">
                                                        <p
                                                            style="text-align: center;font-size: small;font-weight: bold;">
                                                            # 무료배송</p>
                                                    </div>
                                                </div>
                                            </div> 
                                                <div id="intro-3-1"
                                                    style="display: flex; flex-direction: column; width: 90%;">
                                                    <div
                                                        style="margin-top: 50px; border-bottom: 1px solid #d5d5d5; width: 100%;">
                                                        <span
                                                            style="color: #3cb454; font-size:24px;">${book.book_discount
                                                            }% </span><span
                                                            style="font-size: 30px;"><fmt:formatNumber value="${book.book_ntsl_amt}" pattern="#,###" />원 </span><del
                                                            style="color: rgb(221, 81, 104);font-weight: bold;"><fmt:formatNumber value="${book.book_amt}" pattern="#,###" />원</del>
                                                    </div>
                                                    <div
                                                        style="margin-top: 10px; border-bottom: 1px solid #d5d5d5; width: 100%;">
                                                        <span style="font-size:18px; font-weight: bold;">적립/마일리지 </span>
                                                        <c:set var="totalAmount"
                                                            value="${book.book_ntsl_amt * book.book_mileage}" />
                                                        <p style="color:#3cb454; font-weight: bold; ">
                                                            <fmt:formatNumber value="${totalAmount}" type="number"
                                                                pattern="#.#" />
                                                        </p>
                                                        <!--구매하면 얻는 총 마일리지-->
                                                        <input type="hidden" name="book_mileage" id="mileage"
                                                            value="<fmt:formatNumber value='${totalAmount}' type='number' pattern='#.#' />">
                                                        <!--구매하면 얻는 총 마일리지-->

                                                        <!--책 번호 -->
                                                        <input type="hidden" name="book_no" value="${book.book_no}" id="bookNo">
                                                    </div>
                                                    <div
                                                        style="margin-top: 10px; border-bottom: 1px solid #d5d5d5; width: 100%; display: flex; justify-content: space-between;">
                                                        <span style="font-size:18px; font-weight: bold;">수량 : </span>
                                                        <div>
                                                            <a id="minus"><i class="fa-solid fa-circle-minus fa-xl"
                                                                    style="color: #12b51d;line-height:none;"></i></a>
                                                        </div>
                                                        <div>
                                                            <span style="font-size: 20px;" id="cnt">1</span>
                                                            <!--총 구매할 개수-->
                                                            <input type="hidden" name="pl_cnt" id="pl_cnt">
                                                        </div>
                                                        <div>
                                                            <i id="plus" class="fa-solid fa-circle-plus fa-xl"
                                                                style="color: #12b51d;line-height:none;"></i>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 10px; width: 100%;">
                                                        <div style="text-align: center; ">
                                                            <span style="font-weight: bold;">총 상품 금액 : </span><span
                                                                style="font-size: 26px; font-weight: bold; color: #3cb454;"
                                                                id="totalPrice"> <fmt:formatNumber value="${book.book_ntsl_amt}" pattern="#,###" /></span><span
                                                                style="font-size: 22px; font-weight: bold; color: #3cb454;">원</span>
                                                        </div>
                                                        <div
                                                            style="display: flex; flex-direction: column; margin-top: 30px;">
                                                            <button id="wishList" type="button"
                                                                style="height:50px; width:80%; margin:0 auto; font-size:1.2em; font-weight:bold; border-radius:15px; border:1px solid rgb(221, 81, 104); background-color:white; color:rgb(221, 81, 104);">찜하기</button>
                                                        </div>
                                                        <div
                                                            style="display: flex; flex-direction: column; margin-top: 30px;">
                                                            <button id="basketList" type="button"
                                                                style="height:50px; width:80%; margin:0 auto; font-size:1.2em; font-weight:bold; border-radius:15px; border:1px solid #767676; background-color:white; color:#767676;">장바구니 추가하기</button>
                                                        </div>
                                                        
                                                        <div style="display: flex; flex-direction: column; margin-top: 30px;">
                                                        	
                                                            <button id="buyProd" type="button"
                                                                style="height:50px; width:80%; margin:0 auto; font-size:1.2em; font-weight:bold; border-radius:15px; border:1px solid #3cb454; background-color:white; color: #3cb454;">구매하기</button>
                                                        </div>
                                                        <!--총 상품금액-->
                                                        <input type="hidden" name="pl_prchs_amt" id="pl_prchs_amt">
                                                        <input type="hidden" value="${book.book_ntsl_amt}" id="price">
                                                    </div>
                                                </div>
                                        </div>
                                    </div>


                                </div>

                                <!-- Nav Classic -->
                                <div class="js-scroll-nav mb-10">
                                    <div class="woocommerce-tabs wc-tabs-wrapper  2 mx-lg-auto">
                                        <div id="Description" class="">
                                            <div class="border-top border-bottom">
                                                <ul
                                                    class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active"
                                                            href="#Description">
                                                            줄거리
                                                        </a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium"
                                                            href="#ProductDetails">
                                                            책 상세보기
                                                        </a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium" href="#ProductReviews">리뷰 (${reviewCnt })</a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active" href="#ProductCompare" style="border: none;"> 책 비교하기</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!-- Tab Content -->
                                            <div class="tab-content font-size-2 container">
                                                <div class="row">
                                                    <div class="col-xl-8 offset-xl-2">
                                                        <div
                                                            class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab pt-9">
                                                            <!-- Mockup Block -->
                                                            <p class="mb-0">${book.book_content }</p>
                                                            <br><br>
                                                            <!-- End Mockup Block -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Tab Content -->
                                        </div>

                                        <div id="ProductDetails" class="">
                                            <div class="border-top border-bottom">
                                                <ul
                                                    class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium" href="#Description">
                                                            줄거리
                                                        </a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active"
                                                            href="#ProductDetails">
                                                            책 상세정보
                                                        </a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium" href="#ProductReviews"> 리뷰 (${reviewCnt })</a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active" href="#ProductCompare" style="border: none;"> 책 비교하기</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!-- Tab Content -->
                                            <div class="tab-content font-size-2 container">
                                                <div class="row">
                                                    <div class="col-xl-8 offset-xl-2">
                                                        <div
                                                            class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab pt-9">
                                                            <!-- Mockup Block -->
                                                            <div class="table-responsive mb-4">
                                                                <table class="table table-hover table-borderless">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">포맷: </th>
                                                                            <td style="text-align: center">
                                                                                ${book.ccg_b001 }</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">페이지 수</th>
                                                                            <td style="text-align: center">
                                                                                ${book.book_page_cnt }</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">출간일: </th>
                                                                            <td style="text-align: center">
                                                                                ${book.book_spmt_ymd }</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">출판사:</th>
                                                                            <td style="text-align: center">${book.pub_nm}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">가격:</th>
                                                                            <td style="text-align: center">
                                                                                <fmt:formatNumber value="${book.book_amt }" pattern="#,###" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th class="px-4 px-xl-5"
                                                                                style="text-align: center">ISBN:</th>
                                                                            <td style="text-align: center">
                                                                                ${book.book_isbn }</td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <!-- End Mockup Block -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Tab Content -->
                                        </div>
                                        <div id="ProductReviews" class="">
                                            <div class="border-top border-bottom">
                                                <ul
                                                    class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium" href="#Description">줄거리</a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                                        <a class="nav-link py-4 font-weight-medium" href="#ProductDetails"> 책 상세정보</a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active" href="#ProductReviews"> 리뷰 (${reviewCnt })</a>
                                                    </li>
                                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                                        <a class="nav-link py-4 font-weight-medium active" href="#ProductCompare" style="border: none;"> 책 비교하기</a>
                                                    </li>
                                                </ul>
                                            </div>


                                            <!-- Tab Content -->
                                            <div id="reviewContent" class="tab-content font-size-2 container">
                                                <div class="row">
                                                    <div class="col-xl-8 offset-xl-2">
                                                        <div
                                                            class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab pt-9">
                                                            <!-- Mockup Block -->
                                                            <h4 class="font-size-3 font-weight-bold">리뷰 </h4>
                                                            <div class="row mb-8">
                                                                <div class="col-md-6 mb-6 mb-md-0">
                                                                    <div class="d-flex  align-items-center mb-4">
                                                                        <span
                                                                            class="font-size-15 font-weight-bold">${averageScore }</span>
                                                                        <div class="ml-3 h6 mb-0">
                                                                            <span class="font-weight-normal">${reviewCnt } 개 리뷰</span>
                                                                            <div class="text-yellow-darker">
                                                                           	<c:forEach begin="1" end="${averageScoreInt }"> 
 					                                                                <i class="fa-solid fa-star" style="color: #3ec92c;"></i>                                                        	 
 				                                                            	</c:forEach> 
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="d-md-flex">
                                                                        <button type="button" id="reviewWriteBtn" style="background:#5055b1;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:44px;color:white;">리뷰 작성하기</button>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <!-- Ratings -->
                                                                    <ul class="list-unstyled pl-xl-4">
                                                                        <li class="py-2">
                                                                            <a class="row align-items-center mx-gutters-2 font-size-2"
                                                                                href="javascript:;">
                                                                                <div class="col-auto">
                                                                                    <span class="text-dark">5점</span>
                                                                                </div>
                                                                                <div class="col px-0">
                                                                                	<c:set value="0" var="five"/>
                                                                                	<c:set value="0" var="rateFive"/>
                                                                                	<c:set value="0" var="four"/>
                                                                                	<c:set value="0" var="rateFour"/>
                                                                                	<c:set value="0" var="three"/>
                                                                                	<c:set value="0" var="rateThree"/>
                                                                                	<c:set value="0" var="two"/>
                                                                                	<c:set value="0" var="rateTwo"/>
                                                                                	<c:set value="0" var="one"/>
                                                                                	<c:set value="0" var="rateOne"/>
                                                                                	<c:forEach items="${scrList }" var="scr">  
                                                                                		<c:choose>
                                                                                			<c:when test="${scr.review_scr eq 5 }">
                                                                                				<c:set value="${scr.scr_cnt }" var="five"/>
                                                                                				<c:set value="${(five/reviewCnt)*100 }" var="rateFive"/>
                                                                                			</c:when>
                                                                                			<c:when test="${scr.review_scr eq 4 }">
                                                                                				<c:set value="${scr.scr_cnt }" var="four"/>
                                                                                				<c:set value="${(four/reviewCnt)*100 }" var="rateFour"/>
                                                                                			</c:when>
                                                                                			<c:when test="${scr.review_scr eq 3 }">
                                                                                				<c:set value="${scr.scr_cnt }" var="three"/>
                                                                                				<c:set value="${(three/reviewCnt)*100 }" var="rateThree"/>
                                                                                			</c:when>
                                                                                			<c:when test="${scr.review_scr eq 2 }">
                                                                                				<c:set value="${scr.scr_cnt }" var="two"/>
                                                                                				<c:set value="${(two/reviewCnt)*100 }" var="rateTwo"/>
                                                                                			</c:when>
                                                                                			<c:when test="${scr.review_scr eq 1 }">
                                                                                				<c:set value="${scr.scr_cnt }" var="one"/>
                                                                                				<c:set value="${(one/reviewCnt)*100 }" var="rateOne"/>
                                                                                			</c:when>
                                                                                			
                                                                                		</c:choose>

                                                                                	</c:forEach>
                                                                                    <div class="progress bg-white-100"
                                                                                        style="height: 7px;">
                                                                                        <div class="progress-bar" 
                                                                                            role="progressbar"
                                                                                            style="width: ${rateFive}%; background: #3ec92c;"
                                                                                            aria-valuenow="100"
                                                                                            aria-valuemin="0"
                                                                                            aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-2">
                                                                                    <span
                                                                                        class="text-secondary"><fmt:formatNumber value="${rateFive }" pattern="#.#"/>%</span>
                                                                                </div>
                                                                            </a>
                                                                        </li>
                                                                        <li class="py-2">
                                                                            <a class="row align-items-center mx-gutters-2 font-size-2"
                                                                                href="javascript:;">
                                                                                <div class="col-auto">
                                                                                    <span class="text-dark">4점</span>
                                                                                </div>
                                                                                <div class="col px-0">
                                                                                    <div class="progress bg-white-100"
                                                                                        style="height: 7px;">
                                                                                        <div class="progress-bar"
                                                                                            role="progressbar"
                                                                                            style="width: ${rateFour }%;background: #3ec92c;"
                                                                                            aria-valuenow="53"
                                                                                            aria-valuemin="0"
                                                                                            aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-2">
                                                                                	
                                                                                	<span class="text-secondary"><fmt:formatNumber value="${rateFour }" pattern="#.#"/>%</span>
                                                                                </div>
                                                                            </a>
                                                                        </li>
                                                                        
                                                                        <li class="py-2">
                                                                            <a class="row align-items-center mx-gutters-2 font-size-2"
                                                                                href="javascript:;">
                                                                                <div class="col-auto">
                                                                                    <span class="text-dark">3점</span>
                                                                                </div>
                                                                                <div class="col px-0">
                                                                                    <div class="progress bg-white-100"
                                                                                        style="height: 7px;">
                                                                                        <div class="progress-bar"
                                                                                            role="progressbar"
                                                                                            style="width: ${rateThree }%;background: #3ec92c;"
                                                                                            aria-valuenow="20"
                                                                                            aria-valuemin="0"
                                                                                            aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-2">
                                                                                	<span class="text-secondary"><fmt:formatNumber value="${rateThree }" pattern="#.#"/>%</span>
                                                                                </div>
                                                                            </a>
                                                                        </li>
                                                                        <li class="py-2">
                                                                            <a class="row align-items-center mx-gutters-2 font-size-2"
                                                                                href="javascript:;">
                                                                                <div class="col-auto">
                                                                                    <span class="text-dark">2점</span>
                                                                                </div>
                                                                                <div class="col px-0">
                                                                                    <div class="progress bg-white-100"
                                                                                        style="height: 7px;">
                                                                                        <div class="progress-bar"
                                                                                            role="progressbar"
                                                                                            style="width: ${rateTwo }%;background: #3ec92c;"
                                                                                            aria-valuenow="0"
                                                                                            aria-valuemin="0"
                                                                                            aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-2">
                                                                                	<span class="text-secondary"><fmt:formatNumber value="${rateTwo }" pattern="#.#"/>%</span>
                                                                                    
                                                                                </div>
                                                                            </a>
                                                                        </li>
                                                                        <li class="py-2">
                                                                            <a class="row align-items-center mx-gutters-2 font-size-2"
                                                                                href="javascript:;">
                                                                                <div class="col-auto">
                                                                                    <span class="text-dark">1점</span>
                                                                                </div>
                                                                                <div class="col px-0">
                                                                                    <div class="progress bg-white-100"
                                                                                        style="height: 7px;">
                                                                                        <div class="progress-bar"
                                                                                            role="progressbar"
                                                                                            style="width: ${rateOne }%;background: #3ec92c;"
                                                                                            aria-valuenow="1"
                                                                                            aria-valuemin="0"
                                                                                            aria-valuemax="100"></div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-2">
                                                                                	<span class="text-secondary"><fmt:formatNumber value="${rateOne }" pattern="#.#"/>%</span>
                                                                                    
                                                                                </div>
                                                                                
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                    <!-- End Ratings -->
                                                                    
                                                                </div>
                                                            </div>

             												<div style="border: 1px solid #d5d5d5;margin-bottom: 30px;"></div>
	
                                                            <ul class="list-unstyled mb-8">
                                                            	<c:choose>
                                                            		<c:when test="${empty reviewList }">
                                                            			<div style="width: 100%;height: 200px; border: 1px solid #d5d5d5;display: flex;align-items: center;border-radius: 10px;"> 
	                                                             			<p style="color: #5055b1; font-size: 18px; font-weight: bold;margin: 0 auto;">아직 리뷰가 없어요 첫 번째 리뷰를 작성해주세요!</p>
	                                                             		</div> 
                                                            		</c:when>
                                                            		<c:otherwise>
		                                                             	<c:forEach items="${reviewList }" var="review" varStatus="i">
		                                                             		
		                                                             		<c:if test="${review.ua_no ne null}"> 
		                                                             			<div id="reviewImg${i.index }" style="display: none">
		                                                             				<input type="hidden" value="${review }" id="reviewListValue"> 
		                                                             			<c:forEach items="${reviewImgList }" var="img">
		                                                             				                                          				 
		                                                             			    <c:if test="${review.ae_id eq img.ae_id and not empty img.ua_nm }">
		                                                             			    	
			                                                             				<img alt="" src="/upload/images/${img.ua_stre_nm }" style="width: 50px;height: 50px;"> 			
		                                                              				</c:if> 
		                                                             			</c:forEach> 
		                                                             			</div> 
		                                                             		</c:if> 
		                                                            		
		 	                                                                <li class="mb-4 pb-5 border-bottom" id="reviewBox${i.index }" style="display: none"> 
			                                                                
		 	                                                                    <div style="display: flex; align-items: center; margin-top: 20px;"> 
		 	                                                                        <h6 style="font-size: 18px; font-weight: bold;">${review.review_title }</h6> 
		 	                                                                        <div style="display: flex;margin-bottom: 10px;margin-left: 10px;"> 
		 	                                                                        	<c:forEach begin="1" end="${review.review_scr }"> 
		 					                                                                <i class="fa-solid fa-star" style="color: #3ec92c;"></i>                                                        	 
		 				                                                            	</c:forEach> 
			                                                                            
		 	                                                                        </div> 
		 	                                                                    </div> 
		 	                                                                    <p class="mb-4 text-lh-md">${review.review_content }</p> 
		 	                                                                    <div> 
		                                                             				<p style="font-size: 15px; color: #5055b1; font-weight: bold;">작성자 : ${review.ae_id }</p> 
		                                                             			</div> 
		 	                                                                    <div class="text-gray-600 mb-4">${review.review_wrt_ymd } </div>
		 	                                                                    
		 	                                                                    
		 	                                                                    <c:if test="${review.ae_id eq ae_id}">
		                                                                        	<div><p id="deleteReview">삭제</p></div> 
		 	                                                                    </c:if>  
		 	                                                                </li> 
		                                                             	</c:forEach>                                                            		
                                                            		</c:otherwise>
                                                            	</c:choose>
                                                            	
                                                            </ul>
	                                                        <button id="moreBtn" style="margin: 0 auto;border: none;background: white;display: none;">더보기</button>
                                                            <!--   나중에 리뷰 모달창으로 띄어스 만들때 사용    -->
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Tab Content -->
                                        </div>
		                                <div id="ProductCompare" class="" style="margin-top: 30px;">
									         <div class="border-top border-bottom">
									             <ul class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
									                  <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
									                       <a class="nav-link py-4 font-weight-medium" href="#Description" style="border: none;">줄거리</a>
									                  </li>
									                  <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
									                       <a class="nav-link py-4 font-weight-medium" href="#ProductDetails" style="border: none;"> 책 상세정보</a>
									                  </li>
									                  <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
									                       <a class="nav-link py-4 font-weight-medium active" href="#ProductReviews" style="border: none;"> 리뷰 (${reviewCnt })</a>
									                  </li>
									                  <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
									                       <a class="nav-link py-4 font-weight-medium active" href="#ProductCompare" style="border: none;"> 책 비교하기</a>
									                  </li>
									              </ul>
									         </div>
									         <div style="width: 70%;border: 1px solid #d5d5d5; border-radius: 10px;margin: 0 auto;margin-top: 30px;display: flex;" >
									         	<div style="width: 50%;display: flex;flex-direction: column;border-right: 1px solid #d5d5d5;">
									         		<div style="margin: 0 auto;margin-top: 30px;">
									         			<img alt="" src="${book.book_cover }" style="width:120px;height:174px;">
									         		</div>
									         		<div style="display: flex;flex-direction: column;width: 70%;margin: 0 auto;margin-top: 60px;border-top: 1px solid #d5d5d5;">
									         			<div style="display: flex; justify-content: space-between;margin-top: 30px;">
									         				<p style="font-weight: bold;">제목</p>
									         				<p>${book.book_title }</p>
									         			</div>
									         			<div style="display: flex; justify-content: space-between;">
									         				<p style="font-weight: bold;">가격</p>
									         				<p><fmt:formatNumber value="${book.book_amt}" pattern="#,###" />원</p>
									         			</div>
									         			<div style="display: flex; justify-content: space-between;">
									         				<p style="font-weight: bold;">출간일</p>
									         				<p>${book.book_spmt_ymd }</p>
									         			</div>
									         			<div style="display: flex; justify-content: space-between;">
									         				<p style="font-weight: bold;">출판사</p>
									         				<p>${book.pub_nm }</p>
									         			</div>
									         			<div style="display: flex; justify-content: space-between;">
									         				<p style="font-weight: bold;">작가</p>
									         				<p>${book.book_author }</p>
									         			</div>
									         			<div style="display: flex; justify-content: space-between;">
									         				<p style="font-weight: bold;">리뷰 평점</p>
									         				<p>${averageScore }</p>
									         			</div>			         			
									         		</div>
									         	</div>
									         	<div id="compareProd" style="width:50%; display: none;">
										         	<div style="width: 100%;display: flex;flex-direction: column;border-right: 1px solid #d5d5d5;">
										         		<div style="margin-top: 30px;display: flex;align-items: center;">
										         			<img id="compareImg" alt="" src="" style="width:120px;height:174px;margin: 0 auto;">
										         		</div>
										         		<div style="display: flex;flex-direction: column;width: 70%;margin: 0 auto;margin-top: 60px;border-top: 1px solid #d5d5d5;">
										         			<div style="display: flex; justify-content: space-between;margin-top: 30px;">
										         				<p style="font-weight: bold;">제목</p>
										         				<p id="compareTitle"></p>
										         			</div>
										         			<div style="display: flex; justify-content: space-between;">
										         				<p style="font-weight: bold;">가격</p>
										         				<p id="comparePrice"></p>
										         			</div>
										         			<div style="display: flex; justify-content: space-between;">
										         				<p style="font-weight: bold;">출간일</p>
										         				<p id="compareDate"></p>
										         			</div>
										         			<div style="display: flex; justify-content: space-between;">
										         				<p style="font-weight: bold;">출판사</p>
										         				<p id="comparePub"></p>
										         			</div>
										         			<div style="display: flex; justify-content: space-between;">
										         				<p style="font-weight: bold;">작가</p>
										         				<p id="compareAuthor"></p>
										         			</div>
										         			<div style="display: flex; justify-content: space-between;">
										         				<p style="font-weight: bold;">리뷰 평점</p>
										         				<p id="compareReview"></p>
										         			</div>
										         			<input type="hidden" value="" id="compareBookNo">
										         			<input type="hidden" value="" id="compareCcgB002">
										         			<div style="text-align: right;margin-bottom: 20px;">
																<button type="button" id="comparePurchaseBtn" style="margin-top: 30px;right: 5%;height: 44px;border: 1px solid #5055b1; background-color: #5055b1;border-radius: 10px;color: white;font-size: 16px;font-weight: bold;">구매하기</button>
																<button type="button" id="resetBtn" style="margin-top: 30px;right: 5%;height: 44px;border: 1px solid #5055b1; background-color: white;border-radius: 10px;color: #5055b1;font-size: 16px;font-weight: bold;">초기화</button>
															</div>			         			
										         		</div>
										         	</div>
									         	</div>
									         	<div id="compareAdd" style="width:50%;">
										         	<div style="width: 100%;display: flex;flex-direction: column;border-right: 1px solid #d5d5d5;align-items: center;">
										         		<div style="margin: 0 auto;display: flex;flex-direction: column;margin-top: 15%;">
										         			<i class="ri-add-circle-line" style="font-size: 150px;color:#d5d5d5;margin-left: 20px; "></i>
										         			<p style="font-weight: bold;color:d5d5d5;">비교할 책을 추가해보세요</p>
										         		</div>
										         	</div>
									         	</div>
									         </div>
									   </div>
                                    </div>
                                    <div id="modalWrap"style="display: none;z-index: 99px;">
										<div id="modalBody" >
											<div style="width: 100%;">
												<span id="closeBtn">&times;</span>
											</div>
											<div style=" width: 90%;margin: 0 auto;margin-top: 0px;">
												<form method="post" action="/harubooks/review" enctype="multipart/form-data" id="reviewForm">
													<sec:csrfInput/>
													<input type="hidden" name="book_no" value="${book.book_no }">
													
													<div style='display: flex; flex-direction: column;'>
														<div style="display: flex;font-size: 24px;color: #5055b1;font-weight: bold;">
															<p>리뷰 작성</p><p id="refundStatus" style="color: #3cb454;font-weight: bold;font-size: 14px;margin-bottom: 0px;"></p>
														</div>
														<div>
															<p class="modalText">작성자 아이디</p>
															<input class="modalInput" type="text" id="userId" value="<sec:authentication property='name'/>" name="ae_id" readonly>																						
														</div>
														<div style="width: 100%; display: flex;border: 1px solid #d5d5d5; border-radius: 10px; height: 120px;align-items: center;margin-top: 20px;">
															<div style="margin-left: 20px;">
																<img alt="" src="${book.book_cover }" width="60px" height="90px;">
															</div>
															<div style="display: flex; flex-direction: column; margin-left: 20px;width: 45%;">
																<p style="font-size: 12px; font-weight: bold;margin-bottom: 5px;">${book.book_title }</p>
																<div style="display: flex;">
																	<input type="hidden" value="1" name="review_scr" id="review_scr">
																	<i class="ri-star-fill starPoint" style="color: #3ec92c;font-size: 24px;margin-right: 5px;"></i>
																	<i class="ri-star-line starPoint" style="color: #3ec92c;font-size: 24px;margin-right: 5px;"></i>
																	<i class="ri-star-line starPoint" style="color: #3ec92c;font-size: 24px;margin-right: 5px;"></i>
																	<i class="ri-star-line starPoint" style="color: #3ec92c;font-size: 24px;margin-right: 5px;"></i>
																	<i class="ri-star-line starPoint" style="color: #3ec92c;font-size: 24px;margin-right: 5px;"></i>
																</div>
															</div>
															<div style="width: 25%; height: 80%;margin-left: 10px;display: flex;align-items: center;">
																<p style="margin-bottom: 0px;text-align: center;font-size: 28px;font-weight: bold; color:#5055b1; "><span id="starScore">1</span>&nbsp;/&nbsp;5점</p>
															</div>
														</div>
																			
														<div>
															<p class="modalText">리뷰작성</p>
															<input class="modalInput" type="text" id="review_title" value="" name="review_title" placeholder="제목을 입력해주세요" style="width: 50%;">
															<div style="width: 100%;height: 150px; border: 1px solid #d5d5d5;display: flex;flex-direction: column;margin-top: 20px;">
																<textarea name="review_content" id="review_content" style="width: 100%; height: 100%; resize: none; border: none; outline: none; padding: 10px; box-sizing: border-box;color: #767676;font-size: 14px;font-weight: bold;"placeholder="리뷰 내용을 작성해주세요.">
																</textarea>
															</div>	
														</div>
														<div >
															<p class="modalText">첨부이미지</p>
															<div style="display: flex; align-items: center;">
																<div style="width: 50px; height: 50px; position: relative; overflow: hidden;display: flex;">
																  <input type="file" multiple="multiple" id="imageInput" style="display: none;" accept="image/*" name="review_file">
																  <label for="imageInput" style="display: block; width: 100%; height: 100%; cursor: pointer;">
																    <img src="/resources/assets/img/image-add-line (1).png" alt="Image" style="width: 100%; height: 100%; object-fit: cover;">
																  </label>
																</div>
																  <p style="font-size: 14px; color: #767676; font-weight: bold;margin-bottom: 0px;">사진은 최대 3장까지 저장할 수 있습니다</p>
															</div>
														</div>	
														<div id="imageContainer" style="display: flex;"></div>
														<div style="width: 100%; text-align: right;">
															<button id="reviewSubmitBtn" type="submit" style="background:#5055b1;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:44px;color:white;">작성하기</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
                                    
                                    
                                    
                                    <!-- 비교할 책 검색 모달창 -->
                                    <div id="modalWrap2"style="display: none;">
										<div id="modalBody2" style="width: 60%;">
											<div style="width: 100%;">
												<span id="closeBtn2">&times;</span>
											</div>
											<div style=" width: 90%;margin: 0 auto;margin-top: 50px;">									
												<div style='display: flex; flex-direction: column;'>
													<div style="display: flex;font-size: 24px;color: #5055b1;font-weight: bold;">
														<p>도서 검색</p>
													</div>
													<div>
														<input type="text" placeholder="검색할 도서/작가명을 입력해주세요" autofocus="autofocus" id="searchBook" style="width: 70%;border: 1px solid #5055b1;border-radius: 10px;height: 35px;" onkeyup="searchEnter()">
													</div>
													<div id="searchResult" style="margin-top: 30px;border: 1px solid #d5d5d5;border-radius: 10px;display: flex;flex-direction: column;height: 400px; display: none; overflow: auto;">
														
													</div>	
												</div>
											</div>
										</div>
									</div>
                                </div>
                                <!-- End Nav Classic -->
                            </div>
                        </main>
                        <input type="hidden" value="${reviewCnt}" id="reviewCount">
                    </div>
                    <!-- 하루북스 회원만 찜목록을 추가할 수 있다. -->
                    <input type="hidden" value='<sec:authentication property="name"/>' id="secId">
                    <script type="text/javascript" src="/resources/assets/js/review.js"></script>
                    <script>
                        let minus = document.querySelector('#minus');
                        let plus = document.querySelector('#plus');
                        let cnt = document.querySelector('#cnt'); // 수량
                        let pl_cnt = document.querySelector('#pl_cnt');   //수량의 값을 담을 히든값
                        let total = 1;
                        let totalPrice = document.querySelector('#totalPrice');
                        let price = document.querySelector('#price').value;
                        let totalMileage = document.querySelector('#totalMileage'); // 책 구매시 총 마일리지
                        let mileage = document.querySelector('#mileage'); //책 한권당 마일리지
                        
                        pl_cnt.value = total; 
                        minus.addEventListener('click', function () {
                            if (total > 1) {
                                total -= 1;
                                cnt.innerText = total;
                                pl_cnt.value = total;
                                console.log("기존 책가격 : " + price);
                                console.log("책권당 마일리지" + mileage.value);
                                console.log(pl_cnt.value)
                                totalPrice.innerText = parseInt(price * total).toLocaleString('ko-KR');

                            }
                        })
                        plus.addEventListener('click', function () {
                            total += 1;
                            cnt.innerText = total;
                            pl_cnt.value = total;
                            console.log("기존 책가격 : " + price);
                            console.log("책권당 마일리지" + mileage.value);
                            console.log(pl_cnt.value)
                            totalPrice.innerText = parseInt(price * total).toLocaleString('ko-KR');
                            console.log(total);
                        })

                        // 찜, 장바구니 추가, 구매하기
                        let secId = document.querySelector('#secId').value;
                        let bookNo = document.querySelector('#bookNo').value;
                        let wishList = document.querySelector('#wishList');
                        let basketList = document.querySelector('#basketList');
                        let buyProd = document.querySelector('#buyProd');
						let ccg_b002 = document.querySelector('#ccg_b002').value;


                        wishList.addEventListener('click', function () {
                            console.log(secId);
                            if (secId == 'anonymousUser') {
                                Swal.fire({
                                    title: '찜하기는 로그인이 필요합니다',
                                    text: '로그인 하시겠습니까?',
                                    icon: 'question',
                                    iconHtml: '!',
                                    confirmButtonText: '네',
                                    cancelButtonText: '아니요',
                                    showCancelButton: true,
                                    showCloseButton: true
                                }).then(function (result) {
                                    if (result.isConfirmed) {
                                        // '네' 버튼을 클릭한 경우
                                        window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
                                    } else {
                                        return false;
                                    }
                                });
                            } else {
                                // 내가 찜한 목록 저장위치 경로 설정하기(권한도 비회원 제외 회원, 관리자, 출판사만 접근가능하게 조치)
                                const swalWithBootstrapButtons = Swal.mixin({
                                    customClass: {
                                        confirmButton: 'btn btn-success',
                                        cancelButton: 'btn btn-danger'
                                    },
                                    buttonsStyling: false
                                })
                                Swal.fire({
                                    title: '찜목록에 추가하시겠습니까?',
                                    icon: 'question',
                                    iconHtml: '?',
                                    confirmButtonText: '네',
                                    cancelButtonText: '아니요',
                                    showCancelButton: true,
                                    showCloseButton: true
                                }).then(function (result) {
                                    if (result.isConfirmed) {
                                        // '네' 버튼을 클릭한 경우
                                        // 여기서 찜목록 추가하는 로직 설계를 해야한다. ajax로 비동기 처리한다.
                                        console.log("책번호 : " + bookNo);
                                        console.log("사용자 아이디 : " + secId);
                                        let info = {
                                            "book_no": bookNo,
                                            "ae_id": secId,
                                            "ccg_b002" : ccg_b002
                                        }
                                        let xhr = new XMLHttpRequest();
                                        xhr.open("post", "/harubooks/wishList", true);
                                        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState == 4 && xhr.status == 200) {
                                                let result = xhr.responseText;
                                                if (result == 'OK') {
                                                    swalWithBootstrapButtons.fire(
                                                        '추가 완료!',
                                                        '찜목록에 추가되었습니다.',
                                                        'success'
                                                    )
                                                } else if (result == 'EXIST') {
                                                    swalWithBootstrapButtons.fire(
                                                        '이미 찜한 책이에요..',
                                                        '',
                                                        'error'
                                                    )
                                                } else {
                                                    return false;
                                                }
                                            }
                                        }
                                        xhr.send(JSON.stringify(info));
                                    } else {
                                        return false;
                                    }
                                });


                            }
                        })

                        // sweet alert 커스텀
						// 장바구니 추가 버튼 클릭 이벤트
                        basketList.addEventListener('click', function () {
                            console.log(total);
                            console.log(totalPrice.innerText);
                            console.log(bookNo);
                            
                            if (secId == 'anonymousUser') {
                                Swal.fire({
                                    title: '장바구니추가는 로그인이 필요합니다',
                                    text: '로그인 하시겠습니까?',
                                    icon: 'question',
                                    iconHtml: '!',
                                    confirmButtonText: '네',
                                    cancelButtonText: '아니요',
                                    showCancelButton: true,
                                    showCloseButton: true
                                }).then(function (result) {
                                    if (result.isConfirmed) {
                                        // '네' 버튼을 클릭한 경우
                                        window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
                                    } else {
                                        return false;
                                    }
                                });
                            }else{
	                            Swal.fire({
	                                title: '장바구니에 추가하시겠습니까?',
	                                icon: 'question',
	                                iconHtml: '?',
	                                confirmButtonText: '네',
	                                cancelButtonText: '아니요',
	                                showCancelButton: true,
	                                showCloseButton: true
	                            }).then(function (result) {
	                                if (result.isConfirmed) {
	                                    // '네' 버튼을 클릭한 경우
	                                    let info = {
	                                        "cart_cnt": total,    // 수량
	                                        "totalPrice": totalPrice.innerText,
	                                        "book_no": bookNo,
	                                        "ae_id" : secId,
	                                        "ccg_b002" : ccg_b002
	                                    };
	                                    let xhr = new XMLHttpRequest();
	                                    xhr.open("post", "/harubooks/basketList",true);
	                                    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
	                                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                                    xhr.onreadystatechange = function () {
	                                        if (xhr.readyState == 4 && xhr.status == 200) {
	                                        	const swalWithBootstrapButtons = Swal.mixin({
	                                                customClass: {
	                                                    confirmButton: 'btn btn-success',
	                                                    cancelButton: 'btn btn-danger'
	                                                },
	                                                buttonsStyling: false
	                                            })
	                                            let res = xhr.responseText;
	                                            if (res == 'OK') {
	                                            	
	                                                Swal.fire({
	                                                    title: '장바구니에 추가되었습니다!',
	                                                    text: '장바구니로 이동 하시겠습니까?',
	                                                    icon: 'success',
	                                                    confirmButtonText: '장바구니로 이동',
	                                                    cancelButtonText: '아니요',
	                                                    showCancelButton: true,
	                                                    showCloseButton: true
	                                                }).then(function (result) {
	                                                    if (result.isConfirmed) {
	                                                        // '네' 버튼을 클릭한 경우
	                                                        window.location.href = '/harubooks/myCart'; // 장바구니 페이지로 이동
	                                                    } else {
	                                                        return false;
	                                                    }
	                                                });
	                                            } else if (res == 'EXIST') {
	                                                swalWithBootstrapButtons.fire(
	                                                        '이미 장바구니에 존재합니다',
	                                                        '',
	                                                        'error'
	                                                )
	                                            } else {
	                                                return false;
	                                            }
	                                        }
	                                    }
	                                    xhr.send(JSON.stringify(info));
	                                } else {
	                                    return false;
	                                }
	                            });	
                            }     
                        })
						// 결제하기 버튼 클릭 이벤트
						buyProd.addEventListener('click',function(){
                            location.href = "/harubooks/prodOrderForm?book_no="+bookNo+"&pl_cnt="+pl_cnt.value;
                        })
						


                        // 책 비교하기 
                        let compareAdd = document.querySelector('#compareAdd'); // 책 추가 부분
                        let compareImg = document.querySelector('#compareImg'); // 비교 책 표지 부분
                        let compareProd = document.querySelector('#compareProd'); // 책 선택 시 제품 정보
                        let compareTitle = document.querySelector('#compareTitle'); // 비교할 책 제목
                        let comparePrice = document.querySelector('#comparePrice'); // 비교할 책 가격
                        let compareDate = document.querySelector('#compareDate'); // 비교할 책 출간일
                        let comparePub = document.querySelector('#comparePub'); // 비교할 책 출판사
                        let compareReview = document.querySelector('#compareReview'); // 비교할 책 평점
                        let searchBook = document.querySelector('#searchBook'); // 책 검색창
                        let searchResult = document.querySelector('#searchResult'); //검색 결과 출력할 곳
                        let compareAuthor = document.querySelector('#compareAuthor');
                        let compareCcgB002 = document.querySelector('#compareCcgB002');
                        let compareBookNo = document.querySelector('#compareBookNo');
                        let comparePurchaseBtn = document.querySelector('#comparePurchaseBtn');
                        compareAdd.addEventListener('click',function(){
                            searchBook.value = "";
                            searchResult.style.display = "none";
                            openModal();
                            
                        })
                        
                        function openModal(){ // 클릭시 모달창 여는 함수
                            const modal = document.getElementById('modalWrap2');
					        const closeBtn = document.getElementById('closeBtn2');
                            modal.style.display = 'block';
                            closeBtn.onclick = function() {
                                modal.style.display = 'none';
                            }
                            window.onclick = function(event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                        }

                        function searchEnter(){
                            if(window.event.keyCode == 13){
                                let searchBook = document.querySelector("#searchBook").value;
                                let compareXhr = new XMLHttpRequest();
                                compareXhr.open("get","/harubooks/compareBook?searchBook="+searchBook,true);
                                compareXhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
                                compareXhr.onreadystatechange = function(){
                                    if(compareXhr.readyState == 4 && compareXhr.status == 200){
                                        let compareResult = JSON.parse(compareXhr.responseText);
                                        console.log(compareResult);
                                        res = ``;
                                        if(compareResult.compareBook.length == 0){
                                            res += `<div style="display: flex;width: 95%; border-radius: 10px;margin: 0 auto;margin-top: 20px; margin-bottom: 20px;">`;
                                            res += `<p style="text-align:center;font-size:18px;font-weight:bold;color:#5055b1;margin:0 auto;">검색한 도서는 존재하지 않습니다.</p>`
                                            res += `</div>`
                                        }else{
                                            searchResult.style.display = "block";
                                            for(let i=0; i<compareResult.compareBook.length; i++){
                                                    res += `<div style="display: flex;width: 95%; border-radius: 10px;margin: 0 auto;margin-top: 20px; margin-bottom: 20px;">`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;justify-content:center; width: 20%;">`;
                                                    res += `<p style="margin-bottom: 0;font-weight: bold;font-size: 14px;">[책 번호]</p>`;
                                                    res += `<p style="font-weight: bold;font-size: 12px;">\${compareResult.compareBook[i].book_no }</p>`;
                                                    res += `</div>`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;width: 20%;">`;
                                                    res += `<img alt="" src="\${compareResult.compareBook[i].book_cover }" style="width: 50px;height: 80px;">`;
                                                    res += `</div>`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;width: 30%;">`;
                                                    res += `<p style="font-weight: bold;margin-top: 20px;font-size: 14px;">\${compareResult.compareBook[i].book_title }</p>`;
                                                    res += `</div>`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;width: 20%;">`;
                                                    res += `<p style="font-weight: bold;margin-top: 20px;font-size: 14px;">\${compareResult.compareBook[i].book_author }</p>`;
                                                    res += `</div>`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;width: 10%;">`;
                                                    res += `<p style="font-weight: bold;margin-top: 20px;font-size: 14px;">\${compareResult.compareBook[i].ccg_b001 }</p>`;
                                                    res += `</div>`;
                                                    res += `<div style="display: flex; flex-direction: column; align-items: center;width: 20%;">`;
                                                    res += `<button class="compareBtn" style="margin-top: 20px;right: 5%;height: 34px;border: 1px solid #5055b1; background-color: #5055b1;border-radius: 10px;color: white;font-size: 16px;font-weight: bold;">비교하기</button>`;
                                                    res += `</div>`;
                                                    res += `</div>`;    
                                            }
                                        }
                                        searchResult.innerHTML = res;
                                        let compareBtn = document.querySelectorAll('.compareBtn');
                                        for(let i = 0; i< compareBtn.length; i++){
                                            compareBtn[i].addEventListener('click',function(){
                                                compareAdd.style.display = "none";
                                                compareProd.style.display = "block";
                                                compareImg.setAttribute("src",compareResult.compareBook[i].book_cover);
                                                compareTitle.innerText = compareResult.compareBook[i].book_title;
                                                comparePrice.innerText = parseInt(compareResult.compareBook[i].book_amt).toLocaleString('ko-KR')+"원";
                                                compareDate.innerText = compareResult.compareBook[i].book_spmt_ymd;
                                                comparePub.innerText = compareResult.compareBook[i].pub_nm;
                                                compareAuthor.innerText = compareResult.compareBook[i].book_author;
                                                compareReview.innerText = compareResult.scrList[i].review_avg;
                                                compareCcgB002.value = compareResult.compareBook[i].ccg_b002;
                                                compareBookNo.value = compareResult.compareBook[i].book_no;
                                                document.getElementById('modalWrap2').style.display = "none";
                                            })
                                        }
                                    }
                                }
                                compareXhr.send();
                            }
                        }

                        // 비교하기 초기화 버튼 클릭 이벤트
                        let resetBtn = document.querySelector('#resetBtn');
                        resetBtn.addEventListener('click',function(){
                            compareAdd.style.display = "block";
                            compareProd.style.display = "none";
                        })
                        // 비교한 책 구매하기 버튼 클릭 이벤트
                        comparePurchaseBtn.addEventListener('click',function(){
                            location.href = "/harubooks/detailBook?bookNo="+compareBookNo.value+"&ccg_b002="+compareCcgB002.value;
                        })


                        // 리뷰 버튼 클릭시 이벤트
                        let reviewBtn = document.querySelector('#reviewBtn');
						reviewBtn.addEventListener('click',function(){
						    const swalWithBootstrapButtons = Swal.mixin({
						        customClass: {
						            confirmButton: 'btn btn-success',
						            cancelButton: 'btn btn-danger'
						        },
						        buttonsStyling: false
						    })
						    let reviewXhr = new XMLHttpRequest();
						    let data = {
						        "ae_id" : secId,
						        "book_no" : bookNo,
						    };
						    reviewXhr.open("post","/harubooks/reviewCheck",true);
						    reviewXhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
						    reviewXhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						    reviewXhr.onreadystatechange = function(){
						        if(reviewXhr.readyState == 4 && reviewXhr.status == 200){
						            let result = reviewXhr.responseText;
						            if(result == 'OK'){
						                location.href = "#reviewContent"
						            }else if(secId == 'anonymousUser'){
						                Swal.fire({
						                    title: '로그인 후 리뷰작성 가능합니다',
						                    text: '로그인페이지로 이동하시겠습니까?',
						                    icon: 'question',
						                    confirmButtonText: '로그인 하기',
						                    cancelButtonText: '아니요',
						                    showCancelButton: true,
						                    showCloseButton: true
						                }).then(function (result) {
						                    if (result.isConfirmed) {
						                        // '네' 버튼을 클릭한 경우
						                        window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
						                    } else {
						                        return false;
						                    }
						                });
						            }else if(result == 'EXIST'){
                                        location.href = "#reviewContent"
                                    }else{
						                swalWithBootstrapButtons.fire(
						                    '리뷰작성을 하실 수 없습니다',
						                    '리뷰작성은 책 구매 후에 작성가능합니다.',
						                    'error'
						                )
						            }
						        }
						    }
						    reviewXhr.send(JSON.stringify(data));
						})

                        // 리뷰작성하기 클릭시 이벤트
                        let reviewWriteBtn = document.querySelector('#reviewWriteBtn');
                        reviewWriteBtn.addEventListener('click',function(){
                            const swalWithBootstrapButtons = Swal.mixin({
						        customClass: {
						            confirmButton: 'btn btn-success',
						            cancelButton: 'btn btn-danger'
						        },
						        buttonsStyling: false
						    })
                            let userId = document.querySelector('#userId').value;
                            if(userId == 'anonymousUser'){
                                Swal.fire({
                                    title: '로그인 후 리뷰작성 가능합니다',
                                    text: '로그인페이지로 이동하시겠습니까?',
                                    icon: 'question',
                                    confirmButtonText: '로그인 하기',
                                    cancelButtonText: '아니요',
                                    showCancelButton: true,
                                    showCloseButton: true
                                }).then(function (result) {
                                    if (result.isConfirmed) {
                                        window.location.href = '/login/signinForm'; 
                                    } else {
                                        return false;
                                    }
                                });
                            }else{
                                let reviewXhr2 = new XMLHttpRequest();
                                let data2 = {
                                    "ae_id" : secId,
                                    "book_no" : bookNo,
						        };
                                reviewXhr2.open("post","/harubooks/reviewCheck",true);
                                reviewXhr2.setRequestHeader("Content-Type","application/json;charset=utf-8");
						        reviewXhr2.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						        reviewXhr2.onreadystatechange = function(){
                                    if(reviewXhr2.readyState == 4 && reviewXhr2.status == 200){
						                let result = reviewXhr2.responseText;
                                        if(result == 'OK'){
                                            const modal = document.getElementById('modalWrap');
                                            const closeBtn = document.getElementById('closeBtn');
                    
                                            modal.style.display = 'block';	
                                            
                                            closeBtn.onclick = function() {
                                            modal.style.display = 'none';
                                            }
                                            window.onclick = function(event) {
                                                if (event.target == modal) {
                                                    modal.style.display = "none";
                                                }
                                            }
                                        }else if(result == 'EXIST'){
                                            swalWithBootstrapButtons.fire(
                                                '리뷰를 이미 작성하였습니다',
                                                '',
                                                'error'
						                    )
                                        }else{
                                            swalWithBootstrapButtons.fire(
                                                '리뷰작성을 하실 수 없습니다',
                                                '리뷰작성은 책 구매 후에 작성가능합니다.',
                                                'error'
						                    )
                                        }  
                                    }
                                }
                                reviewXhr2.send(JSON.stringify(data2));
                            }
                        })

                        // 리뷰 작성 별 클릭시 이벤트
                        let starPoint = document.querySelectorAll('.starPoint');
                        let starScore = document.querySelector('#starScore');
                        let review_scr = document.querySelector('#review_scr');
                        let totalCnt = 0;
                        let tempCnt;

                        function updateStars(cnt) {
                            for (let j = 0; j < 5; j++) {
                            if (j < cnt) {
                                starPoint[j].classList.remove('ri-star-line');
                                starPoint[j].classList.add('ri-star-fill');
                            } else {
                                starPoint[j].classList.remove('ri-star-fill');
                                starPoint[j].classList.add('ri-star-line');
                            }
                            }
                        }

                        for (let i = 0; i < starPoint.length; i++) {
                            starPoint[i].addEventListener('click', function () {
                            totalCnt = i + 1;
                            starScore.innerText = totalCnt;
                            review_scr.value = totalCnt;
                            updateStars(totalCnt);
                            tempCnt = totalCnt;
                            });
                        }

                        // 리뷰 사진 클릭시 이벤트
                        let imageInput = document.querySelector('#imageInput');
                        let imageContainer = document.querySelector('#imageContainer');
                        let selectedImages = [];

                        imageInput.addEventListener('change', function() {
                            const swalWithBootstrapButtons = Swal.mixin({
						        customClass: {
						            confirmButton: 'btn btn-success',
						            cancelButton: 'btn btn-danger'
						        },
						        buttonsStyling: false
						    })
                            const files = imageInput.files;
                            if (files.length + selectedImages.length > 3) {
                            swalWithBootstrapButtons.fire(
                                '업로드 개수 초과',
                                '사진 업로드는 최대 3개까지만 가능합니다.',
                                'error'
						    )
                            // 기존에 선택한 파일 초기화 (선택 취소)
                            imageInput.value = '';
                            return;
                            }

                            for (let i = 0; i < Math.min(3 - selectedImages.length, files.length); i++) {
                            const file = files[i];
                            const reader = new FileReader();

                            reader.onload = function() {
                                const imageWrapper = document.createElement('div');
                                imageWrapper.classList.add('imageWrapper');

                                const newImg = document.createElement('img');
                                newImg.src = reader.result;
                                newImg.style.width = '100%';
                                newImg.style.height = '100%';
                                newImg.style.objectFit = 'cover';
                                imageWrapper.style.marginRight = '10px';
                                imageWrapper.appendChild(newImg);

                                // x 버튼 추가하여 취소 기능 구현
                                const cancelButton = document.createElement('button');
                                cancelButton.innerText = 'X';
                                cancelButton.classList.add('cancelButton');
                                cancelButton.addEventListener('click', function() {
                                imageWrapper.remove();
                                selectedImages = selectedImages.filter(img => img !== file);
                                });
                                imageWrapper.appendChild(cancelButton);

                                imageContainer.appendChild(imageWrapper);

                                selectedImages.push(file);
                            };

                            reader.readAsDataURL(file);
                            }
                        });
                         // 리뷰작성 유효성 검사
                         let reviewForm = document.querySelector('#reviewForm');
                         let reviewSubmitBtn = document.querySelector('#reviewSubmitBtn');
                         reviewSubmitBtn.addEventListener('click',function(){
                            event.preventDefault();
                            const swalWithBootstrapButtons = Swal.mixin({
						        customClass: {
						            confirmButton: 'btn btn-success',
						            cancelButton: 'btn btn-danger'
						        },
						        buttonsStyling: false
						    })
                            if(document.querySelector('#review_title').value == ''){
                                swalWithBootstrapButtons.fire(
                                    '제목을 입력해주세요!',
                                    '',
                                    'error'
						        )
                                return false;
                            }
                            if(document.querySelector('#review_content').value == ''){
                                swalWithBootstrapButtons.fire(
                                    '내용을 입력해주세요!',
                                    '',
                                    'error'
						        )
                                return false;
                            }
                            
                            let userInput = document.querySelector('#review_content').value;
                            let userInput2 = document.querySelector('#review_title').value;
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
                            document.querySelector('#review_content').value = escapedUserInput;
                            
                            let escapedUserInput2 = userInput2.replace(/[&<>"'/]/g, function (x) {
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
                            document.querySelector('#review_title').value = escapedUserInput2;
                            
                            Swal.fire({
                                title: '리뷰 등록 성공!',
                                icon: 'success',
                                confirmButtonText: '확인',                               
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                	reviewForm.submit();
                                }
                            });
                            
                         })


                         // 더 보기
                        let reviewCount = document.querySelector('#reviewCount').value;
                        let endReview = 1;
                        let moreBtn = document.querySelector('#moreBtn');
                        let clickMoreCnt = 1;
                        window.onload = function(){
                            for(let i = 0; i < endReview; i++){
                                    document.querySelector('#reviewImg'+i).style.display = 'block';
                                    document.querySelector('#reviewBox'+i).style.display = 'block';
                                }
                            if(reviewCount<=endReview){
                                moreBtn.style.display = "none";
                            }else{
                                moreBtn.style.display = "block";
                                moreBtn.addEventListener('click',function(){
                                    clickMoreCnt++;
                                    console.log(endReview*clickMoreCnt)
                                    console.log(reviewCount)
                                    for(let i = endReview; i < endReview*(clickMoreCnt); i++){
                                        document.querySelector('#reviewImg'+i).style.display = 'block';
                                        document.querySelector('#reviewBox'+i).style.display = 'block';
                                        if(endReview*clickMoreCnt>reviewCount){
                                            moreBtn.style.display = "none";
                                            break;
                                        }
                                    }
                                })
                                
                            }
                        }
                        

                         // 리뷰 삭제 
                         let deleteReview = document.querySelector('#deleteReview');
                         deleteReview.addEventListener('click',function(){
                            Swal.fire({
                                title: '정말 리뷰를 삭제하시겠습니까?',
                                icon: 'question',
                                confirmButtonText: '확인',
                                cancelButtonText: '아니요',
                                showCancelButton: true,
                                showCloseButton: true                               
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                    let delData = {
                                        "ae_id" : secId,
                                        "book_no" : bookNo
                                    }
                                	let reviewDelXhr = new XMLHttpRequest();
                                    reviewDelXhr.open('post',"/harubooks/deleteReview",true);
                                    reviewDelXhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
                                    reviewDelXhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                    reviewDelXhr.onreadystatechange = function(){
                                        if(reviewDelXhr.readyState == 4 && reviewDelXhr.status == 200){
                                            let delRes = reviewDelXhr.responseText;
                                            if(delRes == 'OK'){
                                                Swal.fire({
                                                    title: '리뷰가 삭제되었습니다',
                                                    icon: 'success',
                                                    confirmButtonText: '확인',                               
                                                }).then(function (result) {
                                                    if (result.isConfirmed) {
                                                        location.reload();
                                                    }
                                                });
                                            }
                                        }
                                    }
                                    reviewDelXhr.send(JSON.stringify(delData));
                                }else{
                                    return false;
                                }
                            });
                         });

                         
                                              
                    </script>
                    <!-- ====== END MAIN CONTENT ====== -->