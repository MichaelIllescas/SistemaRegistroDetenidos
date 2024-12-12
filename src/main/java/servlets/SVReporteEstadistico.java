package servlets;

import java.awt.Color;
import java.awt.geom.Point2D;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.AttributedString;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 * Servlet para generar reportes estadísticos.
 */
@WebServlet(name = "SVReporteEstadistico", urlPatterns = {"/SVReporteEstadistico"})
public class SVReporteEstadistico extends HttpServlet {

    Controladora controladora = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String fechaDesdeStr = request.getParameter("fechaDesde");
        String fechaHastaStr = request.getParameter("fechaHasta");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDesde = null;
        Date fechaHasta = null;

        sesion.removeAttribute("chartImage");

        try {
            if (fechaDesdeStr != null && fechaHastaStr != null) {
                fechaDesde = sdf.parse(fechaDesdeStr);
                fechaHasta = sdf.parse(fechaHastaStr);
            }
            if (fechaDesde != null && fechaHasta != null && fechaDesde.after(fechaHasta)) {
                sesion.setAttribute("errorFecha", "La fecha 'Desde' debe ser anterior a la fecha 'Hasta'.");
                response.sendRedirect("reporteEstadistico.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        sesion.setAttribute("fechaDesde", fechaDesde);
        sesion.setAttribute("fechaHasta", fechaHasta);

        List<Object[]> datosDelito = controladora.getDetenidosPorDelito(fechaDesde, fechaHasta);
        
        Integer totalDelitos=0;
        
      
        
        if (datosDelito == null || datosDelito.isEmpty()) {
            sesion.setAttribute("mensaje", "No hay registros para la fecha seleccionada.");
            response.sendRedirect("reporteEstadistico.jsp");
            return;
        }

        // Calcular total de detenidos y desglose por delito
        int totalDetenidos = 0;
        StringBuilder detalleDelitos = new StringBuilder();
        for (Object[] row : datosDelito) {
            String delito = (String) row[0];
            Long cantidadLong = (Long) row[1];
            int cantidad = cantidadLong != null ? cantidadLong.intValue() : 0;
            totalDetenidos += cantidad;
            detalleDelitos.append(delito).append(": ").append(cantidad).append("<br>");
        }

        // Guardar totales en la sesión
        sesion.setAttribute("totalDetenidos", totalDetenidos);
        sesion.setAttribute("detalleDelitos", detalleDelitos.toString());

        // Crear el dataset para el gráfico
        DefaultPieDataset dataset = crearDataset(datosDelito);

        // Crear y personalizar el gráfico
        JFreeChart chart = ChartFactory.createPieChart(
                "Detenidos por Delito",
                dataset,
                true,
                true,
                false
        );
        chart.setBackgroundPaint(Color.white);
        PiePlot plot = (PiePlot) chart.getPlot();
        plot.setLabelGenerator(new PieSectionLabelGenerator() {
            @Override
            public String generateSectionLabel(PieDataset dataset, Comparable key) {
                Number value = dataset.getValue(key);
                double total = getTotal(dataset);
                double percentage = (value.doubleValue() / total) * 100;
                return key + " (Cantidad de Detenidos: " + value.intValue() + ", Portentaje:" + String.format("%.2f", percentage) + "%)";
            }

            @Override
            public AttributedString generateAttributedSectionLabel(PieDataset dataset, Comparable key) {
                return null;
            }
        });

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ChartUtils.writeChartAsPNG(baos, chart, 600, 400);

        sesion.setAttribute("chartImage", baos.toByteArray());
        response.sendRedirect("reporteEstadistico.jsp");
    }

    private DefaultPieDataset crearDataset(List<Object[]> datosDelito) {
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (Object[] row : datosDelito) {
            String delito = (String) row[0];
            Long cantidadLong = (Long) row[1];
            int cantidad = cantidadLong != null ? cantidadLong.intValue() : 0;
            dataset.setValue(delito, cantidad);
        }
        return dataset;
    }

    private double getTotal(PieDataset dataset) {
        double total = 0;
        for (int i = 0; i < dataset.getItemCount(); i++) {
            total += dataset.getValue(i).doubleValue();
        }
        return total;
    }
}
