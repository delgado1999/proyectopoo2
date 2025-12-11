<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="beans.TipoPersona" %>
<%
    TipoPersona tipo = (TipoPersona) request.getAttribute("tipo");
    if (tipo == null) {
        response.sendRedirect(request.getContextPath() + "/TipoPersonaController?op=listar");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Tipo Persona</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">✏️ Editar Tipo de Persona</h2>

    <!-- Mensaje de feedback -->
    <% 
        String mensaje = (String) session.getAttribute("mensaje");
        if (mensaje != null) { 
    %>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= mensaje %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% 
            session.removeAttribute("mensaje"); // Limpiar mensaje
        } 
    %>

    <!-- Formulario -->
    <form action="<%= request.getContextPath() %>/TipoPersonaController" method="post">
        <input type="hidden" name="op" value="modificar">
        <input type="hidden" name="id" value="<%= tipo.getId() %>">

        <div class="mb-3">
            <label class="form-label">Nombre del Tipo:</label>
            <input type="text" name="nombre" class="form-control" required value="<%= tipo.getNombre() %>" autofocus>
        </div>

        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        <a href="<%= request.getContextPath() %>/TipoPersonaController?op=listar" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

