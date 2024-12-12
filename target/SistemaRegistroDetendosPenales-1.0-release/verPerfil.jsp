<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%
    Usuario user = (Usuario) request.getSession().getAttribute("user");
%>
    <%HttpSession miSession = request.getSession();
        String usuario = (String) miSession.getAttribute("usuario");
        Usuario userr = (Usuario) miSession.getAttribute("user");
        String visiblidad = (String) miSession.getAttribute("visiblidad");

        if (usuario == null) {
            response.sendRedirect("sinLogin.jsp");
        }

        %>



<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <div class="p-5" data-aos="zoom-in">
            <div class="text-center titulo-color mb-4">
                <h1 class="titulo-color">Perfil de Usuario</h1>
                <p>Este es un apartado para ver y editar los datos de un usuario registrado en el sistema.</p>
            </div>

            <div class="m-auto titulo-color col-12 col-lg-6 p-4 border rounded shadow text-center">
                <h3 class="mb-4">Detalles</h3>

                <!-- Agrupando en un row y usando col para dividir columnas -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>NOMBRE:</label>
                            <p><strong>${user.policia.nombre}</strong></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>APELLIDO:</label>
                            <p><strong>${user.policia.apellido}</strong></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>TELEFONO:</label>
                            <p><strong>${user.policia.telefono}</strong></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>JERARQUIA:</label>
                            <p><strong>${user.policia.jerarquia}</strong></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>LEGAJO:</label>
                            <p><strong>${user.policia.legajo}</strong></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>DNI:</label>
                            <p><strong>${user.policia.dni}</strong></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>NOMBRE DE USUARIO:</label>
                            <p><strong>${user.nombreUsuario}</strong></p>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    
                    <a href="editarPerfil.jsp" class="btn btn-primary">
                            Editar Perfil
                        </a>

                </div>

                
            </div>  
        </div>
<div class="ml-4">
                    <a href="verPolicias.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                        <i class="fa-solid fa-arrows-left-right"></i> Volver
                    </a>
                </div>
        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </div>

</body>
