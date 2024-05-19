<%-- 
    Document   : cards
    Created on : 8 may. 2024, 14:22:08
    Author     : jonii
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%HttpSession miSes= request.getSession();
     
     String visib = (String)miSes.getAttribute("visiblidad");

    %>
<section class="m-auto pb-5">
    <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
        <div class="card text-center pt-2 shadow  ">
            <img src="recursos/img/mas.png" class="card-img-top m-auto  img-fluid p-1 w-50 h-50" alt="...">
            <div class="card-body">
                <h5 class="card-title">Registrar Detenido</h5>
                <p class="card-text">Registrar a un detenido en el sistema</p>
                <a href="registrarDetenido.jsp" class="btn gradiente-azul-oscuro">Ingresar</a>
            </div>
        </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
        <div class="card text-center pt-2 shadow">
            <img src="recursos/img/book.png" class="card-img-top m-auto img-fluid p-1 w-50 h-50"  alt="...">
            <div class="card-body">
                <h5 class="card-title">Generar Reporte</h5>
                <p class="card-text">Generar un reporte de detenidos registrados</p>
                <a href="#" class="btn gradiente-azul-oscuro">Ingresar</a>
            </div>
        </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-10 m-auto mb-5" style="display: <%=visib%> ">
        <div class="card text-center pt-2 shadow" >
            <img src="recursos/img/user.png" class="card-img-top m-auto img-fluid p-1 w-50 h-50" alt="...">
            <div class="card-body">
                <h5 class="card-title">Administrar Usuarios</h5>
                <p class="card-text">Administrar usuarios registrados</p>
                <a href="administrarUsuarios.jsp" class="btn gradiente-azul-oscuro">Ingresar</a>
            </div>
        </div>
    </div>
</section>
