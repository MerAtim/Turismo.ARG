<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <link rel="./login/login.html" href="">
    <link rel="/index.html" href="">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/svg+xml" href="/img/assets/IconImg.svg">
</head>

<body>
    <div class="container">
        <div class="cont-welcome">
            <img src="../img/assets/IconImg.svg" alt="">
            <a href="../login/login.jsp">
                <button>Iniciar Sesion</button>
            </a>
        </div>
        <div class="content-form">
            <h1>Crea una cuenta</h1>
            <div class="icons-form">
                <i class='bx bxl-facebook'></i>
                <i class='bx bxl-google'></i>
                <i class='bx bx-envelope'></i>
            </div>
            <form class="info-form" id="registerForm">
                <label for="">
                    <i class='bx bx-user'></i>
                    <div>
                        <input type="text" placeholder="Nombre" id="nombre">
                        <div id="nombreError" class="error-box"></div>
                    </div>
                </label>
                
                <label for="">
                    <i class='bx bxs-user'></i>
                    <div>
                        <input type="text" placeholder="Apellido" id="apellido">
                        <div id="apellidoError" class="error-box"></div>
                    </div>
                </label>

                <label for="">
                    <i class='bx bxs-envelope'></i>
                    <div>
                        <input type="text" placeholder="Email" id="email">
                        <div id="emailError" class="error-box"></div>
                    </div>
                </label>

                <label for="">
                    <i class='bx bx-lock-alt'></i>
                    <div>
                        <input type="password" placeholder="Contraseña" id="password">
                        <div id="passwordError" class="error-box"></div>
                    </div>
                </label>

                <label for="">
                    <i class='bx bxs-lock-alt'></i>
                    <div>
                        <input type="password" placeholder="Confirmar Contraseña" id="confirmar">
                        <div id="confirmarError" class="error-box"></div>
                    </div>
                </label>
                <div class="confirmar-form">
                    <input type="checkbox" placeholder="" id="terminos">
                    <p>Acepta los terminos y condiciones</p>
                </div>
                <div id="terminosError" class="error-checkbox"></div>
                <button type="submit">Registrarse</button>
            </form>
        </div>
    </div>
    <div class="Inicio">
        <a href="../index.jsp">
            <img src="../img/assets/back.svg" alt="">
        </a>
    </div>
    <script src="register.js"></script>
</body>
</html>