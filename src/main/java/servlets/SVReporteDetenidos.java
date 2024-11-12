/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.google.protobuf.TextFormat.ParseException;
import java.awt.BorderLayout;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Causa;
import logica.Controladora;
import logica.Detenido;
import logica.ExcelExporter;
import logica.Registro;
import logica.Utilitaria;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eclipse.persistence.expressions.ExpressionOperator;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVReporteDetenidos", urlPatterns = {"/SVReporteDetenidos"})
public class SVReporteDetenidos extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String fechaDesdeStr = request.getParameter("fechaDesde");
        String fechaHastaStr = request.getParameter("fechaHasta");
        
        
        
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDesde = null;
        Date fechaHasta = null;
        
         if (fechaDesdeStr != null && fechaHastaStr != null) {
            try {
                fechaDesde = sdf.parse(fechaDesdeStr);
                fechaHasta = sdf.parse(fechaHastaStr);
                if (fechaDesde.after(fechaHasta)) {
                request.getSession().setAttribute("errorFecha", "La fecha 'Desde' debe ser anterior a la fecha 'Hasta'.");
                // Opcionalmente, redirigir o reenviar la solicitud a la misma página
                response.sendRedirect("crearReporte.jsp");
                return; // Salir del método
                }
                
                
            } catch (java.text.ParseException ex) {
                Logger.getLogger(SVReporteDetenidos.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            }
        
        
        
        
        

        List<Registro> registros = controladora.getRegistros();
        registros = controladora.filtrarRegistrosPorFecha(registros, fechaDesdeStr, fechaHastaStr);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("fechaDesdeDate", Utilitaria.convertStringToDate(fechaDesdeStr, "yyyy-MM-dd"));
        sesion.setAttribute("fechaHastaDate", Utilitaria.convertStringToDate(fechaHastaStr, "yyyy-MM-dd"));

     

        sesion.setAttribute("registros", registros);
        response.sendRedirect("verReporteRequerimiento.jsp");
    }

    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Registro> registros = (List<Registro>) request.getSession().getAttribute("registros");

        try {
            

            // Llamar al método que genera y descarga el Excel
            ExcelExporter.exportarRegistrosAExcel(registros, response);
        } catch (Exception e) {
            e.printStackTrace(); // Para depuración
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generando el reporte.");
        } finally {

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
