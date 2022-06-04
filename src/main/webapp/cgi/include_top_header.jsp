<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Beethoven</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/tmpl/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/tmpl/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/tmpl/assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="/tmpl/assets/css/layout.min.css" rel="stylesheet" type="text/css">
	<link href="/tmpl/assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="/tmpl/assets/css/colors.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->  
	<!-- Core JS files -->
	<script src="/tmpl/global_assets/js/main/jquery.min.js"></script>
	<script src="/tmpl/global_assets/js/main/bootstrap.bundle.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="/tmpl/global_assets/js/plugins/visualization/d3/d3.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
	<script src="/tmpl/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/ui/moment/moment.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/pickers/daterangepicker.js"></script>

	<script src="/tmpl/assets/js/app.js"></script>
	<script src="/tmpl/global_assets/js/demo_pages/dashboard.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/streamgraph.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/sparklines.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/lines.js"></script>	
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/areas.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/donuts.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/bars.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/progress.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/heatmaps.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/pies.js"></script>
	<script src="/tmpl/global_assets/js/demo_charts/pages/dashboard/light/bullets.js"></script>
	
	<script src="/tmpl/global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/forms/selects/select2.min.js"></script>
	<script src="/tmpl/global_assets/js/demo_pages/datatables_basic.js"></script>
	
	<script src="/tmpl/global_assets/js/plugins/buttons/spin.min.js"></script>
	<script src="/tmpl/global_assets/js/plugins/buttons/ladda.min.js"></script>
	<script src="/tmpl/global_assets/js/demo_pages/components_buttons.js"></script>
	
	<script src="/tmpl/global_assets/js/plugins/notifications/bootbox.min.js"></script>
	<script src="/tmpl/global_assets/js/demo_pages/components_modals.js"></script>
	<!-- /theme JS files -->

	<script src="/js/Chart.js/Chart.js"></script>
	<script src="/js/Chart.js/samples/utils.js"></script>
	<script src="/js/Chart.js/Chart.bundle.js"></script>
	<script src="/js/common_util.js"></script>

</head>
<body>

	<!-- Main navbar -->
	<div class="navbar navbar-expand-md navbar-dark">
		<div class="navbar-brand">
			
				<!--img src="/tmpl/global_assets/images/hyper_logo.png" alt="" style="width: 50%; height: 50%;"-->
				<i class="icon-pointer"> Beethoven</i>	
			
		</div>
		<div class="d-md-none">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>
			<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
						<i class="icon-paragraph-justify3"></i>
					</a>
				</li>
			</ul>
			<span class="ml-md-3 mr-md-auto">&nbsp;</span>
			<ul class="navbar-nav">
				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
						<img src="/tmpl/global_assets/images/placeholders/placeholder.jpg" class="rounded-circle mr-2" height="34" alt="">
						<span>사용자1</span>
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a href="#" class="dropdown-item"><i class="icon-user-plus"></i> My Beethoven</a>
						<!--a href="#" class="dropdown-item"><i class="icon-coins"></i> My balance</a>
						<a href="#" class="dropdown-item"><i class="icon-comment-discussion"></i> Messages <span class="badge badge-pill bg-blue ml-auto">58</span></a-->
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"><i class="icon-cog5"></i> 개인정보 수정</a>
						<a href="#" class="dropdown-item"><i class="icon-switch2"></i> 로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->
	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<div class="sidebar sidebar-dark sidebar-main sidebar-expand-md">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				Navigation
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->

			<!-- Sidebar content -->
			<div class="sidebar-content">

<%@ include file="/cgi/include_left_menu.jsp" %>

			</div>
			<!-- /sidebar content -->
		</div>
		<!-- /main sidebar -->  
		<!-- Main content -->
		<div class="content-wrapper">
			<!-- Page header -->
			<div class="page-header page-header-light">

				<div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
					<div class="d-flex">
						<div class="breadcrumb">
							<a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i>Main</a>
							<span class="breadcrumb-item active">Dashboard</span>
						</div>

						<a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
					</div>
					<div class="header-elements d-none">
						<div class="breadcrumb justify-content-center">
							<a href="#" class="breadcrumb-elements-item">
								<i class="icon-comment-discussion mr-2"></i>
								Support
							</a>

							<div class="breadcrumb-elements-item dropdown p-0">
								<a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">
									<i class="icon-gear mr-2"></i>
									Settings
								</a>

								<div class="dropdown-menu dropdown-menu-right">
									<a href="#" class="dropdown-item"><i class="icon-user-lock"></i> Account security</a>
									<a href="#" class="dropdown-item"><i class="icon-statistics"></i> Analytics</a>
									<a href="#" class="dropdown-item"><i class="icon-accessibility"></i> Accessibility</a>
									<div class="dropdown-divider"></div>
									<a href="#" class="dropdown-item"><i class="icon-gear"></i> All settings</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">