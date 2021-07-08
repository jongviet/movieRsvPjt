<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- 무비 차트 페이지에서 특정 영화를 확인하여 '예매하기' 버튼을 누른 것으로 가정. 버튼 누를 시 get방식으로 moviNum, moviName이 넘어옴 -->
	<c:set var="scheduleNum"><%=java.lang.Math.round(java.lang.Math.random() * 1000000 + 100000)%></c:set>
	<div class="section primary-section" style="text-align: center; padding: 30px;">
		<h3 class="title">예매정보</h3>
		<table class="rsvInfo">
			<thead>
				<tr>
					<th>moviNum</th>
					<th>moviName</th>
					<th>email(예매자)</th>
					<th>cfmNum(예매번호)</th>
					<th>scheduleNum(스케쥴번호)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${param.moviNum}</td>
					<td>${param.moviName}</td>
					<td>${Ses_email}</td>
					<td id="cfmNum"></td>
					<td id="scheduleNum">${scheduleNum}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="section secondary-section" style="text-align: center; padding: 30px;">
		<h3 class="title">상영 일정 선택</h3>
		<form action="./rc" method="post">
			<input type="date" name="viewDate" id="viewDate"> 
			<select name="viewTime" id="viewTime">
				<option value="10:00~12:00">10:00~12:00</option>
				<option value="13:00~15:00">13:00~15:00</option>
				<option value="16:00~18:00">16:00~18:00</option>
				<option value="19:00~21:00">19:00~21:00</option>
				<option value="22:00~24:00">22:00~24:00</option>
			</select>
			<div>
				<button type="submit" id="seatBtn" class="btn btn-warning">좌석조회</button>
				<button type="button" id="reloadBtn" class="btn btn-warning">다시조회</button>
				<input type="hidden" name="nextSt" value="seatStatus"> 
				<input type="hidden" name="moviNum" value="${param.moviNum}"> 
				<input type="hidden" name="moviName" value="${param.moviName}"> 
			</div>
		</form>
	</div>
	<div class="section primary-section" style="text-align: center; padding: 30px;" id="seatTable">
		<h3 class="title">좌석정보</h3>
		<input type="hidden" name="email"
			value=<%=session.getAttribute("Ses_email")%>>
		<img src="src/images/screen.png" alt="">
		<div style="margin: 20px;">
			<table class="rsvSeat" border="1" style="margin: 0 auto;">
				<tr>
					<td id="t1"><a id="a1" href="javascript:void(0)"
						onclick='bgcolor($("#a1").text());'>1</a></td>
					<td id="t2"><a id="a2" href="javascript:void(0)"
						onclick='bgcolor($("#a2").text());'>2</a></td>
					<td id="t3"><a id="a3" href="javascript:void(0)"
						onclick='bgcolor($("#a3").text());'>3</a></td>
					<td id="t4"><a id="a4" href="javascript:void(0)"
						onclick='bgcolor($("#a4").text());'>4</a></td>
					<td id="t5"><a id="a5" href="javascript:void(0)"
						onclick='bgcolor($("#a5").text());'>5</a></td>
					<td id="t6"><a id="a6" href="javascript:void(0)"
						onclick='bgcolor($("#a6").text());'>6</a></td>
					<td id="t7"><a id="a7" href="javascript:void(0)"
						onclick='bgcolor($("#a7").text());'>7</a></td>
					<td id="t8"><a id="a8" href="javascript:void(0)"
						onclick='bgcolor($("#a8").text());'>8</a></td>
					<td id="t9"><a id="a9" href="javascript:void(0)"
						onclick='bgcolor($("#a9").text());'>9</a></td>
					<td id="t10"><a id="a10" href="javascript:void(0)"
						onclick='bgcolor($("#a10").text());'>10</a></td>
				</tr>
				<tr>
					<td id="t11"><a id="a11" href="javascript:void(0)"
						onclick='bgcolor($("#a11").text());'>11</a></td>
					<td id="t12"><a id="a12" href="javascript:void(0)"
						onclick='bgcolor($("#a12").text());'>12</a></td>
					<td id="t13"><a id="a13" href="javascript:void(0)"
						onclick='bgcolor($("#a13").text());'>13</a></td>
					<td id="t14"><a id="a14" href="javascript:void(0)"
						onclick='bgcolor($("#a14").text());'>14</a></td>
					<td id="t15"><a id="a15" href="javascript:void(0)"
						onclick='bgcolor($("#a15").text());'>15</a></td>
					<td id="t16"><a id="a16" href="javascript:void(0)"
						onclick='bgcolor($("#a16").text());'>16</a></td>
					<td id="t17"><a id="a17" href="javascript:void(0)"
						onclick='bgcolor($("#a17").text());'>17</a></td>
					<td id="t18"><a id="a18" href="javascript:void(0)"
						onclick='bgcolor($("#a18").text());'>18</a></td>
					<td id="t19"><a id="a19" href="javascript:void(0)"
						onclick='bgcolor($("#a19").text());'>19</a></td>
					<td id="t20"><a id="a20" href="javascript:void(0)"
						onclick='bgcolor($("#a20").text());'>20</a></td>
				</tr>
				<tr>
					<td id="t21"><a id="a21" href="javascript:void(0)"
						onclick='bgcolor($("#a21").text());'>21</a></td>
					<td id="t22"><a id="a22" href="javascript:void(0)"
						onclick='bgcolor($("#a22").text());'>22</a></td>
					<td id="t23"><a id="a23" href="javascript:void(0)"
						onclick='bgcolor($("#a23").text());'>23</a></td>
					<td id="t24"><a id="a24" href="javascript:void(0)"
						onclick='bgcolor($("#a24").text());'>24</a></td>
					<td id="t25"><a id="a25" href="javascript:void(0)"
						onclick='bgcolor($("#a25").text());'>25</a></td>
					<td id="t26"><a id="a26" href="javascript:void(0)"
						onclick='bgcolor($("#a26").text());'>26</a></td>
					<td id="t27"><a id="a27" href="javascript:void(0)"
						onclick='bgcolor($("#a27").text());'>27</a></td>
					<td id="t28"><a id="a28" href="javascript:void(0)"
						onclick='bgcolor($("#a28").text());'>28</a></td>
					<td id="t29"><a id="a29" href="javascript:void(0)"
						onclick='bgcolor($("#a29").text());'>29</a></td>
					<td id="t30"><a id="a30" href="javascript:void(0)"
						onclick='bgcolor($("#a30").text());'>30</a></td>
				</tr>
				<tr>
					<td id="t31"><a id="a31" href="javascript:void(0)"
						onclick='bgcolor($("#a31").text());'>31</a></td>
					<td id="t32"><a id="a32" href="javascript:void(0)"
						onclick='bgcolor($("#a32").text());'>32</a></td>
					<td id="t33"><a id="a33" href="javascript:void(0)"
						onclick='bgcolor($("#a33").text());'>33</a></td>
					<td id="t34"><a id="a34" href="javascript:void(0)"
						onclick='bgcolor($("#a34").text());'>34</a></td>
					<td id="t35"><a id="a35" href="javascript:void(0)"
						onclick='bgcolor($("#a35").text());'>35</a></td>
					<td id="t36"><a id="a36" href="javascript:void(0)"
						onclick='bgcolor($("#a36").text());'>36</a></td>
					<td id="t37"><a id="a37" href="javascript:void(0)"
						onclick='bgcolor($("#a37").text());'>37</a></td>
					<td id="t38"><a id="a38" href="javascript:void(0)"
						onclick='bgcolor($("#a38").text());'>38</a></td>
					<td id="t39"><a id="a39" href="javascript:void(0)"
						onclick='bgcolor($("#a39").text());'>39</a></td>
					<td id="t40"><a id="a40" href="javascript:void(0)"
						onclick='bgcolor($("#a40").text());'>40</a></td>
				</tr>
				<tr>
					<td id="t41"><a id="a41" href="javascript:void(0)"
						onclick='bgcolor($("#a41").text());'>41</a></td>
					<td id="t42"><a id="a42" href="javascript:void(0)"
						onclick='bgcolor($("#a42").text());'>42</a></td>
					<td id="t43"><a id="a43" href="javascript:void(0)"
						onclick='bgcolor($("#a43").text());'>43</a></td>
					<td id="t44"><a id="a44" href="javascript:void(0)"
						onclick='bgcolor($("#a44").text());'>44</a></td>
					<td id="t45"><a id="a45" href="javascript:void(0)"
						onclick='bgcolor($("#a45").text());'>45</a></td>
					<td id="t46"><a id="a46" href="javascript:void(0)"
						onclick='bgcolor($("#a46").text());'>46</a></td>
					<td id="t47"><a id="a47" href="javascript:void(0)"
						onclick='bgcolor($("#a47").text());'>47</a></td>
					<td id="t48"><a id="a48" href="javascript:void(0)"
						onclick='bgcolor($("#a48").text());'>48</a></td>
					<td id="t49"><a id="a49" href="javascript:void(0)"
						onclick='bgcolor($("#a49").text());'>49</a></td>
					<td id="t50"><a id="a50" href="javascript:void(0)"
						onclick='bgcolor($("#a50").text());'>50</a></td>
				</tr>
			</table>
		</div>
		<button id="cfmBtn" class="btn btn-warning">예매하기</button> <!-- id만 유지하고 디자인된 버튼으로 변경되어야 함 -->
	</div>
	<script src="src/js/rsv.js"></script>