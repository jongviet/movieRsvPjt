<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="movieChart" style="text-align: center;">

	<div class="section primary-section" id="dailyMoiveChart">
					<!-- 영화 순위 프론트 작업 필요 -->
			<aside id="asideWelcomePageMovieRank" class="movieRank">
				<div id="chase">
					<div class="title">
						<h2>실시간 예매 순위</h2>
					</div>
					<div>
						<table id="movieRankTable">
							<tbody>
								<c:forEach items="${mrvo }" var="mrvo">
									<c:set var="rank" value="${rank+1 }" />
									<c:set var="rate" value="${mrvo.moviCount / ticListSize * 100 }" />
									<tr>
										<th>${rank }</th>
										<th><fmt:formatNumber value="${rate }" pattern="0.00" />%</th>
										<c:choose>
										<c:when test="${mrvo.moviName eq '크루엘라'}">
										<th><a href="main.jsp?view=rsv&moviNum=1&moviName=크루엘라">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '컨저링3'}">
										<th><a href="main.jsp?view=rsv&moviNum=2&moviName=컨저링3">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '캐시트럭'}">
										<th><a href="main.jsp?view=rsv&moviNum=3&moviName=캐시트럭">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '분노의질주 - 더 얼티메이트'}">
										<th><a href="main.jsp?view=rsv&moviNum=4&moviName=분노의질주 - 더 얼티메이트">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '콰이어트플레이스2'}">
										<th><a href="main.jsp?view=rsv&moviNum=5&moviName=콰이어트플레이스2">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '귀멸의칼날 - 무한열차'}">
										<th><a href="main.jsp?view=rsv&moviNum=6&moviName=귀멸의칼날 - 무한열차">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '파이프라인'}">
										<th><a href="main.jsp?view=rsv&moviNum=7&moviName=파이프라인">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '도라에몽: 스탠바이미 2'}">
										<th><a href="main.jsp?view=rsv&moviNum=8&moviName=도라에몽: 스탠바이미 2">${mrvo.moviName }</a></th>
										</c:when>
										<c:when test="${mrvo.moviName eq '아야와 마녀'}">
										<th><a href="main.jsp?view=rsv&moviNum=9&moviName=아야와 마녀">${mrvo.moviName }</a></th>
										</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>							
			<!-- 영화 순위 끝 -->
			</aside>
<!-- 멀티 모달 -->
<script>
//Bootstrap multiple modal
var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌
$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * count);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
    count = count + 1
});

// multiple modal Scrollbar fix
$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});
</script>

<!-- 모달로 트레일러 -->
<script>
$(document).ready(function() {
    let $videoSrc;

    $(".video-btn").click(function() {
        $("#trailerSection").css("z-index", "5000");
        $videoSrc = $(this).data("src");
        console.log($videoSrc);
        $("#trailerSection").append(
            "<div class='player'><iframe width='784' height='441' src='https://youtube.com/embed/" +
            $(this).data("src") +
            "?rel=0&playsinline=1&autoplay=1' allow='autoplay; encrypted-media'</iframe></div>"
        );
    });

    $(".close").click(function() {
        $(".player").remove();
    });
    
  
});
</script>			
		<div class="container">
			<div class="title">
				<h1>무비차트</h1>
			</div>
			<div class="row-fluid team">
				<!-- 1위 -->
				<div class="span4" id="moviechart-1">
					<div class="thumbnail">
						<img src="src/images/movie/cruella.jpg" alt="">
						<h3>크루엘라</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=1&moviName=크루엘라"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="cruella" type="button" 
							data-toggle="modal" data-src="yfSMTFzw-Kw"
							data-target="#trailerModal">트레일러</button></li>

						</ul>
						<div class="mask">
							<h3>크루엘라</h3>
							<p style="font-size: x-small;">
								처음부터 난 알았어. 내가 특별하단 걸<br> 그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는
								없잖아?<br> 그러다 보니 결국, 학교를 계속 다닐 수가 없었지<br> <br>
								우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고<br> 나의 뛰어난 패션
								감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이했어<br> <br> 도둑질이
								지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어<br> 거리를 떠돌았지만
								패션을 향한 나의 열정만큼은 언제나 진심이었거든<br> <br> 근데 이게 뭐야, 옷에는 손도 못
								대보고 하루 종일 바닥 청소라니<br> 인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작
								부인이 나타났어<br> 천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지<br>
								<br> 꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…<br>
								<br> 그래서 난 내가 누군지 보여주기로 했어<br> 잘가, 에스텔라<br> <br>
								난 이제 크루엘라야!
							</p>
						</div>
					</div>
				</div>
				<!-- 2위 -->
				<div class="span4" id="moviechart-2">
					<div class="thumbnail">
						<img src="src/images/movie/theConjouring.jpg" alt="">
						<h3>컨저링3: 악마가 시켰다</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=2&moviName=컨저링3"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="conjouring3" type="button"
							data-toggle="modal" data-src="-ph-C38VJkI"
							data-target="#trailerModal">트레일러</button></li>

						</ul>
						<div class="mask">
							<h3>컨저링3: 악마가 시켰다</h3>
							<p style="font-size: x-small;">
								1981년, 미국 역사상 최초로 잔혹한 살인사건의 용의자가<br> 악마가 살해하도록 시켰다고 주장하는
								초유의 사태가 일어난다!<br> <br> 그리고 사건의 배후에는 악마에게 빙의된 소년이 있었는데…<br>
								<br>초자연 현상 연구가 워렌 부부의 사건 파일 중 여전히 미스터리로 남아있는 실화!<br> <br>
								진실 혹은 거짓? 살인사건의 범인, 인간인가 악마인가...
							</p>
						</div>
					</div>
				</div>
				<!-- 3위 -->
				<div class="span4" id="moviechart-3">
					<div class="thumbnail">
						<img src="src/images/movie/wrathOfMan.jpg" alt="">
						<h3>캐시트럭</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=3&moviName=캐시트럭"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="cashtruck" type="button"
							data-toggle="modal" data-src="SYiEc5GO0-8"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>캐시트럭</h3>
							<p style="font-size: x-small;">
								캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).<br> <br> 분노에
								휩싸인 그는 아들을 죽인 범인의 단서를 찾기 위해현금 호송 회사에 위장 취업한다.<br> <br>
								첫 임무부터 백발백중 사격 실력을 자랑하며, <br>단숨에 에이스로 급부상한 H.캐시트럭을 노리는 자들을
								하나 둘 처리하며, <br>아들을 죽인 범인들과 점점 가까워지는데…자비는 없다, <br> <br>
								분노에 가득 찬 응징만이 남았다.6월, 그의 분노가 폭발한다!
							</p>
						</div>
					</div>
				</div>
			</div>
			<p></p>
			<div class="row-fluid team">
				<!-- 4위 -->
				<div class="span4" id="moviechart-4">
					<div class="thumbnail">
						<img src="src/images/movie/fastNfurious.jpg" alt="">
						<h3>분노의 질주: 더 얼티메이트</h3>
						<ul class="social">
							<li><a
								href="main.jsp?view=rsv&moviNum=4&moviName=분노의질주 - 더 얼티메이트"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="fastnfurious" type="button"
							data-toggle="modal" data-src="L9Y-hn2COm0"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>분노의 질주: 더 얼티메이트</h3>
							<p style="font-size: x-small;">
								도미닉(빈 디젤)은 자신과 가장 가까웠던 형제 제이콥(존 시나)이 <br> 사이퍼(샤를리즈 테론)와
								연합해서 세계를 위기로<br> 빠트릴 위험천만한 계획을 세운다는 사실을 알게 되고, <br> 이를
								막기 위해 다시 한 번 패밀리들을 소환한다.<br> <br> 가장 가까운 자가 한순간, <br>
								가장 위험한 적이 된 상황! <br> <br> 도미닉과 패밀리들은 이에 반격할 놀라운 컴백과
								작전을 세우고<br> 지상도, 상공도, 국경도 <br> 경계가 없는 불가능한 대결이 시작되는데…
							</p>
						</div>
					</div>
				</div>
				<!-- 5위 -->
				<div class="span4" id="moviechart-5">
					<div class="thumbnail">
						<img src="src/images/movie/aQuietPlace.jpg" alt="">
						<h3>콰이어트 플레이스 2</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=5&moviName=콰이어트플레이스2"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="quietplace" type="button"
							data-toggle="modal" data-src="rf7SFaFSf5c"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>콰이어트 플레이스 2</h3>
							<p style="font-size: x-small;">
								실체를 알 수 없는 괴생명체의 공격으로<br> 일상의 모든 것이 사라진 세상,<br> <br>
								아이들 대신 죽음을 선택한 아빠의 희생 이후<br> 살아남은 가족들은 위험에 노출된다.<br> <br>
								갓 태어난 막내를 포함한 아이들과 함께 <br> 소리 없는 사투를 이어가던 엄마 ‘에블린’은 <br>
								<br> 살아남기 위해 새로운 은신처를 찾아 집 밖을 나서지만,<br> 텅 빈 고요함으로 가득한
								바깥은 더 큰 위험이 도사리고 있는데...
							</p>
						</div>
					</div>
				</div>
				<!-- 6위 -->
				<div class="span4" id="moviechart-6">
					<div class="thumbnail">
						<img src="src/images/movie/demonSlayerMugenTrain.jpg" alt="">
						<h3>극장판 귀멸의 칼날: 무한열차편</h3>
						<ul class="social">
							<li><a
								href="main.jsp?view=rsv&moviNum=6&moviName=귀멸의칼날 - 무한열차"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="demonslayermugentrain" type="button"
							data-toggle="modal" data-src="5EXgtz_seFA"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>극장판 귀멸의 칼날: 무한열차편</h3>
							<p style="font-size: x-small;">
								혈귀로 변해버린 여동생 ‘네즈코’를 <br> 인간으로 되돌릴 단서를 찾아 <br>비밀조직 귀살대에
								들어간 ‘탄지로.’‘젠이츠’,<br> ‘이노스케’와 새로운 임무 수행을 위해 <br> 무한열차에
								탑승 후귀살대 최강 검사 염주 ‘렌고쿠’와 합류한다. <br> <br> 달리는 무한열차에서
								승객들이 하나 둘 흔적 없이 사라지자숨어있는 <br> 식인 혈귀의 존재를 직감하는 ‘렌고쿠’. <br>
								<br> 귀살대 ‘탄지로’ 일행과 최강 검사 염주 ‘렌고쿠’는 <br> 어둠 속을 달리는
								무한열차에서 모두의 목숨을 구하기 위해<br> 예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을
								시작하는데…
							</p>
						</div>
					</div>
				</div>
			</div>
			<p></p>
			<div class="row-fluid team">
				<!-- 7위 -->
				<div class="span4" id="moviechart-7">
					<div class="thumbnail">
						<img src="src/images/movie/pipeline.jpg" alt="">
						<h3>파이프라인</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=7&moviName=파이프라인"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="pipeline" type="button"
							data-toggle="modal" data-src="KbFhzL1b8iQ"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>파이프라인</h3>
							<p style="font-size: x-small;">
								손만 대면 대박을 터트리는 도유 업계 최고 천공기술자 ‘핀돌이’는 <br> 수천억의 기름을 빼돌리기 위해
								거대한 판을 짠 대기업 후계자 ‘건우’의<br> 거부할 수 없는 제안에 빠져 위험천만한 도유 작전에
								합류한다.<br> <br> 프로 용접공 '접새', 땅 속을 장기판처럼 꿰고 있는 '나과장',<br>
								괴력의 인간 굴착기 '큰삽', 이 모든 이들을 감시하는 '카운터'까지!​<br> <br> 그러나
								저마다 다른 목적을 가진 이들이 서로를 속고 속이면서<br> 계획은 예상치 못한 방향으로 흘러가기
								시작하는데...​<br> <br> 인생 역전을 꿈꾸는 여섯 명의 도유꾼들​그들의 막장 팀플레이가
								시작된다!
							</p>
						</div>
					</div>
				</div>
				<!-- 8위 -->
				<div class="span4" id="moviechart-8">
					<div class="thumbnail">
						<img src="src/images/movie/standByMeDoraemon.jpg" alt="">
						<h3>도라에몽 : 스탠바이미</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=8&moviName=도라에몽: 스탠바이미 2"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="standbymedoraemon" type="button"
							data-toggle="modal"	data-src="IEKt_GtoAz0"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>도라에몽 : 스탠바이미</h3>
							<p style="font-size: x-small;">
								“할머니를 만나고 싶어!”어느 날 진구는 돌아가신 <br> 할머니와의 추억이 담긴 낡은 곰 인형을 발견하고<br>
								할머니가 보고 싶은 마음에 <br> 도라에몽의 4차원 비밀도구 타임머신을 타고 과거로 향한다.<br>
								<br> 느닷없이 찾아온 소년을 금세 진구라고 믿어주시는 할머니는 <br> 한 가지 소원을
								말씀하시는데…<br> “진구의 아내를 만나보고 싶구나”<br> <br> 결혼식을 보여
								드리기 위해 미래로 간 도라에몽과 진구!<br> 하지만 이슬이와의 결혼식 당일 신랑 진구는 도망가 버리고<br>
								퉁퉁이와 비실이가 진구를 찾는 동안 <br> 이슬이는 진구를 믿고 기다리는데…할머니의 소원을 위해,<br>
								그리고 가족과 친구들, <br> 좋아하는 이슬이와의 약속을 위해<br> <br>
								도라에몽과 진구의 과거와 현재, 미래를 넘나드는 스펙터클한 대모험이 시작된다!

							</p>
						</div>
					</div>
				</div>
				<!-- 9위 -->
				<div class="span4" id="moviechart-9">
					<div class="thumbnail">
						<img src="src/images/movie/earwigAndTheWitch.jpg" alt="">
						<h3>아야와마녀</h3>
						<ul class="social">
							<li><a href="main.jsp?view=rsv&moviNum=9&moviName=아야와 마녀"><button
										class="btn btn-warning" type="submit">예매하기</button></a></li>
							<li><button class="btn btn-warning video-btn" id="earwigdndthewtch" type="button"
							data-toggle="modal"	data-src="fe3r-hOOxAE"
							data-target="#trailerModal">트레일러</button></li>
						</ul>
						<div class="mask">
							<h3>아야와마녀</h3>
							<p style="font-size: x-small;">
								‘동료 마녀 12명을 완전히 따돌리면 아이를 찾으러 오겠다’는<br> 수수께끼 같은 편지와 함께 성
								모어발트의 집에 맡겨진 아야.<br> <br> 10살이 된 어느 날, 아야는 갑자기 찾아온 마법사
								벨라와 맨드레이크를 따라<br> 미스터리한 저택에 발을 들이게 된다.<br> <br>
								순간이동할 수 있는 문부터 비밀의 방까지 <br> 신비로움으로 가득 찬 그곳에서의 생활이 시작되고, <br>
								아야는 벨라를 돕는 조건으로 마법을 배우기로 한다. <br> <br> 하지만 마법은 알려주지 않고
								잔심부름만 시키는 마녀 벨라.<br> 벨라를 골탕 먹이기 위한 마녀지망생 아야와<br> 말하는
								고양이 토마스의 아주 특별한 주문이 시작된다!
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 트레일러 div 영역 -->
<div class="modal fade" id="trailerModal" tabindex="-1" aria-labelledby="trailerModalLabel"
aria-hidden="true" data-backdrop="static" style="z-index:-1; width:800px; background: rgba(0, 0, 0, 0.7); left: 29%; right: 29%;">
	<div class="modal-dialog">
		<div class="modal-content"style="width:800px; position:relative;">
			<div class="modal-header" style="margin-bottom: 2%;">
				<h4 class="modal-title" id="trailerModalLabel" style="color:#fff;">트레일러</h4>
               	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
               		<span aria-hidden="true">&times;</span>
              	</button>	
			</div>
			<div class="modal-body" id="trailerSection" style="width:800px; padding:0px; margin: 0px;">
			</div>
		</div>	
	</div>
</div>

<script src="src/js/sideBar.js"></script>