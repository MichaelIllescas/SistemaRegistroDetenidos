/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Causa;
import logica.Controladora;
import logica.Defensoria;
import logica.Delito;
import logica.Denunciante;
import logica.Detenido;
import logica.EstadoCivil;
import logica.Fiscalia;
import logica.Juzgado;
import logica.Nacionalidad;
import logica.Ocupacion;
import logica.Registro;
import logica.Sexo;
import logica.Usuario;
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVEditarRegistro", urlPatterns = {"/SVEditarRegistro"})
public class SVEditarRegistro extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession sesion = request.getSession();
        int idRegistroAEditar = Integer.parseInt((String) request.getParameter("id"));
        int idDetenido = Integer.parseInt(request.getParameter("idDetenido"));

        Registro registroAeditar = controladora.getRegistro(idRegistroAEditar);

        sesion.setAttribute("registroAeditar", registroAeditar);
        sesion.setAttribute("idDetenido", idDetenido);

        List<Ocupacion> ocupaciones = controladora.getOcupaciones();
        List<Sexo> sexos = controladora.getSexos();
        List<EstadoCivil> estadosCiviles = controladora.getEstadosCiviles();
        List<Nacionalidad> nacionalidades = controladora.getNacionalidades();
        List<Juzgado> juzgados = controladora.getJuzgados();
        List<Fiscalia> fiscalias = controladora.getFiscalias();
        List<Defensoria> defensorias = controladora.getDefensorias();
        List<Delito> delitos = controladora.getDelitos();

        sesion.setAttribute("ocupaciones", ocupaciones);
        sesion.setAttribute("sexos", sexos);
        sesion.setAttribute("estadosCiviles", estadosCiviles);
        sesion.setAttribute("nacionalidades", nacionalidades);
        sesion.setAttribute("juzgados", juzgados);
        sesion.setAttribute("fiscalias", fiscalias);
        sesion.setAttribute("defensorias", defensorias);
        sesion.setAttribute("delitos", delitos);

        response.sendRedirect("editarRegistro.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int idDetenido = (int) request.getSession().getAttribute("idDetenido");
        Registro registroAeditar = (Registro) request.getSession().getAttribute("registroAeditar");

        Detenido detenido = Utilitaria.buscarDetenidoPorId(registroAeditar.getCausa().getDetenidos(), idDetenido);

        detenido.setNombre(request.getParameter("nombre"));
        detenido.setApellido(request.getParameter("apellido"));
        detenido.setDni(request.getParameter("dni"));
        detenido.setDireccion(request.getParameter("direccion"));
        detenido.setTelefono(request.getParameter("telefono"));
        detenido.setApodo(request.getParameter("apodo"));
        detenido.getOcupacion().setDescripcion(request.getParameter("ocupacion"));

        int idSexo = Integer.parseInt(request.getParameter("sexo"));
        Sexo sexoDetenido = controladora.getSexo(idSexo);
        detenido.setSexo(sexoDetenido);
        detenido.setInstuccion(request.getParameter("instruccion"));
        detenido.setCalidad(request.getParameter("calidad"));

        int idNacionalidad = Integer.parseInt(request.getParameter("nacionalidad"));
        Nacionalidad nacionalidad = controladora.getNacionalidad(idNacionalidad);
        detenido.setNacionalidad(nacionalidad);

        Date fechaNac = Utilitaria.convertStringToDate(request.getParameter("fechaNac"), "yyyy-MM-dd");

        int idEstadoCivil = Integer.parseInt(request.getParameter("estadoCivil"));
        EstadoCivil estadoCivil = controladora.getEstadocivil(idEstadoCivil);
        detenido.setEstadoCivil(estadoCivil);

        detenido.setFechaNacimiento(fechaNac);

        Causa causa = registroAeditar.getCausa();
        causa.setNumeroCausa(request.getParameter("nroCausa"));
       
        int idDelito=Integer.parseInt(request.getParameter("delito"));
        Delito delito = controladora.getDelitoPorId(idDelito);
        causa.setDelito(delito);


        int idFiscalia = Integer.parseInt(request.getParameter("fiscalia"));
        Fiscalia fiscalia = controladora.getFiscalia(idFiscalia);
        causa.setFiscalia(fiscalia);

        int idDefensoria = Integer.parseInt(request.getParameter("defensoria"));
        Defensoria defensoria = controladora.getDefensoria(idFiscalia);
        causa.setDefensoria(defensoria);

        int idJuzgado = Integer.parseInt(request.getParameter("juzgado"));
        Juzgado juzgado = controladora.getJuzgado(idJuzgado);
        causa.setJuzgado(juzgado);

        List<Detenido> detenidos = causa.getDetenidos();
        Utilitaria.reemplazarDetenidoPorId(detenidos, detenido);
        causa.setDetenidos(detenidos);
        causa.setDepartamentoJudicial("Trenque Lauquen");

        detenido.setFechaIngreso(Utilitaria.convertStringToDate(request.getParameter("fechaIngreso"), "yyyy-MM-dd"));
        detenido.setFechaEgreso(Utilitaria.convertStringToDate(request.getParameter("fechaEgerso"), "yyyy-MM-dd"));

        // Obtener la lista de denunciantes
        List<Denunciante> denunciantes = registroAeditar.getCausa().getDenunciantes();

// Si la lista de denunciantes es nula, inicializarla
        if (denunciantes == null) {
            denunciantes = new ArrayList<>();
        }

// Buscar el denunciante por dni
        String dniDte = request.getParameter("dniDte");
        Denunciante denunciante = Utilitaria.buscarDenunciantePorDni(registroAeditar.getCausa().getDenunciantes(), dniDte);

// Si el denunciante no existe, crearlo
        if (denunciante == null) {
            denunciante = new Denunciante();
            // Configurar el ID del denunciante si es necesario (según la lógica de tu aplicación)
            denunciante.setId(idDetenido);
            // Agregar el denunciante a la lista
            denunciantes.add(denunciante);
        }

// Actualizar los campos del denunciante con los datos del request
        denunciante.setNombre(request.getParameter("nombreDte"));
        denunciante.setApellido(request.getParameter("apellidoDte"));
        denunciante.setDni(request.getParameter("dniDte"));
        denunciante.setDireccion(request.getParameter("direccionDte"));
        denunciante.setTelefono(request.getParameter("telefonoDte"));
        denunciante.setFechaNacimiento(Utilitaria.convertStringToDate(request.getParameter("fechaNacDte"), "yyyy-MM-dd"));

// Reemplazar el denunciante por ID si es necesario (puedes omitir esta línea si ya agregaste el denunciante)
        Utilitaria.reemplazarDenunciantePorId(denunciantes, denunciante);

// Establecer la lista de denunciantes actualizada en la causa
        causa.setDenunciantes(denunciantes);

        HttpSession session = request.getSession();
        String fechaActual = LocalDate.now().toString();

        registroAeditar.setCausa(causa);
        registroAeditar.setUsuario((Usuario) session.getAttribute("user"));
        registroAeditar.setFechaRegistro(Utilitaria.convertStringToDate(fechaActual, "yyyy-MM-dd"));
        String observaciones = (String) request.getParameter("observaciones");
        registroAeditar.setObservaciones(observaciones);

        controladora.editarRegistro(registroAeditar);

        response.sendRedirect("SVVerDetenidos");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
