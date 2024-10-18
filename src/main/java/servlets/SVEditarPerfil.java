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
import logica.Usuario;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVEditarPerfil", urlPatterns = {"/SVEditarPerfil"})
public class SVEditarPerfil extends HttpServlet {
    Controladora controladora= new Controladora();
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.sendRedirect("editarPerfil.jsp");
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String telefono=request.getParameter("telefono");
        String dni=request.getParameter("dni");
        String jerarquia=request.getParameter("jerarquia");
        String legajo=request.getParameter("legajo");
        HttpSession sesion= request.getSession();
        Usuario usuario= (Usuario)sesion.getAttribute("user");
        usuario.getPolicia().setNombre(nombre);
        usuario.getPolicia().setApellido(apellido);
        usuario.getPolicia().setTelefono(telefono);
        usuario.getPolicia().setDni(dni);
        usuario.getPolicia().setJerarquia(jerarquia);
        usuario.getPolicia().setLegajo(legajo);
        controladora.editarUsuario(usuario);
        response.sendRedirect("verPerfil.jsp");
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
