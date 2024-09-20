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
import logica.Controladora;
import logica.Usuario;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVEliminarUsuarios", urlPatterns = {"/SVEliminarUsuarios"})
public class SVEliminarUsuarios extends HttpServlet {

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
        Usuario usuario= controladora.getUsuario(Integer.parseInt((String)request.getParameter("id")));
        if(usuario.getEstado().getId()==2){
        controladora.habilitarUsuario(Integer.parseInt((String)request.getParameter("id")));
        }else{
        controladora.eliminarUsuario(Integer.parseInt((String)request.getParameter("id")));
       
        }
         response.sendRedirect("SvUsuarios");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
