<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Habitacion" %>

<div class="modal fade" id="modalHabitacion" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Seleccionar Habitación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <div class="habitaciones-grid">

          <%
              List<Habitacion> list = (List<Habitacion>) request.getAttribute("listarHabitacion");
              for (Habitacion h : list) {
                  String color = h.getEstado().equalsIgnoreCase("ACTIVO") ? "#41d151" : "#ff4e4e";
          %>

          <div class="card-habitacion"
               onclick="seleccionarHabitacion(<%= h.getId() %>)"
               id="hab-<%= h.getId() %>">

            <div class="estado-dot" style="background:<%= color %>;"></div>

            <h4>Hab. <%= h.getnHabitacion() %></h4>
            <p>Piso: <%= h.getnPiso() %></p>
            <p><%= h.getEstado() %></p>
          </div>

          <% } %>

        </div>

      </div>

    </div>
  </div>
</div>

