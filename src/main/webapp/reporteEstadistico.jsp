<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color">Generar Reporte Estadístico de Detenidos</h1>
                    <p class="mb-4 titulo-color">A continuación, podrá generar un reporte estadístico de delitos por los cuales se han registrado detenidos en el sistema.</p>
                </div>

                <div>
                    <p>* Campos Obligatorios</p>
                </div>

                <div class="col-sm-10 col-lg-4 m-auto mt-5">
                    <form method="GET" action="SVReporteEstadistico">
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
                        <%                            String mensaje = (String) request.getSession().getAttribute("mensaje");
                            if (mensaje != null) {
                        %>
                        <div class="alert alert-warning form-group h-25 mt-3">
                            <br>
                            <p><%= mensaje%> </p>
                        </div>
                        <%
                                // Limpiar el mensaje después de mostrarlo
                                request.getSession().removeAttribute("mensaje");
                            }
                        %>
                    </form>
                </div>

                
     


                    
                    
               <!-- Mostrar gráfico si existe -->
<%
    byte[] chartImage = (byte[]) request.getSession().getAttribute("chartImage");
    if (chartImage != null) {
%>
    <div class="mt-4 d-flex flex-column align-items-center">
        <%
            Date fechaDesde = (Date) request.getSession().getAttribute("fechaDesde");
            Date fechaHasta = (Date) request.getSession().getAttribute("fechaHasta");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        %>

        <% if (fechaDesde != null && fechaHasta != null) { %>
            <div class="alert alert-info w-50 text-center mt-3">
                <p>Reporte de gráficos desde <strong><%= sdf.format(fechaDesde) %></strong> hasta <strong><%= sdf.format(fechaHasta) %></strong>.</p>
            </div>
        <% } %>

        <div>
            <img class="img-fluid" src="data:image/png;base64,<%= Base64.getEncoder().encodeToString(chartImage) %>" alt="Gráfico de Detenidos" />
        </div>
    </div>
<%
    } // No se hace nada si chartImage es null
%>











                <div class="text-center d-flex justify-content-start align-items-center">
                    <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                        <i class="fa-solid fa-arrows-left-right">Volver</i>
                    </a>
                </div>
            </div>




        </div>

        <%@include file="recursos/components/cerrarSesion.jsp" %>
        <%@include file="recursos/components/footer.jsp" %>
    </div>
</body>
