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


    <div id="wrapper" class="container-fluid pl-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Ver Usuarios</h1>
            <p class="mb-4">A continuación, podrá visualziar la lista completa de usuarios del sistema.<p>

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
                                    <th>Id</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Rol</th>
                                    <th>Acción</th>


                                </tr>
                            </thead>


                            <%    List<Usuario> listaDeUsuarios = (List) request.getSession().getAttribute("listaUsu");                         %>


                            <tbody>
                                <%for (Usuario usu : listaDeUsuarios) {%>
                                <tr>
                                    <td id="id_usu<%= usu.getId()%>"><%= usu.getId()%></td>
                                    <td><%= usu.getNombreUsuario()%></td>
                                    <td><%= usu.getRol()%></td>
                                    <td style="display:flex; " class="justify-content-center">


                                        <form class="mr-2" name="eliminar" action="SvUsuarios" method="GET">

                                            <button type="submit" class="btn btn-user btn-circle btn-danger"/>
                                            <i class="fas fa-trash-alt"></i> 
                                            </button>
                                            <input type="hidden" name="id" value=" <%=usu.getId()%>"> 

                                        </form>

                                        <form class="mr-2" name="editar" action="SvUsuarios" method="GET">

                                            <button type="submit" class="btn btn-primary  btn-user btn-circle " />
                                            <i class="fas fa-pencil-alt"></i>   
                                            </button>

                                            <input type="hidden"name="id" class="btn btn-primary  btn-user " value="<%=usu.getId()%>" style="margin-right: 5px;" />

                                        </form>

                                </tr>
                                <% }%>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        <hr>
        <hr>
    </div>



    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>








</body>
