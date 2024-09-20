<%-- 
    Document   : administrarUsuarios
    Created on : 11 may. 2024, 02:04:14
    Author     : jonii
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class=" " >




    <div id="wrapper" class="container-fluid p-0">
        <div id="wrapper" class="container-fluid p-0 ">
            <%@include file="recursos/components/navegacion.jsp" %>

          <section class="administracion container">
    <div class="row mt-3">
        <div class="col-sm-12 text-center">
            <h1 class="titulo-color text-center">Administración de Usuarios</h1>
            <p class="mb-4 titulo-color">A continuación, podrá administrar a los usuarios registrados en el sistema.</p>
        </div>
    </div>
    <div class="row pb-5 justify-content-center">
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/addUser.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <form action="crearPolicia.jsp" method="GET" class="d-flex flex-column h-100">
                        <h5 class="card-title">Registrar Funcionario</h5>
                        <p class="card-text">Ingresar a un nuevo efectivo policial en el sistema</p>
                        <button type="submit" class="btn gradiente-azul-oscuro mt-auto">Ingresar</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/poliEditar.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <form action="SVVerPolicias" method="GET" class="d-flex flex-column h-100">
                        <h5 class="card-title">Ver y Editar Funcionarios</h5>
                        <p class="card-text">Edita los datos de los efectivos policiales registrados en el sistema</p>
                        <button type="submit" class="btn gradiente-azul-oscuro mt-auto">Ingresar</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/user.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <form action="SVCargarDatos" method="GET" class="d-flex flex-column h-100">
                        <h5 class="card-title">Registrar Usuario</h5>
                        <p class="card-text">Registra a un nuevo usuario en el sistema</p>
                        <button type="submit" class="btn gradiente-azul-oscuro mt-auto">Ingresar</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-10 mb-3">
            <div class="card text-center pt-2 shadow h-100">
                <img src="recursos/img/userEdit.png" class="card-img-top m-auto img-fluid p-1" alt="..." style="max-width: 100px; max-height: 100px;">
                <div class="card-body d-flex flex-column">
                    <form action="SvUsuarios" method="get" class="d-flex flex-column h-100">
                        <h5 class="card-title">Ver y Editar Usuarios</h5>
                        <p class="card-text">Edita datos de los usuarios en el sistema</p>
                        <button type="submit" class="btn gradiente-azul-oscuro mt-auto">Ingresar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
              <div class="text-center d-flex justify-content-start align-items-center">
                <a href="index.jsp" class="btn rounded-2 p-2 border-0 gradiente-azul-oscuro mb-5">
                    <i class="fa-solid fa-arrows-left-right ">Volver</i>
                </a>

            </div>
</section>
            





</div>
<!-- /.container-fluid -->

<hr>
<hr>
</div>



<%@include file="recursos/components/cerrarSesion.jsp" %>
<%@include file="recursos/components/footer.jsp" %>








</body>
