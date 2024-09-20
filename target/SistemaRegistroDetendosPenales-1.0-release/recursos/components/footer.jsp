<%-- 
    Document   : footer
    Created on : 28 abr. 2024, 19:21:31
    Author     : jonii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Footer -->
<footer class=" bg-gradient-dark fixed-bottom text-gray-100">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website for Jonathan Illescas</span>
        </div>
    </div>
</footer>



<!-- Bootstrap core JavaScript-->
<script src="recursos/vendor/jquery/jquery.min.js"></script>
<script src="recursos/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="recursos/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="recursos/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="recursos/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="recursos/js/demo/chart-area-demo.js"></script>
<script src="recursos/js/demo/chart-pie-demo.js"></script>


<!-- Page level plugins -->
<script src="recursos/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="recursos/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="recursos/js/demo/datatables-demo.js"></script>

<script src="recursos/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>


<!-- Incluye los scripts de Bootstrap JS y Popper.js (necesario para los componentes de Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Incluye jQuery (necesario para Datepicker) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Incluye Datepicker -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Incluye la localización en español para Datepicker -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js"></script>
<!-- Configura Datepicker -->
<script>
    $(document).ready(function () {
        $('#fecha').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            todayHighlight: true,
            language: 'es', // Establece el idioma en español
            daysOfWeekDisabled: '0,6' // Desactiva domingo (0) y sábado (6)
        });
    });
</script>

<!-- Incluye los scripts de Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>


<!-- Incluye los scripts de Bootstrap Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="recursos/vendor/jquery/jquery.min.js"></script>

<!-- Page level plugins -->
<script src="recursos/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="recursos/vendor/datatables/dataTables.bootstrap4.min.js"></script>


<script src="recursos/js/demo/funciones.js"></script>



<!-- End of Footer -->


