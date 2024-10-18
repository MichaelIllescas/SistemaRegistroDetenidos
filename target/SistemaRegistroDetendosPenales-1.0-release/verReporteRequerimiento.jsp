<%@page import="logica.Utilitaria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>
<%@page import="java.util.List"%>
<%@page import="logica.Registro"%>
<%@page import="logica.Causa"%>
<%@page import="logica.Detenido"%>

<%
    List<Registro> registros = (List<Registro>) request.getSession().getAttribute("registros");

%>

<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid pb-4">
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color">Reporte a Requerimiento:</h1>
                    <p class="mb-4 titulo-color">desde ${Utilitaria.dateToString(sessionScope.fechaDesdeDate)} hasta ${Utilitaria.dateToString(sessionScope.fechaHastaDate)}</p>
                </div>

                <div class="container mt-5">
                    <h2 class="text-center">Reporte de Detenidos</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Fecha de Ingreso</th>
                                <th>Detalles</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                if (registros != null && !registros.isEmpty()) {
                                    for (Registro registro : registros) {
                                        Causa causa = registro.getCausa();
                                        if (causa != null) {
                                            for (Detenido detenido : causa.getDetenidos()) {
                            %>
                            <tr>
                                <td><%= detenido.getNombre()%></td>
                                <td><%= detenido.getApellido()%></td>
                                <td><%= detenido.getDni()%></td>
                                <td><%= Utilitaria.dateToString(detenido.getFechaIngreso())%></td>
                                <td>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-primary btn-sm m-1 rounded-circle" data-toggle="modal" data-target="#ventaModal<%= registro.getId()%>">
                                            <i class="fas fa-solid fa-eye"></i>
                                        </button>
                                    </div>

                                    <!-- Modal detalles de registro -->
                                    <div class="modal fade" id="ventaModal<%= registro.getId()%>" tabindex="-1" role="dialog" aria-labelledby="ventaModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title text-dark" id="ventaModalLabel">Detalles del Registro</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="accordion accordion-flush" id="accordionExample">
                                                        <!-- Datos Personales -->
                                                        <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<%= registro.getId()%>" aria-expanded="false" aria-controls="collapseOne">
                                                                    Datos Personales
                                                                </button>
                                                            </h2>
                                                            <div id="collapseOne<%= registro.getId()%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body">
                                                                    <div class="row mb-3">
                                                                        <div class="col-12">
                                                                            <p>Nombre: <%= detenido.getNombre().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Apellido: <%= detenido.getApellido().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>DNI: <%= detenido.getDni().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Fecha de Nacimiento: <%= Utilitaria.dateToString(detenido.getFechaNacimiento())%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Ocupación: <%= detenido.getOcupacion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Ocupación: <%= detenido.getTelefono().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Sexo: <%= detenido.getSexo().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Estado Civil: <%= detenido.getEstadoCivil().getDescipcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Nacionalidad: <%= detenido.getNacionalidad().getDescipcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Calidad: <%= detenido.getCalidad().toUpperCase()%></p>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- I.P.P. / Causa -->
                                                        <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIPP<%= registro.getId()%>" aria-expanded="false" aria-controls="collapseIPP">
                                                                    I.P.P. / Causa
                                                                </button>
                                                            </h2>
                                                            <div id="collapseIPP<%= registro.getId()%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body">
                                                                    <div class="row mb-3">
                                                                        <div class="col-12">
                                                                            <p>Nº I.P.P. / Causa: <%= registro.getCausa().getNumeroCausa().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Carátula: <%= registro.getCausa().getDescripcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Defensoría: <%= registro.getCausa().getDefensoria().getDescripcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Fiscalía: <%= registro.getCausa().getFiscalia().getDescripcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Juzgado: <%= registro.getCausa().getJuzgado().getDescripcion().toUpperCase()%></p>
                                                                        </div>
                                                                        <!-- Otros detalles -->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Fecha de Ingreso -->
                                                        <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIngreso<%= registro.getId()%>" aria-expanded="false" aria-controls="collapseIngreso">
                                                                    Fecha de Ingreso/Egreso
                                                                </button>
                                                            </h2>
                                                            <div id="collapseIngreso<%= registro.getId()%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body">
                                                                    <div class="row mb-3">
                                                                        <div class="col-12">
                                                                            <p>Fecha de Ingreso: <%= Utilitaria.dateToString(detenido.getFechaIngreso())%></p>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <p>Fecha de Egreso: <%= detenido.getFechaEgreso() != null ? Utilitaria.dateToString(detenido.getFechaEgreso()) : "N/A"%></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Observaciones -->
                                                        <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseObservaciones<%= registro.getId()%>" aria-expanded="false" aria-controls="collapseIngreso">
                                                                    Observaciones
                                                                </button>
                                                            </h2>
                                                            <div id="collapseObservaciones<%= registro.getId()%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                                                <div class="accordion-body">
                                                                    <div class="row mb-3">
                                                                        <div class="col-12">
                                                                            <p>Observaciones: <%= registro.getObservaciones()%></p>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%
                                        }
                                    }
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5" class="text-center">No se encontraron detenidos en el rango seleccionado.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <!-- Botón para exportar a Excel -->
                    <form method="POST" action="SVReporteDetenidos" class="text-center">
                        <input type="hidden" name="fechaDesde" value="<%= request.getParameter("fechaDesde")%>">
                        <input type="hidden" name="fechaHasta" value="<%= request.getParameter("fechaHasta")%>">
                        <button type="submit" class="btn btn-success">Exportar a Excel</button>
                    </form>
                </div>
            </div>

            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right"> Volver</i>
                </a>
            </div>
        </div>

        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </div>
</body>
