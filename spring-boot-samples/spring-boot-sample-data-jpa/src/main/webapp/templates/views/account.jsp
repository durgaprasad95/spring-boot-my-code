<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User-Account Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/home.css" rel="stylesheet">
<style type="text/css">
.error {
	color: #ff0000;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body ng-app="accountPage">
	<div class="row-fluid">
		<nav class="navbar navbar-inverse">
		<div class="navbar-inner">
			<a class="brand">Carting Site</a> <a class="btn-navbar"
				data-toggle="collapse" data-target=".nav-collapse"> <i
				class="icon-bar"></i> <i class="icon-bar"></i> <i class="icon-bar"></i>
			</a>
			<div class="nav-collapse collapse">
				<ul class="nav pull-right">
					<c:choose>
						<c:when
							test="${sessionScope.user != null || sessionScope.user != ''}">
							<li><a href="home">Home</a></li>
							<li><a href="cart">Cart</a></li>
							<li><a id="sessionUsername" href="account">${user.username}</a></li>
							<li><a href="logout">Log Out</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="eror">Home</a></li>

						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="row-fluid">
		<div class="span2 navbar-inverse">
			<ul class="nav navbar-inner nav-pills nav-stacked">
				<li class="active"><a data-toggle="tab" href="#user">User</a></li>
				<li><a data-toggle="tab" href="#value">Value</a></li>
				<li><a data-toggle="tab" href="#menu2">CSS</a></li>
				<li><a data-toggle="tab" href="#menu3">About</a></li>
			</ul>
		</div>
		<div class="span7 offset2 tab-content">
			<div id="user" class="tab-pane active"
				ng-controller="userCtrl as ctrl">
				<h3>User Details</h3>
				<table class="table borderless">
					<tbody>
						<tr ng-repeat="(key,value) in ctrl.user">
							<td class="span2">{{key}}</td>
							<td class="offset1 span3">{{value}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="value" class="tab-pane" ng-controller="valueCtrl as ctrl">
				<div class="row-fluid">
					<div class="navbar-inverse">
						<ul class="nav navbar-inner nav-pills">
							<li><a data-toggle="tab" href="#addvalue">Add</a></li>
							<li><a data-toggle="tab" href="#showvalue">Show</a></li>
							<li><a data-toggle="tab" href="#updatevalue">Update</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="tab-content">
						<div id="addvalue" class="tab-pane">
							<jsp:include page="/addValue" />
						</div>
						<div id="showvalue" class="tab-pane">
							<h3>Today's Prices</h3>
							<table class="table borderless">
								<thead>
									<tr>
										<th></th>
										<th>NAME</th>
										<th>QUANTITY</th>
										<th>COST (in Rs.)</th>
										<th>ACTION</th>
									</tr>
								</thead>
								<tbody ng-repeat="(key,value) in ctrl.values">
									<tr ng-repeat="x in value">
										<td ng-if="$first">{{ctrl.valueHeading(key) | uppercase}}
											:</td>
										<td ng-hide="$first"></td>
										<td ng-repeat="(key,value) in x">{{value | uppercase}}</td>
										<td><input type="submit" class="btn"
											ng-click="ctrl.changeTab(x,'updatevalue')" value="Update" /></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="updatevalue" class="tab-pane">
							<h3>Update Prices</h3>
							<div class="container-fluid">
								<form:form class="form-horizontal" method="post">
									<div class="control-group"
										ng-repeat="(key,value) in ctrl.updatableValue">
										<label class="control-label">{{key |uppercase}}:</label>
										<div class="controls">
											<input type="text" ng-if="!($last)" disabled="disabled"
												ng-value="value" /> <input type="text"
												ng-model="ctrl.amount" ng-if="$last" ng-value="value" />
										</div>
									</div>
									<input type="submit" class="btn btn-primary"
										ng-click="ctrl.updateValue();ctrl.changeTab('null','showvalue')"
										value="Save" />
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="menu2" class="tab-pane">
				<h3>Menu 2</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			</div>
			<div id="menu3" class="tab-pane">
				<h3>Menu 3</h3>
				<p>Hai Menu3</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="jquery-1.8.3.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/underscore-min.js"></script>
	<script src="assets/js/angular.min.js"></script>
	<script src="assets/js/account.js"></script>
</body>
</html>