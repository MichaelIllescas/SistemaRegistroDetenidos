
package logica;

import com.google.protobuf.TextFormat.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;



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
     
      public static Detenido buscarDetenidoPorId(List<Detenido>listaDeDetenidos, int id){
          for(Detenido detenido: listaDeDetenidos){
              if (detenido.getId() ==id){
                  return detenido;
              }
          }
        return null;
      }
          public static Denunciante buscarDenunciantePorId(List<Denunciante>listaDeDenunciantes, int id){
          for(Denunciante denunciante : listaDeDenunciantes){
              if (denunciante.getId() ==id){
                  return denunciante;
              }
          }
        return null;
      }
     
      public static String convertirDateAinputDate(Date fecha){
          if (fecha == null){
              return "";
          }else{
          SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
          return dateFormat.format(fecha);
      }

      }
      
         public  static String dateToStringReturn(Date date) {
        // Define el formato deseado para la fecha
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        // Aplica el formato y convierte la fecha a String
        String formattedDate = sdf.format(date);
        // Retorna la fecha formateada como String
        return formattedDate;
    }
         
          // Método para reemplazar un detenido en la lista
    public static void reemplazarDetenidoPorId(List<Detenido> detenidos, Detenido nuevoDetenido) {
        if (detenidos == null || nuevoDetenido == null) {
            return;
        }
        
        for (int i = 0; i < detenidos.size(); i++) {
            Detenido detenido = detenidos.get(i);
            if (detenido.getId() == nuevoDetenido.getId()) {
                detenidos.set(i, nuevoDetenido);
                break;
            }
        }
    }
         
}
