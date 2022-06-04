<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/temp.css">
    <script src="/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	$("#btn-login").click(function(e) {
		$('#form-login').submit();
	});

});
</script>
</head>
<body>
<form id="form-login" method="post" action="/userlist.do">  
    <div class="wrap">
        <div class="login">
            <h2>Beethoven Log-in</h2>
            <div class="login_sns">
            <!--li><a href=""><i class="fab fa-instagram"></i></a></li>
            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
            <li><a href=""><i class="fab fa-twitter"></i></a></li-->
            </div>
          
            <div class="login_id">
                <h4>사용자 ID</h4>
                <input type="text" name="usr_id" id="" placeholder="Id">
            </div>
            <div class="login_pw">
                <h4>사용자 Password</h4>
                <input type="password" name="usr_passwd" id="" placeholder="Password">
            </div>
           
            <div class="submit">
                <input type="button" id="btn-login" value="submit">
            </div>
           
        </div>
    </div>
</form> 
</body>
</html>