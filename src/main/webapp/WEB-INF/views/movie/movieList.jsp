<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/movieList.css">
</head>
<body>
	<div id="movie_wrap">
		<div id="movieList">
			<h2>무비 차트</h2>
			<ul>
				<%-- 			<li>
				<a href="movieInfo/${item.movieCd}">
					<img alt="영화포스터" src="data:image/jpeg;base64,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">
				</a>
				<div class="mv_title">
					<h3>걸캅스 </h3>
					<span>개봉일 2021.01.01 </span>
					<span> 별점 8.1 </span>
				</div>
				    <div class="reservation">
				        <div>예매하기</div>
				        <div>예매하기</div>
				    </div>

			</li>
		 --%>
				<c:forEach var="item" items="${mvList }">
					<li>
						<a href="movieInfo/${item.movieCd}"> 
						<img alt="영화 포스터" src="${item.image }">
					</a>
						<div class="mv_title">
							<h3>${item.movieNm }</h3>
							<span>개봉일 ${item.openDt } </span> 
							<span>별점 ${item.starpoint } </span>
						</div>
							<form class="moveForm" id="revform" action="/reservemovie" method="post">
								<input type="hidden" name="movieNm" value="${item.movieNm}">
								<input type="hidden" name="movieCd" value="${item.movieCd}">
								 <input type="submit" value="예매하기" class="button gblue">
		
							</form>

					</li>
				</c:forEach>
			</ul>

			<div id="clear"></div>
		</div>
	</div>

</body>
</html>