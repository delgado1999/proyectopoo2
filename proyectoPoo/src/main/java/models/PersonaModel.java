package models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.Persona;
import util.Conexion;

public class PersonaModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;
	Statement st;

	public List<Persona> listarPersona() {
		try {
			ArrayList<Persona> personas = new ArrayList<Persona>();
			String sql = "CALL sp_listarPersonas()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Persona persona = new Persona();
				persona.setIdpersona(rs.getInt("idpersona"));
				persona.setDni(rs.getString("dni"));
				persona.setNombres(rs.getString("nombres"));
				persona.setTelefono(rs.getString("telefono"));
				persona.setTipo(rs.getString("nombre"));
				persona.setEstado(rs.getString("estado"));
				personas.add(persona);
			}
			this.cerrarConexion();
			return personas;
		}

		catch (Exception e) {
			// TODO: handle exception
			this.cerrarConexion();
			return null;
		}

	}

	public int insertarPersona(Persona persona) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_insertarPersona(?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, persona.getDni());
			cs.setString(2, persona.getNombres());
			cs.setString(3, persona.getApellidos());
			cs.setString(4, persona.getTelefono());
			cs.setInt(5, persona.getIdtipo());
			cs.setString(6, persona.getEstado());
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (Exception e) {
			this.cerrarConexion();
			e.printStackTrace();
			return 0;
		}

	}

	public Persona obtenerPersona(int idpersona) {
		Persona persona = new Persona();
		try {

			String sql = "CALL sp_obtenerPersona(?)";
			this.abrirConexion();

			cs = conexion.prepareCall(sql);
			cs.setInt(1, idpersona);
			rs = cs.executeQuery();

			if (rs.next()) {
				persona.setIdpersona(rs.getInt("idpersona"));
				persona.setDni(rs.getString("dni"));
				persona.setNombres(rs.getString("nombres"));
				persona.setApellidos(rs.getString("apellidos"));
				persona.setTelefono(rs.getString("telefono"));
				persona.setIdtipo(rs.getInt("idtipo_persona"));
				persona.setEstado(rs.getString("estado"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			this.cerrarConexion();
		}

		return persona;
	}

	public int eliminarPersona(int idpersona) throws SQLException {
		int filasAfectadas = 0;

		try {
			String sql = "CALL sp_eliminarPersona(?)";
			this.abrirConexion();

			cs = conexion.prepareCall(sql);
			cs.setInt(1, idpersona);

			filasAfectadas = cs.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(PersonaModel.class.getName()).log(Level.SEVERE, null, ex);
			return 0;
		} finally {
			this.cerrarConexion();
		}

		return filasAfectadas;
	}

	public int modificarPersona(Persona persona) throws SQLException {
		int filasAfectadas = 0;

		try {
			String sql = "CALL sp_modificarPersona(?,?,?,?,?,?,?)";
			this.abrirConexion();

			cs = conexion.prepareCall(sql);
			cs.setInt(1, persona.getIdpersona());
			cs.setString(2, persona.getDni());
			cs.setString(3, persona.getNombres());
			cs.setString(4, persona.getApellidos());
			cs.setString(5, persona.getTelefono());
			cs.setInt(6, persona.getIdtipo());
			cs.setString(7, persona.getEstado());

			filasAfectadas = cs.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(PersonaModel.class.getName()).log(Level.SEVERE, null, ex);
			return 0;

		} finally {
			this.cerrarConexion();
		}

		return filasAfectadas;
	}

}
