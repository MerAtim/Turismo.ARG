package servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daos.LugarDao;
import entidades.Lugar;

@Service
public class LugarServicio {

	@Autowired
	private LugarDao repositorio;

	@Autowired
	public LugarServicio() {
		repositorio = new LugarDao();
	}

	public List<Lugar> obtenerLugares(Long limit) {
		return repositorio.obtenerTodosLosLugares(limit);
	}
}
