<%-- 
    Document   : detalleRegistro
    Created on : 26 may. 2024, 00:05:46
    Author     : jonii
--%>

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
<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="container-fluid pb-4">
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color"> Detenido</h1>
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
                                            <label for="nombre">Nombre:</label>
                                            <p> nombre </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="apellido">Apellido:</label>
                                            <p> Apellido </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="dni">D.N.I. / Documento:</label>
                                            <p> Dni </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="direccion">Direccion:</label>
                                            <p> Direccion </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="telefono">Telefono:</label>
                                            <p> telefono </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="apodo">Apodo:</label>
                                            <p> Apodo</p>
                                        </div>
                                        <div class="col-12">
                                            <label for="ocupacion">Ocupacion:</label>
                                            <p> Ocupacion </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="fechaNac">Fecha de Nacimiento:</label>
                                            <p> fecha de nacimiento </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="sexo">Sexo:</label>
                                            <p> sexo </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="instruccion">Instruccion:</label>
                                            <p> instruccion </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="estadoCivil">Estado Civil:</label>
                                            <p> Estado civil </p>
                                        </div>
                                        <div class="col-12">
                                            <label for="Nacionalidad">Nacionalidad:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="rol">Calidad:</label>
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
                                            <label for="nroCausa">Nº I.P.P. / Causa:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="caratula">Caratula:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="fiscalia">N° Fiscalìa Interviniente:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="fiscal">Agente Fiscal:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="defensoria">Defensoria Interviniente:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="juzgado">Juzgado Interviniente:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="juez">Juez Interviniente:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="deptoJudicial">Departamento Judicial:</label>
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
                                            <label for="fechaIngreso">Fecha de Ingreso:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="fechaEgreso">Fecha de Egreso:</label>
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
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="nombreDte">Nombre:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="apellidoDte">Apellido:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="dniDte">D.N.I. / Documento:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="direccionDte">Direccion:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="telefonoDte">Telefono:</label>
                                        </div>
                                        <div class="col-12">
                                            <label for="fechaNacDte">Fecha de Nacimiento:</label>
                                        </div>
                                    </div>
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
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="observaciones">Observaciones:</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </div>
</body>
