<%@page import="logica.Policia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%
    Usuario user = (Usuario) request.getSession().getAttribute("user");
%>

<body id="page-top" class="">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="p-5" data-aos="zoom-in">
            <div class="text-center titulo-color">
                <h1 class="titulo-color">Editar Perfil</h1>
                <p>Este es un apartado para editar los datos de un perfil de usuario registrado en el sistema.</p>
            </div>
            <div>
                <p>* Campos Obligatorios</p>
            </div>

            <div class="container-fluid mt-4">
                <div class="m-auto titulo-color col-12 col-lg-6 p-4 border rounded shadow">
                    <h3 class="text-center mb-4">Editar Perfil</h3>
                    <form method="POST" action="SVEditarPerfil">
                        <div class="form-group mb-3">
                            <label for="nombre">* NOMBRE:</label>
                            <input type="text" id="nombre" class="form-control" name="nombre" value="${user.policia.nombre}" required/>
                        </div>

                        <div class="form-group mb-3">
                            <label for="apellido">* APELLIDO:</label>
                            <input type="text" id="apellido" class="form-control" name="apellido" value="${user.policia.apellido}" required/>
                        </div>

                        <div class="form-group mb-3">
                            <label for="dni">* D.N.I.</label>
                            <input type="text" id="dni" class="form-control" name="dni" value="${user.policia.dni}" required/>
                        </div>


                        <div class="form-group mb-3">
                            <label for="telefono">* TELEFONO:</label>
                            <input type="text" id="telefono" class="form-control" name="telefono" value="${user.policia.telefono}" required/>
                        </div>

                        <div class="form-group mb-3">
                              <label for="telefono">* JERARQUIA:</label>
                                <select id="miListaDesplegable" name="jerarquia" class="form-control   form-select " >
                                <option value="OFICIAL"<%= "OFICIAL".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%> >Oficial</option>
                                <option value="SARGENTO" <%= "SARGENTO".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Sargento</option>
                                <option value="SUBTENIENTE" <%= "SUBTENIENTE".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Subteniente</option>
                                <option value="TENIENTE" <%= "TENIENTE".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Teniente</option>
                                <option value="TENIENTE 1º" <%= "TENIENTE 1º".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Teniente 1º</option>
                                <option value="CAPITAN" <%= "CAPITAN".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Captitan</option>
                                <option value="MAYOR" <%= "MAYOR".equals(user.getPolicia().getJerarquia())  ? "selected" : ""%>>Mayor</option>
                                <option value="OFICIAL SUB AYUDANTE" <%= "OFICIAL SUB AYUDANTE".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Oficial Sub Ayudante</option>
                                <option value="OFICIAL AYUDANTE" <%= "OFICIAL AYUDANTE".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Oficial Ayudante</option>
                                <option value="OFICIAL SUBINSPECTOR" <%= "OFICIAL SUBINSPECTOR".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Oficial Sub Inspector</option>
                                <option value="OFICIAL INSPECTOR" <%= "OFICIAL INSPECTOR".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Oficial Inspector</option>
                                <option value="OFICIAL PRINCIPAL" <%= "OFICIAL PRINCIPAL".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Oficial Principal</option>
                                <option value="SUB COMISARIO" <%= "SUB COMISARIO".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Sub Comisario</option>
                                <option value="COMISARIO" <%= "COMISARIO INSPECTOR".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Comisario</option>
                                <option value="COMISARIO INSPECTOR" <%= "COMISARIO INSPECTOR".equals(user.getPolicia().getJerarquia())  ? "selected" : ""%>>Comisario Inpsector</option>
                                <option value="COMISARIO MAYOR" <%= "COMISARIO MAYOR".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Comisario Mayor</option>
                                <option value="COMISARIO GENERAL" <%= "OMISARIO GENERAL".equals(user.getPolicia().getJerarquia()) ? "selected" : ""%>>Comisario General</option>

                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="legajo">* LEGAJO:</label>
                            <input type="text" id="legajo" class="form-control" name="legajo" value="${user.policia.legajo}" required/>
                        </div>

                        <div class="form-group mb-4">
                            <label for="usuario">NOMBRE DE USUARIO:</label>
                            <p type="text" id="usuario" class="form-control" name="nombreUsuario" value="">${user.nombreUsuario}</p>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-success">
                                Guardar
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="verPolicias.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right">Volver</i>
                </a>
            </div>
        </div>  
    </div>  

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
</body>
