package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Defensoria;
import logica.Denunciante;
import logica.Detenido;
import logica.Fiscalia;
import logica.Juzgado;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-05-28T21:48:27")
@StaticMetamodel(Causa.class)
public class Causa_ { 

    public static volatile SingularAttribute<Causa, String> descripcion;
    public static volatile SingularAttribute<Causa, Fiscalia> fiscalia;
    public static volatile SingularAttribute<Causa, String> numeroCausa;
    public static volatile ListAttribute<Causa, Detenido> detenidos;
    public static volatile SingularAttribute<Causa, Juzgado> juzgado;
    public static volatile SingularAttribute<Causa, String> departamentoJudicial;
    public static volatile SingularAttribute<Causa, Integer> id;
    public static volatile SingularAttribute<Causa, Defensoria> defensoria;
    public static volatile ListAttribute<Causa, Denunciante> denunciantes;

}