<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registrar Nueva Persona</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">📝 Registrar Nueva Persona</h2>

    <form action="personaController" method="post">
        <input type="hidden" name="op" value="insertar">
        
        <div class="mb-3">
            <label for="dni" class="form-label">DNI:</label>
            <input type="text" name="dni" id="dni" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="nombres" class="form-label">Nombres:</label>
            <input type="text" name="nombres" id="nombres" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="apellidos" class="form-label">Apellidos:</label>
            <input type="text" name="apellidos" id="apellidos" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="telefono" class="form-label">Teléfono:</label>
            <input type="text" name="telefono" id="telefono" class="form-control">
        </div>

        <div class="mb-3">
            <label for="idtipo" class="form-label">Tipo:</label>
            <select name="idtipo" id="idtipo" class="form-select">
                <option value="1">Cliente</option>
                <option value="2">Empleado</option>
                <!-- Agrega los tipos según tu base de datos -->
            </select>
        </div>

        <div class="mb-3">
            <label for="estado" class="form-label">Estado:</label>
            <select name="estado" id="estado" class="form-select">
                <option value="Activo">Activo</option>
                <option value="Inactivo">Inactivo</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success">Registrar Persona</button>
        <a href="personaController?op=listar" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

</body>
</html>
