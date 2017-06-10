<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Task | Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>

	<div class="Navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">New Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode== 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jambotron text-center">
					<h1>Welcome To Our Task Manager Portfolio</h1>
				</div>
				<div>
					<marquee behavior="scroll" direction="left">Welcome To Our Site. Hope You will get better feedback from us incase of any quiries. Please Contact Us at +91-9700288623/+91-9515639619</marquee>
				</div>
				<div>
					<img alt="Human Resources" src="/resources/images/human-resources.jpg" width="100%">
				</div>
				
				<div class="footer-bottom">
				<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="copyright">
					© 2017, India, All rights reserved
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

				<div class="design pull-right">
					   <span>Developed by Gyanaranjan</span>
				</div>
			</div>
		</div>
	</div>
			</div>
				
			</div>
		</c:when>
		<c:when test="${mode== 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table
						class="table table-striped table-borderd text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Created Date</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
									<td>${task.finished}</td>
									<td>
									<a href="update-task?id=${task.id}">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
									</td>
									<td>
									<a href="delete-task?id=${task.id}">
										<span class="glyphicon glyphicon-trash"></span>
									</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</c:when>
		<c:when test="${mode== 'MODE_NEW' || mode== 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}">
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-5">
							<input type="text" class="form-control" name="name"
								value="${task.name}" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-5">
							<input type="text" class="form-control" name="description"
								value="${task.description}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-5">
							<input type="radio" class="col-sm-1" name="finished" value="true" />
							<div class="col-md-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished"
								value="false" checked="checked"/>
							<div class="col-md-1">No</div>
						</div>
					</div>

					<div class="pull-right">
						<input type="reset" class="btn btn-secondary" value="Clear" onclick="taskClear('clear')"/>
						<input type="submit" class="btn btn-primary" value="Save" />

					</div>

				</form>
			</div>
		</c:when>

	</c:choose>



<script src="static/js/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>