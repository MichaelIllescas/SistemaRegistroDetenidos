<%-- 
    Document   : pruebaEditarUsuario
    Created on : 29 may. 2024, 00:26:21
    Author     : jonii
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmar Envío de Formulario</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
    <%HttpSession miSession = request.getSession();
        String usuario = (String) miSession.getAttribute("usuario");
        Usuario user = (Usuario) miSession.getAttribute("user");
        String visiblidad = (String) miSession.getAttribute("visiblidad");

        if (usuario == null) {
            response.sendRedirect("sinLogin.jsp");
        }

        %>


<body>
    <div class="container">
        <h2 class="text-center">Editar Usuario</h2>
        <form class="needs-validation" action="SVEditarUsuarios" method="POST" novalidate>
            <!-- Campos de formulario -->
            <!-- Botón que abre el modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmModal">Confirmar</button>

            <!-- Modal de confirmación -->
            <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmModalLabel">Confirmación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ¿Estás seguro de que deseas enviar este formulario?
                        </div>
                        <div class="modal-footer">
                            <!-- Botón para cancelar -->
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <!-- Botón para confirmar y enviar el formulario -->
                            <button type="submit" class="btn btn-primary">Confirmar</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Enlace a Bootstrap JS y tu archivo de JavaScript personalizado -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
Con este código, deberías tener un modal que se muestre correctamente y funcione correctamente para confirmar el envío del formulario. Asegúrate de que todos los enlaces a los archivos CSS y JavaScript de Bootstrap estén correctos y de que no haya conflictos con otras bibliotecas JavaScript que puedan estar en uso en tu página.






