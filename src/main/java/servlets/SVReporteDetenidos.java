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

        String fechaDesde = request.getParameter("fechaDesde");
        String fechaHasta = request.getParameter("fechaHasta");

        List<Registro> registros = controladora.getRegistros();
        registros = controladora.filtrarRegistrosPorFecha(registros, fechaDesde, fechaHasta);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("fechaDesdeDate", Utilitaria.convertStringToDate(fechaDesde, "yyyy-MM-dd"));
        sesion.setAttribute("fechaHastaDate", Utilitaria.convertStringToDate(fechaHasta, "yyyy-MM-dd"));

        for (Registro reg : registros) {
            System.out.println(reg.getId());
        }

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
