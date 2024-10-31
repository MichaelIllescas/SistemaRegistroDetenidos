package logica;

import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Causa;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-10-31T12:31:01", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Detenido.class)
public class Detenido_ extends Persona_ {

    public static volatile SingularAttribute<Detenido, Date> fechaIngreso;
    public static volatile SingularAttribute<Detenido, Boolean> estado;
    public static volatile SingularAttribute<Detenido, Causa> causa;
    public static volatile SingularAttribute<Detenido, Date> fechaEgreso;
    public static volatile SingularAttribute<Detenido, String> calidad;

}