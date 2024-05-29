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
import logica.Denunciante;
import logica.Detenido;
import logica.EstadoCivil;
import logica.Fiscalia;
import logica.Juzgado;
import logica.Nacionalidad;
import logica.Registro;
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
        int id = Integer.parseInt((String)request.getParameter("id"));
        int idDetenido = Integer.parseInt(request.getParameter("idDetenido"));

        Registro registroAeditar = controladora.getRegistro(id);

        sesion.setAttribute("registroAeditar", registroAeditar);
        sesion.setAttribute("idDetenido", idDetenido);
        response.sendRedirect("editarRegistro.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int idDetenido = (int) request.getSession().getAttribute("idDetenido");
        Registro registroAeditar = (Registro) request.getSession().getAttribute("registroAeditar");

        Detenido detenido = Utilitaria.buscarDetenidoPorId(  registroAeditar.getCausa().getDetenidos(), idDetenido);
          
      
                
        detenido.setNombre(request.getParameter("nombre"));
        detenido.setApellido(request.getParameter("apellido"));
        detenido.setDni(request.getParameter("dni"));
        detenido.setDireccion(request.getParameter("direccion"));
        detenido.setTelefono(request.getParameter("telefono"));
        detenido.setApodo(request.getParameter("apodo"));
        detenido.setOcupacion(request.getParameter("ocupacion"));
        detenido.setSexo(request.getParameter("sexo"));
        detenido.setInstuccion(request.getParameter("instruccion"));
        detenido.setCalidad(request.getParameter("calidad"));

      
        
        Nacionalidad nacionalidad = detenido.getNacionalidad();
        nacionalidad.setDescipcion(request.getParameter("nacionalidad"));
        Date fechaNac = Utilitaria.convertStringToDate(request.getParameter("fechaNac"), "yyyy-MM-dd");

        detenido.getEstadoCivil().setDescipcion(request.getParameter("estadoCivil"));
        detenido.getNacionalidad().setDescipcion(request.getParameter("nacionalidad"));
        detenido.setFechaNacimiento(fechaNac);

        Causa causa = registroAeditar.getCausa();
        causa.setNumeroCausa(request.getParameter("nroCausa"));
        causa.setDescripcion(request.getParameter("caratula"));

        Fiscalia fiscalia = causa.getFiscalia();
        fiscalia.setTitular(request.getParameter("fiscal"));
        fiscalia.setDescripcion(request.getParameter("nroFiscalia") + " Depto Judicial: " + request.getParameter("deptoJudicial"));
        Defensoria defensoria = causa.getDefensoria();
        defensoria.setDescripcion(request.getParameter("defensoria"));
        Juzgado juzgado = causa.getJuzgado();
        juzgado.setDescripcion(request.getParameter("juzgado") + ", " + request.getParameter("deptoJudicial"));
        juzgado.setTitular(request.getParameter("juez"));

        causa.setDefensoria(defensoria);
        causa.setFiscalia(fiscalia);
        causa.setJuzgado(juzgado);

        List<Detenido> detenidos = causa.getDetenidos();
        Utilitaria.reemplazarDetenidoPorId(detenidos, detenido);
        causa.setDetenidos(detenidos);
        causa.setDepartamentoJudicial(request.getParameter("deptoJudicial"));

        detenido.setFechaIngreso(Utilitaria.convertStringToDate(request.getParameter("fechaIngreso"), "yyyy-MM-dd"));
        detenido.setFechaEgreso(Utilitaria.convertStringToDate(request.getParameter("fechaEgerso"), "yyyy-MM-dd"));

      
        Denunciante denunciante = Utilitaria.buscarDenunciantePorId(  registroAeditar.getCausa().getDenunciantes(), idDetenido);
          
        denunciante.setNombre(request.getParameter("nombreDte"));
        denunciante.setApellido(request.getParameter("apellidoDte"));
        denunciante.setDni(request.getParameter("dniDte"));
        denunciante.setDireccion(request.getParameter("direccionDte"));
        denunciante.setTelefono(request.getParameter("telefonoDte"));

        denunciante.setFechaNacimiento(Utilitaria.convertStringToDate(request.getParameter("fechaNacDte"), "yyyy-MM-dd"));

        List<Denunciante> denunciantes = causa.getDenunciantes();

      Utilitaria.reemplazarDenunciantePorId(denunciantes, denunciante);
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
