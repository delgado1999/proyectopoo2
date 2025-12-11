<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="beans.TipoPersona"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Lista de Tipos de Persona</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #d7ecff, #e8d9ff);
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #5a4bd1;
        font-size: 32px;
        margin-bottom: 25px;
        animation: fadeIn 0.7s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .btn-new {
        display: inline-block;
        background: #7b6dff;
        color: #fff;
        padding: 12px 22px;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
        margin-left: 30px;
    }

    .btn-new:hover {
        background: #5c4de2;
        transform: scale(1.05);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(100, 100, 150, 0.2);
        animation: fadeIn 0.8s ease;
    }

    th {
        background: #7b6dff;
        color: white;
        padding: 14px;
        font-size: 16px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    tr:hover {
        background: #f3efff;
        transition: 0.3s;
    }

    .btn {
        padding: 7px 14px;
        border-radius: 8px;
        color: white;
        font-weight: 600;
        text-decoration: none;
        transition: 0.3s;
    }

    .edit { background: #00a2ff; }
    .edit:hover { background: #007acc; transform: scale(1.05); }

    .delete { background: #ff4d6d; }
    .delete:hover { background: #d93c59; transform: scale(1.05); }

    .empty {
        text-align: center;
        padding: 20px;
        color: #6b6a9f;
        font-size: 16px;
        font-weight: 600;
    }
</style>

</head>
<body>

<%
String url = "http://localhost:8080/proyectoPoo/";
%>

<a href="<%=url%>TipoPersonaController?op=nuevo" class="btn-new">➕ Nuevo Tipo de Persona</a>

<h2>📘 Lista de Tipos de Persona</h2>

<div class="container">

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Operaciones</th>
        </tr>
    </thead>

    <tbody>
    <%
        List<TipoPersona> tipos = (List<TipoPersona>) request.getAttribute("listarTipoPersona");

        if (tipos != null && !tipos.isEmpty()) {
            for (TipoPersona tp : tipos) {
    %>

        <tr>
            <td><%=tp.getId()%></td>
            <td><%=tp.getNombre()%></td>

            <td>
                <a href="<%=url%>TipoPersonaController?op=obtener&id=<%=tp.getId()%>"
                   class="btn edit">Editar</a>

                <a href="#" onclick="confirmarEliminar(<%=tp.getId()%>)" class="btn delete">Eliminar</a>
                
            </td>
        </tr>

    <%
            }
        } else {
    %>

        <tr>
            <td colspan="3" class="empty">No hay tipos registrados</td>
        </tr>

    <%
        }
    %>
    </tbody>
</table>

</div>

</body>
<script>
function confirmarEliminar(id) {
    Swal.fire({
        title: "¿Eliminar?",
        text: "Esta acción no se puede deshacer.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#ff4d6d",
        cancelButtonColor: "#6c757d",
        confirmButtonText: "Sí, eliminar",
        cancelButtonText: "Cancelar",
        width: "350px"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "TipoPersonaController?op=eliminar&id=" + id;
        }
    });
}
</script>

<%
    String errorEliminar = (String) request.getAttribute("errorEliminar");
    if (errorEliminar != null) {
%>
<script>
Swal.fire({
    icon: "error",
    title: "No se puede eliminar",
    text: "<%=errorEliminar%>",
    confirmButtonText: "Aceptar",
    width: "350px"
});
</script>
<% } %>


</html>
