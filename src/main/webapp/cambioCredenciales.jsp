<%-- 
    Document   : cambioCredenciales
    Created on : 21 may. 2024, 11:55:46
    Author     : jonii
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%
    HttpSession miSession = request.getSession();

   String mensaje = (String) miSession.getAttribute("mensaje");
if (mensaje == null) {
    mensaje = "";
}
    Usuario usuario = (Usuario) miSession.getAttribute("user");

%>
<body class="gradiente-azul-oscuro mb-5">
    <div class="container border-bottom-secondary h-auto mb-4 pb-3" 
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1200">

        <!-- Outer Row -->
        <div class="row justify-content-center pb-3 mt-3">

            <div class="col-lg-6 shadow-lg pr-5 pl-5 pt-4 pb-3">

                <div class="text-center" >
                    <h1 class="h4 text-white font-weight-bold">Ingreso a S.R.D.P.</h1>
                    <p class="mb-0 ">*Primer ingreso, debe actualizar sus credenciales.</p>
                </div>
                <form class="user text-center" action="SVCambioCredenciales" method="POST" id="formulario" >
                    <div class="form-group ">
                        <p >Usuario <%=usuario.getNombreUsuario()%>:</p> 
                    </div>
                    <div class="form-group">
                        <label for="password">Ingrese su nueva contraseña:</label>

                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" class="form-control form-control-user shadow" 
                                       id="password" name="password" placeholder="Contraseña">
                                <div class="input-group-append">
                                    <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer;">
                                        <i class="fa fa-eye" id="eyeIcon"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="passwordRepeat">Repita su contraseña:</label>
                        <div class="input-group">
                        <input type="password" class="form-control form-control-user shadow"
                               id="passwordRepeat" name="passwordRepeat" placeholder="Contraseña" required>
                        <div class="input-group-append">
                                    <span class="input-group-text" onclick="togglePasswordRepeat()" style="cursor: pointer;">
                                        <i class="fa fa-eye" id="eyeIconRepeat"></i>
                                    </span>
                                </div>
                        </div>
                        <p class="<%= mensaje.equalsIgnoreCase("hidden")? "d-none":"d-flex" %> text-justify mt-3 bg-gradient-light text-dark p-2 " >
    <%= mensaje.equalsIgnoreCase("hidden")? "": mensaje %>
</p>


                    </div>

                    <button type="submit" class="btn bg-gradient-info btn-user text-lg text-white">
                        Confirmar
                    </button>


                </form>
            </div>
        </div>
    </div>

    <div class="container text-center mt-5 "
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1700">
        <img src="recursos/img/ministerio.png" alt="alt" class="rounded shadow"/>


    </div>








<%@include file="recursos/components/footer.jsp" %>


</body>
