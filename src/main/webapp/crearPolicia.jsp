<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class=" " >

    <div id="wrapper" class="container-fluid p-0">
        <div id="wrapper" class="container-fluid p-0">
            <%@include file="recursos/components/navegacion.jsp" %>

            <div class="p-5" data-aos="zoom-in">
                <div class="text-center titulo-color ">
                    <h1 class="titulo-color">Alta Efectivo Policial</h1>

                    <p>Este es un apartado para ingresar a un nuevo funcionario policial en el sistema.</p>
                </div>
                <div>
                    <p>* Campos Obligatorios</p>
                </div>
                <form class="user text-center" action="SVCrearPolicia" method="POST">
                    <div class="form-group col">
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="nombrepol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Nombre" required>
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="apellidopol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Apellido" required>
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="legajo" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Legajo" required>
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <select id="miListaDesplegable" name="jerarquia" class="form-control form-select form-control-lg" required>
                                <option value="" disabled selected>* Seleccione una jerarquía</option>
                                <option value="OFICIAL">Oficial</option>
                                <option value="SARGENTO">Sargento</option>
                                <option value="SUBTENIENTE">Subteniente</option>
                                <option value="TENIENTE">Teniente</option>
                                <option value="TENIENTE 1º">Teniente 1º</option>
                                <option value="CAPITAN">Capitán</option>
                                <option value="MAYOR">Mayor</option>
                                <option value="OFICIAL SUB AYUDANTE">Oficial Sub Ayudante</option>
                                <option value="OFICIAL AYUDANTE">Oficial Ayudante</option>
                                <option value="OFICIAL SUBINSPECTOR">Oficial Sub Inspector</option>
                                <option value="OFICIAL INSPECTOR">Oficial Inspector</option>
                                <option value="OFICIAL PRINCIPAL">Oficial Principal</option>
                                <option value="SUB COMISARIO">Sub Comisario</option>
                                <option value="COMISARIO">Comisario</option>
                                <option value="COMISARIO INSPECTOR">Comisario Inspector</option>
                                <option value="COMISARIO MAYOR">Comisario Mayor</option>
                                <option value="COMISARIO GENERAL">Comisario General</option>
                            </select>
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="dni" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* D.N.I." required>
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="telefono" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Teléfono" required>
                        </div>
                    </div>

                    <button class="btn-facebook btn shadow border-dark btn-user" type="submit">
                        Crear Efectivo
                    </button>

                    <div class="text-center d-flex justify-content-start align-items-center">
                        <a href="administrarUsuarios.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                            <i class="fa-solid fa-arrows-left-right ">Volver</i>
                        </a>
                        <%
                        HttpSession sess = request.getSession();
                        String mensajeError = (String) sess.getAttribute("errorRegistroPolicia"); // Asegúrate de hacer un casting
                        %>   
                        <p class="m-auto" style="color: red; display: <%= (mensajeError != null && !mensajeError.isEmpty()) ? "block" : "none" %>;">
                            <%= (mensajeError != null && !mensajeError.isEmpty()) ? mensajeError : "" %>
                        </p> 
                    </div>           
                </div>
                <hr>
                </form>

                <hr>
            </div>

            <hr>
            <hr>
        </div>

        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </body>
