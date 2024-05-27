/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVDetalleRegistro", urlPatterns = {"/SVDetalleRegistro"})
public class SVDetalleRegistro extends HttpServlet {

    Controladora controladora=new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
       
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         int idRegistro= Integer.parseInt(request.getParameter("id"));
         int idDetenido= Integer.parseInt(request.getParameter("idDetenido"));
        
        HttpSession sesion= request.getSession();
        sesion.setAttribute("registroDetalle", controladora.getRegistro(idRegistro));
        sesion.setAttribute("detalleDetenido", Utilitaria.buscarDetenidoPorId(controladora.getRegistro(idRegistro).getCausa().getDetenidos(), idDetenido));
        sesion.setAttribute("detalleDenunciante", Utilitaria.buscarDenunciantePorId(controladora.getRegistro(idRegistro).getCausa().getDenunciantes(), idDetenido));
        
        response.sendRedirect("detalleRegistro.jsp");
        
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
