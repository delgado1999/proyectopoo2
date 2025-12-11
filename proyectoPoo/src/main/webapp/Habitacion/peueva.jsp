<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Casa – Selección de Cuadros</title>

<style>
    body {
        font-family: "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #fce4ec);
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .contenedor {
        width: 80%;
        max-width: 900px;
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 5px 25px rgba(0,0,0,0.2);
        text-align: center;
    }

    h1 {
        margin-bottom: 25px;
        color: #333;
    }

    h2 {
        margin: 15px 0;
        color: #555;
    }

    .piso-container {
        margin-bottom: 30px;
    }

    .cuadros {
        display: grid;
        grid-template-columns: repeat(10, 55px);
        justify-content: center;
        gap: 10px;
        margin: 0 auto;
    }

    .cuadro {
        width: 55px;
        height: 55px;
        background: #e0e0e0;
        border-radius: 10px;
        border: 2px solid #b0b0b0;
        cursor: pointer;
        transition: 0.25s;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: bold;
        font-size: 16px;
        box-shadow: 0px 2px 6px rgba(0,0,0,0.15);
    }

    .cuadro:hover {
        transform: scale(1.08);
        background: #d5d5d5;
    }

    /* Estado seleccionado */
    .cuadro.seleccionado {
        background: #4CAF50 !important;
        color: white;
        border-color: #2e7d32;
        box-shadow: 0px 2px 10px rgba(76,175,80,0.6);
        transform: scale(1.1);
    }
</style>

<script>
function toggleCuadro(id) {
    let cuadro = document.getElementById(id);
    cuadro.classList.toggle("seleccionado");
}
</script>

</head>
<body>

<div class="contenedor">
    <h1>Casa – Seleccionar Cuadros</h1>

    <!-- Piso 1 -->
    <div class="piso-container">
        <h2>Piso 1</h2>
        <div class="cuadros">
            <% for (int i = 1; i <= 10; i++) { %>
                <div class="cuadro" id="p1_<%=i%>" 
                     onclick="toggleCuadro('p1_<%=i%>')">
                    <%=i%>
                </div>
            <% } %>
        </div>
    </div>

    <!-- Piso 2 -->
    <div class="piso-container">
        <h2>Piso 2</h2>
        <div class="cuadros">
            <% for (int i = 1; i <= 10; i++) { %>
                <div class="cuadro" id="p2_<%=i%>" 
                     onclick="toggleCuadro('p2_<%=i%>')">
                    <%=i%>
                </div>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>

