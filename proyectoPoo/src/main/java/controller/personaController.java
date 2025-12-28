package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.PersonaModel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.Persona;


@WebServlet("/personaController")
public class personaController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    PersonaModel modelo = new PersonaModel();

    public personaController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

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
                	request.setAttribute("listarTipoPersona", modelo.listarTipoPersona());
                    request.getRequestDispatcher("/persona/nuevoPersona.jsp").forward(request, response);
                    break;
                case "insertar":
                    insertar(request, response);
                    break;
                case "obtener":
                	request.setAttribute("listarTipoPersona", modelo.listarTipoPersona());
                    obtener(request, response);
                    break;
                case "modificar":
                    modificar(request, response);
                    break;
                case "eliminar":
                    eliminar(request, response);
                    break;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarPersonas", modelo.listarPersona());
            request.getRequestDispatcher("/persona/ListarPersonas.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(personaController.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Persona persona = new Persona();
            persona.setDni(request.getParameter("dni"));
            persona.setNombres(request.getParameter("nombres"));
            persona.setApellidos(request.getParameter("apellidos"));
            persona.setTelefono(request.getParameter("telefono"));
            persona.setIdtipo(Integer.parseInt(request.getParameter("idtipo")));
            persona.setEstado(request.getParameter("estado"));

            if (modelo.insertarPersona(persona) > 0) {
                request.getSession().setAttribute("mensaje", "Persona registrada correctamente");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo registrar la persona");
            }
            listar(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("id");
            request.setAttribute("persona", modelo.obtenerPersona(Integer.parseInt(id)));
            request.getRequestDispatcher("/persona/editarPersona.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Persona persona = new Persona();
            persona.setIdpersona(Integer.parseInt(request.getParameter("idpersona")));
            persona.setDni(request.getParameter("dni"));
            persona.setNombres(request.getParameter("nombres"));
            persona.setApellidos(request.getParameter("apellidos"));
            persona.setTelefono(request.getParameter("telefono"));
            persona.setIdtipo(Integer.parseInt(request.getParameter("idtipo")));
            persona.setEstado(request.getParameter("estado"));

            if (modelo.modificarPersona(persona) > 0) {
                request.getSession().setAttribute("exito", "Persona modificada correctamente");
                response.sendRedirect(request.getContextPath() + "/personaController?op=listar");
            } else {
                request.getSession().setAttribute("fracaso", "No se pudo modificar la persona");
                response.sendRedirect(request.getContextPath() + "/personaController?op=listar");
            }
        } catch (IOException | SQLException ex) {
            Logger.getLogger(personaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idpersona = Integer.parseInt(request.getParameter("id"));
            if (modelo.eliminarPersona(idpersona) > 0) {
                request.getSession().setAttribute("exito", "Persona eliminada correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se puede eliminar esta persona");
            }
            response.sendRedirect(request.getContextPath() + "/personaController?op=listar");
        } catch (SQLException | IOException ex) {
            Logger.getLogger(personaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
