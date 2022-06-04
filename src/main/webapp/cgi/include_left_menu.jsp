<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">
						<!-- Main -->
						<li class="nav-item-header"><div class="font-size-s line-height-s"><i class="icon-heart5"></i> &nbsp; I will be your ears</div> <i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">						
							<a href="/userlist.do?mnu=a01" class="nav-link ${menuMap['a01']}">
								<i class="icon-home4"></i><span>홈</span>
							</a>
						</li>
						<c:choose>
   							<c:when test="${empty menuMap['b']}">
						<li class="nav-item nav-item-submenu">
							</c:when>
							<c:otherwise>
						<li class="nav-item nav-item-submenu nav-item-expanded nav-item-open">
							</c:otherwise>
						</c:choose>						
							<a href="#" class="nav-link ${menuMap['b']}"><i class="icon-stack"></i> <span>메뉴1</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Basic components">							
								<li class="nav-item"><a href="#" class="nav-link ${menuMap['b01']}">서브메뉴1_1</a></li>
								<li class="nav-item"><a href="#" class="nav-link ${menuMap['b02']} ">서브메뉴1_2</a></li>
								<li class="nav-item"><a href="/userlist.do?mnu=b03" class="nav-link ${menuMap['b03']}">사용자 목록(테스트)</a></li>
							</ul>
						</li>
						
						<c:choose>
   							<c:when test="${empty menuMap['c']}">
						<li class="nav-item nav-item-submenu">
							</c:when>
							<c:otherwise>
						<li class="nav-item nav-item-submenu nav-item-expanded nav-item-open">
							</c:otherwise>
						</c:choose>						
							<a href="#" class="nav-link ${menuMap['c']}"><i class="icon-stack"></i> <span>메뉴2</span></a>
							<ul class="nav nav-group-sub" data-submenu-title="Basic components">							
								<li class="nav-item"><a href="#" class="nav-link ${menuMap['c01']}">서브메뉴2_1</a></li>
								<li class="nav-item"><a href="#" class="nav-link ${menuMap['c02']}">서브메뉴2_2</a></li>
							</ul>
						</li>
						<li class="nav-item">						
							<a href="/swagger-ui/index.html" class="nav-link" target="_blank">
								<i class="icon-stack"></i><span>Swagger UI 접속</span>
							</a>
						</li>

					</ul>
				</div>
				<!-- /main navigation -->