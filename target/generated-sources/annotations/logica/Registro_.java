package logica;

import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Causa;
import logica.Usuario;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-11-08T19:09:18", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Registro.class)
public class Registro_ { 

    public static volatile SingularAttribute<Registro, Boolean> estado;
    public static volatile SingularAttribute<Registro, Causa> causa;
    public static volatile SingularAttribute<Registro, Date> fechaRegistro;
    public static volatile SingularAttribute<Registro, String> observaciones;
    public static volatile SingularAttribute<Registro, Usuario> usuario;
    public static volatile SingularAttribute<Registro, Integer> id;

}