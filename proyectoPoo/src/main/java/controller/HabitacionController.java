package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.HabitacionModel;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.Habitacion;
import beans.TipoPersona;

@WebServlet("/HabitacionController")
public class HabitacionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       HabitacionModel modelo = new HabitacionModel();
   
    public HabitacionController() {
        super();
        // TODO Auto-generated constructor stub
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
                request.getRequestDispatcher("/Habitacion/nuevaHabitacion.jsp").forward(request, response);
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
            case "modal":
                modal(request, response);
                break;

        }
    }


    private void listar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarHabitacion", modelo.listarHabitacion());
            request.getRequestDispatcher("/Habitacion/ListarHabitacion.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(TipoPersonaController.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    private void insertar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Habitacion habitacion = new Habitacion();
            habitacion.setnHabitacion(Integer.parseInt(request.getParameter("numero_Habitacion")));
            habitacion.setnPiso(Integer.parseInt(request.getParameter("numero_Piso")));          
            habitacion.setEstado(request.getParameter("estado"));

            if (modelo.insertarHabitacion(habitacion) > 0) {
                request.getSession().setAttribute("mensaje", "habitacion registrado correctamente");
            } else {
                request.getSession().setAttribute("mensaje", "No se pudo registrar la habitacion");
            }

            listar(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void modal(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("listarHabitacion", modelo.listarHabitacion());
            request.getRequestDispatcher("/Habitacion/modalHabitacion.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void obtener(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            request.setAttribute("habitacion", modelo.obtenerHabitacion(id));
            request.getRequestDispatcher("/Habitacion/editarHabitacion.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 
    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        try {
            Habitacion habitacion = new Habitacion();
            habitacion.setId(Integer.parseInt(request.getParameter("id")));
            habitacion.setnHabitacion(Integer.parseInt(request.getParameter("numero_Habitacion")));
            habitacion.setnPiso(Integer.parseInt(request.getParameter("numero_Piso")));          
            habitacion.setEstado(request.getParameter("estado"));
            if (modelo.modificarHabitacion(habitacion) > 0) {
                request.getSession().setAttribute("exito", "habitacion modificado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se pudo modificar la habitacion");
            }

            response.sendRedirect(request.getContextPath() + "/HabitacionController?op=listar");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (modelo.eliminarHabitacion(id) > 0) {
                request.getSession().setAttribute("exito", "habitacion eliminado correctamente");
            } else {
                request.getSession().setAttribute("fracaso", "No se puede eliminar este habitacion");
            }

            response.sendRedirect(request.getContextPath() + "/HabitacionController?op=listar");

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
