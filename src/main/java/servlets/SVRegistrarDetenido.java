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
@WebServlet(name = "SVRegistrarDetenido", urlPatterns = {"/SVRegistrarDetenido"})
public class SVRegistrarDetenido extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        List<Ocupacion> ocupaciones = controladora.getOcupaciones();
        List<Sexo> sexos = controladora.getSexos();
        List<EstadoCivil> estadosCiviles = controladora.getEstadosCiviles();
        List<Nacionalidad> nacionalidades = controladora.getNacionalidades();
        List<Juzgado> juzgados = controladora.getJuzgados();
        List<Fiscalia> fiscalias = controladora.getFiscalias();
        List<Defensoria> defensorias = controladora.getDefensorias();
        List<Delito> delitos = controladora.getDelitos();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("ocupaciones", ocupaciones);
        sesion.setAttribute("sexos", sexos);
        sesion.setAttribute("estadosCiviles", estadosCiviles);
        sesion.setAttribute("nacionalidades", nacionalidades);
        sesion.setAttribute("juzgados", juzgados);
        sesion.setAttribute("fiscalias", fiscalias);
        sesion.setAttribute("defensorias", defensorias);
        sesion.setAttribute("delitos", delitos);

        response.sendRedirect("registrarDetenido.jsp");

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

        int idOcupacion = Integer.parseInt(request.getParameter("ocupacion"));
        detenido.setOcupacion(controladora.getOcupacion(idOcupacion));
        int idSexo = Integer.parseInt(request.getParameter("sexo"));
        Sexo sexoDetenido = controladora.getSexo(idSexo);
        detenido.setSexo(sexoDetenido);
        detenido.setInstuccion(request.getParameter("instruccion"));
        detenido.setCalidad(request.getParameter("calidad"));

        int idEstadoCivil = Integer.parseInt(request.getParameter("estadoCivil"));
        EstadoCivil estadoCivil = controladora.getEstadocivil(idEstadoCivil);
        detenido.setEstadoCivil(estadoCivil);

        
        int idNacionalidad =Integer.parseInt(request.getParameter("nacionalidad"));
        Nacionalidad nacionalidad = controladora.getNacionalidad(idNacionalidad);
        detenido.setNacionalidad(nacionalidad);
        
        Date fechaNac = Utilitaria.convertStringToDate(request.getParameter("fechaNac"), "yyyy-MM-dd");

        detenido.setFechaNacimiento(fechaNac);

        Causa causa = new Causa();
        causa.setNumeroCausa(request.getParameter("nroCausa"));
        int idDelito=Integer.parseInt(request.getParameter("delito"));
        Delito delito = controladora.getDelitoPorId(idDelito);
        causa.setDelito(delito);

        
        int idFiscalia =Integer.parseInt(request.getParameter("ficalia"));
        Fiscalia fiscalia = controladora.getFiscalia(idFiscalia);
        causa.setFiscalia(fiscalia);
        
        
        int idDefensoria= Integer.parseInt(request.getParameter("defensoria"));
        Defensoria defensoria = controladora.getDefensoria(idDefensoria);
        causa.setDefensoria(defensoria);
        
        int idJuzgado=Integer.parseInt(request.getParameter("juez"));
        Juzgado juzgado = controladora.getJuzgado(idJuzgado); 
        causa.setJuzgado(juzgado);

        List<Detenido> detenidos = new ArrayList<>();
        detenidos.add(detenido);
        causa.setDetenidos(detenidos);
        causa.setDepartamentoJudicial("Trenque Lauquen");

        detenido.setFechaIngreso(Utilitaria.convertStringToDate(request.getParameter("fechaIngreso"), "yyyy-MM-dd"));
        detenido.setFechaEgreso(Utilitaria.convertStringToDate(request.getParameter("fechaEgerso"), "yyyy-MM-dd"));

        String nombre = request.getParameter("nombreDte");
String apellido = request.getParameter("apellidoDte");
String dni = request.getParameter("dniDte");

if (nombre != null && !nombre.isEmpty() &&
    apellido != null && !apellido.isEmpty() &&
    dni != null && !dni.isEmpty()) {

    Denunciante denunciante = new Denunciante();
    denunciante.setNombre(nombre);
    denunciante.setApellido(apellido);
    denunciante.setDni(dni);
    denunciante.setDireccion(request.getParameter("direccionDte"));
    denunciante.setTelefono(request.getParameter("telefonoDte"));
    denunciante.setFechaNacimiento(Utilitaria.convertStringToDate(request.getParameter("fechaNacDte"), "yyyy-MM-dd"));

    List<Denunciante> denunciantes = new ArrayList<>();
    denunciantes.add(denunciante);
    causa.setDenunciantes(denunciantes);

} else {
    causa.setDenunciantes(null); // O bien, otra lógica en caso de que no se creen denunciantes.
}

        
        Registro registro = new Registro();
        HttpSession session = request.getSession();
        String fechaActual = LocalDate.now().toString();

        registro.setCausa(causa);
        registro.setUsuario((Usuario) session.getAttribute("user"));
        registro.setFechaRegistro(Utilitaria.convertStringToDate(fechaActual, "yyyy-MM-dd"));
        String observaciones = (String) request.getParameter("observaciones");
        registro.setObservaciones(observaciones);
        registro.setEstado(true);

        controladora.crearRegistro(registro);

        response.sendRedirect("SVVerDetenidos");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
