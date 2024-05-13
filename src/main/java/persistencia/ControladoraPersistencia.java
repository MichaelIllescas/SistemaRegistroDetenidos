/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.util.List;
import logica.Policia;
import logica.Usuario;

/**
 *
 * @author jonii
 */
public class ControladoraPersistencia {


    public ControladoraPersistencia() {
    }
    
    
    DefensoriaJpaController defensoriaJPA = new DefensoriaJpaController();
    
    CausaJpaController causaJPA = new CausaJpaController();
    
    DenuncianteJpaController denuncianteJPA = new DenuncianteJpaController();
    
    DetenidoJpaController detenidoJPA = new DetenidoJpaController();
    
    EstadoCivilJpaController estadoCivilJPA = new EstadoCivilJpaController();
    
    EstadoUsuarioJpaController estadoUsuarioJPA = new EstadoUsuarioJpaController();
    
    FiscaliaJpaController fiscaliaJPA = new FiscaliaJpaController();
    
    JuzgadoJpaController juzgadoJPA = new JuzgadoJpaController();
    
    NacionalidadJpaController nacionalidadJPA = new NacionalidadJpaController();
    PersonaJpaController personaJPA = new PersonaJpaController();
    
    PoliciaJpaController policiaJPA = new PoliciaJpaController();
    
    RegistroJpaController registroJPA = new RegistroJpaController();
    
    ReporteJpaController reporteJPA = new ReporteJpaController();
    
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    
    
    
    
    
    public void crearUsuario(Usuario usu) {
        usuarioJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
       return usuarioJPA.findUsuarioEntities();
    }

    public void crearPolicia(Policia policia) {
        policiaJPA.create(policia);
    }
     public List<Policia> getPolicias(){
         return policiaJPA.findPoliciaEntities();
     }
   
    public Policia buscarPoliciaLegajo(String legajo){
        return policiaJPA.buscarPorLegajo(legajo);
    }

    public Policia getPolicia(int policiaId) {
        
       return policiaJPA.findPolicia(policiaId);
    }
    
}
