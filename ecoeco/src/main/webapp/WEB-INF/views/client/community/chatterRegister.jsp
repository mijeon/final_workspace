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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

.box-style{
	width:150px;
	height:150px;
	border:1px solid #ccc;
}

.box-style img{
	width:150px;
	height:150px;
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
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
		data-wow-delay="0.1s">
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



	<div class="container-fluid">
		
		<div class="container">
			<h3 class="card-title" style="padding: 50px 0 25px 0">글등록</h3>
			<!-- 제목 -->
			<div class="row" style="float: none; margin: 0 auto; padding: 0 0 25px 0">
				<div class="col-lg-12" style="float: none; margin: 0 auto">	
					<div class="form-group">
	                	<input type="text" class="form-control input-default " placeholder="제목을 입력하세요" name="chatter_title">
	                </div>
				</div>
			</div>
			<!-- 제목 -->
			
			<!-- 써머노트 -->
				<div class="row">
			    <div class="col-xl-12 col-xxl-12" style="float: none; margin: 0 auto; padding: 0 0 25px 0">
			    	<textarea type="text" class="form-comtrol" name="chatter_detail"></textarea> 
			    </div>
			</div>
			<!-- 써머노트 -->
			
			<!-- 파일탐색기 -->
			<div class="row form-group" style="padding: 0 0 25px 0">
					<div class="col">
						<input type="file" class="form-control" id="chatter_flie" name="chatter_flie">
						<!-- DTO 파라미터명과 일치해야함 -->
					</div>
			</div>
			<!-- 파일탐색기 -->	
			
			<div class="row" style="padding: 0 0 50px 0">
				<!-- 파일미리보기 -->
				<div class="col" align="left">
					<div class="box-style">
						<img id="chatter_thumbnail" name="chatter_thumbnail">
						<!-- DTO 파라미터명과 일치해야함 -->
					</div>
				</div>
				<!-- 파일미리보기 -->
				
				<!-- 버튼 -->
				<div class="col " align="right">	
					<div class="btn-group" role="group" aria-label="기본 예">
		            	<button type="button" class="btn btn-secondary" id="bt_register"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">등록</font></font></button>
		                <button type="button" class="btn btn-secondary" id="bt_list"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">목록</font></font></button>
		             </div>
				</div>
				<!-- 버튼 -->
			</div>
			
		</div>
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

	<script type="text/javascript">
	
	let fileObj;
	let key=0;
	
	//썸네일 미리보기
	function preview(file){
		
		//선택한 첫번째 파일[0]을 file로 끌어옴
		fileObj = file;
		console.log("fileObj 정보 : ",fileObj); //[object File]
		
		let reader = new FileReader(); //스트림 생성
		//로드되면 가동됨
		reader.onload=(e)=>{
			console.log("선택한 파일의 바이너리 정보 : ", e.target.result); 
			
			//file=e.target.result;
			//attr : 속성값을 가져옴 / src는 지어준 이름
			//$("img[name='chatter_thumbnail']").attr("src",file);
			//-> chatterList에서 썸네일을 띄우기 위해 file 대신 json으로 받기로 함
			
			key++;
			
			let json=[];
			json['key']=key; //기준값(다른 예제에서 이미지 삭제할 때 썼던 값인데 일단 넣어놓음)
			json['binary']=e.target.result; //바이너리 정보
			json['file']=file;
			$("img[name='chatter_thumbnail']").attr("src",json.binary);
			
			console.log("넘겨받은 json : ", json);
		}
		reader.readAsDataURL(file);  //URL로 파일 읽어서 미리보여줌
	}
	
	
	
	//등록하기
	function register(){
		
		//입력값 formData로 담기(전송 대상에 이미지가 포함되기 때문)
		let formData = new FormData();
		//formData.append("mem.mem_idx", 1); //로그인시확인되는아이디로 수정해줘야해~~~~~~~~~~~~~
		formData.append("chatter_title", $("input[name='chatter_title']").val());
		formData.append("chatter_detail", $("textarea[name='chatter_detail']").val());
		formData.append("chatter_flie", fileObj); //파일 자체
		formData.append("chatter_thumbnail", $("img[name='chatter_thumbnail']").val()); //파일 이름
		
		//controller로 전송하기
		//processData:false, contentType:false 반드시 false여야 전송됨
		$.ajax({
			url:"/rest/community/chatter", 
			type:"POST",
			data:formData,
			processData:false,
			contentType:false,
			success:function(result, status, xhr){
				console.log("입력정보", result.msg);
				alert("등록 완료 :)");
				location.href="/community/chatterList" //목록으로 돌아가기
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
		
		//서머노트 적용
 		$("textarea[name='chatter_detail']").summernote({
 			placeholder: '내용을 입력하세요',
			height: 300
		}); 
		
		//파일편집기에 이벤트 연결
		$("input[name='chatter_flie']").change(function(){
			//alert("파일 선택했어!");
			console.log("선택한 파일 정보 : "+this.files); //[object FileList]
			preview(this.files[0]); //썸네일 미리보기
			//배열로 나오는 결과물 중 첫번째 파일 하나만 필요하니 순서를 [0]으로 명시함
		});

		
 		//등록버튼 이벤트 연결
		$("#bt_register").click(function(){
			register();
		});
		
		//목록버튼 이벤트 연결
		$("#bt_list").click(function(){
			location.href="/community/chatterList"
		});
		
	});
	
	</script>
</body>
</html>