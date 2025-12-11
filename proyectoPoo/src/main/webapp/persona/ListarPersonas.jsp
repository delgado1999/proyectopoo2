<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="beans.Persona"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Lista de Personas</title>

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

<a href="<%=url%>personaController?op=nuevo" class="btn-new">➕ Nueva Persona</a>

<h2>👤 Lista de Personas</h2>

<table>
    <thead>
        <tr>
            <th>DNI</th>
            <th>Nombres</th>
            <th>Teléfono</th>
            <th>Tipo</th>
            <th>Estado</th>
            <th>Operaciones</th>
        </tr>
    </thead>

    <tbody>
    <%
        List<Persona> personas = (List<Persona>) request.getAttribute("listarPersonas");

        if (personas != null && !personas.isEmpty()) {
            for (Persona persona : personas) {
    %>

        <tr>
            <td><%= persona.getDni() %></td>
            <td><%= persona.getNombres() %></td>
            <td><%= persona.getTelefono() %></td>
            <td><%= persona.getTipo() %></td>
            <td><%= persona.getEstado() %></td>

            <td>
                <a href="<%=url%>personaController?op=obtener&id=<%=persona.getIdpersona()%>"
                   class="btn edit">Editar</a>

                <a href="<%=url%>personaController?op=eliminar&id=<%=persona.getIdpersona()%>"
                   class="btn delete"
                   onclick="return confirm('¿Eliminar esta persona?');">
                    Eliminar
                </a>
            </td>
        </tr>

    <%
            }
        } else {
    %>

        <tr>
            <td colspan="6" class="empty">No hay datos</td>
        </tr>

    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
