package controladores;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.stereotype.Component;

import daos.LugarDao;
import entidades.Lugar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@WebServlet("/NuevoLugar")
@Component
@Slf4j
@NoArgsConstructor
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, // 2MB
maxRequestSize = 1024 * 1024 * 4) // 4MB
public class NuevoLugarControlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private LugarDao lugarDao = new LugarDao();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			// Obtener parámetros del formulario
			String nombre = request.getParameter("nombre");
			String descripcion = request.getParameter("descripcion");
			String ubicacion = request.getParameter("ubicacion");
			String categoria = request.getParameter("categoria");
			
			 // Obtener la parte del archivo
            Part filePart = request.getPart("imagen");

         // Convertir InputStream del archivo a byte[]
            InputStream inputStream = filePart.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            byte[] imagenBytes = outputStream.toByteArray();

            // Cerrar streams
            outputStream.close();
            inputStream.close();

			// Crear un objeto Lugar con los datos recibidos
			Lugar nuevoLugar = new Lugar();
			nuevoLugar.setNombre(nombre);
			nuevoLugar.setDescripcion(descripcion);
			nuevoLugar.setUbicacion(ubicacion);
			nuevoLugar.setCategoria(categoria);
			nuevoLugar.setImagenBytes(imagenBytes);

			// Guardar el nuevo lugar en la base de datos
			lugarDao.insertarLugar(nuevoLugar);

			// Redirigir a una página de éxito o mostrar un mensaje de confirmación
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} catch (Exception e) {
			log.error("Error al procesar la solicitud", e);
			// Redirigir a una página de error o mostrar un mensaje de error
//			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}
}