<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Registros Activos</title>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .card {
            width: 350px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        #totalActivos {
            font-size: 40px;
            font-weight: bold;
            color: #2c73d2;
        }

        #chartContainer {
            width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<h2>Reporte de Registros Activos</h2>

<div class="card">
    <p>Total de Registros Activos</p>
    <div id="totalActivos">Cargando...</div>
</div>

<div id="chartContainer">
    <canvas id="graficoActivos"></canvas>
</div>


<script>
async function cargarDatos() {

    try {
        const response = await fetch("RegistroController?op=reporte", {
            headers: { "Accept": "application/json" }
        });

        const json = await response.json();

        if (!json.success) {
            document.getElementById("totalActivos").innerText = "Error";
            return;
        }

        // Extraer datos reales
        const labels = json.data.labels;
        const values = json.data.values;

        // Mostrar total bonito
        document.getElementById("totalActivos").innerText = values[0];

        // ===============================
        //   CREAR GRÁFICO
        // ===============================
        const ctx = document.getElementById('graficoActivos').getContext('2d');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: "Registros Activos",
                    data: values,
                    borderWidth: 1
                }]
            }
        });

    } catch (e) {
        console.log("Error cargando datos:", e);
        document.getElementById("totalActivos").innerText = "Error al cargar";
    }
}

cargarDatos();
</script>

</body>
</html>


