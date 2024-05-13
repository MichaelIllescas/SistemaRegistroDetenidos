
package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author jonii
 */
@Entity
public class Juzgado implements Serializable  {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String descripcion;
    private String titular;

    public Juzgado() {
    }

    public Juzgado(int id, String descripcion, String titular) {
        this.id = id;
        this.descripcion = descripcion;
        this.titular = titular;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }
    
    
}
