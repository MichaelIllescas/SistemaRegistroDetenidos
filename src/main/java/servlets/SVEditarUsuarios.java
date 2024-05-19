
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Policia;
import logica.Usuario;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVEditarUsuarios", urlPatterns = {"/SVEditarUsuarios"})
public class SVEditarUsuarios extends HttpServlet {

    Controladora controladora = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
               int id = Integer.parseInt(request.getParameter("id"));
           Usuario usu= controladora.getUsuario(id);
           
           HttpSession miSession= request.getSession();
           
           miSession.setAttribute("usuEditar", usu);
           List <Policia> policias =controladora.getPolicias();
           miSession.setAttribute("policias", policias);

        
   
           response.sendRedirect("editarUsuario.jsp"); 
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
        String nombreUsuario=request.getParameter("nomusu");
        String clave=request.getParameter("contras");
        String rol=request.getParameter("rol");
        
        Usuario usu= (Usuario) request.getSession().getAttribute("usuEditar");
        
        usu.setClave(clave);
        usu.setNombreUsuario(nombreUsuario);
        usu.setRol(rol);
        
        controladora.editarUsuario(usu);
        response.sendRedirect("SvUsuarios");
        
        
        
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
