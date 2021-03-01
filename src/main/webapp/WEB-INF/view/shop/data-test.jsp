<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family: Arial;
	}
</style>
</head>
<body>
<h1>Bill</h1>

<br/>
${order}
<br/>
<a href="${pageContext.request.contextPath}/">To Homepage</a>

</body>
</html>