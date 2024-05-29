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
import logica.EstadoUsuario;
import logica.Policia;
import logica.Usuario;
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVCrearUsuario", urlPatterns = {"/SVCrearUsuario"})
public class SVCrearUsuario extends HttpServlet {

    Controladora controladora =new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
         HttpSession session=request.getSession();

       
        String nombreUsuario= (String) request.getParameter("nomusu");
        String clave= Utilitaria.MD5((String) request.getParameter("contras"));
        String rol= (String) request.getParameter("rol");
        
       String polnId=(String)request.getParameter("policia");
       Policia policia= (Policia)controladora.getPolicia(Integer.parseInt(polnId));
       
       
        Usuario usuario =new Usuario(0, nombreUsuario, rol, clave, null,policia);
 
        
        controladora.creaUsuario(usuario);
       
      response.sendRedirect("SvUsuarios");
       
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
