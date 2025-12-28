package models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Habitacion;
import beans.TipoPersona;
import util.Conexion;

public class HabitacionModel extends Conexion{
    CallableStatement cs;
    ResultSet rs;

    // LISTAR TIPOS DE PERSONA
    public List<Habitacion> listarHabitacion() {
        List<Habitacion> lista = new ArrayList<>();

        try {
            String sql = "CALL sp_listarHabitacion()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                Habitacion tp = new Habitacion();
                tp.setId(rs.getInt("idhabitacion"));
                tp.setnHabitacion(rs.getInt("numero_habitacion"));
                tp.setnPiso(rs.getInt("numero_piso"));
                tp.setEstado(rs.getString("estado"));
                lista.add(tp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            this.cerrarConexion();
        }

        return lista;
    }

    public Habitacion obtenerHabitacion(int idhabitacion) {
        Habitacion tp = null;

        try {
            String sql = "CALL sp_obtenerHabitacion(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idhabitacion);
            rs = cs.executeQuery();

            if (rs.next()) {
                tp = new Habitacion();
                tp.setId(rs.getInt("idhabitacion"));
                tp.setnHabitacion(rs.getInt("numero_habitacion"));
                tp.setnPiso(rs.getInt("numero_piso"));
                tp.setEstado(rs.getString("estado"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            this.cerrarConexion();
        }

        return tp;
    }

    public int insertarHabitacion(Habitacion habitacion) {
        int filas = 0;

        try {
            String sql = "CALL sp_InsetarHabitacion(?,?,?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, habitacion.getnHabitacion());
            cs.setInt(2, habitacion.getnPiso());
            cs.setString(3, habitacion.getEstado());
            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            this.cerrarConexion();
        }

        return filas;
    }

    public int modificarHabitacion(Habitacion habitacion) {
        int filas = 0;

        try {
            String sql = "CALL sp_modificarHabitacion(?,?,?,?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, habitacion.getId());
            cs.setInt(2, habitacion.getnHabitacion());
            cs.setInt(3, habitacion.getnPiso());
            cs.setString(4, habitacion.getEstado());

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            this.cerrarConexion();
        }

        return filas;
    }

    public int eliminarHabitacion(int idhabitacion) {
        int filas = 0;

        try {
            String sql = "CALL sp_EliminarHabitacion(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idhabitacion);

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            this.cerrarConexion();
        }

        return filas;
    }

}
