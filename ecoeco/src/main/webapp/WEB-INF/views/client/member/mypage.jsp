<%@page import="com.friendly.eco.domain.Mem"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Mem sessionMem = (Mem)session.getAttribute("mem");
	int mem_type_idx = sessionMem.getMemType().getMem_type_idx();
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- header_link Start -->
	<%@ include file="../inc/header_link.jsp" %>
	<!-- header_link End -->
</head>

<body>
    <!-- Spinner Start -->
    <%@ include file="../inc/spinner.jsp" %>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <%@ include file="../inc/topbar.jsp" %>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <%@ include file="../inc/navbar.jsp" %>
    <!-- Navbar End -->


	<!-- 양식 start -->
	<div>
		<%if(mem_type_idx == 1 || 
				mem_type_idx ==3 || 
				mem_type_idx ==4){%> <!--  -->
			<div>개인회원 mypage 나오는 곳</div>
		<% }else{%>
		<div>단체회원 mypage 나오는 곳</div>
		<%} %>
	</div>
	<!-- 양식 end -->



    <!-- Footer Start -->
    <%@ include file="../inc/footer.jsp" %>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <%@ include file="../inc/capyright.jsp" %>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <%@ include file="../inc/back_to_top.jsp" %>

    <!-- Footer link Start -->
    <%@ include file="../inc/footer_link.jsp" %>
	<!-- Footer link Start -->
</body>

</html>