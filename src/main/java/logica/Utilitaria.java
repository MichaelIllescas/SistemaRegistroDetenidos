
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

}
