package beans;

public class Persona {
	private int idpersona;
	private String dni;
	private String nombres;
	private String apellidos;
	private String telefono;
	private int idtipo;
	private String tipo;
	private String estado;
	
	
	public Persona() {
	}


	public Persona(int idpersona, String dni, String nombres, String apellidos, String telefono, int idtipo,
			String tipo, String estado) {
		this.idpersona = idpersona;
		this.dni = dni;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.idtipo = idtipo;
		this.tipo = tipo;
		this.estado = estado;
	}


	public int getIdpersona() {
		return idpersona;
	}


	public void setIdpersona(int idpersona) {
		this.idpersona = idpersona;
	}


	public String getDni() {
		return dni;
	}


	public void setDni(String dni) {
		this.dni = dni;
	}


	public String getNombres() {
		return nombres;
	}


	public void setNombres(String nombres) {
		this.nombres = nombres;
	}


	public String getApellidos() {
		return apellidos;
	}


	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public int getIdtipo() {
		return idtipo;
	}


	public void setIdtipo(int idtipo) {
		this.idtipo = idtipo;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	

}
