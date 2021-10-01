<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources\css\mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<section>
	<div class="mypage_wrap">
		<div class="info">
			<div class="modify_quit">
				<div id="login_type" style="display: none">${dto.login_type }</div>
				<div onclick="accessCheck()" class="modify">회원정보 수정</div>
				<div class="glyphicon glyphicon-option-vertical" aria-hidden="true"></div>
				<div class="quit" data-toggle="modal" data-target="#exampleModal">탈퇴</div>
			</div>
			
			<div class="name">${dto.member_name }님</div>

			<div class="point_story">
				<div class="mypoint">
					<p>MY POINT</p>
					<p class="point">${dto.point }</p>
					<button type="button" class="btn btn-default btn-sm"
						onclick="pointList()" style="font-size: 15px">내 포인트 내역</button>
				</div>
				<div class="story">
					<p>나의 필름스토리</p>
					<a href="myfilmstory">${fn:length(myRsvList)}</a>
				</div>
				<div class="etc">
					<p>무엇을 넣을까요</p>
				</div>
			</div>
		</div>

		<div class="rsv_wrap">
			<div class="rsv_h">MY 예매내역</div> 
			<!-- <span><a href="myreservelist">더보기</a></span> -->
			
			<div class="rsv_list_wrap">
				<ul>
				<c:choose>
					<c:when test="${!empty myRsvList }">
						<c:forEach var="item" items="${myRsvList }">
						
							
						
							<div style="display: none" class="rev_condition">${item.rev_condition }</div>

							<c:if test="${item.rev_condition eq 0 }">
							<li class="rsv_list">
								<div class="rsv_no_wrap">
									예매번호 <span class="rsv_no" id="rsv_no">${item.rev_no }</span>
								</div>
								<div class="rsv_info_wrap">
									<img src="${item.image }" width='160px' height='180px'>
									<div class="rsv_info">
										<div class="title" id="title">${item.movieNm }</div>
										<div>
											관람일시
											<p id="date">${item.show_date } ${item.show_time }</p>
										</div>
										<div>
											좌석
											<p id="seat">${item.seats }</p>
										</div>
									</div>
									
									<div class="rsv_btn">
										<span class="glyphicon glyphicon-qrcode" aria-hidden="true"
												id="qr" onclick="openPop(this)"></span>
										<br>
										<button type="button" class="btn btn-default btn-sm" data-toggle="modal"
											data-toggle2="tooltip" data-placement="bottom" title="예매취소는 상영시작 20분 전까지 가능합니다!" 
											data-target="#rsvCancelModal" data-title ="${item.rev_no }" style="font-size: 15px">예매 취소</button>
									</div>
								</div>
							</li>
							</c:if>
						</c:forEach>
					</c:when>
				
					<c:otherwise>
						<li class="rsv_list">
							<div class="empty_rsv">
								<img src="resources\img\tickets.png" width="90px" height="90px">
								<div>예매 내역이 없습니다</div>
								<div><strong>지금 바로 영화 예매하세요!</strong></div><br>
								<a href="movieList">영화 예매하러가기</a>
							</div>
						</li>
					</c:otherwise>
					
				</c:choose>
				</ul>
			
			</div>
		</div>
		
	</div>
		
		<!-- 예매 취소 modal -->
		<div class="modal fade" id="rsvCancelModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Filmbox 예매 취소</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<!-- <span aria-hidden="true">&times;</span> -->
						</button>
					</div>
					<div class="modal-body">예매 취소 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="confirm">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- 회원 탈퇴 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Filmbox</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<!-- <span aria-hidden="true">&times;</span> -->
						</button>
					</div>
					<div class="modal-body">회원 탈퇴 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onClick="location.href='userquit'">탈퇴하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>

	</section>
<script type="text/javascript" src="resources\js\mypage.js"></script>
</body>
</html>