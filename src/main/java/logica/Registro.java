
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jonii
 */
@Entity
public class Registro implements Serializable {
     @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
     int id;
    private String observaciones;
    @Temporal(TemporalType.DATE)
    private Date fechaRegistro;
    @OneToOne( cascade = CascadeType.ALL)
    private Causa causa;
    @OneToOne
    private Usuario usuario;

    public Registro() {
    }

    public Registro(int id, String observaciones, Date fechaRegistro, Causa causa, Usuario usuario) {
        this.id = id;
        this.observaciones = observaciones;
        this.fechaRegistro = fechaRegistro;
        this.causa = causa;
        this.usuario = usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Causa getCausa() {
        return causa;
    }

    public void setCausa(Causa causa) {
        this.causa = causa;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
