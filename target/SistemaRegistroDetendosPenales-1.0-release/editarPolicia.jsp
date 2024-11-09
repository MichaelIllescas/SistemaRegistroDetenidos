<%-- 
    Document   : editarPolicia
    Created on : 20 may. 2024, 15:31:11
    Author     : jonii
--%>


<%@page import="logica.Policia"%>
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


<%
    Policia police = (Policia) request.getSession().getAttribute("policia");

%>



<body id="page-top" class=" " >


    <div id="wrapper" class="container-fluid pl-0">
        <div id="wrapper" class="container-fluid pl-0">
            <%@include file="recursos/components/navegacion.jsp" %>


            <div class="p-5" data-aos="zoom-in">
                <div class="text-center titulo-color ">
                    <h1 class="titulo-color">Editar Efectivo Policial</h1>

                    <p>Este es un apartado para editar los datos de un funcionario policial registrado en el sistema.</p>
                </div>
                <form class="user text-center" action="SVEditarPolicia" method="POST">
                    <div class="form-group col">
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="nombrepol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Nombre" value="<%=police.getNombre()%>">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="apellidopol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Apellido" value="<%=police.getApellido()%>">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="legajo" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Legajo" value="<%=police.getLegajo()%>">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3" >


                            <select id="miListaDesplegable" name="jerarquia" class="form-control   form-select form-control-lg" >
                                <option value="OFICIAL"<%= "OFICIAL".equals(police.getJerarquia()) ? "selected" : ""%> >Oficial</option>
                                <option value="SARGENTO" <%= "SARGENTO".equals(police.getJerarquia()) ? "selected" : ""%>>Sargento</option>
                                <option value="SUBTENIENTE" <%= "SUBTENIENTE".equals(police.getJerarquia()) ? "selected" : ""%>>Subteniente</option>
                                <option value="TENIENTE" <%= "TENIENTE".equals(police.getJerarquia()) ? "selected" : ""%>>Teniente</option>
                                <option value="TENIENTE 1º" <%= "TENIENTE 1º".equals(police.getJerarquia()) ? "selected" : ""%>>Teniente 1º</option>
                                <option value="CAPITAN" <%= "CAPITAN".equals(police.getJerarquia()) ? "selected" : ""%>>Captitan</option>
                                <option value="MAYOR" <%= "MAYOR".equals(police.getJerarquia()) ? "selected" : ""%>>Mayor</option>
                                <option value="OFICIAL SUB AYUDANTE" <%= "OFICIAL SUB AYUDANTE".equals(police.getJerarquia()) ? "selected" : ""%>>Oficial Sub Ayudante</option>
                                <option value="OFICIAL AYUDANTE" <%= "OFICIAL AYUDANTE".equals(police.getJerarquia()) ? "selected" : ""%>>Oficial Ayudante</option>
                                <option value="OFICIAL SUBINSPECTOR" <%= "OFICIAL SUBINSPECTOR".equals(police.getJerarquia()) ? "selected" : ""%>>Oficial Sub Inspector</option>
                                <option value="OFICIAL INSPECTOR" <%= "OFICIAL INSPECTOR".equals(police.getJerarquia()) ? "selected" : ""%>>Oficial Inspector</option>
                                <option value="OFICIAL PRINCIPAL" <%= "OFICIAL PRINCIPAL".equals(police.getJerarquia()) ? "selected" : ""%>>Oficial Principal</option>
                                <option value="SUB COMISARIO" <%= "SUB COMISARIO".equals(police.getJerarquia()) ? "selected" : ""%>>Sub Comisario</option>
                                <option value="COMISARIO" <%= "COMISARIO INSPECTOR".equals(police.getJerarquia()) ? "selected" : ""%>>Comisario</option>
                                <option value="COMISARIO INSPECTOR" <%= "COMISARIO INSPECTOR".equals(police.getJerarquia()) ? "selected" : ""%>>Comisario Inpsector</option>
                                <option value="COMISARIO MAYOR" <%= "COMISARIO MAYOR".equals(police.getJerarquia()) ? "selected" : ""%>>Comisario Mayor</option>
                                <option value="COMISARIO GENERAL" <%= "OMISARIO GENERAL".equals(police.getJerarquia()) ? "selected" : ""%>>Comisario General</option>

                            </select>


                        </div>


                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="dni" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* DNI" value="<%=police.getDni()%>">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="telefono" type="text" class="form-control form-control-lg" id="nomusu" placeholder="* Telefono" value="<%=police.getTelefono()%>">
                        </div>
                    </div>
                    <input type="hidden"name="id" class="btn btn-primary  btn-user " value="<%=police.getId()%>"  />

                    <button class="btn-facebook btn shadow border-dark btn-user" type="submit">
                        Actualizar Efectivo
                    </button>

                  


 <div class="text-center d-flex justify-content-start align-items-center">
            <a href="verPolicias.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                <i class="fa-solid fa-arrows-left-right ">Volver</i>
            </a>

        </div>

 </div> 
        </div>  

        <hr>
        </form>
       
        <hr>




    </div>



    <!-- /.container-fluid -->

    <hr>
    <hr>




    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>
