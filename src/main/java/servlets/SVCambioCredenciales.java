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
import logica.Utilitaria;

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
        HttpSession miSession=request.getSession();
        miSession.removeAttribute("mensaje"); // O establecer a null
        response.sendRedirect("cambioCredenciales.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String clave = request.getParameter("password");
        String claveRepeat = request.getParameter("passwordRepeat");
        HttpSession miSession = request.getSession();
        Usuario usu = (Usuario) miSession.getAttribute("user");
        miSession.removeAttribute("mensaje"); // O establecer a null
        // Validación de la contraseña
        String mensajeError = Utilitaria.validarContrasena(clave);
        if (!mensajeError.isEmpty()) {
            miSession.setAttribute("mensaje", mensajeError);
            // Usar RequestDispatcher para redirigir
            request.getRequestDispatcher("cambioCredenciales.jsp").forward(request, response);
            return; // Salir después de redirigir
        }

        // Verificación de las contraseñas repetidas
        String verificarClavesRepeat = Utilitaria.validarClaves(clave, claveRepeat);
        if (!verificarClavesRepeat.isEmpty()) {
            miSession.setAttribute("mensaje", verificarClavesRepeat);
            // Usar RequestDispatcher para redirigir
            request.getRequestDispatcher("cambioCredenciales.jsp").forward(request, response);
            return; // Salir después de redirigir
        }

        // Si todo está bien, actualiza la contraseña
        clave = Utilitaria.MD5(clave);
        usu.setClave(clave);
        usu.setContador(usu.getContador() + 1);
        controladora.editarUsuario(usu);
        // Redirigir a la página de inicio de sesión
        miSession.removeAttribute("mensaje"); // O establecer a null
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
