<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>하루북스</title>
        <link rel="icon" type="image/x-icon" href="/resources/assets/img/harufirst/로고1.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/assets/css/harufirst/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
            <div class="container px-5">
                <img src="/resources/assets/img/harufirst/로고3.png" style="width:150px;height: 50px;" onclick="location.href=''">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="bi-list"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#features">소개</a></li>
                        <li class="nav-item"><a class="nav-link me-lg-3" href="#into-main">하루터이동</a></li>
                    </ul>
                    <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" data-bs-toggle="modal" data-bs-target="#feedbackModal">
                        <span class="d-flex align-items-center">
                            <i class="bi-chat-text-fill me-2"></i>
                            <span class="small">문의사항</span>
                        </span>
                    </button>
                </div>
            </div>
        </nav>
        <!-- Mashead header-->
        <header class="masthead">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <!-- Mashead text and app badges-->
                        <div class="mb-5 mb-lg-0 text-center text-lg-start">
                    
                            <h1 class="display-1 lh-1 mb-3" id="text-ani"></h1>
                            <!-- <h1 class="display-1 lh-1 mb-3">"나랑...</h1>
                            <h1 class="display-1 lh-1 mb-3">책 보러 갈래?"</h1> -->
                            <span class="lead fw-normal text-muted mb-5"> 매일 하루를 책으로 가득 채워주는 서점</span><br>
                            <span style="font-size:2.0em; color:  black ;">"하루북스"</span>
                            <span class="lead fw-normal text-muted mb-5">와 시작하는 달콤한 도서여행</span><br><br>
                            <a class="btn btn-outline-light py-3 px-4 rounded-pill" onclick="location.href='/harubooks/main'"  target="_blank" id="into-btn">책 보러가기</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!-- Masthead device mockup feature-->
                        <div class="masthead-device-mockup">
                            <img src="/resources/assets/img/harufirst/남녀png.png" style="width: 500px;">
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Quote/testimonial aside-->
        <aside style="border: 1px solid #6c757d;">
            <div class="container px-5" style="background-color: white;">
                <div class="row gx-5 justify-content-center">
                    <div class="col-xl-8" >
                        <div style="color: black;">
                            
                            <h2 style="text-align: center;">"하루 하루, 당신의 이야기가 책이되는 순간"</h2><br>
                            <p style="text-align: center;">하루북스가 당신의 빛이 되줄게요</p>
                        </div>
                        <img src="/resources/assets/img/harufirst/light2.png" alt="..." style="width: 150px; margin-left: 40%;" /> 
                    </div>
                    
                </div>
            </div>
        </aside>
        <!-- App features section-->
        <section id="features" style="border: 1px soild #6c757d;">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
                        <div class="container-fluid px-5">
                            <div class="row gx-5">
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <img src="/resources/assets/img/harufirst/varBooks.png" class="info-img"><br><br>
                                        <h3 class="font-alt">풍부한 도서재고</h3>
                                        <p class="text-muted mb-0">항상 당신곁에 준비되있는 도서 하루북스와 함께해요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <img src="/resources/assets/img/harufirst/ebook.png" class="info-img"><br><br>
                                        <h3 class="font-alt">E-book</h3>
                                        <p class="text-muted mb-0">하루북스 E-book으로 언제 어디서든 간편하게 독서해요!</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-5 mb-md-0">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <img src="/resources/assets/img/harufirst/community.png" class="info-img"><br><br>
                                        <h3 class="font-alt">커뮤니티</h3>
                                        <p class="text-muted mb-0">우리 하루북스는 독서를 사랑하는 사람들끼리 모여 지식공유와 자유로운 토론이 가능해요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <img src="/resources/assets/img/harufirst/event.png" class="info-img"><br><br>
                                        <h3 class="font-alt">다양한 이벤트</h3>
                                        <p class="text-muted mb-0">다양한 이벤트로 여러분들의 도서여행에 날개를 달아드려요!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 order-lg-0">
                        <img src="/resources/assets/img/harufirst/think-intro.png" style="width: 300px; height: 500px; margin-left: 10%;">
                        
                    </div>
                </div>
            </div>
        </section>
       <div id="hr-div"></div>
        <!-- Call to action section-->
        <section class="cta" id="into-main" style="background-color: white;">
            <div class="cta-content" style="background-color: white;">
                <div class="container px-5" style="margin-top: 100px; margin-left: 10%;">
                    <h3  style="color: black; font-size: 2.5em;">
                       하루터에서 여러분의 일상을 공유해보세요! <br>
                        <br>
                        <p style="font-size: 20px; font-weight: bold; color: green">소통, 공유, 나만의 서재까지<br> 독서를 사랑하는 사람들과 하루터에서의 특별한 시간!</p><br>
                        <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="" target="_blank" id="into-btn" style="border: 1px solid black;color: black;">하루터 가기</a>
                    </h3>
                </div>
                <img src="/resources/assets/img/harufirst/find.jpeg" style="width: 500px; margin-right: 10%;">
            </div>
        </section>
        <!-- Footer-->
        <footer class="bg-black text-center py-5">
            <div class="container px-5">
                <div class="text-white-50 small">
                    <div class="mb-2">&copy; haru-books 2023. All Rights Reserved.</div>
                    <a href="#!">Privacy</a>
                    <span class="mx-1">&middot;</span>
                    <a href="#!">Terms</a>
                    <span class="mx-1">&middot;</span>
                    <a href="#!">FAQ</a>
                </div>
            </div>
        </footer>
        <!-- Feedback Modal-->
        <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-gradient-primary-to-secondary p-4">
                        <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">문의사항</h5>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body border-0 p-4">
                       
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- 피드백 이름-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">이름</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">이름을 입력해주세요</div>
                            </div>
                            <!-- 피드백 이메일-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">이메일</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일을 입력해주세요</div>                
                            </div>
                            <!-- 피드백 연락처-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(010) 1111-1111" data-sb-validations="required" />
                                <label for="phone">전화번호</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">연락처를 입력해주세요</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="건의사항을 작성해주세요" style="height: 10rem" data-sb-validations="required">
                                
                                </textarea>
                                <label for="message">내용</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">건의사항을 작성해주세요</div>
                            </div>
                            
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg disabled" id="submitButton" type="submit" style="background-color: #595959;">제출하기</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/assets/js/firstjs.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
