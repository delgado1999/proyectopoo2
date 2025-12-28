<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Habitacion" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Habitaciones</title>

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
    }

    .btn-new {
        display: inline-block;
        margin-bottom: 20px;
        background: #7b6dff;
        color: #fff;
        padding: 10px 18px;
        border-radius: 10px;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
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
    }

    th {
        background: #7b6dff;
        color: white;
        padding: 12px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    tr:hover {
        background: #f3efff;
    }

    .btn {
        padding: 6px 12px;
        border-radius: 8px;
        color: white;
        text-decoration: none;
        transition: 0.3s;
    }

    .edit { background: #00a2ff; }
    .edit:hover { background: #007acc; }

    .delete { background: #ff4d6d; }
    .delete:hover { background: #d93c59; }
</style>

</head>
<body>

<h2>Listado de Habitaciones</h2>

<a class="btn-new" href="${pageContext.request.contextPath}/HabitacionController?op=nuevo">Nuevo</a>

<table>
    <tr>
        <th>ID</th>
        <th>N° Habitación</th>
        <th>N° Piso</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>

    <%
        List<Habitacion> lista = (List<Habitacion>) request.getAttribute("listarHabitacion");
        if (lista != null) {
            for (Habitacion h : lista) {
    %>
    <tr>
        <td><%= h.getId() %></td>
        <td><%= h.getnHabitacion() %></td>
        <td><%= h.getnPiso() %></td>
        <td><%= h.getEstado() %></td>
        <td>
            <a class="btn edit"
               href="${pageContext.request.contextPath}/HabitacionController?op=obtener&id=<%= h.getId() %>">
                Editar
            </a>
            <a class="btn delete"
               href="${pageContext.request.contextPath}/HabitacionController?op=eliminar&id=<%= h.getId() %>"
               onclick="return confirm('¿Eliminar esta habitación?')">
                Eliminar
            </a>
        </td>
    </tr>
    <% 
        }
    } 
    %>
</table>

</body>
</html>
