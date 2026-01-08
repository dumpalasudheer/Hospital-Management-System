<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@ include file="components/cssTags.jsp"%>
<style>
body {
	background: url('img/login page.jpg') no-repeat center center fixed;
	background-size: cover;
}

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.login-container {
	margin-top: 80px; /* Moves the login tab down */
	margin-bottom: 50px; /* Moves the login tab up if needed */
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container p-5 login-container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">user login</p>

						<c:if test="${not empty sessionScope.ErrMsg}">
							<p class="text-center text-danger fs-5">${sessionScope.ErrMsg}</p>
							<c:remove var="ErrMsg" scope="session" />
						</c:if>
						<form action="userLogin" method="post">
							<div class="mb=3">
								<label class="form-label">Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						<br> Don't have an account? <a href="sign up.jsp"
							class="text-decoration-none">create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>