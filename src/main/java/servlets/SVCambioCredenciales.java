/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import logica.Usuario;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVCambioCredenciales", urlPatterns = {"/SVCambioCredenciales"})
public class SVCambioCredenciales extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.sendRedirect("cambioCredenciales.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String usuario = (String) request.getAttribute("usuario");
        String clave = request.getParameter("password");
        String claveRepeat = request.getParameter("passwordRepeat");

        HttpSession miSession = request.getSession();
        Usuario usu = (Usuario) miSession.getAttribute("user");

       

        if(clave.equals(claveRepeat)){
            usu.setClave(clave);     
            usu.setContador(usu.getContador() + 1);
            controladora.editarUsuario(usu);
            response.sendRedirect("login.jsp");

        }else{  
            miSession.setAttribute("mensaje", "visible");
            response.sendRedirect("SVCambioCredenciales");
        }
      
        
       

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
