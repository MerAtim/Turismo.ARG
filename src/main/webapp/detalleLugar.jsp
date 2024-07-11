<%@page import="entidades.Lugar"%>
<%@page import="daos.LugarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idStr = request.getParameter("id");
	Long id = null;
	
	if (idStr != null && !idStr.isEmpty()) {
	id = Long.parseLong(idStr);
	}
	
	Lugar lugar = null;
	if(id!= null){
		LugarDao lugarDao = new LugarDao();
        lugar = lugarDao.obtenerLugarPorId(id);
	}else{
		lugar = new Lugar();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.0.7/css/boxicons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/detalle.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap" rel="stylesheet">
    <link rel="icon" type="image/svg+xml" href="/src/main/webapp/img/assets/montana.png">
    <script src="index.js"></script>
    <title>Detalle del lugar</title>
</head>
<body>
    
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom nav-size">
            <a class="navbar-brand" href="../cacturismo/index.jsp">
                <div class="logo">
                <img class="logoImg" src="./img/assets/IconImg.svg" alt="icono">
                    <span>C</span><span>A</span><span>C</span>
                    <span>-</span>
                    <span>T</span><span>u</span><span>r</span><span>i</span><span>s</span><span>m</span><span>o</span>
                </div>
            </a>
    
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> <!-- Este botón es la hamburguesa para desplegar un menú en dispositivos pequeños-->
    
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"> <!-- la clase active te resalta la clase que se encuentra activa. -->
                        <a class="nav-link pulse" href="#lugares">Lugares <span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pulse ml-lg-4 mr-lg-4" href="Register/register.html">Registrarse</a>
                    </li>
                    <li class="nav-item pulse">
                        <a href="login/login.html" class="btn btn-primary">Iniciar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <div class="seccion1" data-aos="zoom-in">
            <div class="info-contenedor">
                <img class="imagen-principal" src="data:image/jpeg;base64,<%=lugar.getImagen()%>" alt="" srcset="">
                    <div class="info">
                        <h2 class="titulo-lugar"><%=lugar.getNombre()%></h2>
                        <img src="img/detalle/PsFacebookPlaces.png" alt="" srcset="">
                        <p class="ubicacion"><%=lugar.getUbicacion()%></p>
                        <h3 class="descripcion">Descripción</h3>
                        <p class="texto-descripcion"><%=lugar.getDescripcion()%></p>
                    </div>
            </div>
        </div>

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
                            <a href=""><i class='bx bxl-whatsapp'></i></a>
                            <a href=""><i class='bx bxl-facebook-circle'></i></a>
                            <a href=""><i class='bx bxl-instagram'></i></a>
                            <a href=""><i class='bx bxl-twitter'></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>