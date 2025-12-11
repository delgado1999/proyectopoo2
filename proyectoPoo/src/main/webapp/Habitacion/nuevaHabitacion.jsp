<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva Habitación</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #cde3ff, #ebd9ff);
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
        box-shadow: 0 15px 35px rgba(80, 100, 180, 0.25);
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

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

</head>
<body>

<div class="card">

<h2>Nueva Habitación</h2>

<form action="${pageContext.request.contextPath}/HabitacionController" method="post">

    <input type="hidden" name="op" value="insertar">

    <label>N° Habitación</label>
    <input type="number" name="numero_Habitacion" required>

    <label>N° Piso</label>
    <input type="number" name="numero_Piso" required>

    <label>Estado</label>
    <select name="estado">
        <option value="ACTIVO">Activo</option>
        <option value="INACTIVO">Inactivo</option>
    </select>

    <button type="submit">Registrar</button>

</form>

</div>

</body>
</html>
