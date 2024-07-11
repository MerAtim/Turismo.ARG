package daos;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import entidades.Lugar;

public class LugarDao {

	private final String jdbcUrl = "jdbc:mysql://localhost:3306/turismo.arg";
	private final String usuario = "root";
	private final String contraseña = "";

	// Método para obtener una conexión a la base de datos
	private Connection obtenerConexion() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(jdbcUrl, usuario, contraseña);
	}

	// Método para insertar un nuevo lugar
	public void insertarLugar(Lugar lugar) {
		try (Connection conn = obtenerConexion();
				PreparedStatement stmt = conn.prepareStatement(
						"INSERT INTO lugares (nombre, descripcion, ubicacion, categoria, imagen) VALUES (?, ?, ?, ?, ?)")) {
			stmt.setString(1, lugar.getNombre());
			stmt.setString(2, lugar.getDescripcion());
			stmt.setString(3, lugar.getUbicacion());
			stmt.setString(4, lugar.getCategoria());
			stmt.setBytes(5, lugar.getImagenBytes());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Método para obtener un lugar por su ID
	public Lugar obtenerLugarPorId(Long id) {
		try (Connection conn = obtenerConexion();
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM lugares WHERE id = ?")) {
			stmt.setLong(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return mapearLugar(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Método para obtener todos los lugares
	public List<Lugar> obtenerTodosLosLugares(Long limit) {
		List<Lugar> lugares = new ArrayList<>();

		var query = "SELECT * FROM lugares";
		if (limit != null) {
			query += " limit " + limit;
		}
		try (Connection conn = obtenerConexion();
				PreparedStatement stmt = conn.prepareStatement(query);
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				lugares.add(mapearLugar(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lugares;
	}

	public List<Lugar> buscarLugares(String query, String tipo, String duracion) {
		List<Lugar> lugares = new ArrayList<>();
		String sql = "SELECT * FROM lugares WHERE (? IS NULL OR nombre LIKE ?)";

		try (Connection conn = obtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, query);
			stmt.setString(2, query != null ? "%" + query + "%" : null);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Lugar lugar = mapearLugar(rs);
					lugares.add(lugar);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lugares;
	}

	// Método para buscar lugares por nombre
	public List<Lugar> buscarLugaresPorNombre(String nombre) {
		List<Lugar> lugares = new ArrayList<>();
		String sql = "SELECT * FROM lugares WHERE nombre LIKE ?"; // Consulta para buscar por nombre

		try (Connection conn = obtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, "%" + nombre + "%"); // Usamos % para permitir coincidencias parciales

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					lugares.add(mapearLugar(rs));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lugares;
	}

	// Método para mapear una fila del ResultSet a un objeto Lugar
	private Lugar mapearLugar(ResultSet rs) throws SQLException {
		Lugar lugar = new Lugar();
		lugar.setId(rs.getLong("id"));
		lugar.setNombre(rs.getString("nombre"));
		lugar.setDescripcion(rs.getString("descripcion"));
		lugar.setUbicacion(rs.getString("ubicacion"));
		lugar.setCategoria(rs.getString("categoria"));
		try {
			lugar.setImagen(convertirBlobAString(rs.getBlob("imagen")));
		} catch (SQLException e) {
			lugar.setImagen("");
		} catch (IOException e) {
			lugar.setImagen("");
		}

		return lugar;
	}

	private String convertirBlobAString(Blob blob) throws SQLException, IOException {
		byte[] bytes = blob.getBytes(1, (int) blob.length());
		return Base64.getEncoder().encodeToString(bytes);
	}
}