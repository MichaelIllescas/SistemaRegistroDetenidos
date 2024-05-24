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
        Usuario userObjet= controladora.traerUsuarioPorUserYPass(usuario, clave);
        String visiblidad;

        boolean validacionIngreso = false;

        validacionIngreso = controladora.validarUsuario(usuario, clave);
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("usuario", usuario);
        miSession.setAttribute("user", userObjet);

        if (validacionIngreso == true) {

            if (userObjet.getContador() == 0) {
                visiblidad = "hidden";
                miSession.setAttribute("mensaje", visiblidad);
                response.sendRedirect("cambioCredenciales.jsp");
            } else {
                userObjet.setContador(userObjet.getContador() + 1);
                if (userObjet.getRol().equalsIgnoreCase("administrador")) {
                    visiblidad = "visible";
                    miSession.setAttribute("visiblidad", visiblidad);
                } else {

                    visiblidad = "hidden";
                    miSession.setAttribute("visiblidad", visiblidad);
                }

                response.sendRedirect("index.jsp");

            }
        } else {

            response.sendRedirect("loginError.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
