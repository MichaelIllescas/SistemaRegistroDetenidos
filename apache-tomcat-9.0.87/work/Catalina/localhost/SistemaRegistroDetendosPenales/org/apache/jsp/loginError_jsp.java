/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-12-12 12:22:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginError_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/recursos/components/head.jsp", Long.valueOf(1731105139541L));
    _jspx_dependants.put("/recursos/components/footer.jsp", Long.valueOf(1729281232000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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

      out.write('\n');
      out.write('\n');
      out.write('\n');
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
      out.write("  ");
      out.write("\n");
      out.write("\n");
      out.write("<body class=\"gradiente-azul-oscuro mb-5\">\n");
      out.write("\n");
      out.write("    <div class=\"container border-bottom-secondary m-auto \"\n");
      out.write("         data-aos=\"flip-left\"\n");
      out.write("         data-aos-easing=\"ease-out-cubic\"\n");
      out.write("         data-aos-duration=\"1200\">\n");
      out.write("\n");
      out.write("        <!-- Outer Row -->\n");
      out.write("        <div class=\"row justify-content-center\">\n");
      out.write("\n");
      out.write("            <div class=\"col-xl-10 col-lg-10 col-md-9 \">\n");
      out.write("\n");
      out.write("                <div class=\"card o-hidden border-0 shadow-lg my-5 \">\n");
      out.write("                    <div class=\"card-body p-0\">\n");
      out.write("                        <!-- Nested Row within Card Body -->\n");
      out.write("                        <div class=\"row rounded-pill bg-gradient-dark text-center \">\n");
      out.write("\n");
      out.write("                            <div class=\"col-lg-6\">\n");
      out.write("                                <div class=\"p-5\" >\n");
      out.write("                                    <div class=\"user text-center contendor\">\n");
      out.write("                                        <h1 class=\"h4 text-white mb-5\">Ingreso a S.R.D.P.</h1>\n");
      out.write("                                    </div>\n");
      out.write("                                    <form class=\"user text-center \" action=\"\" method=\"POST\">\n");
      out.write("\n");
      out.write("                                        <div class=\"text-center\">\n");
      out.write("                                            <p class=\"text-white\">\n");
      out.write("                                                ");
 if (session.getAttribute("inhabilitado") != null) {
      out.write("\n");
      out.write("                                                ");
      out.print( session.getAttribute("inhabilitado"));
      out.write("\n");
      out.write("                                                ");
 } else { 
      out.write("\n");
      out.write("                                                Usuario o Contraseña Incorrectos.\n");
      out.write("                                                ");
 }
      out.write("\n");
      out.write("                                            </p>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <div>\n");
      out.write("                                            <a href=\"login.jsp\" class=\" btn bg-gradient-info btn-user text-lg text-white\">\n");
      out.write("                                                Intentar de nuevo\n");
      out.write("                                            </a>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <div class=\"mt-4 mb-2\">\n");
      out.write("                                            <a href=\"#\" onclick=\"mostrarPopup()\">¿Olvidó su clave?</a>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                        <div id=\"overlay\"></div>\n");
      out.write("\n");
      out.write("                                        <div id=\"popup\" class=\"gradiente-azul-oscuro\">\n");
      out.write("                                            <span class=\"close\" onclick=\"cerrarPopup()\">&times;</span>\n");
      out.write("                                            <p class=\"text-lg gradiente-azul-oscuro\">Póngase en contacto con el administrador Jonathan Illescas<br>\n");
      out.write("                                                Teléfono: 2923530179</p>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-lg-6  d-lg-block  bg-logo border-left-dark \"></div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container text-center mt-5\"\n");
      out.write("         data-aos=\"flip-left\"\n");
      out.write("         data-aos-easing=\"ease-out-cubic\"\n");
      out.write("         data-aos-duration=\"1700\">\n");
      out.write("        <img src=\"recursos/img/ministerio.png\" alt=\"alt\" class=\"rounded\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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
      out.write("</html>");
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