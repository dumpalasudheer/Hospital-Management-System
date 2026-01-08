<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/cssTags.jsp"%>
<title>Admin Dashboard</title>
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

	<c:if test="${empty AdminObj }">
		<c:redirect url="../Admin.jsp"></c:redirect>
	</c:if>
	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<div class="row">
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-briefcase-medical fa-3x"></i><br>
						<P class="fs-4 text-center text-dark">
							<a class="nav-link active" href="doctor.jsp">Add/View Doctors</a>
						</P>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user fa-3x"></i><br>
						<P class="fs-4 text-center text-dark">
							<a class="nav-link active" href="viewAllUsers.jsp">user's</a>
						</P>
					</div>
				</div>
			</div>
			<div class="col-md-6 mt-3">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<P class="fs-4 text-center text-dark">
							<a class="nav-link active" href="viewAllAppointments.jsp">Appointments</a>
						</P>
					</div>
				</div>
			</div>
			<div class="col-md-6 mt-3">
				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal" style="min-height: 150px;">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<P class="fs-4 text-center text-dark">
							<c:if test="${not empty sessionScope.succMsg}">
								<p class="text-center">${sessionScope.succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty sessionScope.ErrMsg}">
								<p class="text-center text-danger fs-4">${sessionScope.ErrMsg}</p>
								<c:remove var="ErrMsg" scope="session" />
							</c:if>
							<h4 class="text-center text-primary nav-link active">Add Specialist</h4>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form action="../addSpecialist">
						<div class="modal-header ms-2">
							<label>Specialist:</label> <input type="text" name="specName"
								class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>