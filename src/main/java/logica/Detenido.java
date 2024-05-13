package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jonii
 */
@Entity
public class Detenido extends Persona implements Serializable{
     
    @Temporal(TemporalType.DATE)
    private Date fechaIngreso;
    @Temporal(TemporalType.DATE)
    private Date fechaEgreso;

    public Detenido() {
    }

    public Detenido(Date fechaIngreso, Date fechaEgreso, int id, String nombre, String apellido, String dni, String direccion, String apodo, String telefono, String ocupacion, Date fechaNacimiento, String sexo, String instuccion, EstadoCivil estadoCivil, Nacionalidad nacionalidad) {
        super(id, nombre, apellido, dni, direccion, apodo, telefono, ocupacion, fechaNacimiento, sexo, instuccion, estadoCivil, nacionalidad);
        this.fechaIngreso = fechaIngreso;
        this.fechaEgreso = fechaEgreso;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Date getFechaEgreso() {
        return fechaEgreso;
    }

    public void setFechaEgreso(Date fechaEgreso) {
        this.fechaEgreso = fechaEgreso;
    }
    
    
    
}
