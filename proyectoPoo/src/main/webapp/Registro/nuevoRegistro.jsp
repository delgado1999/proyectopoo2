<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="beans.Habitacion"%>
<%@ page import="beans.Persona"%>
<%@ page import="beans.TipoPersona"%>
<%@ page import="beans.Administrador"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Registro</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
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

.habitacion-btn {
	width: 100%;
	padding: 10px;
	background: #5c4de2;
	color: white;
	border: none;
	border-radius: 10px;
	margin-bottom: 15px;
	cursor: pointer;
}

/* Tarjeta de habitaciones */
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

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>

</head>
<body>

	<div class="card-form">

		<h2 class="mb-3">Nuevo Registro</h2>

		<form action="RegistroController" method="post">

			<input type="hidden" name="op" value="insertar">
			<!-- ADMINISTRADOR -->
			<label>Administrador</label> <select class="form-control mb-2"
				name="idadministrador" required>
				<option value="">Seleccione...</option>
				<%
				List<Administrador> listaA = (List<Administrador>) request.getAttribute("listarAdministrador");
				if (listaA != null) {
					for (Administrador a : listaA) {
				%>
				<option value="<%=a.getId()%>"><%=a.getNombre()%></option>
				<%
				}
				}
				%>
			</select>

			<!-- PERSONA -->
			<label>Persona</label> <select class="form-control mb-2"
				name="idpersona" required>
				<option value="">Seleccione...</option>
				<%
				List<Persona> listaP = (List<Persona>) request.getAttribute("listarPersona");
				if (listaP != null) {
					for (Persona p : listaP) {
				%>
				<option value="<%=p.getIdpersona()%>"><%=p.getNombres()%>
				</option>
				<%
				}
				}
				%>
			</select>

			<!-- TIPO PERSONA -->
			<label>Tipo Persona</label> <select class="form-control mb-2"
				name="idtipo_persona" required>
				<option value="">Seleccione...</option>
				<%
				List<TipoPersona> listaTP = (List<TipoPersona>) request.getAttribute("listarTipoPersona");
				if (listaTP != null) {
					for (TipoPersona tp : listaTP) {
				%>
				<option value="<%=tp.getId()%>"><%=tp.getNombre()%></option>
				<%
				}
				}
				%>
			</select> <label>Habitación</label>
			<button type="button" class="habitacion-btn" data-bs-toggle="modal"
				data-bs-target="#modalHabitaciones">Seleccionar Habitación
			</button>

			<input class="form-control mb-2" type="text" name="idhabitacion"
				id="idhabitacion" readonly required> <label>Fecha
				Inicio</label> <input class="form-control mb-2" type="date"
				name="fechaInicio" required> <label>Fecha Fin</label> <input
				class="form-control mb-2" type="date" name="fechaFin" required>

			<label>Estado</label> <select class="form-control mb-3" name="estado"
				required>
				<option value="ACTIVO">Activo</option>
				<option value="INACTIVO">Inactivo</option>
			</select>

			<button class="btn btn-primary w-100" type="submit">Guardar
				Registro</button>
		</form>

	</div>



	<!-- ========== MODAL HABITACIONES ========== -->
	<div class="modal fade" id="modalHabitaciones" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Seleccionar Habitación</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body d-flex flex-wrap justify-content-center">

					<%
					List<Habitacion> listaH = (List<Habitacion>) request.getAttribute("listarHabitacion");
					if (listaH != null) {
						for (Habitacion h : listaH) {
							String color = h.getEstado().equalsIgnoreCase("ACTIVO") ? "#41d151" : "#ff4e4e";
					%>

					<div class="card-habitacion" id="hab-<%=h.getId()%>"
						onclick="seleccionarHabitacion(<%=h.getId()%>)">

						<div class="estado-dot" style="background:<%=color%>;"></div>

						<h4>
							Hab.
							<%=h.getnHabitacion()%></h4>
						<p>
							Piso
							<%=h.getnPiso()%></p>
						<p><%=h.getEstado()%></p>
					</div>

					<%
					}
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

