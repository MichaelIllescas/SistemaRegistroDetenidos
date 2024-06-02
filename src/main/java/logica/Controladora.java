/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.ArrayList;
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

    public Usuario traerUsuarioPorUserYPass(String usuario, String clave) {
           List<Usuario> listaUsuarios= new ArrayList<>();
        listaUsuarios= controlPersistencia.getUsuarios();
        
        Usuario user=null;
        
        for(Usuario usu: listaUsuarios){
            if (usu.getNombreUsuario().equals(usuario))
            {
                if(usu.getClave().equals(clave))
                {
                     user=usu;
                }
            }
 
        }

         return user;
    
    }
        
        
    
        public boolean validarUsuario(String usuario, String clave) {
        List<Usuario> listaUsuarios= new ArrayList<>();
        listaUsuarios= controlPersistencia.getUsuarios();
        
        boolean ingreso=false;
        
        for(Usuario usu: listaUsuarios){
            if (usu.getNombreUsuario().equals(usuario))
            {
                ingreso = Utilitaria.compareMD5(clave,usu.getClave());
            }
 
        }

         return ingreso;
    }

    public Usuario getUsuario(int id) {
         return controlPersistencia.getUsuario(id);
    }

    public void eliminarUsuario(int id) {
        try {
            controlPersistencia.eliminarUsuario(id);
        } catch (Exception e) {
           e.printStackTrace();
        }
    }

 
    public void editarUsuario(Usuario usu) {
        controlPersistencia.editarUsuario(usu);
    }

    public Usuario eliminarPolicia(int id) {
          
        List<Usuario> listaUsuarios= controlPersistencia.getUsuarios();
        for(Usuario usu:listaUsuarios){
            if(  usu.getPolicia()!= null && usu.getPolicia().getId()==id){
            return usu;
            
            }
        }
        
       controlPersistencia.eliminarPolicia(id);
       return null;
    }

    public void crearRegistro(Registro registro) {
       controlPersistencia.crearRegistro(registro);
    }

    public void editarPolicia(Policia policia) {
        controlPersistencia.editPolicia(policia);
    }

    public List <Registro> getRegistros() {
       return controlPersistencia.getRegistros();
    }

    public void eliminarRegistro(int idRegistro) {
       controlPersistencia.eliminarRegistro(idRegistro);
    }

    public Registro getRegistro(int id) {
        return controlPersistencia.getRegistro(id);
    }

    public void editarRegistro(Registro registro) {
       controlPersistencia.editarRegistro(registro); 
    }

    public List<Detenido> getDetenidos() {
    
        return controlPersistencia.getDetenidos();
    }

    public void editarDetenido(Detenido detenido) {
        controlPersistencia.editarDetenido(detenido);
    }
   

}
