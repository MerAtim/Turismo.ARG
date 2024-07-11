package controladores;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Component;

import daos.LugarDao;
import entidades.Lugar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@WebServlet("/BuscarLugarServlet")
@Component
@Slf4j
public class LugaresControlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LugaresControlador() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String query = request.getParameter("query");
		String tipo = request.getParameter("tipo");
		String duracion = request.getParameter("duracion");

		LugarDao lugarDao = new LugarDao();
		List<Lugar> lugares = lugarDao.buscarLugares(query, tipo, duracion);

		request.setAttribute("lugares", lugares);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
