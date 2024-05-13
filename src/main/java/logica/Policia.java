
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;

/**
 *
 * @author jonii
 */
@Entity
public class Policia extends Persona implements Serializable{
    
    private String jerarquia;
    private String legajo;

    public Policia() {
    }


    public Policia(String jerarquia, String legajo, int id, String nombre, String apellido, String dni, String direccion, String apodo, String telefono, String ocupacion, Date fechaNacimiento, String sexo, String instuccion, EstadoCivil estadoCivil, Nacionalidad nacionalidad) {
        super(id, nombre, apellido, dni, direccion, apodo, telefono, ocupacion, fechaNacimiento, sexo, instuccion, estadoCivil, nacionalidad);
        this.jerarquia = jerarquia;
        this.legajo = legajo;
    }

  

    public String getJerarquia() {
        return jerarquia;
    }

    public void setJerarquia(String jerarquia) {
        this.jerarquia = jerarquia;
    }

    public String getLegajo() {
        return legajo;
    }

    public void setLegajo(String legajo) {
        this.legajo = legajo;
    }
    
    
    
    
    
}
