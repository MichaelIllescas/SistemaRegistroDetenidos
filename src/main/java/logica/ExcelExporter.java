package logica;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelExporter {

    public static void exportarRegistrosAExcel(List<Registro> registros, HttpServletResponse response) throws IOException {
        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {

            Sheet sheet = workbook.createSheet("Reportes");

// Crear un estilo de celda para el encabezado
            CellStyle headerStyle = workbook.createCellStyle();
            Font headerFont = workbook.createFont();
            headerFont.setBold(true); // Establecer el texto en negrita
            headerStyle.setFont(headerFont);

// Crear cabeceras
            Row headerRow = sheet.createRow(0);

            headerRow.createCell(0).setCellValue("Nombre");
            headerRow.getCell(0).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(1).setCellValue("Apellido");
            headerRow.getCell(1).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(2).setCellValue("DNI");
            headerRow.getCell(2).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(3).setCellValue("Fecha de Nacimiento");
            headerRow.getCell(3).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(4).setCellValue("Ocupacion");
            headerRow.getCell(4).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(5).setCellValue("Telefono");
            headerRow.getCell(5).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(6).setCellValue("Sexo");
            headerRow.getCell(6).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(7).setCellValue("Estado Civil");
            headerRow.getCell(7).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(8).setCellValue("Nacionalidad");
            headerRow.getCell(8).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(9).setCellValue("Fecha de Ingreso");
            headerRow.getCell(9).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(10).setCellValue("Fecha de Egreso");
            headerRow.getCell(10).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(11).setCellValue("Calidad");
            headerRow.getCell(11).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(12).setCellValue("N° Causa");
            headerRow.getCell(12).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(13).setCellValue("Caratula");
            headerRow.getCell(13).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(14).setCellValue("Juzgado");
            headerRow.getCell(14).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(15).setCellValue("Juzgado");
            headerRow.getCell(15).setCellStyle(headerStyle); // Aplicar estilo a la celda

            headerRow.createCell(16).setCellValue("Defensoria");
            headerRow.getCell(16).setCellStyle(headerStyle); // Aplicar estilo a la celda

           

            // Agregar datos de los detenidos desde los registros
            int rowCount = 1;
            for (Registro registro : registros) {
                Causa causa = registro.getCausa(); // Asumiendo que hay un método getCausa()
                if (causa != null) {
                    for (Detenido detenido : causa.getDetenidos()) { // Asegúrate de que tienes un método getDetenidos()
                        Row row = sheet.createRow(rowCount++);
                        row.createCell(0).setCellValue(detenido.getNombre());
                        row.createCell(1).setCellValue(detenido.getApellido());
                        row.createCell(2).setCellValue(detenido.getDni());
                        row.createCell(3).setCellValue(Utilitaria.dateToString(detenido.getFechaNacimiento())); // Fecha de nacimiento
                        row.createCell(4).setCellValue(detenido.getOcupacion().getDescripcion());
                        row.createCell(5).setCellValue(detenido.getTelefono());
                        row.createCell(6).setCellValue(detenido.getSexo().getDescripcion());
                        row.createCell(7).setCellValue(detenido.getEstadoCivil() != null ? detenido.getEstadoCivil().getDescipcion() : "");
                        row.createCell(8).setCellValue(detenido.getNacionalidad() != null ? detenido.getNacionalidad().getDescipcion() : "");
                        row.createCell(9).setCellValue(detenido.getFechaIngreso() != null ? Utilitaria.dateToString(detenido.getFechaIngreso()).toString() : ""); // Fecha de ingreso
                        row.createCell(10).setCellValue(detenido.getFechaEgreso() != null ? Utilitaria.dateToString(detenido.getFechaEgreso()).toString() : "N/A"); // Fecha de egreso
                        row.createCell(11).setCellValue(detenido.getCalidad());
                        row.createCell(12).setCellValue(causa.getNumeroCausa());
                        row.createCell(13).setCellValue(causa.getDelito().getDescripcion());
                        row.createCell(14).setCellValue(causa.getJuzgado() != null ? causa.getJuzgado().getDescripcion() : "");
                        row.createCell(15).setCellValue(causa.getFiscalia() != null ? causa.getFiscalia().getDescripcion() : "");
                        row.createCell(16).setCellValue(causa.getDefensoria() != null ? causa.getDefensoria().getDescripcion() : "");
                    }
                }
            }

            // Escribir el contenido en el ByteArrayOutputStream
            workbook.write(outputStream);

            // Configurar la respuesta para descargar el archivo
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=\"reporte.xlsx\"");

            // Escribir el archivo en la respuesta
            response.getOutputStream().write(outputStream.toByteArray());
            response.getOutputStream().flush();
        } catch (Exception e) {
            e.printStackTrace(); // Para depuración
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generando el reporte.");
        }
    }
}
