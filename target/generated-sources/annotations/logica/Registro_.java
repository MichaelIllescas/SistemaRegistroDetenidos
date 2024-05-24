package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Causa;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-05-23T21:05:53")
@StaticMetamodel(Registro.class)
public class Registro_ { 

    public static volatile SingularAttribute<Registro, Causa> causa;
    public static volatile SingularAttribute<Registro, Date> fechaRegistro;
    public static volatile SingularAttribute<Registro, String> observaciones;
    public static volatile SingularAttribute<Registro, Usuario> usuario;
    public static volatile SingularAttribute<Registro, Integer> id;

}