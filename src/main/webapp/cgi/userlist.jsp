<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/cgi/include_top_header.jsp" %>
 <script type="text/javascript">

function goModify(usrId)
{	
	$('#usr_id').val(usrId);
	$("#frmUsrDtl").submit();
	
}

</script>             
                <!--div class="row">
					<div class="col-xl-12"-->

						<!-- list sources -->					
						<div class="card">
							<div class="card-header header-elements-inline">
								<h4 class="card-title"><i class="icon-circle-right2"></i>&nbsp; 사용자 목록</h4>								
							</div>
							
                            <div class="table-responsive">							
								<table class="table datatable-basic table-striped">
                                    <thead>
                                        <tr>                                            
                                            <th>사용자ID</th>
                                            <th>사용자명</th>                                            
                                            <th>근무회사명</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
								    <c:when test="${!empty UserList}">
							    	<c:forEach items="${UserList}" var="user">
							    	    <tr>  
                                            <td>${user.usr_id}</td>
                                            <td><a href="javascript:goModify('${user.usr_id}')">${user.usr_nm}</a></td>
                                            <td>${user.cmp_nm}</td>                                           
                                        </tr>
							    	</c:forEach>
							    	</c:when>
							    	</c:choose>
                                    </tbody>
 								</table>
                            </div>
 
 						</div>				
						<!-- /list sources -->
						<div class="text-right">
							<a href="/useradd.go"><button type="button" class="btn btn-primary btn-sm">등 록</button></a>
						</div>

					<!--/div>
				</div-->
<form name="frmUsrDtl" id="frmUsrDtl" action="/usermod.go" method="POST">
 <input type="hidden" name="usr_id" id="usr_id">      
</form> 
<%@ include file="/cgi/include_bottom.jsp" %>	