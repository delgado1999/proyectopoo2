<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Registro" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listado de Registro</title>

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
        margin-top: 20px;
    }

    th {
        background: #7b6dff;
        color: white;
        padding: 14px;
        font-size: 15px;
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

<h2>📝 Listado de Registro</h2>

<a class="btn-new" href="RegistroController?op=nuevo">➕ Nuevo</a>

<%
    List<Registro> lista = (List<Registro>) request.getAttribute("listarRegistro");

    if (lista == null || lista.isEmpty()) {
%>

    <p class="empty">No hay registros para mostrar.</p>

<%
    } else {
%>

<table>
    <thead>
        <tr>
            <th>ID</th>
             <th>Persona</th>
            <th>Tipo Persona</th>
            <th>Número Habitación</th>
            <th>Piso</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>
    <%
        for (Registro r : lista) {
    %>
        <tr>
            <td><%= r.getIdregistro() %></td>
            <td><%= r.getPersona_nombre() %></td>
            <td><%= r.getTipo_persona() %></td>
            <td><%= r.getNumero() %></td>
            <td><%= r.getPiso() %></td>
            <td><%= r.getFechaInicio() %></td>
            <td><%= r.getFechaFin() %></td>
            <td><%= r.getEstado() %></td>

            <td>
                <a class="btn edit"
                   href="RegistroController?op=obtener&id=<%= r.getIdregistro() %>">Editar</a>

                <a class="btn delete"
                   href="RegistroController?op=eliminar&id=<%= r.getIdregistro() %>"
                   onclick="return confirm('¿Seguro que deseas eliminar este registro?')">
                    Eliminar
                </a>
            </td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
    }
%>

</body>
</html>


