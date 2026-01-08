<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.* ,com.db.DbConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediSuite</title>
<%@ include file="components/cssTags.jsp"%>

<style type="text/css">
body {
	background-color: rgb(221, 229, 240);
}
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	background: rgb(193, 197, 201);
}

.custom-card-body {
	padding: 10px;
}

h5 {
	font-weight: bold;
	color: black;
}

.carousel-fade .carousel-item {
	transition: opacity 1.5s ease-in-out;
	opacity: 0;
}

.carousel-fade .carousel-item.active {
	transition: opacity 1.5s ease-in;
	opacity: 1;
}

.carousel-inner {
	position: relative;
	overflow: hidden;
}
</style>
</head>
<body>

	<%@ include file="components/navbar.jsp"%>
	<script>
		const carousel = document.querySelector('#carouselExampleCaptions');
		const carouselInstance = new bootstrap.Carousel(carousel, {
			interval : 5000,
			ride : 'carousel'
		});
	</script>

	<div id="carouselExampleCaptions" class="carousel slide carousel-fade"
		data-bs-ride="carousel" data-bs-interval="3000">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/image11.jpg" class="d-block w-100"
					alt="Hospital staff image" height="550px">
				<div class="carousel-caption d-none d-md-block">
					<h5>TOP CLASS DOCTORS</h5>
					<p style = "color:black;">We have some of the top-class doctors in the world.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/image2.jpg" class="d-block w-100"
					alt="Hospital staff image" height="550px">
				<div class="carousel-caption d-none d-md-block">
					<h5>COLLABORATION WITH TOP DOCTORS</h5>
					<p style = "color:black;">We collaborate with the best doctors for efficient
						treatment.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/image3.jpg" class="d-block w-100"
					alt="Hospital staff image" height="550px">
				<div class="carousel-caption d-none d-md-block">
					<h5>CAREFUL TREATMENT</h5>
					<p style = "color:black;">We treat our patients with utmost care.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">
			<i><b>Key Features</b></i>
		</p>

		<div class="row">
			<div class="col-md-8 p-4">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">100% Safety</p>
								<p>Comprehensive care for every patient, from accurate
									diagnosis to effective treatment and complete recovery.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 md-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">24/7 Availability</p>
								<p>Round-the-clock care for your peace of mind, ensuring
									immediate attention to your needs.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Clean Environment</p>
								<p>A meticulously maintained, hygienic, and safe space for
									healing, prioritizing patient comfort and well-being.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-3">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4">Friendly Doctors</p>
								<p>Compassionate experts dedicated to your well-being,
									providing personalized care with empathy and understanding.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-2" style="margin-top: 25px;">
				<img alt="" src="img/doc profile.jpg" width="450px" height="355px">
			</div>


		</div>
	</div>

	<hr>
	<div class="container p-2">
		<p class="text-center fs-2 ">Our team</p>

		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center custom-card-body">
						<img src="img/doc1.png" width="240px" height="300px">
						<p class="fw-bold fs-5">Maisie Williams</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center custom-card-body">
						<img src="img/doc2.png" width="240px" height="300px">
						<p class="fw-bold fs-5">Emilia Clarke</p>
						<p class="fs-7">(Managing Director)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center custom-card-body">
						<img src="img/doc3.jpg" width="240px" height="300px">
						<p class="fw-bold fs-5">Jake Paul</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center custom-card-body">
						<img src="img/doc4.png" width="240px" height="300px">
						<p class="fw-bold fs-5">Sophie Turner</p>
						<p class="fs-15">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="components/footer.jsp"%>
</body>
</html>