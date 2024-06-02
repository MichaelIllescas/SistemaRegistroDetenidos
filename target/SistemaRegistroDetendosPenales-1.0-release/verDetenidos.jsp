<%-- 
    Document   : verDetenidos
    Created on : 17 may. 2024, 14:32:01
    Author     : jonii
--%>
<%@page import="logica.Utilitaria"%>
<%@page import="logica.Detenido"%>
<%@page import="logica.Registro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>
<%
    HttpSession ses = request.getSession();
    List<Registro> regs = (List) ses.getAttribute("registros");
%>

<body id="page-top" class=" " >

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Ver Registros</h1>
            <p class="mb-4">A continuación, podrá visualizar la lista completa de los detenidos registrados en el sistema.<p>

                <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Listado:</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>D.N.I.</th>
                                    <th>Calidad</th>
                                    <th>Caratula</th>
                                    <th>IPP / NºCausa</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Egreso</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (regs != null) {
                                        for (Registro reg : regs) {
                                            for (Detenido dete : reg.getCausa().getDetenidos()) {
                                                String modalId = "modalDelete" + reg.getId() + dete.getId();
                                %>
                                <tr>
                                    <td><%=dete.getNombre()%></td>
                                    <td><%=dete.getApellido()%></td>
                                    <td><%=dete.getDni()%></td>
                                    <td><%=dete.getCalidad()%></td>
                                    <td><%=reg.getCausa().getDescripcion()%></td>
                                    <td><%=reg.getCausa().getNumeroCausa()%></td>
                                    <td><%=Utilitaria.dateToString(dete.getFechaIngreso())%></td>
                                    <td><%=Utilitaria.dateToString(dete.getFechaEgreso())%></td>
                                    <td style="display:flex;" class="justify-content-center">
                                        <!-- Botón para abrir el modal de eliminación -->
                                        <button type="button" class="btn btn-user btn-circle btn-danger" data-bs-toggle="modal" data-bs-target="#<%= modalId %>">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>

                                        <!-- Modal de eliminación -->
                                        <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form name="eliminar" action="SVEliminarRegistro" method="POST">
                                                <input type="hidden" name="id" value="<%=reg.getId()%>">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar Registro</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            ¿Está seguro de que desea eliminar el registro del detenido <%=dete.getNombre() %> <%=dete.getApellido() %>?
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
                                        <form name="editar" action="SVEditarRegistro" method="GET">
                                            <input type="hidden" name="id" value="<%=reg.getId()%>">
                                            <input type="hidden" name="idDetenido" value="<%=dete.getId()%>">
                                            <button type="submit" class="btn btn-primary btn-user btn-circle">
                                                <i class="fas fa-pencil-alt"></i>
                                            </button>
                                        </form>

                                        <!-- Formulario para ver detalles -->
                                        <form name="verDatos" action="SVDetalleRegistro" method="GET">
                                            <button type="submit" class="btn btn-user btn-circle btn-info">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <input type="hidden" name="id" value="<%=reg.getId()%>">
                                            <input type="hidden" name="idDetenido" value="<%=dete.getId()%>">
                                        </form>
                                    </td>
                                </tr>
                                <%          }
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- /.container-fluid -->
            <hr>
            <hr>
            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>
            </div>
        </div>
    </div>
    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
</body>
