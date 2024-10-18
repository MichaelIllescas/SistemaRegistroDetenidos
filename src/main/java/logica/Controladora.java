/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    public EstadoUsuario getEstadoPorId(int id) {
        return controlPersistencia.getEstadoPorId(id);
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

    public List<Policia> getPolicias() {
        return controlPersistencia.getPolicias();
    }

    public Policia buscarPoliciaLegajo(String legajo) {

        return controlPersistencia.buscarPoliciaLegajo(legajo);

    }

    public Policia getPolicia(int policiaId) {

        return controlPersistencia.getPolicia(policiaId);
    }

    public Usuario traerUsuarioPorUserYPass(String usuario, String clave) {
        List<Usuario> listaUsuarios = new ArrayList<>();
        listaUsuarios = controlPersistencia.getUsuarios();

        Usuario user = null;

        for (Usuario usu : listaUsuarios) {
            if (usu.getNombreUsuario().equals(usuario)) {
                if (usu.getClave().equals(clave)) {
                    user = usu;
                }
            }

        }

        return user;

    }

    public boolean validarUsuario(String usuario, String clave) {
        List<Usuario> listaUsuarios = new ArrayList<>();
        listaUsuarios = controlPersistencia.getUsuarios();

        boolean ingreso = false;

        for (Usuario usu : listaUsuarios) {
            if (usu.getNombreUsuario().equals(usuario)) {
                ingreso = Utilitaria.compareMD5(clave, usu.getClave());
            }

        }

        return ingreso;
    }

    public Usuario getUsuario(int id) {
        return controlPersistencia.getUsuario(id);
    }

    public void eliminarUsuario(int id) {
        try {
            Usuario usuario = controlPersistencia.getUsuario(id);
            EstadoUsuario estado = controlPersistencia.getEstadoPorId(2);
            usuario.setEstado(estado);

            controlPersistencia.editarUsuario(usuario);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void habilitarUsuario(int id) {
        try {
            Usuario usuario = controlPersistencia.getUsuario(id);
            EstadoUsuario estado = controlPersistencia.getEstadoPorId(1);
            usuario.setEstado(estado);
            controlPersistencia.editarUsuario(usuario);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editarUsuario(Usuario usu) {
        controlPersistencia.editarUsuario(usu);
    }

    public void crearRegistro(Registro registro) {
        controlPersistencia.crearRegistro(registro);
    }

    public void editarPolicia(Policia policia) {
        controlPersistencia.editPolicia(policia);
    }

    public List<Registro> getRegistros() {
        return controlPersistencia.getRegistros();
    }
     public List<Registro> getRegistrosActivos() {
        List<Registro> registrosTotales=controlPersistencia.getRegistros();
        List<Registro> registrosActivos=new ArrayList<>();
        
        for(Registro registro: registrosTotales){
            if(registro.getEstado()==true)
                registrosActivos.add(registro);
           
        
        }
          return registrosActivos;  
     }    

     

    public void eliminarRegistro(int idRegistro) {
        Registro registro = controlPersistencia.getRegistro(idRegistro);
        registro.setEstado(false);
        controlPersistencia.editarRegistro(registro);
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

    public Usuario resetClaveUsuario(Usuario usuario) {
        String claveReseteada = usuario.getPolicia().getDni();
        usuario.setClave(claveReseteada);
        return usuario;
    }

    public void habilitarPolicia(int id) {
        List<Usuario> listaUsuarios = controlPersistencia.getUsuarios();
        Policia policia = this.getPolicia(id);
        policia.setEstado(1);
        editarPolicia(policia); // Asegúrate de que esto guarda correctamente
        return; // No necesitas devolver el usuario si no es necesario

    }

    public void eliminarPolicia(int idPolicia) {
        Policia policia = this.getPolicia(idPolicia);
        policia.setEstado(0);
        editarPolicia(policia); // Asegúrate de que esto guarda correctamente

    }
    
     
public List<Registro> filtrarRegistrosPorFecha(List<Registro> registros, String fechaDesdeStr, String fechaHastaStr) {
    List<Registro> registrosFiltrados = new ArrayList<>();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    try {
        // Convertir las fechas de String a Date
        Date fechaDesde = sdf.parse(fechaDesdeStr);
        Date fechaHasta = sdf.parse(fechaHastaStr);

        for (Registro registro : registros) {
            Date fechaRegistro = registro.getFechaRegistro();
            if (fechaRegistro != null && !fechaRegistro.before(fechaDesde) && !fechaRegistro.after(fechaHasta)) {
                registrosFiltrados.add(registro);
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // Manejo de error
    }

    return registrosFiltrados;
}
     

    public List<Ocupacion> getOcupaciones(){
        return controlPersistencia.getOcupaciones();
    }

    public Ocupacion getOcupacion(int id){
        
        return controlPersistencia.getOcupacion(id);
    }
    
    
    public List<Sexo> getSexos(){
        return controlPersistencia.getSexos();
    }

    public Sexo getSexo(int idSexo) {
       return controlPersistencia.getSexo(idSexo);
    }

    public List<EstadoCivil> getEstadosCiviles() {
        return controlPersistencia.getEstadosCiviles();
    }

    public EstadoCivil getEstadocivil(int idEstadoCivil) {
        return controlPersistencia.getEstadoCivil(idEstadoCivil);
    }

    public List<Nacionalidad> getNacionalidades() {
        return controlPersistencia.getNacionalidades();
    }

   

    public Nacionalidad getNacionalidad(int idNacionalidad) {
        return controlPersistencia.getNacionalidad(idNacionalidad);
    }
    

}
