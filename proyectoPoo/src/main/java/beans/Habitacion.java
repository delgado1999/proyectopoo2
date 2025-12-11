package beans;

public class Habitacion {
	private int id;
	private int nHabitacion;
	private int nPiso;
	private String estado;
	public Habitacion() {
	}
	public Habitacion(int id, int nHabitacion, int nPiso, String estado) {
		this.id = id;
		this.nHabitacion = nHabitacion;
		this.nPiso = nPiso;
		this.estado = estado;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getnHabitacion() {
		return nHabitacion;
	}
	public void setnHabitacion(int nHabitacion) {
		this.nHabitacion = nHabitacion;
	}
	public int getnPiso() {
		return nPiso;
	}
	public void setnPiso(int nPiso) {
		this.nPiso = nPiso;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	

}
