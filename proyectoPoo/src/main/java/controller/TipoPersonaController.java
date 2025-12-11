package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.TipoPersonaModel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.TipoPersona;

@WebServlet("/TipoPersonaController")
public class TipoPersonaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    TipoPersonaModel modelo = new TipoPersonaModel();

    public TipoPersonaController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");

        String op = request.getParameter("op");
        if (op == null) {
            listar(request, response);
            return;
        }

        switch (op) {
            case "listar":
                listar(request, response);
                break;
            case "nuevo":
                request.getRequestDispatcher("/TipoPersona/nuevoTipoPersona.jsp").forward(request, response);
                break;
            case "insertar":
                insertar(request, response);
                break;
            case "obtener":
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


    // ========== LISTAR ==========
    private void listar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarTipoPersona", modelo.listarTipos());
            request.getRequestDispatcher("/TipoPersona/listarTipoPersona.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(TipoPersonaController.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // ========== INSERTAR ==========
    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try {
            TipoPersona tipo = new TipoPersona();
            tipo.setNombre(request.getParameter("nombre"));

            if (modelo.insertarTipo(tipo) > 0) {
                request.getSession().setAttribute("mensaje", "Tipo de persona registrado correctamente");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo registrar el tipo");
            }

            listar(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ========== OBTENER ==========
    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            request.setAttribute("tipo", modelo.obtenerTipo(id));
            request.getRequestDispatcher("/TipoPersona/editarTipoPersona.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ========== MODIFICAR ==========
    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try {
            TipoPersona tipo = new TipoPersona();
            tipo.setId(Integer.parseInt(request.getParameter("id")));
            tipo.setNombre(request.getParameter("nombre"));

            if (modelo.modificarTipo(tipo) > 0) {
                request.getSession().setAttribute("exito", "Tipo modificado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se pudo modificar el tipo");
            }

            response.sendRedirect(request.getContextPath() + "/TipoPersonaController?op=listar");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // ========== ELIMINAR ==========
    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (modelo.eliminarTipo(id) > 0) {
                request.getSession().setAttribute("exito", "Tipo eliminado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se puede eliminar este tipo");
            }

            response.sendRedirect(request.getContextPath() + "/TipoPersonaController?op=listar");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

}

