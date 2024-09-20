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

}
