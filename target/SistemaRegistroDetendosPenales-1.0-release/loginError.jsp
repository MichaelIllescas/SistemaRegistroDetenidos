<%-- 
    Document   : loginError
    Created on : 29 abr. 2024, 21:27:27
    Author     : jonii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body class="bg-gradient-dark">

    <div class="container border-bottom-secondary"
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1200">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row rounded-pill bg-gradient-dark text-center">
                            <div class="col-lg-6  d-lg-block  bg-logo border-left-dark"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-white mb-4">Ingreso a S.R.D.P.</h1>
                                    </div>
                                    <form class="user" action="SvLogin" method="POST">

                                        <div class="text-center">
                                            <br>
                                            <br>

                                            <p class="text-white">Usuario o contraseña incorrecto.</p>

                                        </div>    
                                        <br><!-- comment -->
                                        <br><!-- comment -->
                                        <a href="login.jsp" class=" btn bg-gradient-info btn-user text-lg text-white mb-2 ">
                                            Intentar de nuevo
                                        </a>
                                        <br>




                                        <a href="#" onclick="mostrarPopup()">¿Olvidó su clave?</a>

                                        <div id="overlay"></div>

                                        <div id="popup">
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

    <div class="container text-center mt-5"
         data-aos="flip-left"
         data-aos-easing="ease-out-cubic"
         data-aos-duration="1700">
        <img src="recursos/img/ministerio.png" alt="alt" class="rounded"/>


    </div>


</body>

<%@include file="recursos/components/footer.jsp" %>