<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="stylesLogin.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/svg+xml" href="/src/main/webapp/img/assets/montana.png">
    <link rel="./../index.html" href="">
    <title>Inicio de Sesion</title>
</head>
<body>
    <div class="container">
        <div class="cont-welcome">
            <img src="../img/assets/IconImg.svg" alt="">
            <a href="../Register/register.jsp">
                <button>Registrarse</button>
            </a>
        </div>

        <div class="content-form">
            <div class="Iniciar-sesion">
                <h1>Iniciar Sesion</h1>
                <div class="icons-form">
                    <i class='bx bxl-facebook'></i>
                    <i class='bx bxl-google'></i>
                    <i class='bx bx-envelope'></i>
                </div>
                <form class="info-form">
                    <label for="">
                    <i class='bx bxs-envelope' ></i>
                    <input type="email" placeholder="Email">
                </label>
                
                <label for="">
                    <i class='bx bx-lock-alt'></i>
                    <input type="password" placeholder="Contraseña">
                </label>
                </form>
                <a class="ayuda">¿Necesitas Ayuda?</a>
                <button class="buttonConfirm">Iniciar Sesion</button>
            </div>
        </div>
    </div>
    <div class="Inicio">
        <a href="../index.jsp">
            <img src="../img/assets/back.svg" alt="">
        </a>
    </div>
</body>
</html>