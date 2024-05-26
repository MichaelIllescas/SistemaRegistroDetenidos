package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Registro;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-05-25T23:06:36")
@StaticMetamodel(Reporte.class)
public class Reporte_ { 

    public static volatile SingularAttribute<Reporte, Date> fechaInicio;
    public static volatile SingularAttribute<Reporte, Date> fechaCreacion;
    public static volatile SingularAttribute<Reporte, Integer> id;
    public static volatile SingularAttribute<Reporte, Date> fechaFin;
    public static volatile SingularAttribute<Reporte, Registro> registro;

}