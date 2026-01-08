<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/cssTags.jsp"%>
<title>Doctor Info</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	background: rgb(193, 197, 201);
}

body {
	background-color: rgb(221, 229, 240);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid mt-4">
		<div class="row">
			<!-- Card for Adding Doctor -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty ErrMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="ErrMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialisation" required class="form-control">
									<option>--select--</option>
									<%
									SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="text" required name="mobileNo" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Table for Doctor Details -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty ErrMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="ErrMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Password</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctors();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%= d.getFullName()%></td>
									<td><%= d.getQualification()%></td>
									<td><%= d.getSpecialisation()%></td>
									<td><%= d.getEmail()%></td>
									<td><%= d.getMobileNo()%></td>
									<td><%= d.getPassword()%></td>
									<td><a href= "editDocDetails.jsp?id=<%= d.getId() %>"  class = "btn btn-sm btn-primary">Edit</a>
									<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">delete</a>
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

</body>
</html>