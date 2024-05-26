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
    HttpSession ses= request.getSession();
    List<Registro> regs= (List)ses.getAttribute("registros");

  
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
                                        for (Detenido dete : reg.getCausa().getDetenidos()) { %>
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
                                                    <form name="eliminar" action="SVEliminarRegistro" method="POST">
                                                        <button type="submit" class="btn btn-user btn-circle btn-danger">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                        <input type="hidden" name="id" value="<%=reg.getId()%>">
                                                    </form>
                                                    <form name="editar" action="SVEditarRegistro" method="GET">
                                                        <input type="hidden" name="id" value="<%=reg.getId()%>">
                                                        <input type="hidden" name="idDetenido" value="<%=dete.getId()%>">
                                                        <button type="submit" class="btn btn-primary btn-user btn-circle">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </button>
                                                    </form>
                                                    <form name="verDatos" action="SvUsuarios" method="GET">
                                                        <button type="submit" class="btn btn-user btn-circle btn-info">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                        <input type="hidden" name="id" value="">
                                                    </form>
                                                </td>
                                            </tr>
                                <%          }
                                    }
                                } %>
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

