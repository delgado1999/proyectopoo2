<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="beans.Persona"%>

<%
    Persona persona = (Persona) request.getAttribute("persona");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Persona</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">✏ Editar Persona</h2>

    <form action="personaController" method="post">
        <input type="hidden" name="op" value="modificar">
        <input type="hidden" name="idpersona" value="<%=persona.getIdpersona()%>">

        <div class="mb-3">
            <label class="form-label">DNI:</label>
            <input type="text" name="dni" value="<%=persona.getDni()%>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Nombres:</label>
            <input type="text" name="nombres" value="<%=persona.getNombres()%>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Apellidos:</label>
            <input type="text" name="apellidos" value="<%=persona.getApellidos()%>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Teléfono:</label>
            <input type="text" name="telefono" value="<%=persona.getTelefono()%>" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo:</label>
            <select name="idtipo" class="form-select">
                <option value="1" <%= persona.getIdtipo()==1 ? "selected" : "" %>>Cliente</option>
                <option value="2" <%= persona.getIdtipo()==2 ? "selected" : "" %>>Empleado</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <select name="estado" class="form-select">
                <option value="Activo" <%= "Activo".equals(persona.getEstado()) ? "selected" : "" %>>Activo</option>
                <option value="Inactivo" <%= "Inactivo".equals(persona.getEstado()) ? "selected" : "" %>>Inactivo</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        <a href="personaController?op=listar" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

</body>
</html>
