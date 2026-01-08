<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment</title>
<style>
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 8px;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("img/login page.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

body {
	background: rgb(193, 197, 201);
}
</style>
<%@ include file="../components/cssTags.jsp"%>
<%@ include file="../components/navbar.jsp"%>
</head>
<body>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">Make Your Appointment</p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="Doctor Profile" src="img/appointment page.jpg"
					class="img-fluid rounded">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty ErrMsg}">
							<p class="fs-4 text-center text-danger">${ErrMsg}</p>
							<c:remove var="ErrMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="makeAppointment" method="post">
							<input type="hidden" name="userId" value="${userObj.id}">
							<div class="col-md-6">
								<label for="fullName" class="form-label">Full Name</label> <input
									type="text" id="name" class="form-control" required
									name="name">
							</div>
							<div class="col-md-6">
								<label for="gender" class="form-label">Gender</label> <select
									id="gender" class="form-control" required name="gender">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="text" id="age" class="form-control" required name="age">
							</div>
							<div class="col-md-6">
								<label for="appointDate" class="form-label">Appointment
									Date</label> <input type="date" id="appointDate" class="form-control"
									required name="appointDate">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" id="email" class="form-control" required
									name="email">
							</div>
							<div class="col-md-6">
								<label for="phnNo" class="form-label">Phone No</label> <input
									type="text" id="phnNo" class="form-control" required
									name="phnNo" maxlength="10">
							</div>
							<div class="col-md-6">
								<label for="disease" class="form-label">Treatment for</label> <input
									type="text" id="disease" class="form-control" required
									name="disease">
							</div>
							<div class="col-md-6">
								<label for="doct" class="form-label">Doctor</label> <select
									id="doct" class="form-control" required name="doct">
									<option value="" disabled selected>--select--</option>
									<!-- Dynamically populate doctor options -->
									<%
									DoctorDao dao = new DoctorDao(DbConnect.getConn());
										List<Doctor> list = dao.getAllDoctors();
										for(Doctor d:list){%>
									<option value="<%=d.getId()%>">
										<%=d.getFullName()%> (<%=d.getSpecialisation()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label for="address" class="form-label">Full Address</label>
								<textarea id="address" required name="address"
									class="form-control" rows="3"></textarea>
							</div>
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-success">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
