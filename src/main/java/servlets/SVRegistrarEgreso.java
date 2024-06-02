
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Detenido;
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVRegistrarEgreso", urlPatterns = {"/SVRegistrarEgreso"})
public class SVRegistrarEgreso extends HttpServlet {

    Controladora controladora=new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         List<Detenido>detenidos=controladora.getDetenidos();
        HttpSession sesion= request.getSession();
        sesion.setAttribute("detenidos", detenidos);
        response.sendRedirect("registrarEgreso.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
         Date fechaEgreso=Utilitaria.convertStringToDate(request.getParameter("fechaEgreso"), "yyyy-MM-dd");
         int idDetenido= Integer.parseInt(request.getParameter("detenido"));
          List<Detenido>detenidos=controladora.getDetenidos();
        Detenido detenido= Utilitaria.buscarDetenidoPorId(detenidos, idDetenido);
        detenido.setFechaEgreso(fechaEgreso);
        controladora.editarDetenido(detenido);
        response.sendRedirect("SVVerDetenidos");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
