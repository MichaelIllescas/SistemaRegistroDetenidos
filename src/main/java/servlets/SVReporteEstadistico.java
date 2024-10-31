package servlets;

import com.google.gson.Gson;
import java.awt.Color;
import java.awt.Font;
import java.awt.geom.Point2D;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.AttributedString;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 *
 * @author jonii
 */
@WebServlet(name = "SVReporteEstadistico", urlPatterns = {"/SVReporteEstadistico"})
public class SVReporteEstadistico extends HttpServlet {

    Controladora controladora = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaDesdeStr = request.getParameter("fechaDesde");
        String fechaHastaStr = request.getParameter("fechaHasta");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDesde = null;
        Date fechaHasta = null;

        request.getSession().removeAttribute("chartImage");

        try {
            if (fechaDesdeStr != null && fechaHastaStr != null) {
                fechaDesde = sdf.parse(fechaDesdeStr);
                fechaHasta = sdf.parse(fechaHastaStr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Guardar las fechas en la sesión
        request.getSession().setAttribute("fechaDesde", fechaDesde);
        request.getSession().setAttribute("fechaHasta", fechaHasta);

        List<Object[]> datosDelito = controladora.getDetenidosPorDelito(fechaDesde, fechaHasta);

        // Verificar si hay datos para mostrar
        if (datosDelito == null || datosDelito.isEmpty()) {
            // No hay datos para mostrar, establecer un mensaje en la sesión
            request.getSession().setAttribute("mensaje", "No hay registros para la fecha seleccionada.");
            // Redirigir al JSP
            response.sendRedirect("reporteEstadistico.jsp");
            return; // Salir del método
        }

        // Crear el dataset para el gráfico de torta
        DefaultPieDataset dataset = crearDataset(datosDelito);

        // Crear el gráfico
        JFreeChart chart = ChartFactory.createPieChart(
                "Detenidos por Delito",
                dataset,
                true,
                true,
                false
        );

        // Establecer el color de fondo del gráfico
        chart.setBackgroundPaint(Color.white);

        // Personalizar las etiquetas del gráfico para mostrar cantidades y porcentajes
        PiePlot plot = (PiePlot) chart.getPlot();
        plot.setLabelGenerator(new PieSectionLabelGenerator() {
            @Override
            public String generateSectionLabel(PieDataset dataset, Comparable key) {
                Number value = dataset.getValue(key);
                double total = dataset.getValue(key).doubleValue();
                double percentage = (total / getTotal(dataset)) * 100; // Calcular porcentaje
                return key + " (Cantidad: " + value.intValue() + ", Total: " + String.format("%.2f", percentage) + "%)";
            }

            @Override
            public AttributedString generateAttributedSectionLabel(PieDataset pd, Comparable cmprbl) {
                throw new UnsupportedOperationException("Not supported yet.");
            }
        });

        // Agregar texto de fechas al gráfico
        String fechaTexto = "Reporte desde " + sdf.format(fechaDesde) + " hasta " + sdf.format(fechaHasta);
        plot.setNoDataMessage(fechaTexto);
        
        // Guardar el gráfico en un array de bytes
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ChartUtils.writeChartAsPNG(baos, chart, 600, 400);
        
        // Guardar el array de bytes en la sesión
        request.getSession().setAttribute("chartImage", baos.toByteArray());

        // Redirigir al JSP
        response.sendRedirect("reporteEstadistico.jsp");
    }

    private DefaultPieDataset crearDataset(List<Object[]> datosDelito) {
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (Object[] row : datosDelito) {
            String delito = (String) row[0];
            Long cantidadLong = (Long) row[1];
            Integer cantidad = cantidadLong != null ? cantidadLong.intValue() : 0;
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
