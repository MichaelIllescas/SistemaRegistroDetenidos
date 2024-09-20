package logica;

import com.google.protobuf.TextFormat.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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

    public static Detenido buscarDetenidoPorId(List<Detenido> listaDeDetenidos, int id) {
        for (Detenido detenido : listaDeDetenidos) {
            if (detenido.getId() == id) {
                return detenido;
            }
        }
        return null;
    }

    public static Denunciante buscarDenunciantePorId(List<Denunciante> listaDeDenunciantes, int id) {
        for (Denunciante denunciante : listaDeDenunciantes) {
            if (denunciante.getId() == id) {
                return denunciante;
            }
        }
        return null;
    }

    public static String convertirDateAinputDate(Date fecha) {
        if (fecha == null) {
            return "";
        } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.format(fecha);
        }

    }

    public static String dateToStringReturn(Date date) {
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

    public static String MD5(String md5) {

        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();

            for (int i = 0; i < array.length; i++) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
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

    public static int buscarRegistroPorIdDetenido(List<Registro> registros, int idDetenido) {
        for (Registro registro : registros) {
            if (registro.getCausa().getDetenidos() != null) {
                for (Detenido detenido : registro.getCausa().getDetenidos()) {
                    if (detenido.getId() == idDetenido) {
                        return registro.getId();
                    }
                }
            }
        }
        return -1; // Si no se encuentra el detenido
    }

    public static String validarContrasena(String contrasena) {
        StringBuilder mensajes = new StringBuilder();

        // Validación de longitud mínima
        if (contrasena.length() < 6) {
            mensajes.append("- La contraseña debe tener al menos 8 caracteres.\n");
        }

        // Validación de mezcla de caracteres
        boolean tieneMayuscula = false;
        boolean tieneMinuscula = false;
        boolean tieneNumero = false;
        boolean tieneCaracterEspecial = false;

        for (char c : contrasena.toCharArray()) {
            if (Character.isUpperCase(c)) {
                tieneMayuscula = true;
            }
            if (Character.isLowerCase(c)) {
                tieneMinuscula = true;
            }
            if (Character.isDigit(c)) {
                tieneNumero = true;
            }
            if ("!@#$%^&*()_+-=[]{}|;':\",.<>?/~`".contains(String.valueOf(c))) {
                tieneCaracterEspecial = true;
            }
        }

        if (!tieneMayuscula) {
            mensajes.append("- La contraseña debe incluir al menos una letra mayúscula.\n");
        }
        if (!tieneMinuscula) {
            mensajes.append("- La contraseña debe incluir al menos una letra minúscula.\n");
        }
        if (!tieneNumero) {
            mensajes.append("- La contraseña debe incluir al menos un número.\n");
        }
        if (!tieneCaracterEspecial) {
            mensajes.append("- La contraseña debe incluir al menos un carácter especial.\n");
        }

        // Validación de no usar información personal
        if (contrasena.toLowerCase().contains("nombre") || contrasena.toLowerCase().contains("usuario")) {
            mensajes.append("- La contraseña no debe contener información personal.\n");
        }

        // Validación de contraseñas comunes
        List<String> contrasenasComunes = Arrays.asList("123456", "password", "qwerty", "abc123", "letmein");
        if (contrasenasComunes.contains(contrasena)) {
            mensajes.append("- La contraseña no debe ser una contraseña común.<br>\n");
        }

        // Validación de repetición de caracteres
        for (int i = 0; i < contrasena.length() - 2; i++) {
            if (contrasena.charAt(i) == contrasena.charAt(i + 1) && contrasena.charAt(i) == contrasena.charAt(i + 2)) {
                mensajes.append("- La contraseña no debe tener más de tres caracteres iguales consecutivos.\n");
                break;
            }
        }

        // Devolver los mensajes de validación o un string vacío si la contraseña es segura
        return mensajes.length() > 0 ? mensajes.toString() : "";
    }

    public static String validarClaves(String clave1, String clave2) {
        if (clave1.equals(clave2)) {
            return ""; // Claves iguales, devuelve un string vacío
        } else {
            return "- Las contraseñas deben ser iguales."; // Mensaje de error
        }
    }
      public static String verificarPoliciaRegistrado(Policia policia) {
        Controladora controladora=new Controladora();
        List<Policia> listaPolicias = controladora.getPolicias();

        for (Policia p : listaPolicias) {
            if (p.getLegajo().equals(policia.getLegajo()) || p.getDni().equals(policia.getDni())) {
                return "El policía "+ p.getNombre()+ " "
                        +p.getApellido()+" "+ p.getLegajo()+ " ya se encuentra registrado.";
            }
        }

        return null; // Si no se encuentra registrado
    }
    
    
}
