package servlets;

import java.io.IOException;

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
@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora controladora = new Controladora();

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

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("password");
        Usuario user = controladora.traerUsuarioPorUserYPass(usuario, clave);
        String visiblidad;

        boolean validacion = false;

        validacion = controladora.validarUsuario(usuario, clave);

        if (validacion == true) {
            HttpSession miSession = request.getSession(true);
            miSession.setAttribute("usuario", usuario);
            miSession.setAttribute("user", user);
            if (user.getRol().equalsIgnoreCase("administrador")) {
                visiblidad = "true";
            } else {

                visiblidad = "none";
            }
            miSession.setAttribute("visiblidad", visiblidad);

            response.sendRedirect("index.jsp");

        } else {

            response.sendRedirect("loginError.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

 

}
