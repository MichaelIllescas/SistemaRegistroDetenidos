

# Sistema de Registro de Detenidos

Este proyecto es una aplicación web diseñada para gestionar y registrar información de detenidos penales en una seccional policial. Proporciona una interfaz intuitiva para el registro, consulta y administración de la información de detenidos.

## Tecnologías Utilizadas

- **Java**: Lenguaje de programación principal.
- **JavaServer Pages (JSP)**: Para la generación de contenido dinámico en el lado del servidor.
- **Java Persistence API (JPA)**: Para la gestión de la persistencia de datos.
- **EclipseLink**: Implementación de JPA utilizada como ORM (Object-Relational Mapping).
- **Apache Tomcat 9.0.87**: Servidor web para desplegar la aplicación.
- **MySQL**: Sistema de gestión de bases de datos relacional.
- **BOOTSTRAP 5**: para diseño de interfaces.

## Estructura del Proyecto

La estructura del proyecto es la siguiente:

```
SistemaRegistroDetenidos/
├── apache-tomcat-9.0.87/
│   ├── bin/
│   ├── conf/
│   ├── lib/
│   ├── logs/
│   ├── temp/
│   ├── webapps/
│   └── work/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── sistemaregistrodetenidos/
│   │   │               ├── controllers/
│   │   │               ├── models/
│   │   │               ├── repositories/
│   │   │               └── services/
│   │   ├── resources/
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       └── views/
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── sistemaregistrodetenidos/
├── target/
├── .gitignore
├── pom.xml
├── registro_detenidos.sql
└── registro_detenidosBD.sql
```

- **apache-tomcat-9.0.87/**: Contiene los archivos del servidor Apache Tomcat.
- **src/**: Contiene el código fuente del proyecto.
  - **main/**: Código principal de la aplicación.
    - **java/**: Archivos Java.
      - **com/example/sistemaregistrodetenidos/**: Paquete base del proyecto.
        - **controllers/**: Controladores que manejan las solicitudes HTTP.
        - **models/**: Clases que representan las entidades del dominio.
        - **repositories/**: Interfaces que interactúan con la base de datos.
        - **services/**: Clases que contienen la lógica de negocio.
    - **resources/**: Recursos de la aplicación.
    - **webapp/**: Contiene los archivos web.
      - **WEB-INF/**: Archivos de configuración web.
      - **views/**: Vistas JSP de la aplicación.
  - **test/**: Pruebas unitarias y de integración.
- **target/**: Directorio donde Maven compila y empaqueta la aplicación.
- **.gitignore**: Especifica los archivos y directorios que Git debe ignorar.
- **pom.xml**: Archivo de configuración de Maven que gestiona las dependencias del proyecto.
- **registro_detenidos.sql** y **registro_detenidosBD.sql**: Scripts SQL para la creación de la base de datos y tablas necesarias.

## Requisitos Previos

Antes de instalar y ejecutar la aplicación, asegúrate de tener instalados los siguientes componentes:

- [Java Development Kit (JDK) 17]
- [Apache Maven 3.6.3 o superior]
- [Apache Tomcat 9.0.87]
- [MySQL 8.0 o superior]

## Instalación

Sigue estos pasos para instalar y configurar el proyecto:

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/MichaelIllescas/SistemaRegistroDetenidos.git
   cd SistemaRegistroDetenidos
   ```

2. **Configurar la base de datos**

   - Inicia sesión en MySQL y crea la base de datos ejecutando el script `registro_detenidos.sql` o `registro_detenidosBD.sql`:

     ```bash
     mysql -u tu_usuario -p < registro_detenidos.sql
     ```

   - Asegúrate de que las credenciales de la base de datos estén correctamente configuradas en el archivo de configuración correspondiente de la aplicación.

3. **Compilar y empaquetar la aplicación**

   ```bash
   mvn clean package
   ```

   Esto generará un archivo WAR en el directorio `target/`.

4. **Desplegar la aplicación en Apache Tomcat**

   - Copia el archivo WAR generado en el paso anterior al directorio `webapps` de tu instalación de Apache Tomcat.

   - Inicia Apache Tomcat y accede a la aplicación en `http://localhost:8080/SistemaRegistroDetenidos`.

## Uso

Una vez que la aplicación esté en funcionamiento, puedes acceder a la interfaz web para:

- Registrar nuevos detenidos.
- Consultar información de detenidos existentes.
- Actualizar y eliminar registros de detenidos.


 Autor
Jonathan - GitHub
📞 Contacto Si tienes preguntas o sugerencias, puedes contactarme en: ✉️ Email: joni.illes@hotmail.com 🐙 GitHub: MichaelIllescas 🚀 ¡Gracias por visitar! ⚽💙

Nos encontramos en proceso de desarrollo y mejoras de constantemente!
