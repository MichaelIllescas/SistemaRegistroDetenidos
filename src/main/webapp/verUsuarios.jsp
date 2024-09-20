<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class=" " >

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Ver Usuarios</h1>
            <p class="mb-4">A continuación, podrá visualizar la lista completa de usuarios del sistema.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Usuarios:</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Efectivo Policial</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Teléfono</th>
                                    <th>Rol</th>
                                    <th>Estado</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>

                            <% List<Usuario> listaDeUsuarios = (List) request.getSession().getAttribute("listaUsu"); %>

                            <tbody>
                                <% for (Usuario usu : listaDeUsuarios) {
                                        String modalDeleteId = "modalDelete" + usu.getId();
                                        String modalUpdateId = "modalUpdate" + usu.getId();
                                        String modalResetId = "modalReset" + usu.getId();
                                %>
                                <tr>
                                    <td><%= usu.getPolicia().getNombre() + " " + usu.getPolicia().getApellido()%></td>
                                    <td><%= usu.getNombreUsuario()%></td>
                                    <td><%= usu.getPolicia().getTelefono()%></td>
                                    <td><%= usu.getRol()%></td>
                                    <td><%= usu.getEstado().getDescripcion()%></td>
                                    <td style="display:flex;" class="justify-content-center">
<!-- Botón que varía según el estado del usuario -->
<button type="button" class="btn btn-user btn-circle 
        <%= usu.getEstado().getDescripcion().equalsIgnoreCase("activo") ? "btn-danger" : "btn-info"%>" 
        data-bs-toggle="modal" data-bs-target="#<%= modalDeleteId%>" 
        data-bs-toggle="tooltip" data-bs-placement="auto" title="Deshabilitar/Habilitar usuario">
    <i class="<%= usu.getEstado().getDescripcion().equalsIgnoreCase("activo") ? "fas fa-ban" : "fas fa-check"%>"></i>
</button>


                                        <!-- Modal de eliminación -->
                                        <div class="modal fade" id="<%= modalDeleteId%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form name="eliminar" action="SVEliminarUsuarios" method="POST">
                                                <input type="hidden" name="id" value="<%= usu.getId()%>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modificar Estado del Usuario</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <% if (usu.getEstado().getId() == 1) {%>
                                                            ¿Está seguro de que desea deshabilitar al usuario <%= usu.getNombreUsuario()%>?
                                                            <% } else if (usu.getEstado().getId() == 2) {%>
                                                            ¿Está seguro de que desea habilitar al usuario <%= usu.getNombreUsuario()%>?
                                                            <% } %>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn <% if (usu.getEstado().getId() == 1) { %>btn-danger<% } else if (usu.getEstado().getId() == 2) { %>btn-success<% } %>">
                                                                <% if (usu.getEstado().getId() == 1) { %>Deshabilitar<% } else if (usu.getEstado().getId() == 2) { %>Habilitar<% }%>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Botón para abrir el modal de actualización -->
                                        <button type="button" class="btn btn-primary btn-user btn-circle" data-bs-toggle="modal" data-bs-target="#<%= modalUpdateId%>" title="Actualizar usuario" data-bs-toggle="tooltip" data-bs-placement="top">
                                            <i class="fas fa-pencil-alt"></i>
                                        </button>

                                        <!-- Modal de actualización -->
                                        <div class="modal fade" id="<%= modalUpdateId%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form name="editar" action="SVEditarUsuarios" method="GET">
                                                <input type="hidden" name="id" value="<%= usu.getId()%>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Actualizar Usuario</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ¿Está seguro de que desea actualizar al usuario <%= usu.getNombreUsuario()%>?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-primary">Actualizar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Botón para abrir el modal de resetear -->
                                        <button type="button" class="btn btn-info btn-user btn-circle" data-bs-toggle="modal" data-bs-target="#<%= modalResetId%>" title="Resetear contraseña" data-bs-toggle="tooltip" data-bs-placement="top">
                                            <i class="fas fa fa-undo"></i>
                                        </button>

                                        <!-- Modal de resetear -->
                                        <div class="modal fade" id="<%= modalResetId%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form name="resetear" action="SVresetearUsuario" method="POST">
                                                <input type="hidden" name="id" value="<%= usu.getId()%>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Resetear Contraseña</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ¿Está seguro de que desea resetear la contraseña del usuario <%= usu.getNombreUsuario()%>?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-info">Resetear</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="administrarUsuarios.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right">Volver</i>
                </a>
            </div>
        </div>
    </div>
                            

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
    
    <script>
    $(document).ready(function() {
    $('[data-bs-toggle="tooltip"]').tooltip();
});
</script>
  

</body>
