<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="beans.Habitacion"%>
<%@ page import="beans.Persona"%>
<%@ page import="beans.TipoPersona"%>
<%@ page import="beans.Registro"%>
List<Habitacion> listaH = (List<Habitacion>) request.getAttribute("listarHabitacion");


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Registro</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
.bloque-piso {
  width: 100%;
  background: #f4f6f9;
  border-radius: 14px;
  padding: 15px;
  margin-bottom: 25px;
}

.titulo-piso {
  font-weight: bold;
  margin-bottom: 15px;
  padding-left: 10px;
  border-left: 5px solid #5c4de2;
  color: #5c4de2;
}

.habitaciones-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

body {
	font-family: "Poppins", sans-serif;
	background: linear-gradient(135deg, #d7ecff, #e8d9ff);
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.card-form {
	width: 420px;
	background: #ffffff;
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 15px 35px rgba(80, 100, 180, 0.25);
	animation: fadeIn 1s ease both;
}

.selected {
	border: 3px solid #5c4de2 !important;
	box-shadow: 0 0 12px rgba(92, 77, 226, 0.5);
}

.card-habitacion {
	width: 170px;
	background: white;
	padding: 15px;
	border-radius: 14px;
	border: 2px solid #ddd;
	text-align: center;
	margin: 8px;
	cursor: pointer;
	transition: 0.3s;
	position: relative;
}

.card-habitacion:hover {
	transform: scale(1.06);
	border-color: #7b6dff;
}

.estado-dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	position: absolute;
	top: 10px;
	right: 10px;
}

.selected {
	border: 3px solid #5c4de2 !important;
	box-shadow: 0 0 12px rgba(92, 77, 226, 0.5);
}
</style>

</head>
<body>

	<div class="card-form">

		<h2 class="mb-3">Editar Registro</h2>

		<%
		Registro r = (Registro) request.getAttribute("registro");
		List<Persona> listaP = (List<Persona>) request.getAttribute("listarPersona");
		List<TipoPersona> listaTP = (List<TipoPersona>) request.getAttribute("listarTipoPersona");
		List<Habitacion> listaH = (List<Habitacion>) request.getAttribute("listarHabitacion");
		%>

		<form action="RegistroController" method="post">
			<input type="hidden" name="op" value="modificar"> <input
				type="hidden" name="idregistro" value="<%=r.getIdregistro()%>">

			<!-- PERSONA -->
			<label>Persona</label> <select class="form-control mb-2"
				name="idpersona" id="personaSelect" required>

				<option value="">Seleccione...</option>

				<%
				for (Persona p : listaP) {
				%>
				<option value="<%=p.getIdpersona()%>"
					data-idtipo="<%=p.getIdtipo()%>"
					<%=(p.getIdpersona() == r.getIdpersona()) ? "selected" : ""%>>
					<%=p.getNombres()%>
				</option>
				<%
				}
				%>

			</select>


			<!-- TIPO PERSONA -->
			<label>Tipo Persona</label> <select class="form-control mb-2"
				name="idtipo_persona" id="tipoPersonaSelect" required>

				<option value="">Seleccione...</option>

				<%
				for (TipoPersona tp : listaTP) {
				%>
				<option value="<%=tp.getId()%>">
					<%=tp.getNombre()%>
				</option>
				<%
				}
				%>

			</select>


			<!-- HABITACIÓN -->
			<label>Habitación</label>
			<button type="button" class="btn btn-secondary mb-2"
				data-bs-toggle="modal" data-bs-target="#modalHabitaciones">
				Cambiar Habitación</button>

			<input class="form-control mb-2" type="text" name="idhabitacion"
				id="idhabitacion" readonly required value="<%=r.getIdhabitacion()%>">

			<!-- FECHAS -->
			<label>Fecha Inicio</label> <input class="form-control mb-2"
				type="date" name="fechaInicio" required
				value="<%=r.getFechaInicio()%>"> <label>Fecha Fin</label> <input
				class="form-control mb-2" type="date" name="fechaFin" required
				value="<%=r.getFechaFin()%>">

			<!-- ESTADO -->
			<label>Estado</label> <select class="form-control mb-3" name="estado"
				required>
				<option value="ACTIVO"
					<%=r.getEstado().equalsIgnoreCase("ACTIVO") ? "selected" : ""%>>Activo</option>
				<option value="INACTIVO"
					<%=r.getEstado().equalsIgnoreCase("INACTIVO") ? "selected" : ""%>>Inactivo</option>
			</select>

			<button class="btn btn-primary w-100" type="submit">Guardar
				Cambios</button>

		</form>
	</div>


	<!-- ========== MODAL HABITACIONES ========== -->
	<div class="modal fade" id="modalHabitaciones" tabindex="-1">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Seleccionar Habitación</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">

					<%
					int pisoActual = -1;

					if (listaH != null) {
						for (Habitacion h : listaH) {

							if (h.getnPiso() != pisoActual) {

						if (pisoActual != -1) {
					%>
				</div>
			</div>
			<%
			}

			pisoActual = h.getnPiso();
			%>

			<div class="bloque-piso">
				<h4 class="titulo-piso">
					Piso
					<%=pisoActual%></h4>

				<div class="habitaciones-grid">
					<%
					}

					String color = h.getEstado().equalsIgnoreCase("ACTIVO") ? "#41d151" : "#ff4e4e";
					%>

					<div class="card-habitacion" id="hab-<%=h.getId()%>"
						onclick="seleccionarHabitacion(<%=h.getId()%>)">

						<div class="estado-dot" style="background:<%=color%>;"></div>

						<h4>
							Hab.
							<%=h.getnHabitacion()%></h4>
						<p><%=h.getEstado()%></p>
					</div>

					<%
					}
					}

					if (pisoActual != -1) {
					%>
				</div>
			</div>
			<%
			}
			%>

		</div>

	</div>
	</div>
	</div>

	<script>
        function seleccionarHabitacion(idHab) {
            document.querySelectorAll(".card-habitacion").forEach(c => c.classList.remove("selected"));
            document.getElementById("hab-" + idHab).classList.add("selected");
            document.getElementById("idhabitacion").value = idHab;
            bootstrap.Modal.getInstance(document.getElementById("modalHabitaciones")).hide();
        }
    </script>
	<script>
function sincronizarTipo() {
    let personaSelect = document.getElementById("personaSelect");
    let tipoSelect = document.getElementById("tipoPersonaSelect");

    if (!personaSelect || !tipoSelect) return;

    let option = personaSelect.options[personaSelect.selectedIndex];
    let idTipo = option.getAttribute("data-idtipo");

    if (idTipo) {
        tipoSelect.value = idTipo;
    } else {
        tipoSelect.value = "";
    }
}

// cuando cambia la persona
document.getElementById("personaSelect")
    .addEventListener("change", sincronizarTipo);

// cuando carga el EDITAR
window.addEventListener("load", sincronizarTipo);
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
