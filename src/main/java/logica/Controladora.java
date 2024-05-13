/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.List;
import persistencia.ControladoraPersistencia;

/**
 *
 * @author jonii
 */
public class Controladora {

    ControladoraPersistencia controlPersistencia = new ControladoraPersistencia();

    public Controladora() {
    }


    public List<Usuario> getUsuarios() {
       return controlPersistencia.getUsuarios();
    }

    public void creaUsuario(Usuario name) {
      
               
        controlPersistencia.crearUsuario(name);
    }

    public void crearPolicia(Policia policia) {
        controlPersistencia.crearPolicia(policia);
    }

    public List<Policia>getPolicias(){
        return controlPersistencia.getPolicias();
    }
    public Policia buscarPoliciaLegajo(String legajo){
    
        return controlPersistencia.buscarPoliciaLegajo(legajo);
        
    }

    public Policia getPolicia(int policiaId) {
       
        return controlPersistencia.getPolicia(policiaId);
    }
   

}
