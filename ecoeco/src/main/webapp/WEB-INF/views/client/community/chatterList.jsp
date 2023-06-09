<%@page import="com.friendly.eco.domain.Chatter"%>
<%@page import="java.util.List"%>
<%@page import="com.friendly.eco.util.PageManager"%>
<%@page import="com.friendly.eco.model.community.MybatisChatterDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>에코수다</title>

<head>
<!-- header_link Start -->
<%@ include file="../inc/header_link.jsp"%>
<!-- header_link End -->

<!-- Latest compiled and minified CSS -->
<!-- 기본 템플릿 설정과 충돌함, 호버 효과는 포기하자!
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	 -->
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

.box-style img{
	width:100px;
	height:100px;
	border:1px solid #ccc;
}
#paging-area {
	text-align: center;
	float: none;
}

</style>

</head>

<body>
	<!-- Spinner Start -->
	<%@ include file="../inc/spinner.jsp"%>
	<!-- Spinner End -->

	<!-- Topbar Start -->
	<%@ include file="../inc/topbar.jsp"%>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<%@ include file="../inc/navbar.jsp"%>
	<!-- Navbar End -->



	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn"data-wow-delay="0.1s" >
		<div class="container text-center py-5">
			<h1 class="display-3 text-white mb-4 animated slideInDown">에코수다</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item">자유롭게 이야기를 나누는 공간입니다.</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->



	<div class="container-xxl py-5">

		<!-- 표  -->
		<div class="container">
			<div class="row" style="padding: 0 0 25px 0">

				<div class="col-sm-6 col-md-6">
					<div class="dataTables_length" id="zero_config_length"
						style="vertical-align: middle">
						<label>목록<select name="zero_config_length"
							aria-controls="zero_config" class="form-control form-control-sm">
								<option value="10">10개</option>
								<option value="10">20개</option>
								<option value="10">30개</option>
								<option value="50">40개</option>
								<option value="100">50개</option>
						</select></label>
					</div>
				</div>

				<div class="col-sm-6 col-md-6">
					<div id="zero_config_filter" class="dataTables_filter">
						<label>검색 :<input type="search"
							class="form-control form-control-sm" placeholder=""
							aria-controls="zero_config"></label>
					</div>
				</div>
			</div>

			<div class="row" style="padding: 0 0 25px 0">
				<form id="form1">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover" style="vertical-align: middle">
										<thead>
											<tr>
												<th>No.</th>
												<th>섬네일</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<!-- 레코드 한 줄 -->
											<!-- RestChatterController에서 chatterServiceList에 담긴 만큼 반복-->
											<template v-for="(json, i) in chatterList">
												<row :key="json.chatter_idx" :num="num-i" :obj="json" />
											</template>
											<!-- 레코드 한 줄 -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 표 -->
		
		<!-- 페이징 처리 -->
		<div class="row" align="center">
			<div class="col-1" id="paging-area"></div>
		</div>
		<!-- 페이징 처리 -->

		<!-- 마지막 줄 -->
		<div class="container" style="padding: 0 0 50px 0">
			<div class="row">
		<!-- 페이징 처리 -->
			<div class="col-lg-11 grid-margin stretch-card" align="right">
				<div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate">
					<ul class="pagination" style=" float: none; margin: 0 auto" >
						<li class="paginate_button page-item previous disabled" id="zero_config_previous">
							<a href="#" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">이전</a>
						</li>
						<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">1</a>
						</li>
						<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">2</a>
						</li>
						<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">3</a>
						</li>
						<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">4</a>
						</li>
						<li class="paginate_button page-item active">
							<a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">5</a>
						</li>
						<li class="paginate_button page-item next" id="zero_config_next">
							<a href="#" aria-controls="zero_config" data-dt-idx="7" tabindex="0" class="page-link">다음</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 페이징 처리 -->

				<!-- 버튼 -->
				<div class="col-lg-1" align="right">
					<button type="button" class="btn btn-secondary" id="bt_register">글쓰기</button>
				</div>
				<!-- 버튼 -->
			</div>
		</div>
		<!-- 마지막 줄 -->
	</div>



	<!-- Footer Start -->
	<%@ include file="../inc/footer.jsp"%>
	<!-- Footer End -->


	<!-- Copyright Start -->
	<%@ include file="../inc/capyright.jsp"%>
	<!-- Copyright End -->


	<!-- Back to Start -->
	<%@ include file="../inc/back_to_top.jsp"%>
	<!-- Back to End -->


	<!-- Footer link Start -->
	<%@ include file="../inc/footer_link.jsp"%>
	<!-- Footer link End -->

	<!-- -------------------------------------------------------------------------------- -->

	<script type="text/javascript" src="/resources/js/Pager.js"></script>
	<script type="text/javascript">
	
	//webapp/resources/js/Pager.js
	let pager = new Pager(); // 인스턴스 생성
	let currentPage=1; // 현재 보고 있는 페이지
	
	let form1;
	
	// template으로 반복문 처리함
	const row={
			template:`
			<tr>
				<td>{{chatter.chatter_idx}}</td>
				<td class="box-style" @click="moveDetail(chatter)"><a href="#"><img :src="'/resources/data/community/chatter/'+chatter.chatter_thumbnail"></a></td>
				<td @click="moveDetail(chatter)"><a href="#">{{chatter.chatter_title}}</a></td>
				<td>닉네임 연결해야함!!!</td>
				<td>{{chatter.chatter_regdate}}</td>
				<td>{{chatter.chatter_hits}}</td>
			</tr>
			`,
			//row 인스턴스 생성 시 외부에서 전달되는 파라미터를 받아옴
			//chatter에 파라미터를 받아 <img :src="chatter.binary"> 로 다시 보내줌
			//n에 파라미터를 받아 pageLink(n) 로 다시 보내줌
			props:['obj', "num"],
			data(){
				return{
					chatter:this.obj,
					n:this.num
				};
			},
			methods:{
				moveDetail:function(chatter){
					//상세폼 이동
					location.href="/community/chatterDetail?chatter_idx="+chatter.chatter_idx;
				}
			}
	}
	//<td class="py-1"><img src="resources/data/community/{{chatter.chatter_thumbnail}}"></td>
	//<td>{{chatter.mem.memnickname.mem_nickname}}</td>
	
	form1 = new Vue({
		el: '#form1',
		components:{
		row
		},
		data:{
			count:5,
			chatterList:[],
			currentList:[], //페이지당 보여질 배열
			num:0//페이지당 시작 번호를 뷰 컴포넌트에서 접근할 수 있도록 함 
		}
	});
	
	// 페이징 처리하기
	function pageLink(n){
		//chatterList를 제어하면 Vue 디자인은 자동으로 적용됨

		//1) row 인스턴스 생성 시 서버에서 전달받은 데이터로 페이징처리 기준 잡기
		pager.init(form1.chatterList, n);
		
		form1.num=pager.num;//pager에서 초기화한 페이지당 시작 번호로 
		
		//0으로 비우기
		form1.currentList.splice(0, form1.currentList.length);//싹 비우고
		
		//채워넣기
		for(let i=pager.curPos; i<pager.curPos+pager.pageSize;i++){	
			//num이 1보다 작아지면 멈춤
			if(pager.num<1) break;
			pager.num--;
			
			//전체 배열에서 일부 배열로 옮기기
			form1.currentList.push(form1.currentList[i]);
			console.log("currentList는", form1.chatterList);
		}
	}
	
	//목록 가져오기
	function list(){
		$.ajax({
			url:"/rest/community/chatter",
			type:"GET",
			success:function(result, status, xhr){
				form1.chatterList=result;
				console.log("result에서 넘어온 file : ",result);
				
				//pageLink(현재페이지); //페이징 처리 계산 수행
				pageLink(currentPage); //페이징 처리 계산 수행
				//프로그램 가동하자마자 현재 페이지는 ? currentPage
						
				//넘버링 출력(1~10, 11~20)
				
				for(let i=pager.firstPage;i<pager.lastPage;i++){
					if(i>pager.totalPage) break;//내가 가진 페이지수를 넘어서면 반복문 빠져나오기
					$("#paging-area").append("<a href='javascript:pageLink("+i+")' style='margin:3px'>"+i+"</a>")
				}
			},
			error:function(xhr, status, result){
				console.log("xhr : ", xhr);
				console.log("status : ", status);
				console.log("result : ", result);
			}
		});
	}
	
	//init
	$(function(){
		//로드 시 목록 가져오기
		//list에서 로드 시 가져온 목록을 chatterList에 담음
		//form1에서 chatterList에 담긴 목록 수만큼 row를 생성함
		list();
		
		//등록버튼 이벤트 연결
		$("#bt_register").click(function(){
			location.href="/community/chatterRegisterForm"
		});
	});
	
	</script>
</body>
</html>