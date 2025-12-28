<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Registros</title>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: "Poppins", Arial, sans-serif;
            background: linear-gradient(135deg, #e9f0ff, #f7f7ff);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #3f3d56;
            margin-bottom: 30px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 25px;
        }

        .chart-card {
            background: white;
            padding: 25px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            width: 420px;
            text-align: center;
        }

        .chart-card canvas {
            max-width: 320px;
            margin: 0 auto;
        }

        .info-card {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            padding: 25px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(46,204,113,0.4);
            width: 420px;
            text-align: center;
        }

        .info-card h3 {
            margin: 0;
            font-size: 18px;
            opacity: 0.9;
        }

        .info-card .cantidad {
            font-size: 48px;
            font-weight: bold;
            margin-top: 10px;
        }

        .leyenda {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .leyenda span {
            display: inline-flex;
            align-items: center;
            margin: 0 10px;
        }

        .color-box {
            width: 14px;
            height: 14px;
            border-radius: 4px;
            margin-right: 6px;
        }
    </style>
</head>
<body>

<h2>📊 Reporte de Registros</h2>

<div class="container">

    <!-- GRÁFICO -->
    <div class="chart-card">
        <canvas id="graficoRegistros"></canvas>

        <div class="leyenda">
            <span>
                <div class="color-box" style="background:#2ecc71;"></div> Activos
            </span>
            <span>
                <div class="color-box" style="background:#e74c3c;"></div> Inactivos
            </span>
        </div>
    </div>

    <!-- CARD RACIONES -->
    <div class="info-card">
        <h3>Raciones de comida (Registros Activos)</h3>
        <div class="cantidad" id="totalActivos">...</div>
    </div>

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

        const labels = json.data.labels;   // ["Activos", "Inactivos"]
        const values = json.data.values;   // [x, y]

        // Mostrar activos para raciones
        document.getElementById("totalActivos").innerText = values[0];

        // Crear gráfico tipo torta
        const ctx = document.getElementById('graficoRegistros').getContext('2d');

        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: values,
                    backgroundColor: [
                        '#2ecc71', // verde activos
                        '#e74c3c'  // rojo inactivos
                    ],
                    borderWidth: 2,
                    borderColor: '#fff'
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.label + ": " + context.parsed;
                            }
                        }
                    }
                }
            }
        });

    } catch (e) {
        console.error("Error cargando datos:", e);
        document.getElementById("totalActivos").innerText = "Error";
    }
}

cargarDatos();
</script>

</body>
</html>
