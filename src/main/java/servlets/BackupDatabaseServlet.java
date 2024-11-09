package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BackupDatabaseServlet", urlPatterns = "/backup")
public class BackupDatabaseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Verificar si se ha confirmado la acción
        String confirm = request.getParameter("confirm");

        // Solo proceder si la confirmación es verdadera
        if ("true".equals(confirm)) {
            // Obtener la fecha actual en formato YYYY-MM-DD
            String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String backupFileName = date + "_backup.sql";

            // Obtener el directorio de trabajo actual
            String workingDirectory = System.getProperty("user.dir");
            String backupFilePath = workingDirectory + "\\" + backupFileName; // Construir la ruta completa

            // Comando mysqldump
            String command = "mysqldump -u root registro_detenidos > \"" + backupFilePath + "\""; // Usar la ruta completa

            // Usar ProcessBuilder para ejecutar el comando
            ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c", command);

            try {
                // Iniciar el proceso
                Process process = processBuilder.start();
                process.waitFor(); // Esperar a que el proceso termine

                // Establecer atributos en la solicitud
                request.getSession().setAttribute("backupMessage", "Copia de seguridad completada y guarada en el directorio: " + backupFilePath);
            } catch (IOException | InterruptedException e) {
                e.printStackTrace();
                request.getSession().setAttribute("backupMessage", "Error al realizar la copia de seguridad: " + e.getMessage());
            }
        } else {
            request.getSession().setAttribute("backupMessage", "Operación de copia de seguridad cancelada.");
        }

        // Obtener la URL de referencia
        String referer = request.getHeader("Referer");

        // Redirigir a la página desde donde se llamó al servlet
        if (referer != null) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
