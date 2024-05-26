   
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%HttpSession sesion = request.getSession();
   
    String visible = (String) session.getAttribute("visiblidad");
    String us = (String)session.getAttribute("usuario");
     String displ;
     if (visible.equals("hidden")){
        displ="none";
     }else{
        displ="true";
     }

%>


<!-- Sidebar -->
<ul class="navbar-nav gradiente-azul-oscuro sidebar sidebar-dark accordion" id="accordionSidebar">



    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center shadow" href="index.jsp">
            <div class="sidebar-brand-icon">
                <img src="recursos/img/iconologo.jpg" class="rounded-circle img-thumbnail m-auto shadow" alt="logo misnisterio de seguridad buenos aires" style="height: 60px"/>

            </div>
            <div class="sidebar-brand-text mx-lg-3 mt-auto "> <h3>S.R.D.P.</h3></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">


    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading mt-2">
        Gestión
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed shadow-lg" href="#" data-toggle="collapse" data-target="#collapse-header"
           aria-expanded="true" aria-controls="collapse-header">
            <i class="fas fa-regular fa-address-book"></i>
            <span >Detenidos</span>
        </a>
        <div id="collapse-header" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded border-bottom-secondary shadow">
                <h6 class="collapse-header">Acciones:</h6>
                <a class="collapse-item " href="registrarDetenido.jsp">Registrar Ingreso</a>
                <a class="collapse-item " href="registrarDetenido.jsp">Registrar Egreso</a>
                <a class="collapse-item" href="SVVerDetenidos">Ver Registros</a>

            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed dropdown shadow-lg" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-solid fa-hospital-user " ></i>
            <span>Reportes</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded border-bottom-secondary shadow-lg">
                <h6 class="collapse-header">Acciones:</h6>
                <a class="collapse-item" href="crearReporte.jsp">Generar Reporte</a>

            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item" style="display: <%=displ%>">
        <a class="nav-link collapsed shadow-lg" href="#" data-toggle="collapse" data-target="#collapseUsers"
           aria-expanded="true" aria-controls="collapseUsers">

            <i class="fas fa-solid fa-user-plus"></i>
            <span>Usuarios</span>
        </a>
        <div id="collapseUsers" class="collapse shadow-lg" aria-labelledby="collapseUsers"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded border-bottom-secondary">
                <h6 class="collapse-header">Acciones: </h6>
                <a class="collapse-item" href="administrarUsuarios.jsp">Administrar Usuarios</a>
                <a class="collapse-item" href="SvUsuarios">Ver Usuarios</a>
                <a class="collapse-item" href="crearPolicia.jsp">Registrar Funcionario</a>
                <a class="collapse-item" href="SVCargarDatos">Registrar Usuario</a>
                

            </div>
        </div>
    </li>







    <!-- Divider -->
    <hr class="sidebar-divider">
    <form action="registrarDetenido.jsp" method="GET">
        <div class="container-fluid mt-3">

            <div class="text-center d-flex justify-content-center align-items-center">

                <button id="sidebarToggle" type="button" class="rounded-circle border-0 btn "><i class="fa-solid fa-arrows-left-right "></i></button>

            </div>

            <div class="text-center d-flex justify-content-center align-items-center mt-1 mb-5" id="">

                <button type="submit" class="btn-facebook btn shadow border-dark">Registrar Detenido</button>

            </div>
        </div>
    </form>


</ul>
<!-- End of Sidebar -->

<div class="text-center d-none d-md-inline ">
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>
</div>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">


    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3 shadow">
            <i class="fa fa-bars "></i>
        </button>



        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">



            <div class="topbar-divider d-none d-sm-block"></div>


            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                        USUARIO: <%=us%>   
                    </span>
                    <img class="img-profile rounded-circle m-auto"
                         src="recursos/img/undraw_profile.svg">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Perfil
                    </a>


                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">

                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Cerrar Sesión

                    </a>
                </div>
            </li>

        </ul>


    </nav>

    <!-- End of Topbar -->






