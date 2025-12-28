package beans;

public class RegistroActivoDTO {

    private int totalActivos;
    private int totalInactivos;

    public RegistroActivoDTO() {
    }

    public RegistroActivoDTO(int totalActivos, int totalInactivos) {
        this.totalActivos = totalActivos;
        this.totalInactivos = totalInactivos;
    }

    public int getTotalActivos() {
        return totalActivos;
    }

    public void setTotalActivos(int totalActivos) {
        this.totalActivos = totalActivos;
    }

    public int getTotalInactivos() {
        return totalInactivos;
    }

    public void setTotalInactivos(int totalInactivos) {
        this.totalInactivos = totalInactivos;
    }
}
