/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Policia;
import logica.Usuario;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVCargarDatos", urlPatterns = {"/SVCargarDatos"})
public class SVCargarDatos extends HttpServlet {

    Controladora controladora =new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

 

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
    
    // Obtener la lista de policías
    List<Policia> todosPolicias = controladora.getPolicias();
    
    // Obtener la lista de usuarios
    List<Usuario> todosUsuarios = controladora.getUsuarios();

    // Crear una lista para policías sin usuario
    List<Policia> policiasSinUsuario = new ArrayList<>();

    // Crear un conjunto de IDs de usuarios asignados
    Set<Integer> idsUsuarios = new HashSet<>();
    for (Usuario usuario : todosUsuarios) {
        idsUsuarios.add(usuario.getPolicia().getId() ); 
    }
    
    // Filtrar policías que no están en el conjunto de IDs de usuarios
    for (Policia policia : todosPolicias) {
        if (!idsUsuarios.contains(policia.getId())) { // Asegúrate de que getId() devuelva el ID correcto
            policiasSinUsuario.add(policia);
        }
    }
    
    HttpSession miSession = request.getSession();
    miSession.setAttribute("policias", policiasSinUsuario);
    
    response.sendRedirect("crearUsuario.jsp");
}

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
