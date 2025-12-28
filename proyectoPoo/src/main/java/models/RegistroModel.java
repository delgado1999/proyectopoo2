package models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Habitacion;
import beans.Persona;
import beans.Registro;
import beans.RegistroActivoDTO;
import beans.TipoPersona;
import util.Conexion;

public class RegistroModel extends Conexion {

    CallableStatement cs;
    ResultSet rs;

    public List<Registro> listarRegistro() {
        List<Registro> lista = new ArrayList<>();

        try {
            String sql = "CALL sp_listarRegistro()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                Registro r = new Registro();
                r.setIdregistro(rs.getInt("idregistro"));
                r.setNumero(rs.getInt("numero"));
                r.setPiso(rs.getInt("piso"));
                r.setPersona_nombre(rs.getString("persona_nombre"));
                r.setTipo_persona(rs.getString("tipo_persona"));
                r.setFechaInicio(rs.getDate("fechaInicio"));
                r.setFechaFin(rs.getDate("fechaFin"));
                r.setEstado(rs.getString("estado"));
                lista.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        } finally {
            this.cerrarConexion();
        }

        return lista;
    }
    
    public List<Persona> listarPersona() {
        List<Persona> lista = new ArrayList<>();

        try {
            String sql = "CALL sp_listapersona()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                Persona r = new Persona();
                r.setIdpersona(rs.getInt("idpersona"));
                r.setNombres(rs.getString("nombres"));
                r.setIdtipo(rs.getInt("idtipo")); 
                lista.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        } finally {
            this.cerrarConexion();
        }

        return lista;
    }
    
    public List<TipoPersona> listarTipoPersona() {
        List<TipoPersona> lista = new ArrayList<>();

        try {
            String sql = "CALL sp_listarTipoPersona()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            while (rs.next()) {
                TipoPersona r = new TipoPersona();
                r.setId(rs.getInt("idtipo_persona"));
                r.setNombre(rs.getString("nombre"));
                lista.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        } finally {
            this.cerrarConexion();
        }

        return lista;
    }
   
    
    public Registro obtenerRegistro(int idregistro) {
        Registro r = null;

        try {
            String sql = "CALL sp_obtenerRegistro(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idregistro);
            rs = cs.executeQuery();

            if (rs.next()) {
                r = new Registro();
                r.setIdregistro(rs.getInt("idregistro"));
                r.setIdhabitacion(rs.getInt("idhabitacion"));
                r.setIdpersona(rs.getInt("idpersona"));
                r.setIdtipo_persona(rs.getInt("idtipo_persona"));
                r.setFechaInicio(rs.getDate("fechaInicio"));
                r.setFechaFin(rs.getDate("fechaFin"));
                r.setEstado(rs.getString("estado"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        } finally {
            this.cerrarConexion();
        }

        return r;
    }


    public int insertarRegistro(Registro registro) {
        int filas = 0;

        try {
            String sql = "CALL sp_insertarRegistro(?,?,?,?,?,?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, registro.getIdhabitacion());
            cs.setInt(2, registro.getIdpersona());
            cs.setInt(3, registro.getIdtipo_persona());
            cs.setDate(4, registro.getFechaInicio());
            cs.setDate(5, registro.getFechaFin());
            cs.setString(6, registro.getEstado());
           

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;

        } finally {
            this.cerrarConexion();
        }

        return filas;
    }


    public int modificarRegistro(Registro registro) {
        int filas = 0;

        try {
            String sql = "CALL sp_modificarRegistro(?,?,?,?,?,?,?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);

            cs.setInt(1, registro.getIdregistro());
            cs.setInt(2, registro.getIdhabitacion());
            cs.setInt(3, registro.getIdpersona());
            cs.setInt(4, registro.getIdtipo_persona());
            cs.setDate(5, registro.getFechaInicio());
            cs.setDate(6, registro.getFechaFin());
            cs.setString(7, registro.getEstado());

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;

        } finally {
            this.cerrarConexion();
        }

        return filas;
    }
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

    public int eliminarRegistro(int idregistro) {
        int filas = 0;

        try {
            String sql = "CALL sp_eliminarRegistro(?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setInt(1, idregistro);

            filas = cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;

        } finally {
            this.cerrarConexion();
        }

        return filas;
    }
    public RegistroActivoDTO obtenerRegistrosActivos() {
        try {
            RegistroActivoDTO dto = null;

            String sql = "CALL sp_ContarRegistrosActivos()";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            rs = cs.executeQuery();

            if (rs.next()) {
                dto = new RegistroActivoDTO(
                    rs.getInt("total_activos"),
                    rs.getInt("total_inactivos")
                );
            }

            this.cerrarConexion();
            return dto;

        } catch (SQLException e) {
            e.printStackTrace();
            this.cerrarConexion();
            return null;
        }
    }


}

