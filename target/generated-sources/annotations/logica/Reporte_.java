package logica;

import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Registro;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-11-12T12:18:17", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Reporte.class)
public class Reporte_ { 

    public static volatile SingularAttribute<Reporte, Date> fechaInicio;
    public static volatile SingularAttribute<Reporte, Date> fechaCreacion;
    public static volatile SingularAttribute<Reporte, Integer> id;
    public static volatile SingularAttribute<Reporte, Date> fechaFin;
    public static volatile SingularAttribute<Reporte, Registro> registro;

}