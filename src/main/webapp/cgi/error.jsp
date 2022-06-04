<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>에러 페이지</title>
</head>
<body>
    <div class="errorPage">
        <span class="errorHead">작업 실행 중 에러가 발생했습니다.</span><br />
        <p>request_uri : <c:out value="${requestScope['javax.servlet.error.request_uri']}"/></p>
        <p>status_code : <c:out value="${requestScope['javax.servlet.error.status_code']}"/></p>
        <p>servlet_name : <c:out value="${requestScope['javax.servlet.error.servlet_name']}"/></p>
        <p>exception : <c:out value="${requestScope['javax.servlet.error.exception']}"/></p>
        <p>message : <c:out value="${requestScope['javax.servlet.error.message']}"/></p>
    </div>
</body>
</html>