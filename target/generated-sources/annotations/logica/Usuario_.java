package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.EstadoUsuario;
import logica.Policia;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-10-17T22:31:05")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> clave;
    public static volatile SingularAttribute<Usuario, EstadoUsuario> estado;
    public static volatile SingularAttribute<Usuario, Integer> contador;
    public static volatile SingularAttribute<Usuario, Policia> policia;
    public static volatile SingularAttribute<Usuario, Integer> id;
    public static volatile SingularAttribute<Usuario, String> nombreUsuario;
    public static volatile SingularAttribute<Usuario, String> rol;

}