<%-- 
    Document   : editarUsuario
    Created on : 18 may. 2024, 16:14:58
    Author     : jonii
--%>

<%@page import="java.util.List"%>
<%@page import="logica.Policia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>


<%
    Usuario users = (Usuario) request.getSession().getAttribute("usuEditar");
%>
<%List<Policia> polis = (List) request.getSession().getAttribute("policias");%>


<body id="page-top" class=" " >



    <div id="wrapper" class="container-fluid p-0">



        <%@include file="recursos/components/navegacion.jsp" %>


        <div class="p-5" data-aos="zoom-in">

            <div class="row  mb-3">
                <div class="col-sm-12 text-center">
                    <h1 class="h2 titulo-color text-center">Editar Usuario</h1>
                    <p>Este es un apartado para editar a un usuario reistrado en el sistema.</p>
                </div>
            </div>
            <form class="user text-center confirm-submit" action="SVEditarUsuarios" method="POST">
                <div class="row ">
                    <div class="col-md-6 offset-md-3 ">




                        <div class="form-group ">
                            <div class="col-sm-12 mx-auto mb-3">
                                <label for="nomusu">Ingrese nuevo nombre de Usuario</label>
                                <input name="nomusu" type="text" class="form-control form-control-lg " id="nomusu" placeholder="Nombre de Usuario" value="<%=users.getNombreUsuario()%>">
                            </div>
                            <div class="col-sm-12 mx-auto mb-3">
                                <label for="cotras">Ingrese una Clave</label>
                                <input type="password" class="form-control  form-control-lg " id="contras" placeholder="Contraseña" name="contras" value="<%=users.getClave()%>">
                            </div>



                        </div>        
                        <div class="form-group">
                            <div class="col-sm-12 mx-auto mb-3">
                                <label for="rol">Selecciona un Rol</label>
                                <select id="miListaDesplegable" name="rol" class="form-control form-control-lg form-select rounded-1" style="font-size: 1.2em; height: 50px;">
                                    <option value="ADMINISTRADOR" <%= "ADMINISTRADOR".equals(users.getRol()) ? "selected" : ""%>>Administrador</option>
                                    <option value="USUARIO" <%= "USUARIO".equals(users.getRol()) ? "selected" : ""%>>Usuario/a</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-12 mx-auto mb-5 ">

                                <label for="miListaDesplegable">Selecciona un Policia:</label>
                                <select id="miListaDesplegable" class="form-control form-control-lg form-select" name="policia">
                                    <% for (Policia pol : polis) {%>
                                    <option value="<%= pol.getId()%>" <%= pol.getId() == users.getPolicia().getId() ? "selected" : ""%>><%= pol.getNombre() + " " + pol.getApellido()%></option>
                                    <% }%>
                                </select>




                            </div>



                            <button class="btn-facebook btn shadow border-dark btn-user" type="submit">
                                Confirmar
                            </button>
                        </div>  
 </div>
                        <hr>
                        <div class="text-center d-flex justify-content-start align-items-center">
                            <a href="administrarUsuarios.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                                <i class="fa-solid fa-arrows-left-right ">Volver</i>
                            </a>

                        </div>

                   
                    <hr>
                </div>
            </form>









            <!-- /.container-fluid -->

            <hr>
            <hr>


        </div>
    </div>
    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>



    <script src="recursos/js/demo/funciones.js"></script>

</body>
</html>
  