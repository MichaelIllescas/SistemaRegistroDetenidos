<%-- 
    Document   : crearReporte
    Created on : 2 jun. 2024, 13:21:25
    Author     : jonii
--%>

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


<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid pb-4">

            <!-- Page Heading -->
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color">Generar ReporteListado de Detenidos </h1>
                    <p class="mb-4 titulo-color">A continuación, podrá generar un Listado de detenidos registrados en el sistema y exportarlo.</p>
                </div>
<div>
                <p>* Campos Obligatorios</p>
            </div>

                <div class="col-sm-10 col-lg-4  m-auto mt-5">

                    <form method="GET" action="SVReporteDetenidos">
                        <div class="form-group">
                            <label for="fechaDesde">* Fecha Desde:</label>
                            <input type="date" class="form-control" id="fechaDesde" name="fechaDesde" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaHasta">* Fecha Hasta:</label>
                            <input type="date" class="form-control" id="fechaHasta" name="fechaHasta" required>
                        </div>
                        <div class="text-center pt-3">
                             <button type="submit" class="m-auto btn btn-primary">Generar Reporte</button>
                        </div>
                    </form>
                </div>






            </div>
            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>

            </div>

        </div>


        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
</body>

