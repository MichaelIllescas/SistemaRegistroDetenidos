/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Detenido;
import logica.Policia;
import logica.Registro;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

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

    public Usuario getUsuario(int id) {
        return usuarioJPA.findUsuario(id);
    }

    public void eliminarUsuario(int id) {
   
        try {
            usuarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuarioJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarPolicia(int id) {
        try {
            policiaJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearRegistro(Registro registro) {
    
        registroJPA.create(registro);
    }

    public void editPolicia(Policia policia) {
        try {
            policiaJPA.edit(policia);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Registro> getRegistros() {
        return registroJPA.findRegistroEntities();
    }

    public void eliminarRegistro(int idRegistro) {
        try {
            registroJPA.destroy(idRegistro);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Registro getRegistro(int id) {
        return registroJPA.findRegistro(id);
    }

    public void editarRegistro(Registro registro) {
        try {
            registroJPA.edit(registro);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Detenido> getDetenidos() {
       return detenidoJPA.findDetenidoEntities();
    }

    public void editarDetenido(Detenido detenido) {
        try {
            detenidoJPA.edit(detenido);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }
    
}
