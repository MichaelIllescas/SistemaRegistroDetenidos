
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
@WebServlet(name = "SVRegistrarDetenido", urlPatterns = {"/SVRegistrarDetenido"})
public class SVRegistrarDetenido extends HttpServlet {

    Controladora controladora =new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       
        Detenido detenido = new Detenido();
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
        
        
        EstadoCivil estadoCivil = new EstadoCivil();
        estadoCivil.setDescipcion(request.getParameter("estadoCivil"));
        Nacionalidad nacionalidad = new Nacionalidad();
        nacionalidad.setDescipcion(request.getParameter("nacionalidad"));
        Date fechaNac=Utilitaria.convertStringToDate(request.getParameter("fechaNac"), "yyyy-MM-dd");

        
        detenido.setEstadoCivil(estadoCivil);
        detenido.setNacionalidad(nacionalidad);
       detenido.setFechaNacimiento(fechaNac);
        
        Causa causa= new Causa();
        causa.setNumeroCausa(request.getParameter("nroCausa"));
        causa.setDescripcion(request.getParameter("caratula"));
        
        
        Fiscalia fiscalia=new Fiscalia();
        fiscalia.setTitular(request.getParameter("fiscal"));
        fiscalia.setDescripcion(request.getParameter("nroFiscalia") + " Depto Judicial: "+ request.getParameter("deptoJudicial"));
        Defensoria defensoria =new Defensoria();
        defensoria.setDescripcion(request.getParameter("defensoria"));
        Juzgado juzgado =new Juzgado();
        juzgado.setDescripcion(request.getParameter("juzgado") );
        juzgado.setTitular(request.getParameter("juez"));
        
        causa.setDefensoria(defensoria);
        causa.setFiscalia(fiscalia);
        causa.setJuzgado(juzgado);
        
        List<Detenido> detenidos=new ArrayList<>();
        detenidos.add(detenido);
        causa.setDetenidos(detenidos);
        causa.setDepartamentoJudicial(request.getParameter("deptoJudicial"));
        
       detenido.setFechaIngreso(Utilitaria.convertStringToDate(request.getParameter("fechaIngreso"), "yyyy-MM-dd"));
       detenido.setFechaEgreso(Utilitaria.convertStringToDate(request.getParameter("fechaEgerso"), "yyyy-MM-dd"));
       
       
       Denunciante denunciante =new Denunciante();
       denunciante.setNombre(request.getParameter("nombreDte"));
       denunciante.setApellido(request.getParameter("apellidoDte"));
       denunciante.setDni(request.getParameter("dniDte"));
       denunciante.setDireccion(request.getParameter("direccionDte"));
       denunciante.setTelefono(request.getParameter("telefonoDte"));
       
       
       denunciante.setFechaNacimiento(Utilitaria.convertStringToDate(request.getParameter("fechaNacDte"), "yyyy-MM-dd"));
      
        List<Denunciante> denunciantes=new ArrayList<>();
    
        denunciantes.add(denunciante);
        causa.setDenunciantes(denunciantes);
                
        Registro registro = new Registro();
        HttpSession session=request.getSession();
        String fechaActual = LocalDate.now().toString();
        
        registro.setCausa(causa);
        registro.setUsuario((Usuario) session.getAttribute("user"));
       registro.setFechaRegistro(Utilitaria.convertStringToDate(fechaActual, "yyyy-MM-dd"));
       String observaciones= (String) request.getParameter("observaciones");
       registro.setObservaciones(observaciones);
        
        controladora.crearRegistro(registro);
        
        response.sendRedirect("SVVerDetenidos");
        
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
