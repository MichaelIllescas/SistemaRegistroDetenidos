/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-09-20 05:50:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import logica.Usuario;
import logica.Usuario;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(5);
    _jspx_dependants.put("/recursos/components/cards.jsp", Long.valueOf(1717345787171L));
    _jspx_dependants.put("/recursos/components/head.jsp", Long.valueOf(1726704897854L));
    _jspx_dependants.put("/recursos/components/navegacion.jsp", Long.valueOf(1726692848771L));
    _jspx_dependants.put("/recursos/components/footer.jsp", Long.valueOf(1726187805775L));
    _jspx_dependants.put("/recursos/components/cerrarSesion.jsp", Long.valueOf(1716519200000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(1);
    _jspx_imports_classes.add("logica.Usuario");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"Michael Jonathan Illescas\">\n");
      out.write("        <title>S.R.D.P.</title>\n");
      out.write("      \n");
      out.write("        <!-- Custom fonts for this template-->\n");
      out.write("        <link href=\"recursos/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\"\n");
      out.write("            rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Incluye los estilos de Bootstrap CSS -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Incluye los estilos de Datepicker -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Custom styles for this template-->\n");
      out.write("        <link href=\"recursos/css/sb-admin-2.min.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- Custom styles for this page -->\n");
      out.write("        <link href=\"recursos/vendor/datatables/dataTables.bootstrap4.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"recursos/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\"  rel=\"stylesheet\">\n");
      out.write("        <link href=\"recursos/css/estilos.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://unpkg.com/aos@2.3.1/dist/aos.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Custom fonts for this template-->\n");
      out.write("        <link href=\"recursos/vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\"\n");
      out.write("            rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Custom styles for this template-->\n");
      out.write("        <link href=\"recursos/css/sb-admin-2.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("   <script src=\"recursos/js/demo/funciones.js\"></script>\n");
      out.write("\n");
      out.write("        <link href=\"recursos/css/estilos.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"recursos/css/modalError.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"recursos/css/index.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css\" rel=\"stylesheet\" />\n");
      out.write("     \n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<body id=\"page-top\" class=\"  \">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- validacion de session\n");
      out.write("    \n");
      out.write("    ");
HttpSession miSession= request.getSession();
     String usuario = (String)miSession.getAttribute("usuario");
     Usuario user = (Usuario)miSession.getAttribute("user");
     String visiblidad = (String)miSession.getAttribute("visiblidad");
     
     
     
     
      if (usuario==null)
      {
           response.sendRedirect("sinLogin.jsp");
      }
   
   
    
      out.write("\n");
      out.write("    -->\n");
      out.write("    <div id=\"wrapper\">\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
HttpSession sesion = request.getSession();

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


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Sidebar -->\n");
      out.write("<ul class=\"navbar-nav gradiente-azul-oscuro sidebar sidebar-dark accordion\" id=\"accordionSidebar\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Nav Item - Dashboard -->\n");
      out.write("    <li class=\"nav-item active\">\n");
      out.write("\n");
      out.write("        <!-- Sidebar - Brand -->\n");
      out.write("        <a class=\"sidebar-brand d-flex align-items-center justify-content-center shadow\" href=\"index.jsp\">\n");
      out.write("            <div class=\"sidebar-brand-icon\">\n");
      out.write("                <img src=\"recursos/img/iconologo.jpg\" class=\"rounded-circle img-thumbnail m-auto shadow\" alt=\"logo misnisterio de seguridad buenos aires\" style=\"height: 60px\"/>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"sidebar-brand-text mx-lg-3 mt-auto \"> <h3>S.R.D.P.</h3></div>\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <!-- Divider -->\n");
      out.write("        <hr class=\"sidebar-divider my-0\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    </li>\n");
      out.write("\n");
      out.write("    <!-- Divider -->\n");
      out.write("    <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("    <!-- Heading -->\n");
      out.write("    <div class=\"sidebar-heading mt-2\">\n");
      out.write("        Gestión\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link collapsed shadow-lg\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapse-header\"\n");
      out.write("           aria-expanded=\"true\" aria-controls=\"collapse-header\">\n");
      out.write("            <i class=\"fas fa-regular fa-address-book\"></i>\n");
      out.write("            <span >Detenidos</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapse-header\" class=\"collapse\" aria-labelledby=\"headingTwo\" data-parent=\"#accordionSidebar\">\n");
      out.write("            <div class=\"bg-white py-2 collapse-inner rounded border-bottom-secondary shadow\">\n");
      out.write("                <h6 class=\"collapse-header\">Acciones:</h6>\n");
      out.write("                <a class=\"collapse-item \" href=\"registrarDetenido.jsp\">Registrar Ingreso</a>\n");
      out.write("                <a class=\"collapse-item \" href=\"SVRegistrarEgreso\">Registrar Egreso</a>\n");
      out.write("                <a class=\"collapse-item\" href=\"SVVerDetenidos\">Ver Registros</a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </li>\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link collapsed dropdown shadow-lg\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseTwo\"\n");
      out.write("           aria-expanded=\"true\" aria-controls=\"collapseTwo\">\n");
      out.write("            <i class=\"fas fa-solid fa-hospital-user \" ></i>\n");
      out.write("            <span>Reportes</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapseTwo\" class=\"collapse\" aria-labelledby=\"headingTwo\" data-parent=\"#accordionSidebar\">\n");
      out.write("            <div class=\"bg-white py-2 collapse-inner rounded border-bottom-secondary shadow-lg\">\n");
      out.write("                <h6 class=\"collapse-header\">Acciones:</h6>\n");
      out.write("                <a class=\"collapse-item\" href=\"crearReporte.jsp\">Generar Reporte</a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </li>\n");
      out.write("\n");
      out.write("    <!-- Nav Item - Utilities Collapse Menu -->\n");
      out.write("    <li class=\"nav-item\" style=\"display: ");
      out.print(displ);
      out.write("\">\n");
      out.write("        <a class=\"nav-link collapsed shadow-lg\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUsers\"\n");
      out.write("           aria-expanded=\"true\" aria-controls=\"collapseUsers\">\n");
      out.write("\n");
      out.write("            <i class=\"fas fa-solid fa-user-plus\"></i>\n");
      out.write("            <span>Usuarios</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapseUsers\" class=\"collapse shadow-lg\" aria-labelledby=\"collapseUsers\"\n");
      out.write("             data-parent=\"#accordionSidebar\">\n");
      out.write("            <div class=\"bg-white py-2 collapse-inner rounded border-bottom-secondary\">\n");
      out.write("                <h6 class=\"collapse-header\">Acciones: </h6>\n");
      out.write("                <a class=\"collapse-item\" href=\"administrarUsuarios.jsp\">Administrar Usuarios</a>\n");
      out.write("                <a class=\"collapse-item\" href=\"crearPolicia.jsp\">Registrar Funcionario</a>\n");
      out.write("                <a class=\"collapse-item\" href=\"SVVerPolicias\">Ver Funcionarios</a>\n");
      out.write("                <a class=\"collapse-item\" href=\"SVCargarDatos\">Asignar Usuario</a>\n");
      out.write("                <a class=\"collapse-item\" href=\"SvUsuarios\">Ver Usuarios</a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Divider -->\n");
      out.write("    <hr class=\"sidebar-divider\">\n");
      out.write("    <form action=\"registrarDetenido.jsp\" method=\"GET\">\n");
      out.write("        <div class=\"container-fluid mt-3\">\n");
      out.write("\n");
      out.write("            <div class=\"text-center d-flex justify-content-center align-items-center\">\n");
      out.write("\n");
      out.write("                <button id=\"sidebarToggle\" type=\"button\" class=\"rounded-circle border-0 btn \"><i class=\"fa-solid fa-arrows-left-right \"></i></button>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"text-center d-flex justify-content-center align-items-center mt-1 mb-5\" id=\"\">\n");
      out.write("\n");
      out.write("                <button type=\"submit\" class=\"btn-facebook btn shadow border-dark\">Registrar Detenido</button>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("</ul>\n");
      out.write("<!-- End of Sidebar -->\n");
      out.write("\n");
      out.write("<div class=\"text-center d-none d-md-inline \">\n");
      out.write("    <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3\">\n");
      out.write("        <i class=\"fa fa-bars\"></i>\n");
      out.write("    </button>\n");
      out.write("</div>\n");
      out.write("<!-- Content Wrapper -->\n");
      out.write("<div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Topbar -->\n");
      out.write("    <nav class=\"navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow\">\n");
      out.write("\n");
      out.write("        <!-- Sidebar Toggle (Topbar) -->\n");
      out.write("        <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3 shadow\">\n");
      out.write("            <i class=\"fa fa-bars \"></i>\n");
      out.write("        </button>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Topbar Navbar -->\n");
      out.write("        <ul class=\"navbar-nav ml-auto\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"topbar-divider d-none d-sm-block\"></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- Nav Item - User Information -->\n");
      out.write("            <li class=\"nav-item dropdown no-arrow\">\n");
      out.write("                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"userDropdown\" role=\"button\"\n");
      out.write("                   data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                    <span class=\"mr-2 d-none d-lg-inline text-gray-600 small\">\n");
      out.write("                        USUARIO: ");
      out.print(us);
      out.write("   \n");
      out.write("                    </span>\n");
      out.write("                    <img class=\"img-profile rounded-circle m-auto\"\n");
      out.write("                         src=\"recursos/img/undraw_profile.svg\">\n");
      out.write("                </a>\n");
      out.write("                <!-- Dropdown - User Information -->\n");
      out.write("                <div class=\"dropdown-menu dropdown-menu-right shadow animated--grow-in\"\n");
      out.write("                     aria-labelledby=\"userDropdown\">\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\">\n");
      out.write("                        <i class=\"fas fa-user fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                        Perfil\n");
      out.write("                    </a>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"dropdown-divider\"></div>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">\n");
      out.write("\n");
      out.write("                        <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                        Cerrar Sesión\n");
      out.write("\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- End of Topbar -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Begin Page Content -->\n");
      out.write("<div class=\"container-fluid \">\n");
      out.write("   \n");
      out.write("    <!-- Page Heading -->\n");
      out.write("    <div class=\"row  mt-2\">\n");
      out.write("        <div class=\"col-sm-12\">\n");
      out.write("            <h1 class=\"h2 titulo-color text-center\">Sistema de Registro de Detenidos Penales</h1>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container justify-content-center mt-2\">\n");
      out.write("        <div class=\"col-sm-12\">\n");
      out.write("            ");
      out.write('\n');
      out.write('\n');
HttpSession miSes = request.getSession();

    String visib = (String) miSes.getAttribute("visiblidad");
    String display;
    if (visib != null && visib.equals("hidden")) {
        display = "none";
    } else {
        display = "true";
    }


      out.write("\n");
      out.write("<section class=\"m-auto pb-5\">\n");
      out.write("    <div class=\"row justify-content-center\">\n");
      out.write("        <div class=\"col-lg-6 col-md-6 col-sm-10 mb-3\">\n");
      out.write("            <div class=\"card text-center pt-2 shadow h-100\">\n");
      out.write("                <img src=\"recursos/img/mas.png\" class=\"card-img-top m-auto img-fluid p-1\" alt=\"...\" style=\"max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px\">\n");
      out.write("                <div class=\"card-body d-flex flex-column\">\n");
      out.write("                    <h5 class=\"card-title\">Registrar Ingreso de Detenido</h5>\n");
      out.write("                    <p class=\"card-text\">Registrar a un detenido en el sistema</p>\n");
      out.write("                    <a href=\"registrarDetenido.jsp\" class=\"btn gradiente-azul-oscuro mt-auto\">Ingresar</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6 col-md-6 col-sm-10 mb-3\">\n");
      out.write("            <div class=\"card text-center pt-2 shadow h-100\">\n");
      out.write("                <img src=\"recursos/img/menos-removebg-preview.png\" class=\"card-img-top m-auto img-fluid p-1\" alt=\"...\" style=\"max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px\">\n");
      out.write("                <div class=\"card-body d-flex flex-column\">\n");
      out.write("                    <h5 class=\"card-title\">Registrar Egreso de Detenido</h5>\n");
      out.write("                    <p class=\"card-text\">Registrar el egreso de un detenido en el sistema</p>\n");
      out.write("                    <a href=\"SVRegistrarEgreso\" class=\"btn gradiente-azul-oscuro mt-auto\">Ingresar</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6 col-md-6 col-sm-10 mb-3\">\n");
      out.write("            <div class=\"card text-center pt-2 shadow h-100\">\n");
      out.write("                <img src=\"recursos/img/ver-removebg-preview.png\" class=\"card-img-top m-auto img-fluid p-1\" alt=\"...\" style=\"max-width: 100px; max-height: 100px;   min-height: 100px; min-width: 100px\">\n");
      out.write("                <div class=\"card-body d-flex flex-column\">\n");
      out.write("                    <h5 class=\"card-title\">Ver Registros</h5>\n");
      out.write("                    <p class=\"card-text\">Visatlizacion detenidos registrados en el sistema</p>\n");
      out.write("                    <a href=\"SVVerDetenidos\" class=\"btn gradiente-azul-oscuro mt-auto\">Ingresar</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6 col-md-6 col-sm-10 mb-3\">\n");
      out.write("            <div class=\"card text-center pt-2 shadow h-100\">\n");
      out.write("                <img src=\"recursos/img/book.png\" class=\"card-img-top m-auto img-fluid p-1\" alt=\"...\" style=\"max-width: 100px; max-height: 100px;\">\n");
      out.write("                <div class=\"card-body d-flex flex-column\">\n");
      out.write("                    <h5 class=\"card-title\">Generar Reporte</h5>\n");
      out.write("                    <p class=\"card-text\">Generar un reporte de detenidos registrados</p>\n");
      out.write("                    <a href=\"crearReporte.jsp\" class=\"btn gradiente-azul-oscuro mt-auto\">Ingresar</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6 col-md-6 col-sm-10 mb-3\" style=\"display: ");
      out.print(display);
      out.write(";\">\n");
      out.write("            <div class=\"card text-center pt-2 shadow h-100\">\n");
      out.write("                <img src=\"recursos/img/user.png\" class=\"card-img-top m-auto img-fluid p-1\" alt=\"...\" style=\"max-width: 100px; max-height: 100px;\">\n");
      out.write("                <div class=\"card-body d-flex flex-column\">\n");
      out.write("                    <h5 class=\"card-title\">Administrar Usuarios</h5>\n");
      out.write("                    <p class=\"card-text\">Administrar usuarios registrados</p>\n");
      out.write("                    <a href=\"administrarUsuarios.jsp\" class=\"btn gradiente-azul-oscuro mt-auto\">Ingresar</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write(" </div>  \n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Scroll to Top Button-->\n");
      out.write("<a class=\"scroll-to-top rounded\" href=\"#page-top\">\n");
      out.write("    <i class=\"fas fa-angle-up\"></i>\n");
      out.write("</a>\n");
      out.write("\n");
      out.write("<!-- Logout Modal-->\n");
      out.write("<div class=\"modal fade\" id=\"logoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\"\n");
      out.write("     aria-hidden=\"true\" >\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\" >\n");
      out.write("        <div class=\"modal-content\" >\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <h5 class=\"modal-title\" id=\"exampleModalLabel\">¿Desea continuar?</h5>\n");
      out.write("                <button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                    <span aria-hidden=\"true\"><i class=\"fas fa-solid fa-power-off\"></i></span>\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">Seleccione \"Cerrar sesión\" a continuación si desea finalizar su sesión actual.</div>\n");
      out.write("\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                    <form action=\"SVCerrarSesion\" method=\"GET\">\n");
      out.write("                        <button type=\"submit\"  class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">\n");
      out.write("\n");
      out.write("                            <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                            Cerrar Sesión\n");
      out.write("\n");
      out.write("                        </button>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Footer -->\n");
      out.write("<footer class=\" bg-gradient-dark fixed-bottom text-gray-100\">\n");
      out.write("    <div class=\"container my-auto\">\n");
      out.write("        <div class=\"copyright text-center my-auto\">\n");
      out.write("            <span>Copyright &copy; Your Website for Jonathan Illescas</span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Bootstrap core JavaScript-->\n");
      out.write("<script src=\"recursos/vendor/jquery/jquery.min.js\"></script>\n");
      out.write("<script src=\"recursos/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Core plugin JavaScript-->\n");
      out.write("<script src=\"recursos/vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Custom scripts for all pages-->\n");
      out.write("<script src=\"recursos/js/sb-admin-2.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Page level plugins -->\n");
      out.write("<script src=\"recursos/vendor/chart.js/Chart.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Page level custom scripts -->\n");
      out.write("<script src=\"recursos/js/demo/chart-area-demo.js\"></script>\n");
      out.write("<script src=\"recursos/js/demo/chart-pie-demo.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Page level plugins -->\n");
      out.write("<script src=\"recursos/vendor/datatables/jquery.dataTables.min.js\"></script>\n");
      out.write("<script src=\"recursos/vendor/datatables/dataTables.bootstrap4.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Page level custom scripts -->\n");
      out.write("<script src=\"recursos/js/demo/datatables-demo.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"recursos/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("<script src=\"https://unpkg.com/aos@2.3.1/dist/aos.js\"></script>\n");
      out.write("<script>\n");
      out.write("    AOS.init();\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Incluye los scripts de Bootstrap JS y Popper.js (necesario para los componentes de Bootstrap) -->\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("<!-- Incluye jQuery (necesario para Datepicker) -->\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("<!-- Incluye Datepicker -->\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js\"></script>\n");
      out.write("<!-- Incluye la localización en español para Datepicker -->\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js\"></script>\n");
      out.write("<!-- Configura Datepicker -->\n");
      out.write("<script>\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        $('#fecha').datepicker({\n");
      out.write("            format: 'dd/mm/yyyy',\n");
      out.write("            autoclose: true,\n");
      out.write("            todayHighlight: true,\n");
      out.write("            language: 'es', // Establece el idioma en español\n");
      out.write("            daysOfWeekDisabled: '0,6' // Desactiva domingo (0) y sábado (6)\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<!-- Incluye los scripts de Bootstrap Icons -->\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Incluye los scripts de Bootstrap Icons -->\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Bootstrap core JavaScript-->\n");
      out.write("<script src=\"recursos/vendor/jquery/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Page level plugins -->\n");
      out.write("<script src=\"recursos/vendor/datatables/jquery.dataTables.min.js\"></script>\n");
      out.write("<script src=\"recursos/vendor/datatables/dataTables.bootstrap4.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script src=\"recursos/js/demo/funciones.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- End of Footer -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("</body>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
