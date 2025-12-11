package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	private String url = "jdbc:mysql://localhost:3306/registro";
	private String usuario="root";
	private String contrasena="1234";
	protected Connection conexion;
	
	public void abrirConexion() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, usuario, contrasena);
			System.out.println("Conexion exitosa a la BD");
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void cerrarConexion() {
		try {
			
			if(conexion!=null && !conexion.isClosed()) {
				conexion.close();
				System.out.println("Conexion cerrada");
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
