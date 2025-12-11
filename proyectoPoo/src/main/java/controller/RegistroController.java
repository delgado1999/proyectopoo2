package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.RegistroModel;
import util.UtilsJson;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.Registro;
import beans.RegistroActivoDTO;

@WebServlet("/RegistroController")
public class RegistroController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    RegistroModel modelo = new RegistroModel();

    public RegistroController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");

        String operacion = request.getParameter("op");
        if (operacion == null) {
            listar(request, response);
            return;
        }

        switch (operacion) {
            case "listar":
                listar(request, response);
                break;

            case "nuevo":
            	request.setAttribute("listarHabitacion", modelo.listarHabitacion());
            	request.setAttribute("listarAdministrador", modelo.listarAdministrador());
            	request.setAttribute("listarTipoPersona", modelo.listarTipoPersona());
            	request.setAttribute("listarPersona", modelo.listarPersona());
                request.getRequestDispatcher("/Registro/nuevoRegistro.jsp").forward(request, response);
                break;

            case "insertar":
                insertar(request, response);
                break;

            case "obtener":
            	request.setAttribute("listarHabitacion", modelo.listarHabitacion());
            	request.setAttribute("listarAdministrador", modelo.listarAdministrador());
            	request.setAttribute("listarTipoPersona", modelo.listarTipoPersona());
            	request.setAttribute("listarPersona", modelo.listarPersona());
                obtener(request, response);
                break;

            case "modificar":
                modificar(request, response);
                break;

            case "eliminar":
                eliminar(request, response);
                break;
            case "reporte":
    			reporte(request, response);
    			break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // LISTAR
    private void listar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarRegistro", modelo.listarRegistro());
            request.getRequestDispatcher("/Registro/ListarRegistro.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(RegistroController.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // INSERTAR
    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Registro reg = new Registro();

            reg.setIdadministrador(Integer.parseInt(request.getParameter("idadministrador")));
            reg.setIdhabitacion(Integer.parseInt(request.getParameter("idhabitacion")));
            reg.setIdpersona(Integer.parseInt(request.getParameter("idpersona")));
            reg.setIdtipo_persona(Integer.parseInt(request.getParameter("idtipo_persona")));
            reg.setFechaInicio(java.sql.Date.valueOf(request.getParameter("fechaInicio")));
            reg.setFechaFin(java.sql.Date.valueOf(request.getParameter("fechaFin")));
            reg.setEstado(request.getParameter("estado"));

            if (modelo.insertarRegistro(reg) > 0) {
                request.getSession().setAttribute("mensaje", "Registro guardado correctamente");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo guardar el registro");
            }

            listar(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // OBTENER UN REGISTRO
    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("registro", modelo.obtenerRegistro(id));

            request.getRequestDispatcher("/Registro/editarRegistro.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // MODIFICAR
    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Registro reg = new Registro();

            reg.setIdregistro(Integer.parseInt(request.getParameter("idregistro")));
            reg.setIdadministrador(Integer.parseInt(request.getParameter("idadministrador")));
            reg.setIdhabitacion(Integer.parseInt(request.getParameter("idhabitacion")));
            reg.setIdpersona(Integer.parseInt(request.getParameter("idpersona")));
            reg.setIdtipo_persona(Integer.parseInt(request.getParameter("idtipo_persona")));
            reg.setFechaInicio(java.sql.Date.valueOf(request.getParameter("fechaInicio")));
            reg.setFechaFin(java.sql.Date.valueOf(request.getParameter("fechaFin")));
            reg.setEstado(request.getParameter("estado"));

            if (modelo.modificarRegistro(reg) > 0) {
                request.getSession().setAttribute("exito", "Registro modificado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se pudo modificar el registro");
            }

            response.sendRedirect(request.getContextPath() + "/RegistroController?op=listar");

        } catch (IOException ex) {
            Logger.getLogger(RegistroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // ELIMINAR
    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idregistro = Integer.parseInt(request.getParameter("id"));

            if (modelo.eliminarRegistro(idregistro) > 0) {
                request.getSession().setAttribute("exito", "Registro eliminado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se puede eliminar este registro");
            }

            response.sendRedirect(request.getContextPath() + "/RegistroController?op=listar");

        } catch (IOException ex) {
            Logger.getLogger(RegistroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void reporte(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Detectar si es una petición AJAX verificando el header Accept
            String acceptHeader = request.getHeader("Accept");
            boolean esAjax = acceptHeader != null && acceptHeader.contains("application/json");

            if (esAjax) {
                // CASO 1: Petición AJAX - devolver JSON con los datos
                List<RegistroActivoDTO> datos = modelo.obtenerRegistrosActivos();

                List<String> labels = new ArrayList<>();
                List<Integer> values = new ArrayList<>();

                for (RegistroActivoDTO d : datos) {
                    labels.add("Activos"); // único label
                    values.add(d.getTotalActivos()); // único valor
                }

                // Construir el objeto data como JSON
                String dataJson = new StringBuilder(128)
                    .append("{")
                    .append("\"labels\":")
                    .append(UtilsJson.jsonArrayStrings(labels))
                    .append(',')
                    .append("\"values\":")
                    .append(UtilsJson.jsonArrayInts(values))
                    .append("}")
                    .toString();

                // Enviar respuesta JSON
                enviarJSON(response, true, "OK", dataJson);

            } else {
                // CASO 2: Petición directa desde navegador - mostrar JSP
                response.setContentType("text/html; charset=UTF-8");
                request.getRequestDispatcher("/Registro/reporte.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            // Manejar error según el tipo de petición
            String acceptHeader = request.getHeader("Accept");
            boolean esAjax = acceptHeader != null && acceptHeader.contains("application/json");

            if (esAjax) {
                enviarJSON(response, false, "Error: " + e.getMessage(), null);
            } else {
                try {
                    request.setAttribute("error", "Error al cargar el reporte: " + e.getMessage());
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    /**
	 * Envía una respuesta JSON con datos adicionales
	 * 
	 * @param success - true si la operación fue exitosa
	 * @param mensaje - mensaje a enviar
	 * @param dataJsonObject - objeto JSON con datos adicionales
	 */
	private void enviarJSON(HttpServletResponse response, boolean success, String mensaje,
			String dataJsonObject) {
		try {
			response.reset();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Cache-Control", "no-cache");

			String mensajeLimpio = mensaje.replace("\"", "'").replace("\n", " ").replace("\r", " ");

			StringBuilder sb = new StringBuilder(256);
			sb.append("{\"success\":").append(success).append(",\"mensaje\":\"").append(mensajeLimpio).append("\"");

			if (dataJsonObject != null && !dataJsonObject.isEmpty()) {
				sb.append(",\"data\":").append(dataJsonObject);
			}
			sb.append('}');

			try (PrintWriter out = response.getWriter()) {
				out.write(sb.toString());
				out.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

