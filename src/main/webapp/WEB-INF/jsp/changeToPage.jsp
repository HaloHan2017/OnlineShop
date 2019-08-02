<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String PATH=request.getContextPath(); %>
	<script src="${PATH }/assets/js/vendor/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			window.location.href="http://localhost/my-account";
		})
	</script>

</body>
</html>