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

            <section class="administracios container">
                <div class="row  mt-3">
                    <div class="col-sm-12 text-center">
                        <h1 class="titulo-color text-center">Administracion de Usuarios</h1>
                        <p class="mb-4 titulo-color">A continuación, podrá administrar a los usuarios registrados en el sistema.<p>
                    </div>
                </div>
                <div class="m-auto pb-5 ">
                    <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
                        <div class="card text-center pt-2 shadow ">
                            <img src="recursos/img/addUser.png" class="card-img-top m-auto  img-fluid w-50 h-50" alt="...">

                            <div class="card-body m-auto">
                                <form action="crearPolicia.jsp" method="GET">
                                    <h5 class="card-title">Registrar Funcionario</h5>
                                    <p class="card-text">Ingrear a un nuevo efectivo policial en el sistema</p>
                                    <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                     <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
                        <div class="card text-center pt-2 shadow ">
                            <img src="recursos/img/poliEditar.png" class="card-img-top m-auto  img-fluid w-50 h-50" alt="...">

                            <div class="card-body m-auto">
                                <form action="SVVerPolicias" method="GET">
                                    <h5 class="card-title">Editar Funcionario</h5>
                                    <p class="card-text">Edita los datos de los efectivos policiales registrados en el sistema</p>
                                    <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                                </form>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
                        <div class="card text-center pt-2 shadow" >
                            <img src="recursos/img/user.png" class="card-img-top m-auto img-fluid w-50 h-50" alt="...">

                            <div class="card-body">
                                <form action="SVCargarDatos" method="GET">
                                    <h5 class="card-title">Crear Usuario</h5>
                                    <p class="card-text">Registra a un nuevo usuario en el sistema</p>
                                    <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-10 m-auto">
                        <div class="card text-center pt-2 shadow" >
                            <img src="recursos/img/userEdit.png" class="card-img-top m-auto img-fluid w-50 h-50" alt="...">

                            <div class="card-body">
                                <form action="verUsuarios.jsp" method="get">
                                    <h5 class="card-title">Editar Usuarios</h5>
                                    <p class="card-text">Edita datos de los usuarios en el sistema</p>
                                    <button type="submit" class="btn gradiente-azul-oscuro">Ingresar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                

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
