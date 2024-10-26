package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
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
    @OneToOne
    private Delito delito;
    private String departamentoJudicial;

    
    @OneToOne
    private Defensoria defensoria;
    @OneToOne
    private Fiscalia fiscalia;
    @OneToOne
    private Juzgado juzgado;
    
     @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "causa_id") // Esto crea la clave foránea en Detenido y Denunciante
    private List<Detenido> detenidos;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true )
    @JoinColumn(name = "causa_id", nullable=true) // Esto crea la clave foránea en Detenido y Denunciante
    private List<Denunciante> denunciantes;


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

   

    public Delito getDelito() {
        return delito;
    }

    public void setDelito(Delito delito) {
        this.delito = delito;
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

    public Causa(int id, String numeroCausa, Delito delito, String departamentoJudicial, Defensoria defensoria, Fiscalia fiscalia, Juzgado juzgado, List<Detenido> detenidos, List<Denunciante> denunciantes) {
        this.id = id;
        this.numeroCausa = numeroCausa;
        this.delito = delito;
        this.departamentoJudicial = departamentoJudicial;
        this.defensoria = defensoria;
        this.fiscalia = fiscalia;
        this.juzgado = juzgado;
        this.detenidos = detenidos;
        this.denunciantes = denunciantes;
    }

   

    public List<Detenido> getDetenidos() {
        return detenidos;
    }

    public void setDetenidos(List<Detenido> detenidos) {
        this.detenidos = detenidos;
    }

    public List<Denunciante> getDenunciantes() {
        return denunciantes;
    }

    public void setDenunciantes(List<Denunciante> denunciantes) {
        this.denunciantes = denunciantes;
    }
    

 public String getDepartamentoJudicial() {
        return departamentoJudicial;
    }

    public void setDepartamentoJudicial(String departamentoJudicial) {
        this.departamentoJudicial = departamentoJudicial;
    }

}
