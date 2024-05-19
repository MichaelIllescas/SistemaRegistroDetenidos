
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/components/head.jsp" %>

<body id="page-top" class=" " >


    <div id="wrapper" class="container-fluid pl-0">
        <div id="wrapper" class="container-fluid pl-0">
            <%@include file="recursos/components/navegacion.jsp" %>


            <div class="p-5" data-aos="zoom-in">
                <div class="text-center titulo-color ">
                    <h1 class="titulo-color">Alta Efectivo Policial</h1>

                    <p>Este es un apartado para ingresar a un nuevo funcionario policial en el sistema.</p>
                </div>
                <form class="user text-center" action="SVCrearPolicia" method="POST">
                    <div class="form-group col">
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="nombrepol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="Nombre">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="apellidopol" type="text" class="form-control form-control-lg" id="nomusu" placeholder="Apellido">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="legajo" type="text" class="form-control form-control-lg" id="nomusu" placeholder="Legajo">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3" >
                            
                           
                              <select id="miListaDesplegable" name="jerarquia" class="form-control   form-select form-control-lg" >
                                    <option value="OFICIAL">Oficial</option>
                                    <option value="SARGENTO">Sargento</option>
                                    <option value="SUBTENIENTE">Subteniente</option>
                                    <option value="TENIENTE">Teniente</option>
                                    <option value="TENIENTE 1º">Teniente 1º</option>
                                    <option value="CAPITAN">Captitan</option>
                                    <option value="MAYOR">Mayor</option>
                                    <option value="OFICIAL SUB AYUDANTE">Oficial Sub Ayudante</option>
                                    <option value="OFICIAL AYUDANTE">Oficial Ayudante</option>
                                    <option value="OFICIAL SUBINSPECTOR">Oficial Sub Inspector</option>
                                    <option value="OFICIAL INSPECTOR">Oficial Inspector</option>
                                    <option value="OFICIAL PRINCIPAL">Oficial Principal</option>
                                    <option value="SUB COMISARIO">Sub Comisario</option>
                                    <option value="COMISARIO">Comisario</option>
                                    <option value="COMISARIO INSPECTOR">Comisario Inpsector</option>
                                    <option value="COMISARIO MAYOR">Comisario Mayor</option>
                                    <option value="COMISARIO GENERAL">Comisario General</option>

                                </select>
                            
                            
                        </div>
                        
                         
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="dni" type="text" class="form-control form-control-lg" id="nomusu" placeholder="DNI">
                        </div>
                        <div class="col-sm-6 mx-auto mb-3">
                            <input name="telefono" type="text" class="form-control form-control-lg" id="nomusu" placeholder="Telefono">
                        </div>
                    </div>

                    <button class="btn-facebook btn shadow border-dark btn-user" type="submit">
                        Crear Efectivo
                    </button>

            </div>        



           
        </div>  

        <hr>
        </form>


        <hr>




    </div>



    <!-- /.container-fluid -->

    <hr>
    <hr>
</div>



<%@include file="recursos/components/cerrarSesion.jsp" %>
<%@include file="recursos/components/footer.jsp" %>








</body>
