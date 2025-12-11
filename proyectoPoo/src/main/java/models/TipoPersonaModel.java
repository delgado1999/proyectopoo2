package models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.TipoPersona;
import util.Conexion;

public class TipoPersonaModel extends Conexion {

    CallableStatement cs;
    ResultSet rs;

    // LISTAR TIPOS DE PERSONA
    public List<TipoPersona> listarTipos() {
        List<TipoPersona> lista = new ArrayList<>();

        try {
            String sql = "CALL sp_listarTipoPersona()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                TipoPersona tp = new TipoPersona();
                tp.setId(rs.getInt("idtipo_persona"));
                tp.setNombre(rs.getString("nombre"));
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

    // OBTENER UN TIPO POR ID
    public TipoPersona obtenerTipo(int idtipo) {
        TipoPersona tp = null;

        try {
            String sql = "CALL sp_obtenerTipoPersona(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idtipo);
            rs = cs.executeQuery();

            if (rs.next()) {
                tp = new TipoPersona();
                tp.setId(rs.getInt("idtipo_persona"));
                tp.setNombre(rs.getString("nombre"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            this.cerrarConexion();
        }

        return tp;
    }

    // INSERTAR UN TIPO
    public int insertarTipo(TipoPersona tipo) {
        int filas = 0;

        try {
            String sql = "CALL sp_insertarTipoPersona(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setString(1, tipo.getNombre());
            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            this.cerrarConexion();
        }

        return filas;
    }

    // MODIFICAR UN TIPO
    public int modificarTipo(TipoPersona tipo) {
        int filas = 0;

        try {
            String sql = "CALL sp_modificarTipoPersona(?, ?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, tipo.getId());
            cs.setString(2, tipo.getNombre());

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            this.cerrarConexion();
        }

        return filas;
    }

    // ELIMINAR TIPO
    public int eliminarTipo(int idtipo) {
        int filas = 0;

        try {
            String sql = "CALL sp_eliminarTipoPersona(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idtipo);

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
