<%-- 
    Document   : registrarEgreso
    Created on : 2 jun. 2024, 09:33:47
    Author     : jonii
--%>

<%@page import="logica.Detenido"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%
    List<Detenido> detenidos = (List) request.getSession().getAttribute("detenidos");
%>
<style>
    /* Ajuste para select2 para que coincida con form-control-lg */
    .select2-container--default .select2-selection--single {
        height: calc(1.5em + 1rem + 2px) !important;
        padding: 0  !important;
        font-size: 1.25rem !important;
        line-height: 1.5 !important;
    }
    .select2-container .select2-selection--single .select2-selection__rendered {
        line-height: calc(1.5em + 1rem + 2px) !important;
        display: flex !important;
        align-items: center !important;
    }
</style>
<body id="page-top">

    <div id="wrapper" class="container-fluid p-0">
        <%@include file="recursos/components/navegacion.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid pb-4">
            <div class="row mt-3">
                <div class="col-12 text-center">
                    <h1 class="h2 titulo-color">Registrar Egreso de un Detenido</h1>
                    <p class="mb-4 titulo-color">A continuación, podrá registrar el egreso de la dependencia policial, de un detenido.</p>
                </div>
            </div>

            <form action="SVRegistrarEgreso" method="POST">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label for="miListaDesplegable">Selecciona un Detenido:</label>
                                <select id="miListaDesplegable" class="form-control form-control-lg" name="detenido">                           <option></option>
                                    <% for (Detenido dete : detenidos) {
            if (dete.getFechaEgreso() == null) { // Filtrar detenidos con fecha de egreso nula
%>
                                    <option value="<%= dete.getId()%>"><%= dete.getNombre() + " " + dete.getApellido() + " " + dete.getDni()%></option>
                                    <% }
        }%>
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label for="fechaEgreso">Selecciona la fecha de Egreso:</label>
                                <input type="date" name="fechaEgreso" id="fechaEgreso" class="form-control form-control-lg" required>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label for="observaciones">Motivo de Egreso:</label>
                                <input type="<textarea" id="observaciones" name="observaciones" rows="5" cols="10" class="form-control form-control-lg" required></textarea> 
                            </div>


                        </div>
                    </div>

                    <div class="col-12 text-center">
                        <button class="gradiente-azul-oscuro btn shadow border-dark mt-3 mb-3" type="submit">
                            Confirmar
                        </button>
                    </div>
                </div>
            </form>

            <div class="text-center d-flex justify-content-start align-items-center">
                <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>
            </div>
        </div>
    </div>

    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>

    <!-- jQuery (Select2 dependency) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>



    <script>
        $(document).ready(function () {
            $('#miListaDesplegable').select2({
                placeholder: 'Selecciona un detenido',
                allowClear: true
            });
        });
    </script>

</body>

