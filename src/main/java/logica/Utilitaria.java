
package logica;

import com.google.protobuf.TextFormat.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;



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
    
        
          // Método para reemplazar un detenido en la lista
    public static void reemplazarDenunciantePorId(List<Denunciante> denunciantes, Denunciante nuevoDenunciante) {
        if (denunciantes == null || nuevoDenunciante == null) {
            return;
        }
        
        for (int i = 0; i < denunciantes.size(); i++) {
            Denunciante denunciante = denunciantes.get(i);
            if (denunciante.getId() == nuevoDenunciante.getId()) {
                denunciantes.set(i, nuevoDenunciante);
                break;
            }
        }
    }
    
    public static String MD5(String md5){
    
        try {
             java.security.MessageDigest md= java.security.MessageDigest.getInstance("MD5");
             byte [] array=  md.digest(md5.getBytes());
             StringBuffer sb= new StringBuffer();
             
             for ( int i = 0 ;i< array.length;i++){
                 sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100 ).substring(1,3) );
             }
             return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            e.printStackTrace();

        } 
        
        
        return null;
    }
     // Método para comparar una clave ingresada con la clave almacenada (hash)
    public static boolean compareMD5(String originalPassword, String storedHash) {
        String hashedPassword = MD5(originalPassword);
        return hashedPassword != null && hashedPassword.equals(storedHash);
    }

      public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public static boolean verifyPassword(String enteredPassword, String storedHash) {
        return BCrypt.checkpw(enteredPassword, storedHash);
         
}
}