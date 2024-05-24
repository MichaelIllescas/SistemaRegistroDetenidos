
package logica;

import com.google.protobuf.TextFormat.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class Utilitaria {

    public static Date convertStringToDate(String dateString, String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        Date date = null;
        try {
            date = formatter.parse(dateString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

      public static String dateToString(Date date) {
        if (date != null) {
            // Define el formato deseado para la fecha
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            // Aplica el formato y convierte la fecha a String
            String formattedDate = sdf.format(date);
            // Retorna la fecha formateada como String
            return formattedDate;
        } else {
            return "----";
        }
    }
     
     
     
}
