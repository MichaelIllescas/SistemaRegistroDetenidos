<%-- 
    Document   : index
    Created on : 3 may. 2024, 19:21:50
    Author     : jonii
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class="  ">


    <!-- validacion de session
    
    <%HttpSession miSession = request.getSession();
        String usuario = (String) miSession.getAttribute("usuario");
        Usuario user = (Usuario) miSession.getAttribute("user");
        String visiblidad = (String) miSession.getAttribute("visiblidad");

        if (usuario == null) {
            response.sendRedirect("sinLogin.jsp");
        }

        %>
    -->
    <div id="wrapper">
        <%@include file="recursos/components/navegacion.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid ">

            <!-- Page Heading -->
            <div class="row  mt-2">
                <div class="col-sm-12">
                    <h1 class="h2 titulo-color text-center">Sistema de Registro de Detenidos Penales</h1>
                </div>
            </div>
   

            <div class="container justify-content-center mt-2">
                <div class="col-sm-12">
                    <%@include file="recursos/components/cards.jsp" %>
                </div>
            </div>

        </div>  
    </div>
    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>

</body>