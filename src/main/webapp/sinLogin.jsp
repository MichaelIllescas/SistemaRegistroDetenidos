<%-- 
    Document   : sinLogin
    Created on : 9 mar. 2024, 08:31:56
    Author     : jonii
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<%HttpSession miSession = request.getSession();
    miSession.removeAttribute("usuario");


%>
<body class="gradiente-azul-oscuro mb-5">
    <div class="container border-bottom-secondary h-auto mb-4 b" 
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1200">

        <!-- Outer Row -->
        <div class="row justify-content-center ">

            <div class="col-xl-10 col-lg-10 col-md-10 col-sm-12 ">

                <div class="card o-hidden border-0 shadow-lg my-5 shadow-lg" style="box-sizing: border-box; ">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row rounded-pill bg-gradient-dark text-center shadow-lg">
                            <div class="col-lg-6  d-lg-block  bg-logo border-left-dark shadow-lg "></div>
                            <div class="col-lg-6 shadow-lg">
                                <div class="p-5 shadow-lg">
                                    <div class="text-center" >
                                        <h1 class="h4 text-white mb-4">Ingreso a S.R.D.P.</h1>
                                    </div>
                                    <form class="user text-center" action="SvLogin" method="POST" >
                                        <div class="text-center">



                                            <p class="text-white ">Debe estar registrado para poder ingresar al sistema.</p>


                                        </div>    


                                        <div>
                                            <a href="login.jsp" class=" btn bg-gradient-info btn-user text-lg text-white  ">
                                                Volver al Inicio
                                            </a>
                                        </div>


                                        <div class="mt-4 mb-2">
                                            <a href="#" onclick="mostrarPopup()">¿Olvidó su clave?</a>

                                        </div>
                                        <div id="overlay"></div>

                                        <div id="popup" class="gradiente-azul-oscuro">
                                            <span class="close" onclick="cerrarPopup()">&times;</span>
                                            <p class="text-lg">Póngase en contacto con el administrador Jonathan Illescas<br>
                                                Teléfono: 2923530179</p>
                                        </div>




                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>



    <div class="container text-center mt-5 "
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1700">
        <img src="recursos/img/ministerio.png" alt="alt" class="rounded shadow"/>

    </div>




</body>




<%@include file="recursos/components/footer.jsp" %>

