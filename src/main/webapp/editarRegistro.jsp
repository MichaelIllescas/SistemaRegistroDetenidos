<%-- 
    Document   : registrarDetenido
    Created on : 17 may. 2024, 12:20:15
    Author     : jonii
--%>

<%@page import="logica.Delito"%>
<%@page import="logica.Fiscalia"%>
<%@page import="logica.Defensoria"%>
<%@page import="logica.Juzgado"%>
<%@page import="logica.Nacionalidad"%>
<%@page import="logica.EstadoCivil"%>
<%@page import="logica.Sexo"%>
<%@page import="logica.Sexo"%>
<%@page import="logica.Ocupacion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Utilitaria"%>
<%@page import="logica.Registro"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

    <%HttpSession miSession = request.getSession();
        String usuario = (String) miSession.getAttribute("usuario");
        Usuario user = (Usuario) miSession.getAttribute("user");
        String visiblidad = (String) miSession.getAttribute("visiblidad");

        if (usuario == null) {
            response.sendRedirect("sinLogin.jsp");
        }

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
</style>

<body id="page-top" class="  ">

    <%
        HttpSession ses = request.getSession();
        Registro reg = (Registro) ses.getAttribute("registroAeditar");
        int idDetenido = (int) ses.getAttribute("idDetenido");

    %>

    <%            List<Ocupacion> ocupaciones = (List<Ocupacion>) request.getSession().getAttribute("ocupaciones");
        List<Sexo> sexos = (List<Sexo>) request.getSession().getAttribute("sexos");
        List<EstadoCivil> estadosCiviles = (List<EstadoCivil>) request.getSession().getAttribute("estadosCiviles");
        List<Nacionalidad> nacionalidades = (List<Nacionalidad>) request.getSession().getAttribute("nacionalidades");
        List<Juzgado> juzgados = (List<Juzgado>) request.getSession().getAttribute("juzgados");
        List<Defensoria> defensorias = (List<Defensoria>) request.getSession().getAttribute("defensorias");
        List<Fiscalia> fiscalias = (List<Fiscalia>) request.getSession().getAttribute("fiscalias");
        List<Delito> delitos = (List<Delito>) request.getSession().getAttribute("delitos");

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
            <div>
                <p>* Campos Obligatorios</p>
            </div>
            <form class="text-center mx-auto  mb-5 p-3 " style="max-width: 600px;" action="SVEditarRegistro" method="POST">


                <!-- Acordeon de detenido -->
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
                                    <label for="nombre">* Nombre:</label>
                                    <input name="nombre" type="text" class="form-control form-control-lg" id="nombre" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getNombre()%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="apellido">* Apellido:</label>
                                    <input name="apellido" type="text" class="form-control form-control-lg" id="apellido"  value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getApellido()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="dni">* D.N.I. / Documento:</label>
                                    <input name="dni" type="text" class="form-control form-control-lg" id="dni" value="<%=Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getDni()%>"required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="direccion">* Direccion:</label>
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
                                <!-- select ocupacion-->
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="ocupacion">* Ocupación:</label>
                                    <select name="ocupacion" id="ocupacion" class="form-control form-control-lg form-select" required>
                                        <% if (ocupaciones != null) {
                                                for (Ocupacion ocupacion : ocupaciones) {
                                        %>
                                        <option value="<%= ocupacion.getId()%>" 
                                                <%= ocupacion.getDescripcion().equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getOcupacion().getDescripcion()) ? "selected" : ""%>>
                                            <%= ocupacion.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>

                                </div>

                                <!-- input fecha de nacimiento-->    
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaNac">Fecha de Nacimiento:</label>
                                    <input name="fechaNac" id="fechaNac" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaNacimiento())%>" required>
                                </div>

                                <!-- select de sexo-->
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="sexo">* Sexo:</label>
                                    <select name="sexo" id="sexo" class="form-control form-control-lg form-select" required>
                                        <% if (sexos != null) {
                                                for (Sexo sex : sexos) {
                                        %>
                                        <option value="<%= sex.getId()%>" 
                                                <%= sex.getDescripcion().equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getSexo().getDescripcion()) ? "selected" : ""%>>
                                            <%= sex.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <!-- select de instrucción-->    
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="instruccion">* Instrucción:</label>
                                    <select name="instruccion" id="instruccion" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled <%= (Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getInstuccion() == null) ? "selected" : ""%>>Seleccione una Opción</option>
                                        <option value="SI" <%= "SI".equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getInstuccion()) ? "selected" : ""%>>SI</option>
                                        <option value="NO" <%= "NO".equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getInstuccion()) ? "selected" : ""%>>NO</option>
                                    </select>
                                </div>



                                <!-- select de estado civil-->    
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="estadoCivil">* Estado Civil:</label>

                                    <select name="estadoCivil" id="estadoCivil" class="form-control form-control-lg form-select" required>
                                        <% if (estadosCiviles != null) {
                                                for (EstadoCivil estCiv : estadosCiviles) {
                                        %>
                                        <option value="<%= estCiv.getId()%>" 
                                                <%= estCiv.getDescipcion().equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getEstadoCivil().getDescipcion()) ? "selected" : ""%>>
                                            <%= estCiv.getDescipcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>


                                </div>

                                <!-- select de nacionalidad-->
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="nacionalidad">* Nacionalidad:</label>
                                    <select name="nacionalidad" id="nacionalidad" class="form-control form-control-lg form-select" required>
                                        <% if (nacionalidades != null) {
                                                for (Nacionalidad nac : nacionalidades) {
                                        %>
                                        <option value="<%= nac.getId()%>" 
                                                <%= nac.getDescipcion().equals(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getNacionalidad().getDescipcion()) ? "selected" : ""%>>
                                            <%= nac.getDescipcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <!-- select de calidad-->
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="calidad">* Calidad:</label>
                                    <select id="miListaDesplegable" name="calidad" class="form-control form-control-lg form-select">
                                        <option value="APREHENDIDO"<%=("APREHENDIDO".equals((String) Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getCalidad())) ? "selected" : ""%> >Aprehendido</option>
                                        <option value="DETENIDO" <%=("DETENIDO".equals((String) Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getCalidad())) ? "selected" : ""%> >Detenido</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Acordeon de causa/ipp -->
                    <div class="accordion-item gradiente-azul-oscuro rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed shadow desplegable-personalizada rounded titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseIPP" aria-expanded="false" aria-controls="collapseIPP">
                                I.P.P. / Causa
                            </button>
                        </h2>
                        <div id="collapseIPP" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="nroCausa">* Número de I.P.P. / Causa:</label>
                                    <input name="nroCausa" id="nroCausa" type="text" class="form-control form-control-lg" 
                                           value="<%=reg.getCausa().getNumeroCausa()%>" required>
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="delito">* Carátula / Hecho:</label>
                                   <select name="delito" id="delito" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled <%= (reg.getCausa().getDelito() == null) ? "selected" : ""%>>Seleccione una Opción</option>
                                        <%
                                            if (delitos != null) {
                                                for (Delito del : delitos) {
                                                    // Verificamos si la fiscalia del detenido coincide con la fiscalia actual
                                        %>
                                        <option value="<%= del.getId()%>" <%= (reg.getCausa().getFiscalia() != null && reg.getCausa().getDelito().getId() == del.getId()) ? "selected" : ""%>>
                                            <%= del.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fiscalia">* Fiscalía Interviniente: </label>
                                    <select name="fiscalia" id="fiscalia" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled <%= (reg.getCausa().getFiscalia() == null) ? "selected" : ""%>>Seleccione una Opción</option>
                                        <%
                                            if (fiscalias != null) {
                                                for (Fiscalia fis : fiscalias) {
                                                    // Verificamos si la fiscalia del detenido coincide con la fiscalia actual
                                        %>
                                        <option value="<%= fis.getId()%>" <%= (reg.getCausa().getFiscalia() != null && reg.getCausa().getFiscalia().getId() == fis.getId()) ? "selected" : ""%>>
                                            <%= fis.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>

                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="defensoria">* Defensoria Interviniente: </label>
                                    <select name="defensoria" id="defensoria" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled <%= (reg.getCausa().getDefensoria() == null) ? "selected" : ""%>>Seleccione una Opción</option>
                                        <%
                                            if (defensorias != null) {
                                                for (Defensoria def : defensorias) {
                                                    // Verificamos si la defensoria del detenido coincide con la defensoria actual
%>
                                        <option value="<%= def.getId()%>" <%= (reg.getCausa().getDefensoria() != null && reg.getCausa().getDefensoria().getId() == def.getId()) ? "selected" : ""%>>
                                            <%= def.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>

                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="juzgado">* Juzgado Interviniente: </label>
                                    <select name="juzgado" id="juzgado" class="form-control form-control-lg form-select" required>
                                        <option value="" disabled <%= (reg.getCausa().getJuzgado() == null) ? "selected" : ""%>>Seleccione una Opción</option>
                                        <%
                                            if (juzgados != null) {
                                                for (Juzgado juz : juzgados) {
                                                    // Verificamos si el juzgado del detenido coincide con el juzgado actual
                                        %>
                                        <option value="<%= juz.getId()%>" <%= (reg.getCausa().getJuzgado() != null && reg.getCausa().getJuzgado().getId() == juz.getId()) ? "selected" : ""%>>
                                            <%= juz.getDescripcion()%>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>

                                </div>


                            </div>
                        </div>
                    </div>

                    <!-- Acordeon de fecha de ingreso/ egreso-->                          
                    <div class="accordion-item gradiente-azul-oscuro shadow-lg rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button rounded desplegable-personalizada collapsed shadow titulo-color" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Fecha de Ingreso
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse fade" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaIngreso">* Fecha de Ingreso: </label>
                                    <input name="fechaIngreso" id="fechaIngreso" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaIngreso())%>" required>
                                </div>
                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaEgreso">Fecha de Egreso </label>
                                    <input name="fechaEgerso" id="fechaEgreso" type="date" class="form-control form-control-lg" value="<%=Utilitaria.convertirDateAinputDate(Utilitaria.buscarDetenidoPorId(reg.getCausa().getDetenidos(), idDetenido).getFechaEgreso())%>">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Acordeon de denunciante-->
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
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? reg.getCausa().getDenunciantes().get(0).getNombre() : ""%>">
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="apellidoDte">Apellido:</label>
                                    <input name="apellidoDte" type="text" class="form-control form-control-lg" id="apellido" 
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? reg.getCausa().getDenunciantes().get(0).getApellido() : ""%>">
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="dniDte">D.N.I. / Documento:</label>
                                    <input name="dniDte" type="text" class="form-control form-control-lg" id="dni" 
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? reg.getCausa().getDenunciantes().get(0).getDni() : ""%>">
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="direccionDte">Direccion:</label>
                                    <input name="direccionDte" type="text" class="form-control form-control-lg" id="direccion" 
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? reg.getCausa().getDenunciantes().get(0).getDireccion() : ""%>">
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="telefonoDte">Telefono:</label>
                                    <input name="telefonoDte" type="text" class="form-control form-control-lg" id="telefono" 
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? reg.getCausa().getDenunciantes().get(0).getTelefono() : ""%>">
                                </div>

                                <div class="col-sm-12 mx-auto mb-3">
                                    <label for="fechaNacDte">Fecha de Nacimiento:</label>
                                    <input name="fechaNacDte" id="fechaNac" type="date" class="form-control form-control-lg" 
                                           value="<%= (reg.getCausa().getDenunciantes() != null && !reg.getCausa().getDenunciantes().isEmpty()) ? Utilitaria.convertirDateAinputDate(reg.getCausa().getDenunciantes().get(0).getFechaNacimiento()) : ""%>">
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Acordeon de observaciones -->
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



                <button class="gradiente-azul-oscuro btn shadow border-dark mt-3 mb-3 p-2" type="submit">
                    Actualizar Datos
                </button>
            </form>
            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="verDetenidos.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>

            </div>

        </div>
    </div>

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
</body>

