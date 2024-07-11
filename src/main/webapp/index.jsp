<%@page import="java.util.List"%>
<%@page import="entidades.Lugar"%>
<%@page import="daos.LugarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="./css/footer.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="/src/main/webapp/img/assets/montana.png">
<script src="index.js"></script>
<title>CAC Turismo</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-custom nav-size">
			<a class="navbar-brand" href="#">
				<div class="logo">
					<img class="logoImg" src="./img/assets/IconImg.svg" alt="icono">
					<span>C</span><span>A</span><span>C</span> <span>-</span> <span>T</span><span>u</span><span>r</span><span>i</span><span>s</span><span>m</span><span>o</span>
				</div>
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Este botón es la hamburguesa para desplegar un menú en dispositivos pequeños-->

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<!-- la clase active te resalta la clase que se encuentra activa. -->
						<a class="nav-link pulse" href="#lugares">Lugares <span
							class="sr-only"></span></a>
					</li>
					<li class="nav-item"><a class="nav-link pulse ml-lg-4 mr-lg-4"
						href="Register/register.jsp">Registrarse</a></li>
					<li class="nav-item pulse"><a href="login/login.jsp"
						class="btn btn-primary">Iniciar sesión</a></li>
				</ul>
			</div>
		</nav>

	</header>

	<main>
		<section class="PageInicio">
			<div class="sectionInfo">
				<div class="tituloCac">
					<h1>
						Bienvenidos a <span class="highlight">CAC</span>-Turismo
					</h1>
					<img src="img/assets/IconImg.svg" alt="Icono">
				</div>

				<p class="parrafo"fade-up">
					Descubre los mejores destinos y vive experiencias inolvidables con
					<span class="highlight">CAC</span>-Turismo. Te ofrecemos una guía
					completa para que planifiques el viaje de tus sueños. Únete a
					nosotros y transforma cada destino en una aventura única.
				</p>

				<div data-aos="fade-up" class="btoInfo">
					<button onclick="location.href='#'" class="btn-info">
						<i class="fas fa-info-circle"></i> Más Información
					</button>
					<button onclick="location.href='#'" class="btn-register">
						<i class="fas fa-user-plus"></i> Registrarse
					</button>
				</div>
				<div data-aos="fade-up" class="sectionImg">
					<img class="imgDeTurismo" src="img/assets/bookable_crowd.webp"
						alt="Grupo de turistas">
				</div>
			</div>
		</section>

		<section class="services" id="services">
			<div class="services-container">
				<h2>Nuestros Servicios</h2>
				<div class="services-content">
					<div class="service-card">
						<img src="img/assets/planificar.svg" alt="Planificación de Viajes">
						<h3>Planificación de Viajes</h3>
						<p>Ofrecemos servicios personalizados de planificación de
							viajes, ayudándote a crear el itinerario perfecto adaptado a tus
							intereses y presupuesto.</p>
					</div>
					<div class="service-card">
						<img src="img/assets/guia.svg" alt="Guías Turísticas">
						<h3>Guías Turísticas</h3>
						<p>Contamos con guías turísticos expertos que te mostrarán los
							mejores lugares y te contarán historias fascinantes sobre cada
							destino.</p>
					</div>
					<div class="service-card">
						<img src="img/assets/actividades.svg"
							alt="Reservas de Actividades">
						<h3>Reservas de Actividades</h3>
						<p>Facilitamos la reserva de actividades y excursiones para
							que puedas disfrutar de una experiencia completa sin
							preocupaciones.</p>
					</div>
				</div>
			</div>
		</section>

		<section data-aos="fade-up" class="buscadorContenedor">
			<div class="buscador">
				<h2>Encuentra tu Próxima Aventura</h2>
			<form class="buscadorForm" id="searchForm">
			    <div class="inputGroup">
			        <input type="text" id="query" name="query" placeholder="Buscar destino o actividad" aria-label="Buscar">
			        <button type="submit">
			            <img src="img/assets/busqueda.svg" width="30px" height="30px" alt="">
			        </button>
			    </div>
			</form>
			<script>
			    document.getElementById('searchForm').addEventListener('submit', function(event) {
			        event.preventDefault();
			        let searchInput = document.getElementById('query').value.trim();
			        fetch('buscarLugares.jsp?search=' + encodeURIComponent(searchInput))
			            .then(response => response.text())
			            .then(data => {
			                document.getElementById('lugares').innerHTML = data;
			            })
			            .catch(error => console.error('Error al buscar lugares:', error));
			    });
			</script>
			</div>
		</section>
		
		<!-- SECCIÓN LUGARES -->
		
		<section class="seccion-lugar" id="lugares" data-aos="fade-up">
		    <%
		    LugarDao lugarDao = new LugarDao();
		    List<Lugar> lugares = lugarDao.obtenerTodosLosLugares(10L);
		    for (Lugar lugar : lugares) {
		    %>
		    <div class="lugar-Card">
		        <a href="detalleLugar.jsp?id=<%= lugar.getId() %>"> 
		            <img src="data:image/jpeg;base64,<%= lugar.getImagen() %>" alt="<%= lugar.getNombre() %>" srcset=""> 
		            <span class="lupa-icon">
		                <img src="/img/assets/search.svg" alt="<%= lugar.getNombre() %>">
		            </span>
		        </a>
		    </div>
		    <%
		    }
		    %>
		</section>

		<hr />

		<section class="Trends">
			<h1>Los más visitados</h1>
			<div class="section-trends">
				<div class="flex-trend">

					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/bosque-de-los-arrayanes.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Bosque de los Arrayanes</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/cabo-virgenes.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Cabo Vírgenes</h4>
						</a>
					</div>

					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/cataratas.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Cataratas de Iguazú</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/cerro-aconcagua.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Cerro Aconcagua</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/glaciar-perito-moreno.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Glaciar Perito Moreno</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/lago-argentino.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Lago Argentino</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/monte-fitz-roy.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Monte Fitz Roy</h4>
						</a>
					</div>
					<div class="lugar" data-aos="fade-up" data-aos-duration="3000">
						<a href="detalleLugar.html"> <img
							src="img/lugares/Parque-Nacional-El-Palmar.jpg" alt="" srcset="">
							<h4 class="nombre-lugar">Parque Nacional el Palmar</h4>
						</a>
					</div>
				</div>
			</div>
		</section>

	</main>

	<footer class="footer">
		<div class="container-footer">
			<div class="footer-row">

				<div class="footer-links">

					<h1>Compañia</h1>
					<ul>
						<li><a href="">Nosotros</a></li>
						<li><a href="">Nuestros Servicios</a></li>
						<li><a href="">Politica de privacidad</a></li>
					</ul>
				</div>

				<div class="footer-links">
					<h1>Ayuda</h1>
					<ul>
						<li><a href="">Preguntas Frecuentes</a></li>
						<li><a href="">Formas de Pago</a></li>
						<li><a href="">Secretaria de Turismo</a></li>
					</ul>
				</div>

				<div class="footer-links">
					<h1>Asistencia al Turista</h1>
					<ul>
						<li><a href="">Mail:infoturismo.gov.ar</a></li>
						<li><a href="">Telefono: +54 261 413-2135</a></li>
					</ul>
				</div>

				<div class="footer-links">
					<h1>Redes Sociales</h1>
					<div class="social-link">
						<a href=""><i class='bx bxl-whatsapp'></i></a> <a href=""><i
							class='bx bxl-facebook-circle'></i></a> <a href=""><i
							class='bx bxl-instagram'></i></a> <a href=""><i
							class='bx bxl-twitter'></i></a>
					</div>
				</div>
			</div>
		</div>
		<a href="#main" class="flechaArriba"> <img
			src="/img/assets/MaterialSymbolsArrowCircleUp.png"
			alt="ir arriba flecha">
		</a>
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>