<%-- 
    Document   : login.jsp
    Created on : 28 abr. 2024, 19:17:26
    Author     : jonii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>


<body class="bg-gradient-dark">
    <div class="container border-bottom-secondary ">
        <div data-aos="flip-left"
             data-aos-easing="ease-out-cubic"
             data-aos-duration="1200">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-10 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5 ">
                        <div class="card-body p-0 ">
                            <!-- Nested Row within Card Body -->
                            <div class="row rounded-pill bg-imagen">
                                <div class="col-lg-6  d-lg-block  bg-logo border-left-dark ">
                                   
                                </div>
                                <div class="col-lg-6 border-left-dark ">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-white mb-4">Ingreso a S.R.D.P.</h1>
                                        </div>
                                        <form class="user text-center" action="loginError.jsp" method="POST">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                       id="usuario" name="usuario" placeholder="Usuario">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user"
                                                       id="password" name="password" placeholder="Contraseña">
                                            </div>

                                            <button type="submit" class="btn bg-gradient-info btn-user text-lg text-white ">
                                                Ingresar
                                            </button>


                                        </form>
                                        <hr>


                                    </div>
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