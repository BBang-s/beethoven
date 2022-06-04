<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/cgi/include_top_header.jsp" %>
 <script type="text/javascript">

 function saveUser(usrId)
 {	
 	// 등록인 경우
 	if(usrId == null || usrId == "")
 	{
 		if(confirm("사용자를 등록하시겠습니까?")) 
 	 	{
 			
 			$.ajax({
 		  		url: "/adduser.do",
 		  		type: "post",
 		  		data: $("#frmUser").serialize(),
 		  		cache: false,
 		  		success: function(data) 
 		  		{   
 		  			let parseData = JSON.parse(data);
 	  				
 		  			if(parseData.result == "1")
 		  			{ 	 	  				
	 	 	  			if(confirm("사용자 정보가 등록되었습니다.\n목록으로 이동하시겠습니까?")) 
	 	 	  				location.href = "/userlist.do";
 		  			}
 		  			else
 		  				alert("사용자 정보 등록에 실패했습니다.");
 		  		}
 		  	});
 			
 		}
 	}
 	// 수정인 경우
 	else
 	{
 		if(confirm("사용자를 수정하시겠습니까?")) 
 	 	{	
 			$.ajax({
 		  		url: "/upduser.do",
 		  		type: "post",
 		  		data: $("#frmUser").serialize(),
 		  		cache: false,
 		  		success: function(data) 
 		  		{   		
 		  			let parseData = JSON.parse(data);
 	  				
 		  			if(parseData.result == "1")
 		  			{ 	 	  				
	 	 	  			if(confirm("사용자 정보가 수정되었습니다.\n목록으로 이동하시겠습니까?")) 
	 	 	  				location.href = "/userlist.do";
 		  			}
 		  			else
 		  				alert("사용자 정보 수정에 실패했습니다.");
 		  		}
 		  	});
 			
 		}
 	}
 	
 }

 function delUser(usrId)
 {	
 	
 	if(confirm("사용자를 삭제하시겠습니까?")) 
 	{
 		// 삭제할 사용자ID 설정
 		$('#usr_id').val(usrId);
 		
 		$.ajax({
 	  		url: "/deluser.do",
 	  		type: "post",
 	  		data: $("#frmUser").serialize(),
 	  		cache: false,
 	  		success: function(data) 
 	  		{   		
 	  			let parseData = JSON.parse(data);
 	  				
 	  			if(parseData.result == "1")
 	  			{
	 	  			alert("사용자 정보가 삭제되었습니다.");
	 	  			location.href = "/userlist.do";
 	  			}
 	  			else
		  			alert("사용자 정보 삭제에 실패했습니다.");
 	  		}
 	  	});
 		
 	}
 	
 }

</script>             
<c:choose>
	<c:when test="${not empty UserMap.usr_id}">
		<c:set var="titleNm" value="수정"/>	
		<c:set var="usrIdReadOnly" value="readonly"/>
	</c:when>
	<c:otherwise>
		<c:set var="titleNm" value="등록"/>
		<c:set var="usrIdReadOnly" value=""/>	
	</c:otherwise>
</c:choose>            			
						<div class="card">
							<div class="card-header header-elements-inline">
								<h4 class="card-title"><i class="icon-circle-right2"></i>&nbsp; 사용자 ${titleNm}</h4>								
							</div>
							
                            <div class="card-body">
<form name="frmUser" id="frmUser" method="POST">
								<div class="form-group row">
									<label class="col-form-label col-md-1">사용자ID</label>
									<div class="col-md-4">
										<input type="text" class="form-control" id="usr_id" name="usr_id" value="${UserMap.usr_id}" ${usrIdReadOnly}>
									</div>
								</div>								
								<div class="form-group row">
									<label class="col-form-label col-md-1">사용자명</label>
									<div class="col-md-4">
										<input type="text" class="form-control" id="usr_nm" name="usr_nm" value="${UserMap.usr_nm}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-1">근무회사명</label>
									<div class="col-md-4">
										<input type="text" class="form-control" id="cmp_nm" name="cmp_nm" value="${UserMap.cmp_nm}">
									</div>
								</div>
								<div class="text-right">
									<button type="button" class="btn btn-primary btn-sm" onclick="javascript:saveUser('${UserMap.usr_id}')">저 장</button>
									<c:if test="${not empty UserMap.usr_id}">
		                            <button type="button" class="btn btn-danger btn-sm" title="삭제" onclick="javascript:delUser('${UserMap.usr_id}')">삭 제</button>
		                            </c:if>
		                            <a href="/userlist.do"><button type="button" class="btn btn-success btn-sm">목 록</button></a>
								</div>
</form>
							</div>						
						</div>

<%@ include file="/cgi/include_bottom.jsp" %>	