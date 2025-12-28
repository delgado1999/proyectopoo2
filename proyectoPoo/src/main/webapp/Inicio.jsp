<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Pastel</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css">
    <style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #e8efff, #f2f6ff);
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    h1 {
        text-align: center;
        margin-top: 30px;
        color: #4a4cb8;
        font-size: 40px;
        animation: fadeInDown 1.2s ease;
    }

    .container {
        width: 90%;
        margin: 40px auto;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 25px;
        animation: fadeIn 1.5s ease;
    }

    .card {
        border-radius: 25px;
        padding: 25px;
        box-shadow: 0 10px 30px rgba(90, 120, 255, 0.18);
        text-align: center;
        transition: 0.4s;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    /* ❄️ PALETA PASTEL FRÍA */
    .card:nth-child(1) { background: #dcd9ff; } /* lila hielo */
    .card:nth-child(2) { background: #cfe8ff; } /* celeste frío */
    .card:nth-child(3) { background: #dae9ff; } /* azul nube */
    .card:nth-child(4) { background: #e1f3ff; } /* azul ártico */
    .card:nth-child(5) { background: #f0e7ff; } /* violeta polar */

    .card:hover {
        transform: translateY(-10px) scale(1.03);
        box-shadow: 0 20px 40px rgba(70, 90, 150, 0.25);
    }

    .card i {
        font-size: 55px;
        margin-bottom: 15px;
        color: #353558;
    }

    .card h3 {
        margin: 10px 0;
        font-size: 22px;
        color: #2f2e4f;
        font-weight: 600;
    }

    .card p {
        color: #4a4a63;
        font-size: 15px;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .report-img {
        width: 90px;
        margin: 10px auto;
        opacity: 0.95;
        display: block;
    }
</style>
    

</head>
<body>

    <h1>✨ Gestión de Albergue de Yurúa</h1>

    <div class="container">

        <!-- Registro -->
        <div class="card" onclick="window.location='RegistroController?op=listar'">
            <i class="ri-user-add-line"></i>
            <h3>Registro</h3>
            <p>Gestiona las entradas y salidas.</p>
        </div>

        <!-- Habitaciones -->
        <div class="card" onclick="window.location='HabitacionController?op=listar'">
            <i class="ri-hotel-bed-line"></i>
            <h3>Habitaciones</h3>
            <p>Control y administración de habitaciones.</p>
        </div>

        <!-- Personas -->
        <div class="card" onclick="window.location='personaController?op=listar'">
            <i class="ri-account-circle-line"></i>
            <h3>Personas</h3>
            <p>Listado y gestión de personas registradas.</p>
        </div>

        <!-- Tipo Persona -->
        <div class="card" onclick="window.location='TipoPersonaController?op=listar'">
            <i class="ri-team-line"></i>
            <h3>Tipo de Persona</h3>
            <p>Roles y categorías de personas.</p>
        </div>

        <!-- Reportes -->
        <div class="card" onclick="window.location='RegistroController?op=reporte'">

            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828761.png" class="report-img">

            <h3>Reportes</h3>
            <p>Visualiza información detallada y gráficos.</p>
        </div>

    </div>

</body>
</html>




