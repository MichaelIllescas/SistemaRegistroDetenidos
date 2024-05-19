<%-- 
    Document   : cerrarSesion
    Created on : 3 may. 2024, 19:30:44
    Author     : jonii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true" >
    <div class="modal-dialog" role="document" >
        <div class="modal-content" >
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">¿Desea continuar?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-solid fa-power-off"></i></span>
                </button>
            </div>
            <div class="modal-body">Seleccione "Cerrar sesión" a continuación si desea finalizar su sesión actual.</div>

            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <form action="SVCerrarSesion" method="GET">
                        <button type="submit"  class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">

                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Cerrar Sesión

                        </button>
                    </form>

            </div>

        </div>
    </div>
</div>
