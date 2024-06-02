<%-- 
Document   : verUsuarios
Created on : 10 may. 2024, 21:07:30
Author     : jonii
--%>
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
            <p class="mb-4">A continuación, podrá visualizar la lista completa de usuarios del sistema.<p>

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
                                    <th>Rol</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>

                            <%
                                List<Usuario> listaDeUsuarios = (List) request.getSession().getAttribute("listaUsu");
                            %>

                            <tbody>
                                <% for (Usuario usu : listaDeUsuarios) {
                                    String modalId = "modalDelete" + usu.getId();
                                %>
                                <tr>
                                    <td><%= usu.getPolicia().getNombre() + " " + usu.getPolicia().getApellido() %></td>
                                    <td><%= usu.getNombreUsuario() %></td>
                                    <td><%= usu.getRol() %></td>
                                    <td style="display:flex;" class="justify-content-center">
                                        <!-- Botón para abrir el modal de eliminación -->
                                        <button type="button" class="btn btn-user btn-circle btn-danger" data-bs-toggle="modal" data-bs-target="#<%= modalId %>">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>

                                        <!-- Modal de eliminación -->
                                        <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form name="eliminar" action="SVEliminarUsuarios" method="POST">
                                                <input type="hidden" name="id" value="<%= usu.getId() %>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Usuario</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ¿Está seguro de que desea eliminar al usuario <%= usu.getNombreUsuario() %>?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-danger">Eliminar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Formulario para editar -->
                                        <form class="mr-2" name="editar" action="SVEditarUsuarios" method="GET">
                                            <input type="hidden" name="id" value="<%= usu.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-user btn-circle">
                                                <i class="fas fa-pencil-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="administrarUsuarios.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>
            </div>
        </div>
    </div>

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>

</body>
