<%-- 
    Document   : administrarUsuarios
    Created on : 11 may. 2024, 02:04:14
    Author     : jonii
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class=" " >


    <div id="wrapper" class="container-fluid pl-0">
        <div id="wrapper" class="container-fluid pl-0 ">
            <%@include file="recursos/components/navegacion.jsp" %>

            <div class="d-flex flex-wrap justify-content-center mb-5">
                <div class="col-lg-4 col-md-6 col-sm-10 m-1">
                    <div class="card text-center pt-2 shadow" style="max-width: 300px;">
                        <img src="recursos/img/user.png" class="card-img-top m-auto images-card img-fluid w-50" style="max-height: 80px; max-width: 150px;" alt="...">

                        <div class="card-body">
                            <form action="crearPolicia.jsp" method="GET">
                                <h5 class="card-title">Registra Funcionario</h5>
                                <p class="card-text">Registra a un nuevo efectivo policial en el sistema</p>
                                <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="col-lg-4 col-md-6 col-sm-10 m-1">
                    <div class="card text-center pt-2 shadow" style="max-width: 300px;">
                        <img src="recursos/img/user.png" class="card-img-top m-auto images-card img-fluid w-50" style="max-height: 80px; max-width: 150px;" alt="...">

                        <div class="card-body">
                            <form action="SVCargarDatos" method="GET">
                                <h5 class="card-title">Crear Usuario</h5>
                                <p class="card-text">Registra a un nuevo usuario en el sistema</p>
                                <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>










        </div>
        <!-- /.container-fluid -->

        <hr>
        <hr>
    </div>



    <%@include file="recursos/components/cerrarSesion.jsp" %>
    <%@include file="recursos/components/footer.jsp" %>








</body>
