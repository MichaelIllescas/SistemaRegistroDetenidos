<%-- 
    Document   : registrarDetenido
    Created on : 17 may. 2024, 12:20:15
    Author     : jonii
--%>
<%@page import="logica.Nacionalidad"%>
<%@page import="logica.EstadoCivil"%>
<%@page import="logica.Sexo"%>
<%@page import="logica.Ocupacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%

    List<Ocupacion> ocupaciones = (List<Ocupacion>) request.getSession().getAttribute("ocupaciones");
    List<Sexo> sexos = (List<Sexo>) request.getSession().getAttribute("sexos");
    List<EstadoCivil> estadosCiviles = (List<EstadoCivil>) request.getSession().getAttribute("estadosCiviles");
    List<Nacionalidad> nacionalidades = (List<Nacionalidad>) request.getSession().getAttribute("nacionalidades");

%>

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

<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid pb-4">

            <!-- Page Heading -->
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color">Registrar Ingreso de Detenido</h1>
                    <p class="mb-4 titulo-color">A continuación, podrá registrar a un detenido en el sistema.</p>
                </div>
            </div>
            <div>
                <p>* Campos Obligatorios</p>
            </div>
            <form class="text-center mx-auto  mb-5 p-3 rounded-1 " style="max-width: 600px;" action="SVRegistrarDetenido" method="POST">

                <div class="accordion accordion-flush rounded-1" id="accordionExample">
                    <div class="accordion-item gradiente-azul-oscuro rounded-2">
                        <h2 class="accordion-header ">
                            <button class="accordion-button collapsed shadow rounded-2 desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                Datos Personales
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="mb-3">
                                    <label for="nombre">* Nombre:</label>
                                    <input name="nombre" type="text" class="form-control form-control-lg" id="nombre" required>
                                </div>
                                <div class="mb-3">
                                    <label for="apellido">*Apellido:</label>
                                    <input name="apellido" type="text" class="form-control form-control-lg" id="apellido" required>
                                </div>
                                <div class="mb-3">
                                    <label for="dni">* D.N.I. / Documento:</label>
                                    <input name="dni" type="text" class="form-control form-control-lg" id="dni" required>
                                </div>
                                <div class="mb-3">
                                    <label for="direccion">* Direccién:</label>
                                    <input name="direccion" type="text" class="form-control form-control-lg " id="direccion" required>
                                </div>
                                <div class="mb-3">
                                    <label for="telefono">Teléfono:</label>
                                    <input name="telefono" type="text" class="form-control form-control-lg " id="telefono" required>
                                </div>
                                <div class="mb-3">
                                    <label for="apodo">Apodo:</label>
                                    <input name="apodo" type="text" class="form-control form-control-lg " id="apodo">
                                </div>
                                <div class="mb-3">
                                    <label for="ocupacion">* Ocupación:</label>
                                    <select name="ocupacion" id="ocupacion" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled selected>Seleccione su ocupación</option>
                                        <%        if (ocupaciones != null) {
                                                for (Ocupacion ocupacion : ocupaciones) {
                                        %>
                                        <option value="<%= ocupacion.getId()%>"><%= ocupacion.getDescripcion()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="fechaNac">* Fecha de Nacimiento:</label>
                                    <input name="fechaNac" id="fechaNac" type="date" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="sexo">* Sexo:</label>
                                    <select name="sexo" id="sexo" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled selected>Seleccione su sexo</option>
                                        <%
                                            if (sexos != null) {
                                                for (Sexo sex : sexos) {
                                        %>
                                        <option value="<%= sex.getId()%>"><%= sex.getDescripcion()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="instruccion">* Instruccion:</label>

                                    <select name="instruccion" id="instruccion" class="form-control form-control-lg form-select">
                                        <option value="" disabled selected>Seleccione su Instrucción</option>
                                        <option value="SI"> SI</option>>
                                        <option value="NO"> no</option>>
                                    </select>

                                </div>
                                <div class="mb-3">
                                    <label for="estadoCivil">* Estado Civil:</label>
                                   <select name="estadoCivil" id="estadoCivil" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled selected>Seleccione su sexo</option>
                                        <%
                                            if (estadosCiviles != null) {
                                                for (EstadoCivil estadoCivil : estadosCiviles) {
                                        %>
                                        <option value="<%= estadoCivil.getId()%>"><%= estadoCivil.getDescipcion()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="nacionalidad">* Nacionalidad:</label>
                                     <select name="nacionalidad" id="nacionalidad" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled selected>Seleccione su Nacionalidad</option>
                                        <%
                                            if (nacionalidades != null) {
                                                for (Nacionalidad nacionalidad : nacionalidades) {
                                        %>
                                        <option value="<%= nacionalidad.getId()%>"><%= nacionalidad.getDescipcion()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="rol">* Calidad:</label>
                                    <select id="miListaDesplegable" name="calidad" class="form-control form-control-lg form-select">
                                        <option value="APREHENDIDO">Aprehendido</option>
                                        <option value="DETENIDO">Detenido</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIPP" aria-expanded="false" aria-controls="collapseIPP">
                                I.P.P. / Causa
                            </button>
                        </h2>
                        <div id="collapseIPP" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="mb-3">
                                    <label for="nroCausa">* Nº I.P.P. / Causa:</label>
                                    <input name="nroCausa" id="nroCausa" type="text" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="caratula">* Carátula:</label>
                                    <input name="caratula" id="caratula" type="text" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="fiscalia">* N° Fiscalía Interviniente:</label>
                                    <input name="nroFiscalia" id="fiscalia" type="text" class="form-control form-control-lg">
                                </div>
                                <div class="mb-3">
                                    <label for="fiscal">* Agente Fiscal:</label>
                                    <input name="fiscal" id="fiscal" type="text" class="form-control form-control-lg">
                                </div>
                                <div class="mb-3">
                                    <label for="defensoria">* Defensoría Interviniente:</label>
                                    <input name="defensoria" id="defensoria" type="text" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="juzgado">* Juzgado Interviniente:</label>
                                    <input name="juzgado" id="juzgado" type="text" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="juez">* Juez Interviniente:</label>
                                    <input name="juez" id="juez" type="text" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="deptoJudicial">* Departamento Judicial:</label>
                                    <input name="deptoJudicial" id="deptoJudicial" type="text" class="form-control form-control-lg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" rounded accordion-item gradiente-azul-oscuro rounded shadow-lg">
                        <h2 class="accordion-header">
                            <button class=" accordion-button collapsed shadow rounded desplegable-personalizada titulo-color " type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Fecha de Ingreso
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="mb-3">
                                    <label for="fechaIngreso">* Fecha de Ingreso:</label>
                                    <input name="fechaIngreso" id="fechaIngreso" type="date" class="form-control form-control-lg" required>
                                </div>
                                <div class="mb-3">
                                    <label for="fechaEgreso">Fecha de Egreso:</label>
                                    <input name="fechaEgreso" id="fechaEgreso" type="date" class="form-control form-control-lg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDte" aria-expanded="false" aria-controls="collapseDte">
                                Denunciante / Víctima
                            </button>
                        </h2>
                        <div id="collapseDte" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="mb-3">
                                    <label for="nombreDte">Nombre:</label>
                                    <input name="nombreDte" type="text" class="form-control form-control-lg" id="nombreDte">
                                </div>
                                <div class="mb-3">
                                    <label for="apellidoDte">Apellido:</label>
                                    <input name="apellidoDte" type="text" class="form-control form-control-lg" id="apellidoDte">
                                </div>
                                <div class="mb-3">
                                    <label for="dniDte">D.N.I. / Documento:</label>
                                    <input name="dniDte" type="text" class="form-control form-control-lg" id="dniDte">
                                </div>
                                <div class="mb-3">
                                    <label for="direccionDte">Dirección:</label>
                                    <input name="direccionDte" type="text" class="form-control form-control-lg" id="direccionDte">
                                </div>
                                <div class="mb-3">
                                    <label for="telefonoDte">Teléfono:</label>
                                    <input name="telefonoDte" type="text" class="form-control form-control-lg" id="telefonoDte">
                                </div>
                                <div class="mb-3">
                                    <label for="fechaNacDte">Fecha de Nacimiento:</label>
                                    <input name="fechaNacDte" id="fechaNacDte" type="date" class="form-control form-control-lg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gradiente-azul-oscuro rounded-circle rounded-top">
                        <div class="accordion-item gradiente-azul-oscuro rounded">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseObs" aria-expanded="false" aria-controls="collapseObs">
                                    Observaciones
                                </button>
                            </h2>
                            <div id="collapseObs" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="mb-3">
                                        <label for="observaciones">Observaciones:</label>
                                        <textarea id="observaciones" class="form-control" maxlength="255" name="observaciones" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="gradiente-azul-oscuro btn shadow border-dark mt-3 mb-3 " type="submit">
                    Registrar Detenido
                </button>

            </form>

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


