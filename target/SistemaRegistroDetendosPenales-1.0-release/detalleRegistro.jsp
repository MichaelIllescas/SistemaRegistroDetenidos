<%-- 
    Document   : detalleRegistro
    Created on : 26 may. 2024, 00:05:46
    Author     : jonii
--%>

<%@page import="java.util.List"%>
<%@page import="logica.Denunciante"%>
<%@page import="logica.Utilitaria"%>
<%@page import="logica.Detenido"%>
<%@page import="logica.Registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>
<style>
    .accordion-collapse {
        transition: height 0.25s ease, opacity 0.25s ease;
    }
    .accordion-collapse.collapse:not(.show) {
        opacity: 0;
    }
    .accordion-collapse.collapse.show {
        opacity: 1;
    }

    @media (max-width: 576px) {
        .form-control-lg {
            font-size: 1rem;
            padding: 0.5rem 0.75rem;
        }
        .accordion-button {
            font-size: 1rem;
            padding: 0.5rem 0.75rem;
        }
    }

    @media (max-width: 768px) {
        .form-control-lg {
            font-size: 1.125rem;
            padding: 0.75rem 1rem;
        }
        .accordion-button {
            font-size: 1.125rem;
            padding: 0.75rem 1rem;
        }
    }

    @media (max-width: 992px) {
        .form-control-lg {
            font-size: 1.25rem;
            padding: 0.75rem 1rem;
        }
        .accordion-button {
            font-size: 1.25rem;
            padding: 0.75rem 1rem;
        }
    }
</style>
    <%HttpSession miSession = request.getSession();
        String usuario = (String) miSession.getAttribute("usuario");
        Usuario user = (Usuario) miSession.getAttribute("user");
        String visiblidad = (String) miSession.getAttribute("visiblidad");

        if (usuario == null) {
            response.sendRedirect("sinLogin.jsp");
        }

        %>


<%
    Registro regis = (Registro) request.getSession().getAttribute("registroDetalle");
    Detenido deteni = (Detenido) request.getSession().getAttribute("detalleDetenido");
    List<Denunciante> denun = (List<Denunciante>) request.getSession().getAttribute("detalleDenunciante");

%>
<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid pb-4">
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color"> Detenido: </h1>
                </div>

                <div class="col-12 col-md-10 col-lg-8 mx-auto  mb-5 rounded">
                    <div class="accordion accordion-flush rounded" id="accordionExample">
                        <!-- Datos Personales -->
                        <div class="accordion-item gradiente-azul-oscuro rounded">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed shadow desplegable-personalizada rounded titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    Datos Personales
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row mb-3">
                                        <div class="col-12">

                                            <p >Nombre: <%=deteni.getNombre().toUpperCase()%></p>
                                        </div>
                                        <div class="col-12">

                                            <p>Apellido: <%=deteni.getApellido().toUpperCase()%></p>
                                        </div>
                                        <div class="col-12">

                                            <p> D.N.I.: <%=deteni.getDni().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p> Dirección: <%=deteni.getDireccion().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p> Teléfono: <%=deteni.getTelefono().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p> Apodo: <%=deteni.getApodo().toUpperCase()%></p>
                                        </div>
                                        <div class="col-12">

                                            <p> Ocupación: <%=deteni.getOcupacion().getDescripcion().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p> Fecha de nacimiento: <%=Utilitaria.dateToString(deteni.getFechaNacimiento())%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p>Sexo: <%=deteni.getSexo().getDescripcion().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p>Instrucción: <%=deteni.getInstuccion().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">

                                            <p> Estado civil: <%=deteni.getEstadoCivil().getDescipcion().toUpperCase()%> </p>
                                        </div>
                                        <div class="col-12">
                                            <p>Nacionalidad: <%=deteni.getNacionalidad().getDescipcion().toUpperCase()%><p>
                                        </div>
                                        <div class="col-12">
                                            <p>Calidad: <%=deteni.getCalidad().toUpperCase()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- I.P.P. / Causa -->
                        <div class="accordion-item gradiente-azul-oscuro rounded">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIPP" aria-expanded="false" aria-controls="collapseIPP">
                                    I.P.P. / Causa
                                </button>
                            </h2>
                            <div id="collapseIPP" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <p>Nº I.P.P. / Causa: <%=regis.getCausa().getNumeroCausa().toUpperCase()%></p>
                                        </div>
                                        <div class="col-12">
                                            <p>Carátula:<%=regis.getCausa().getDelito().getDescripcion().toUpperCase()%></p>
                                        </div>
                                        <div class="col-12">
                                            <p>Fiscalía Interviniente: <%=regis.getCausa().getFiscalia().getDescripcion().toUpperCase()%></p>
                                        </div>
                                      
                                        <div class="col-12">
                                            <p>Defensoría: <%=regis.getCausa().getDefensoria().getDescripcion().toUpperCase()%></p>      
                                        </div>
                                        <div class="col-12">
                                            <p>Juzgado: <%=regis.getCausa().getJuzgado().getDescripcion().toUpperCase()%></p>        
                                        </div>
                                        
                                        <div class="col-12">
                                            <p>Departamento Judicial: <%=regis.getCausa().getDepartamentoJudicial().toUpperCase()%></p>        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Fecha de Ingreso -->
                        <div class="accordion-item gradiente-azul-oscuro shadow-lg rounded">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Fecha de Ingreso
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <p>Fecha de Ingreso: <%=Utilitaria.dateToString(deteni.getFechaIngreso())%></p>        
                                        </div>
                                        <div class="col-12">
                                            <p>Fecha de Egreso: <%=Utilitaria.dateToString(deteni.getFechaEgreso())%></p>        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Denunciante/Victima -->
                       <div class="accordion-item gradiente-azul-oscuro rounded">
    <h2 class="accordion-header">
        <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDte" aria-expanded="false" aria-controls="collapseDte">
            Denunciante/Victima
        </button>
    </h2>
    <div id="collapseDte" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
        <div class="accordion-body">
            <% if (denun != null && !denun.isEmpty()) { %> <!-- Verificar si 'denun' no es null y no está vacío -->
                <div class="row mb-3">
                    <%
                        // Recorrer la lista de denunciantes
                        for (Denunciante d : denun) {
                    %>
                        <div class="col-12">
                            <p>Nombre: <%= d.getNombre().toUpperCase() %></p>
                        </div>
                        <div class="col-12">
                            <p>Apellido: <%= d.getApellido().toUpperCase() %></p>
                        </div>
                        <div class="col-12">
                            <p>D.N.I.: <%= d.getDni().toUpperCase() %></p>
                        </div>
                        <div class="col-12">
                            <p>Dirección: <%= d.getDireccion().toUpperCase() %></p>
                        </div>
                        <div class="col-12">
                            <p>Teléfono: <%= d.getTelefono().toUpperCase() %></p>
                        </div>
                        <div class="col-12">
                            <p>Fecha de Nacimiento: <%= Utilitaria.dateToString(d.getFechaNacimiento()) %></p>
                        </div>
                        <hr> <!-- Separador entre denunciantes -->
                    <%
                        }
                    %>
                </div>
            <% } else { %> <!-- Si 'denun' es null o está vacío, no mostrar nada -->
                <p>No hay datos del denunciante disponibles.</p>
            <% } %>
        </div>
    </div>
</div>



                        <!-- Observaciones -->
                        <div class="accordion-item gradiente-azul-oscuro rounded">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseObs" aria-expanded="false" aria-controls="collapseObs">
                                    Observaciones
                                </button>
                            </h2>
                            <div id="collapseObs" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                                <div class="accordion-body">


                                    <p>Observaciones: <%=regis.getObservaciones().toLowerCase()%></p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="verDetenidos.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>

            </div>
        </div>

        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </div>
</body>
