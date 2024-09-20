
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Policia;
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVCrearPolicia", urlPatterns = {"/SVCrearPolicia"})
public class SVCrearPolicia extends HttpServlet {

    Controladora controladora=new Controladora();

  
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
         HttpSession misession=request.getSession();
        
        Policia policia = new Policia();
        String nombre= (String) request.getParameter("nombrepol");
        String apellido= (String) request.getParameter("apellidopol");
        String legajo= (String)request.getParameter("legajo");
        String jerarquia = (String) request.getParameter("jerarquia");
        String dni= (String) request.getParameter("dni");
        String telefono= (String) request.getParameter("telefono");
        
        policia.setNombre(nombre);
        policia.setApellido(apellido);
        policia.setLegajo(legajo);
        policia.setJerarquia(jerarquia);
        policia.setDni(dni);
        policia.setEstado(1);
        policia.setTelefono(telefono);
        String errorCrearPolicia=Utilitaria.verificarPoliciaRegistrado(policia);
        System.out.println("pl:" + errorCrearPolicia);
        if(errorCrearPolicia==null){
         controladora.crearPolicia(policia);
         misession.removeAttribute("errorRegistroPolicia");
        response.sendRedirect("SVVerPolicias");
        
        }
        else{
        
         misession.setAttribute("errorRegistroPolicia", errorCrearPolicia);
         response.sendRedirect("crearPolicia.jsp");
        }
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
