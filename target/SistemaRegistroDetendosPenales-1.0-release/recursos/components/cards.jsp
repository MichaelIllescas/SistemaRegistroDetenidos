<%-- 
    Document   : cards
    Created on : 8 may. 2024, 14:22:08
    Author     : jonii
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%HttpSession miSes = request.getSession();

    String visib = (String) miSes.getAttribute("visiblidad");
    String display;
    if (visib != null && visib.equals("hidden")) {
        display = "none";
    } else {
        display = "true";
    }

%>
<section class="m-auto pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/mas.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Registrar Ingreso de Detenido</h5>
                    <p class="card-text">Registrar a un detenido en el sistema</p>
                    <a href="registrarDetenido.jsp" class="btn gradiente-azul-oscuro mt-auto">Ingresar</a>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/menos-removebg-preview.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Registrar Egreso de Detenido</h5>
                    <p class="card-text">Registrar el egreso de un detenido en el sistema</p>
                    <a href="registrarDetenido.jsp" class="btn gradiente-azul-oscuro mt-auto">Ingresar</a>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/ver-removebg-preview.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Ver Registros</h5>
                    <p class="card-text">Visatlizacion detenidos registrados en el sistema</p>
                    <a href="SVVerDetenidos" class="btn gradiente-azul-oscuro mt-auto">Ingresar</a>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/book.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Generar Reporte</h5>
                    <p class="card-text">Generar un reporte de detenidos registrados</p>
                    <a href="#" class="btn gradiente-azul-oscuro mt-auto">Ingresar</a>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3" style="display: <%=display%>;">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/user.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Administrar Usuarios</h5>
                    <p class="card-text">Administrar usuarios registrados</p>
                    <a href="administrarUsuarios.jsp" class="btn gradiente-azul-oscuro mt-auto">Ingresar</a>
                </div>
            </div>
        </div>
    </div>
</section>

