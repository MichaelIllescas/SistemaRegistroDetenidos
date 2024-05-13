package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author jonii
 */
@Entity
public class Causa implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String numeroCausa;
    private String descripcion;
    @OneToOne
    private Defensoria defensoria;
    @OneToOne
    private Fiscalia fiscalia;
    @OneToOne
    private Juzgado juzgado;
            
     @OneToMany
     @JoinColumn(name="detenidos")
    private List<Detenido> detenidos;
    
     @OneToMany
  @JoinColumn(name="denunciante")
    private List<Denunciante>denunciantes;

    public Causa() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumeroCausa() {
        return numeroCausa;
    }

    public void setNumeroCausa(String numeroCausa) {
        this.numeroCausa = numeroCausa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Defensoria getDefensoria() {
        return defensoria;
    }

    public void setDefensoria(Defensoria defensoria) {
        this.defensoria = defensoria;
    }

    public Fiscalia getFiscalia() {
        return fiscalia;
    }

    public void setFiscalia(Fiscalia fiscalia) {
        this.fiscalia = fiscalia;
    }

    public Juzgado getJuzgado() {
        return juzgado;
    }

    public void setJuzgado(Juzgado juzgado) {
        this.juzgado = juzgado;
    }

    public Causa(int id, String numeroCausa, String descripcion, Defensoria defensoria, Fiscalia fiscalia, Juzgado juzgado) {
        this.id = id;
        this.numeroCausa = numeroCausa;
        this.descripcion = descripcion;
        this.defensoria = defensoria;
        this.fiscalia = fiscalia;
        this.juzgado = juzgado;

    }
}
