package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Policia;
import logica.Usuario;
import logica.Utilitaria;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVresetearUsuario", urlPatterns = {"/SVresetearUsuario"})
public class SVresetearUsuario extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        int id = Integer.parseInt(request.getParameter("id"));
        Usuario usu = controladora.getUsuario(id);
        Policia policia = usu.getPolicia();
        String claveNueva = policia.getDni();
        usu.setClave(Utilitaria.MD5(claveNueva));
        usu.setContador(0);
        controladora.editarUsuario(usu);

        response.sendRedirect("SvUsuarios");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
