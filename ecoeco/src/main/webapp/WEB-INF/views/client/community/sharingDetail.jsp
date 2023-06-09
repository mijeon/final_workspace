<%@page import="com.friendly.eco.domain.SharingApplicant"%>
<%@page import="com.friendly.eco.domain.Mem"%>
<%@page import="com.friendly.eco.domain.Sharing"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Sharing sharing = (Sharing)request.getAttribute("sharing");
	Mem mem2 = (Mem)request.getAttribute("mem");
	SharingApplicant sharingApplicant = (SharingApplicant)request.getAttribute("sharingApplicant");
%>

<!DOCTYPE html>
<html lang="en">
<title>에코나눔</title>
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
	
	#thumbnail {
		width:600px;
		overflow: auto;
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

	<!-- -------------------------------------------------------------------------------- -->

	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-3 text-white mb-4 animated slideInDown">에코나눔</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item">더 가치 있는 곳으로 나눔을 실천하는 공간입니다. 원하는
						상품을 신청하면 랜덤으로 당첨됩니다.</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->

	<div class="container-fluid py-5">
		<div class="container">
		<form id="form1">
		<h3 class="card-title" style="padding: 50px 0 25px 0">상세내용</h3>
			<!-- 상세보기 -->
				<div class="row" >
    			<div class="col-lg-6 mb-5 ftco-animate fadeInUp ftco-animated">
    				<img src="/resources/data/community/sharing/<%=sharing.getSharing_thumbnail()%>" id="thumbnail" alt="Colorlib Template">
    			</div>
    			<div class="col-lg-1 product-details pl-md-5 ftco-animate fadeInUp ftco-animated">
    			</div>
    			<div class="col-lg-5 product-details pl-md-5 ftco-animate fadeInUp ftco-animated">
    				<input type="hidden" name="sharing_idx" value="<%=sharing.getSharing_idx()%>">
    				<input type="hidden" name="mem_idx" value="<%=sharing.getSharing_idx()%>">
    				<input type="hidden" name="sharing_random_range" value="<%=sharing.getSharing_random_range()%>">
    				<h4 style="padding: 0px 0px 10px 0px;"><%=sharing.getSharing_productname() %></h4>
    				<h5 style="padding: 0px 0px 10px 0px;">작성자 올 곳</h5>
    				<div class="row" style="padding: 0px 0px 15px 0px;">
    					<div class="col-6"><div >등록일 : <%=sharing.getSharing_regdate()%></div></div>
    					<div class="col-6"><label >조회수 : <%=sharing.getSharing_hits() %></label></div>
    				</div>
    				<div style="border: 1px solid; padding:10px; margin:20px 0 50px 0 ;" id="detail">
    					<%=sharing.getSharing_detail() %>
    				</div>
    			</div>
    			<!-- 버튼 -->
                        <div class="col " align="right" style="padding: 0px 15px 100px 0px;">
                            <div class="btn-group" role="group" aria-label="기본 예">
                                <button type="button" class="btn btn-danger" id="bt_apply">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">신청하기</font>
                                    </font>
                                </button>
                                <button type="button" class="btn btn-secondary" id="bt_edit">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">수정</font>
                                    </font>
                                </button>
                                <button type="button" class="btn btn-secondary" id="bt_delete">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">삭제</font>
                                    </font>
                                </button>
                                <button type="button" class="btn btn-secondary" id="bt_list">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">목록</font>
                                    </font>
                                </button>
                            </div>
                        </div>
                      <!-- 버튼 -->
    		</div>
			<!-- 상세보기 -->
		</form>
	</div>
	<div class="container">
		<form id="form2">
	<!-- 신청자보기 -->
	<div class="row">
              <div class="col-lg-12">
                  <div class="card">
                      <div class="card-header d-block">
                          <h5 class="card-title">신청자 목록</h5>
                      </div>
                      <div class="card-body">
                          <!-- 버튼 한 줄 -->
	                      <!-- 3) sharingApplicantList에 담긴 목록 수만큼 row를 생성함 (idx와 json이 키,값으로 채워짐)-->
	                       <template v-for="json in sharingApplicantList">
	                       	<row :key="json.applicant_idx" :obj="json"/>
	                      </template>
                          <!-- 버튼 한 줄 -->
                      </div>
                  </div>
                  </div>
              </div>
	<!-- 신청자보기 -->	
		</form>
	</div>
	</div>

	<!-- -------------------------------------------------------------------------------- -->

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

	<script type="text/javascript">
	
	let form2;
	//let applicantIdx;
	//let randomIndex;
	let sharingRandomIndex;
	let win=0; //기본값0=낙첨, 1=당첨
	
	//template으로 반복문 처리함
	const row={
			template:`
			<div>
				<input type="hidden" name="applicant_idx" value="sharingApplicant.applicant_idx" >
				<button type="button" class="btn btn-outline-dark"  id="bt_applicant_idx" style="margin :  5px 5px 5px 5px" v-on:click="applyForm(sharingApplicant.applicant_idx)">닉네임</button>
			</div>
			`, 
			//4) row 인스턴스 생성 시 외부에서 전달되는 파라미터(json에 담긴 sharingApplicant)를 받아와 data로 나타냄
			props:['obj'],
			data(){
				return{
					sharingApplicant:this.obj
				};
			},
			methods:{
				applyForm(idx){
					alert("신청번호 : " + idx);
				}	
			}
	}
	
	form2 = new Vue({
		el: '#form2',
		components:{
			row
		},
		data:{
			sharingApplicantList:[]
		}
	});
	
	//삭제하기
	function del() {

		console.log("선택한 글번호 : ", $("#form1 input[name='sharing_idx']").val());

		//삭제 확인하기
		if (!confirm("삭제하시겠습니까?")) {
			return;
		}

		$.ajax({
			url : "/community/sharing/del/"+ $("#form1 input[name='sharing_idx']").val(),
			type : "POST",
			success : function(result, status, xhr) {
				alert("삭제 완료 :)");
				location.href = "/community/sharingList"
			},
			error : function(xhr, status, result) {
				console.log("xhr : ", xhr);
				console.log("status : ", status);
				console.log("result : ", result);
			}
		});
		
		//목록으로 이동
		location.href = "/community/sharingList" 
	}
	
	//당첨결과 확인하기(신청 결과 확인, 신청자 등록)
	function winnerCheck(){
		//1) 인덱스(=신청자 수) 증가시키기
		//2) 레코드 한 줄 가져와 랜덤범위와 인덱스(=신청자 수) 비교하기
		//3) 신청 정보 등록하기
		//let formData = new FormData();
		let json = {};
		json['sharing_idx']=${sharing.sharing_idx};
		console.log("sharing_idx : ${sharing.sharing_idx}");
		$.ajax({
			url:"/rest/community/sharing/index", 
			method:"POST",
			dataType:'json',
			contentType: 'application/json',
			data:JSON.stringify(json),
			success:function(result, status, xhr){
				let resultCode = result.code; //0-낙첨, 1-당첨
				//console.log("결과 : "+ resultCode);
				if(resultCode==0){
				alert(result.msg); //낙첨
				location.href = "/community/sharingList"
				} else if (resultCode==1) {
				alert(result.msg);
				location.href="/community/sharingWinning"
				}
			},
			error:function(xhr, status, result){
				//alert("result : ", result);
				alert("실패");
			}
	    });
	}
	
	 

	
	
	
	//신청자 목록 가져오기
	function saList(){
		
		$.ajax({
			url:"/rest/community/sharing/"+ $("#form1 input[name='sharing_idx']").val(),
			type:"GET",
			success:function(result, status, xhr){
				//console.log(result);
				form2.sharingApplicantList=result; //2) 가져오기 성공한 sharingApplicantList을 List에 담음 
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
		//1) 로드 시 신청자목록 가져오기
		//saList에서 로드 시 가져온 신청자목록을 sharingApplicantList에 담음
		//form2에서 sharingApplicantList에 담긴 목록 수만큼 row를 생성함
		saList(); //신청목록 가져오기
		
		//수정버튼 이벤트 연결
		$("#bt_edit").click(
				function() {
					//수정폼 이동
					location.href="sharingEdit?sharing_idx="+$("#form1 input[name='sharing_idx']").val();
				});
		
		//삭제버튼 이벤트 연결
		$("#bt_delete").click(function() {
			del();
		});

		//목록버튼 이벤트 연결
		$("#bt_list").click(function() {
			location.href = "/community/sharingList"
		});
		
		//신청버튼 이벤트 연결
		$("#bt_apply").click(function() {
			confirm("회원당 한 번만 신청가능합니다. 신청하시겠습니까?");
			winnerCheck(); //당첨결과 확인하기
		});
		
	});
		
	</script>
</body>
</html>