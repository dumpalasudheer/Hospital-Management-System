<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.dao.UserDao"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Overview</title>
<%@ include file="../components/cssTags.jsp"%>
<%@ include file="navbar.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
	background-color: #f9f9f9;
	border-radius: 8px;
	padding: 20px;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("../img/login page.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

body {
	background: rgb(193, 197, 201);
}

.table-responsive {
	padding: 10px;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle;
}

.table th {
	background-color: #e9ecef;
}

.btn-warning {
	color: white;
	font-weight: bold;
	text-transform: uppercase;
}
</style>
</head>
<body>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">Patient overview</p>
	</div>
	<div class="container-fluid p-3">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Patient Data</p>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">Id</th>
										<th scope="col">User Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email</th>
										<th scope="col">Gender</th>
										<th scope="col">Appointment Date</th>
										<th scope="col">Treatment For</th>
										<th scope="col">Doctor Name</th>
										<th scope="col">Phone No</th>
										<th scope="col">Address</th>
									</tr>
								</thead>
								<tbody>
									<%
									AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
									List<Appointment> lst = dao.getAllPatients();

									for (Appointment apt : lst) {
										List<Doctor> docList = dao.getDoctNamebyDoctId(apt.getId());
										String doctorName = docList.isEmpty() ? "Unknown" : docList.get(0).getFullName();
									%>
									<tr>
										<td><%=apt.getId()%></td>
										<td><%=apt.getUserId()%></td>
										<td><%=apt.getName()%></td>
										<td><%=apt.getEmail()%></td>
										<td><%=apt.getGender()%></td>
										<td><%=apt.getAppointDate()%></td>
										<td><%=apt.getDisease()%></td>
										<td><%=doctorName%></td>
										<td><%=apt.getPhnNno()%></td>
										<td><%=apt.getAddress()%></td>
									</tr>
									<%
									}
									%>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
