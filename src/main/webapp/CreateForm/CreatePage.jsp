<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
    <link href="CreatePage.css" rel="stylesheet" />
    <link rel="./login/login.html" href="" />
    <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
    <title>Create</title>
  </head>
  <body>
    <main>
      <section>
        <h1>Formulario de Creación de Turismo</h1>
        <form action="${pageContext.request.contextPath}/NuevoLugar" method="post" enctype="multipart/form-data">
            <h2>Información General</h2>
            <label>Nombre del destino turístico:</label>
            <input type="text" id="nombre" name="nombre" required>
    
            <label>Descripción:</label>
            <textarea id="descripcion" name="descripcion" required></textarea>
    
            <label>Ubicación:</label>
            <input type="text" id="ubicacion" name="ubicacion" required>
            <label>Categoría:</label>
            <select id="categoria" name="categoria">
                <option value="playa">Playa</option>
                <option value="montana">Montaña</option>
                <option value="ciudad">Ciudad</option>
                <option value="aventura">Aventura</option>
            </select>
            <label for="">Imagen del lugar:</label>
            <input type="file" id="imagen" name="imagen">
            <button type="submit">Enviar</button>
        </form>
        <button type="button" onClick="history.back()">Volver atrás</button>
    </section>
    </main>

  </body>
</html>
