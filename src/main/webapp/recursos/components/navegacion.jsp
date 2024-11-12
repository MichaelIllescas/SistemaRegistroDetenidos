  
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%HttpSession sesion = request.getSession();

    String visible = "hidden";
    visible = (String) session.getAttribute("visiblidad");
    String us = (String) session.getAttribute("usuario");
    String displ = "none";
    if (visible != null) {
        if (visible.equals("hidden")) {
            displ = "none";
        } else {
            displ = "true";
        }
    }
    
    // Obtener el mensaje de la sesión
    String msj = (String) request.getSession().getAttribute("backupMessage");
    
    // Limpiar el mensaje después de usarlo
    request.getSession().removeAttribute("backupMessage"); 



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
                <a class="collapse-item " href="SVRegistrarEgreso">Registrar Egreso</a>
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
                <a class="collapse-item" href="crearReporte.jsp">Reporte Listado</a>
                <a class="collapse-item" href="reporteEstadistico.jsp">Reporte Estadístico</a>

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
                <a class="collapse-item" href="crearPolicia.jsp">Registrar Funcionario</a>
                <a class="collapse-item" href="SVVerPolicias">Ver Funcionarios</a>
                <a class="collapse-item" href="SVCargarDatos">Asignar Usuario</a>
                <a class="collapse-item" href="SvUsuarios">Ver Usuarios</a>

            </div>
        </div>
    </li>







    <!-- Divider -->
    <hr class="sidebar-divider">

    <div class="container-fluid mt-3">
        <form action="registrarDetenido.jsp" method="GET" class="text-center mb-4">
            <div class="d-flex justify-content-center mb-3">
                <button id="sidebarToggle" type="button" class="rounded-circle border-0 btn btn-light">
                    <i class="fa-solid fa-arrows-left-right"></i>
                </button>
            </div>
            <div class="d-flex justify-content-center flex-column">
                <button type="submit" class="btn btn-facebook btn-lg shadow border-dark mb-3 w-100 p-1" style="font-size: calc(0.5rem + 0.5vw);">
                    Registrar Detenido
                </button>
            </div>
        </form>
        <form action="backup" method="get" class="text-center" style="display: <%=displ%>">
            <!-- Botón para abrir el modal de confirmación -->
            <button class="btn btn-facebook btn-lg shadow border-dark w-100 p-1" style="font-size: calc(0.5rem + 0.5vw);" type="button" data-toggle="modal" data-target="#confirmBackupModal">
                Hacer Backup de Base de Datos
            </button>
        </form>
        
           
<div class="d-flex justify-content-center">
    <% if (msj != null) { %>
        <div class="alert alert-success mb-3 mt-3 p-1" style="font-size: calc(0.5rem + 0.5vw); max-width: 100%; overflow-wrap: break-word; word-break: break-all;">
            <%= msj %>
        </div>
    <% } %>
</div>
    </div>

    <!-- Modal de Confirmación -->
    <div class="modal fade" id="confirmBackupModal" tabindex="-1" role="dialog" aria-labelledby="confirmBackupModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-dark" id="confirmBackupModalLabel">Confirmación de Backup</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-dark">
                    ¿Está seguro de que desea hacer una copia de seguridad de la base de datos?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <!-- Formulario oculto que se enviará al confirmar -->
                    <form action="backup" method="get" style="display: inline;">
                        <input type="hidden" name="confirm" value="true" />
                        <button type="submit" class="btn btn-primary">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



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


