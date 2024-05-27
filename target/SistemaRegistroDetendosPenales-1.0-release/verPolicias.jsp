<%-- 
    Document   : verPolicias
    Created on : 18 may. 2024, 17:00:36
    Author     : jonii
--%>
<%@page import="logica.Policia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>
<%
                                                String mensaje="hidden";
                                                if (request.getSession().getAttribute("policiaEliminado") != null) {
                                                    mensaje = "visible";
                                                } else {
                                                    mensaje = "hidden";
                                                }
                                            %>


<body id="page-top" class=" " >


    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Ver Policias</h1>
            <p class="mb-4">A continuación, podrá visualziar la lista completa de efetivos policiles registrados en el sistema.<p>


                <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Policias: </h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Jerarquia</th>
                                    <th>Legajo</th>
                                    <th>D.N.I.</th>
                                    <th>Telefono</th>
                                    <th>Acciones</th>


                                </tr>
                            </thead>


                            <%  List<Policia> listapolis = (List) request.getSession().getAttribute("listadoPolicias");
                            %>


                            <tbody>
                                <%for (Policia pol : listapolis) {%>
                                <tr>
                                    <td><%= pol.getNombre()%></td>
                                    <td><%= pol.getApellido()%></td>
                                    <td><%= pol.getJerarquia()%></td>
                                    <td><%= pol.getLegajo()%></td>
                                    <td><%= pol.getDni()%></td>
                                    <td><%= pol.getTelefono()%></td>
                                    <td style="display:flex; " class="justify-content-center">


                                        <form class="mr-2" name="eliminar" action="SVEliminarPolicia" method="POST">

                                            <button type="submit" class="btn btn-user btn-circle btn-danger"/>
                                            <i class="fas fa-trash-alt"></i> 
                                            </button>
                                            <input type="hidden" name="id" value="<%=pol.getId()%>"> 

                                            

                                        </form>

                                        <form class="mr-2" name="editar" action="SVEditarPolicia" method="GET">

                                            <button type="submit" class="btn btn-primary  btn-user btn-circle " />
                                            <i class="fas fa-pencil-alt"></i>   
                                            </button>

                                            <input type="hidden" name="id" value="<%=pol.getId()%>" style="margin-right: 5px;" />

                                        </form>


                                </tr>
                                <% };


                                %>




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
            <p class="mb-4" style="visibility: <%=mensaje %>;">*No es posible eliminar efectivos asociados a un usuario(Primero eliminar Usuario).<p>
        </div>
        <!-- /.container-fluid -->

        <hr>
        <hr>
        
    </div>



    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>








</body>
