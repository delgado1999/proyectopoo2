package beans;

import java.sql.Date;

public class Registro {

    private int idregistro;
    private int idadministrador;
    private int idhabitacion;
    private int idpersona;
    private int idtipo_persona;
    private Date fechaInicio;
    private Date fechaFin;
    private String estado;
    private String nombreA;
    private int numero;
    private int piso;
    private String persona_nombre;
    private String tipo_persona;
    

	public int getIdregistro() {
        return idregistro;
    }

    public void setIdregistro(int idregistro) {
        this.idregistro = idregistro;
    }

    public int getIdadministrador() {
        return idadministrador;
    }

    public void setIdadministrador(int idadministrador) {
        this.idadministrador = idadministrador;
    }

    public int getIdhabitacion() {
        return idhabitacion;
    }

    public void setIdhabitacion(int idhabitacion) {
        this.idhabitacion = idhabitacion;
    }

    public int getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(int idpersona) {
        this.idpersona = idpersona;
    }

    public int getIdtipo_persona() {
        return idtipo_persona;
    }

    public void setIdtipo_persona(int idtipo_persona) {
        this.idtipo_persona = idtipo_persona;
    }

    

    public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
	

	public String getNombreA() {
		return nombreA;
	}

	public void setNombreA(String nombreA) {
		this.nombreA = nombreA;
	}

	public String getPersona_nombre() {
		return persona_nombre;
	}

	public void setPersona_nombre(String persona_nombre) {
		this.persona_nombre = persona_nombre;
	}

	public String getTipo_persona() {
		return tipo_persona;
	}

	public void setTipo_persona(String tipo_persona) {
		this.tipo_persona = tipo_persona;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}
    
}


