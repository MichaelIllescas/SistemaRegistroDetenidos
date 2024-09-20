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
import logica.Utilitaria;

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

    // Limpiar la sesión
    HttpSession miSession = request.getSession(true);
    miSession.invalidate();
    miSession = request.getSession(true);

    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("password");

    // Traer el usuario actualizado desde la base de datos
    Usuario userObjet = controladora.traerUsuarioPorUserYPass(usuario, Utilitaria.MD5(clave));

    // Verifica si el usuario existe
    if (userObjet == null) {
        response.sendRedirect("loginError.jsp");
        return;
    }

    miSession.setAttribute("usuario", usuario);
    miSession.setAttribute("user", userObjet);

    // Verifica el estado del usuario
    if (userObjet.getEstado().getDescripcion().equalsIgnoreCase("inactivo")) {
        miSession.setAttribute("inhabilitado", "Usuario Inhabilitado");
        response.sendRedirect("loginError.jsp");
        return;
    }

    String visiblidad = "hidden";
    // Valida el ingreso
    boolean validacionIngreso = controladora.validarUsuario(usuario, clave);
    
    if (userObjet.getContador() == 0) {
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
}


 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
