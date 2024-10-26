
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ReporteEstadistico;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVReporteEstadistico", urlPatterns = {"/SVReporteEstadistico"})
public class SVReporteEstadistico extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
         // Datos de ejemplo para el gráfico
        Map<String, Integer> detenidosPorDelito = new HashMap<>();
        detenidosPorDelito.put("Robo", 10);
        detenidosPorDelito.put("Hurto", 7);
        detenidosPorDelito.put("Asalto", 15);
        detenidosPorDelito.put("Fraude", 5);

        // Generar el gráfico como una cadena base64
        String graficoBase64 = ReporteEstadistico.generarGraficoTortaBase64(detenidosPorDelito);

        // Pasar la cadena base64 al JSP como atributo
        request.setAttribute("graficoTorta", graficoBase64);

        // Redirigir al JSP
        request.getRequestDispatcher("/reporteEstadistico.jsp").forward(request, response);
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
