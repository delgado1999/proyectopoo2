<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Habitacion" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Habitación</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #d7ecff, #e8d9ff);
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        width: 420px;
        background: white;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 15px 35px rgba(80, 100, 200, 0.25);
        animation: fadeIn 1s ease both;
    }

    h2 {
        text-align: center;
        color: #5a4bd1;
        margin-bottom: 20px;
    }

    label {
        font-weight: 600;
        color: #444;
    }

    input, select {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 12px;
        border: 1px solid #ccc;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #7b6dff;
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 17px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #5c4de2;
        transform: scale(1.05);
    }
</style>

</head>
<body>

<div class="card">

<%
    Habitacion h = (Habitacion) request.getAttribute("habitacion");
%>

<h2>Editar Habitación</h2>

<form action="${pageContext.request.contextPath}/HabitacionController" method="post">

    <input type="hidden" name="op" value="modificar">
    <input type="hidden" name="id" value="<%= h.getId() %>">

    <label>N° Habitación</label>
    <input type="number" name="numero_Habitacion" value="<%= h.getnHabitacion() %>" required>

    <label>N° Piso</label>
    <input type="number" name="numero_Piso" value="<%= h.getnPiso() %>" required>

    <label>Estado</label>
    <select name="estado">
        <option value="ACTIVO" <%= "ACTIVO".equals(h.getEstado()) ? "selected" : "" %>>Activo</option>
        <option value="INACTIVO" <%= "INACTIVO".equals(h.getEstado()) ? "selected" : "" %>>Inactivo</option>
    </select>

    <button type="submit">Guardar Cambios</button>

</form>

</div>

</body>
</html>
