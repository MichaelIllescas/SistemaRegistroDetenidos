<%-- 
    Document   : registrarDetenido
    Created on : 17 may. 2024, 12:20:15
    Author     : jonii
--%>

<%@page import="logica.Utilitaria"%>
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
</style>

<body id="page-top" class="  ">

    <%
        HttpSession ses = request.getSession();
        Registro reg = (Registro) ses.getAttribute("registroAeditar");
        int idDetenido = (int) ses.getAttribute("idDetenido");
        
    %>
<div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid pb-4">

            <!-- Page Heading -->
            <div class="row mt-3">

 
                <div class="col-sm-12 text-center">
                    <h1 class="h2 titulo-color text-center">Editar Datos de un Detenido</h1>
                    <p class="mb-4 titulo-color">A continuación, podrá modificar datos registrados de un detenido que se enucentre en el sistema.<p>
                </div>
            </div>
             <form class="text-center mx-auto  mb-5 p-3 " style="max-width: 600px;" action="SVRegistrarDetenido" method="POST">
                <div class="accordion accordion-flush rounded" id="accordionExample">
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header ">
                            <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                Datos Personales
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="nombre">Nombre:</label>
                                    <input name="nombre" type="text" class="form-control form-control-lg" id="nombre" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getNombre()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="apellido">Apellido:</label>
                                    <input name="apellido" type="text" class="form-control form-control-lg" id="apellido"  value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getApellido()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="dni">D.N.I. / Documento:</label>
                                    <input name="dni" type="text" class="form-control form-control-lg" id="dni" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getDni()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="direccion">Direccion:</label>
                                    <input name="direccion" type="text" class="form-control form-control-lg" id="direccion" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getDireccion()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="telefono">Telefono:</label>
                                    <input name="telefono" type="text" class="form-control form-control-lg" id="telefono" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getTelefono()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="apodo">Apodo:</label>
                                    <input name="apodo" type="text" class="form-control form-control-lg" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getApodo()%>" id="apodo">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="ocupacion">Ocupacion:</label>
                                    <input name="ocupacion" id="ocupacion" type="text" class="form-control form-control-lg" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getOcupacion()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaNac">Fecha de Nacimiento:</label>
                                    <input name="fechaNac" id="fechaNac" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaNacimiento())%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="sexo">Sexo</label>
                                    <input name="sexo" id="sexo" type="text" class="form-control form-control-lg" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getSexo()%> " required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="instruccion">Instruccion:</label>
                                    <input name="instruccion" id="instruccion" type="text" class="form-control form-control-lg" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getInstuccion()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="estadoCivil">Estado Civil:</label>
                                    <input name="estadoCivil" id="estadoCivil" type="text" class="form-control form-control-lg" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getEstadoCivil().getDescipcion()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="Nacionalidad">Nacionalidad:</label>
                                    <input name="nacionalidad" id="nacionalidad" type="text" class="form-control form-control-lg"value=" <%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getNacionalidad().getDescipcion()%> "required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="calidad">Calidad:</label>
                                    <select id="miListaDesplegable" name="calidad" class="form-control form-control-lg form-select">
                                        <option value="APREHENDIDO"<%=("APREHENDIDO".equals((String) Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getCalidad())) ? "selected" : ""%> >Aprehendido</option>
                                        <option value="DETENIDO" <%=("DETENIDO".equals((String) Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getCalidad())) ? "selected" : ""%> >Detenido</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow desplegable-personalizada rounded titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIPP" aria-expanded="false" aria-controls="collapseIPP">
                                I.P.P. / Causa
                            </button>
                        </h2>
                        <div id="collapseIPP" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="nroCausa">Nº I.P.P. / Causa:</label>
                                    <input name="nroCausa" id="nroCausa" type="text" class="form-control form-control-lg" 
                                           value="<%=reg.getCausa().getNumeroCausa()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="caratula">Caratula:</label>
                                    <input name="caratula" id="caratula" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getDescripcion()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fiscalia">N° Fiscalia Interviniente: </label>
                                    <input name="nroFiscalia" id="fiscalia" type="text" value="<%=reg.getCausa().getFiscalia().getDescripcion()%>" class="form-control form-control-lg">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fiscal">Agente Fiscal:</label>
                                    <input name="fiscal" id="fiscalia" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getFiscalia().getTitular()%>">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="defensoria">Defensoria Interviniente: </label>
                                    <input name="defensoria" id="defensoria" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getDefensoria().getDescripcion()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="juzgado">Juzgado Interviniente: </label>
                                    <input name="juzgado" id="juzgado" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getJuzgado().getDescripcion()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="juez">Juez Interviniente: </label>
                                    <input name="juez" id="juez" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getJuzgado().getTitular()%> "required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="deptoJudicial">Departamento Judicial:</label>
                                    <input name="deptoJudicial" id="fiscalia" type="text" class="form-control form-control-lg" value="<%=reg.getCausa().getDepartamentoJudicial()%>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item gradiente-azul-oscuro shadow-lg rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button rounded desplegable-personalizada collapsed shadow titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Fecha de Ingreso
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaIngreso">Fecha de Ingreso: </label>
                                    <input name="fechaIngreso" id="fechaIngreso" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaIngreso())%>" required>
                                           </div>
                                           <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaEgreso">Fecha de Egreso </label>
                                    <input name="fechaEgerso" id="fechaEgreso" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaEgreso())%>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow desplegable-personalizada rounded titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDte" aria-expanded="false" aria-controls="collapseDte">
                                Denunciante/Victima
                            </button>
                        </h2>

                        <div id="collapseDte" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="nombreDte">Nombre:</label>
                                    <input name="nombreDte" type="text" class="form-control form-control-lg" id="nombre"
                                         
                                           value="<%=Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getNombre()%>"   
                                           >
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="apellidoDte">Apellido:</label>
                                    <input name="apellidoDte" type="text" class="form-control form-control-lg" id="apellido"
                                           value="<%=Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getApellido()%>">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="dniDte">D.N.I. / Documento:</label>
                                    <input name="dniDte" type="text" class="form-control form-control-lg" id="dni" value="<%=Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getDni()%>" >
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="direccionDte">Direccion:</label>
                                    <input name="direccionDte" type="text" class="form-control form-control-lg" id="direccion" value="<%=Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getDireccion()%>">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="telefonoDte">Telefono:</label>
                                    <input name="telefonoDte" type="text" class="form-control form-control-lg" id="telefono" value="<%=Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getTelefono()%>">
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaNacDte">Fecha de Nacimiento:</label>
                                    <input name="fechaNacDte" id="fechaNac" type="date" class="form-control form-control-lg" 
                                           value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDenunciantePorId(reg.getCausa().getDenunciantes(), idDetenido).getFechaNacimiento())%>">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow rounded desplegable-personalizada titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseObs" aria-expanded="false" aria-controls="collapseObs">
                                Observaciones
                            </button>
                        </h2>
                        <div id="collapseObs" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="observaciones">Observaciones:</label>
                                    <textarea id="" class="w-100" maxlength="255" name="observaciones" rows="5"  ><%=reg.getObservaciones()%></textarea>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>



                <button class="gradiente-azul-oscuro btn shadow border-dark mt-3 mb-3" type="submit">
                    Actualizar Datos
                </button>
            </form>

        </div>
    </div>

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
</body>

