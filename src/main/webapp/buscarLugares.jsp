<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="daos.LugarDao, entidades.Lugar" %>
<%
    String search = request.getParameter("search");
    LugarDao lugarDao = new LugarDao();
    List<Lugar> lugares = new ArrayList<>();

    if (search != null && !search.isEmpty()) {
        lugares = lugarDao.buscarLugaresPorNombre(search);
    } else {
        lugares = lugarDao.obtenerTodosLosLugares(10L); // Obtener por defecto si no hay búsqueda
    }
%>

<%
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
