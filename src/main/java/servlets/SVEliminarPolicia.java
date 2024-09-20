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
@WebServlet(name = "SVEliminarPolicia", urlPatterns = {"/SVEliminarPolicia"})
public class SVEliminarPolicia extends HttpServlet {

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
        int id = Integer.parseInt((String) request.getParameter("id"));

        if (controladora.getPolicia(id).getEstado() == 1) {
            controladora.eliminarPolicia(id);

        } else {
            controladora.habilitarPolicia(id);
        }
        response.sendRedirect("SVVerPolicias");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
