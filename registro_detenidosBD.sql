-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2024 a las 21:49:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro_detenidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causa`
--

CREATE TABLE `causa` (
  `ID` int(11) NOT NULL,
  `DEPARTAMENTOJUDICIAL` varchar(255) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `NUMEROCAUSA` varchar(255) DEFAULT NULL,
  `DEFENSORIA_ID` int(11) DEFAULT NULL,
  `FISCALIA_ID` int(11) DEFAULT NULL,
  `JUZGADO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `causa`
--

INSERT INTO `causa` (`ID`, `DEPARTAMENTOJUDICIAL`, `DESCRIPCION`, `NUMEROCAUSA`, `DEFENSORIA_ID`, `FISCALIA_ID`, `JUZGADO_ID`) VALUES
(11, 'Trenque lauquen', 'leisones graves', 'C-114', 11, 11, 11),
(12, 'Trenque lauquen', 'leisones graves', 'C-114', 12, 12, 12),
(13, 'Trenque lauquen', 'Lesiones graves', 'C-114', 13, 13, 13),
(24, 'trenque Lauquen', 'robo', '17-0-1111/24', 24, 24, 24),
(25, 'Trenque lauquen', 'Homicidio', 'PP-17-00-00123/24', 25, 25, 25),
(26, 'Trenque Lauquen', 'Homicidio', 'C-12112', 26, 26, 26),
(27, 'Trenque Lauquen', 'robo', 'C-114', 27, 27, 27),
(28, 'Trenque lauquen', 'robo', '17-0-1111/24', 28, 28, 28),
(29, 'Trenque lauquen', 'leisones graves', '17-0-1111/24', 29, 29, 29),
(32, 'trenque Lauquen', 'leisones leves', 'C-114', 32, 32, 32),
(33, 'Trenque lauquen', 'leisones graves', '17-0-1111/24', 33, 33, 33),
(34, 'Trenque lauquen', 'leisones graves', '17-0-1111/24', 34, 34, 34),
(35, 'trenque Lauquen', 'leisones graves', '17-0-1111/24', 35, 35, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defensoria`
--

CREATE TABLE `defensoria` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `defensoria`
--

INSERT INTO `defensoria` (`ID`, `DESCRIPCION`, `TITULAR`) VALUES
(11, 'en turno', NULL),
(12, 'en turno', NULL),
(13, 'en turno', NULL),
(24, 'en turno', NULL),
(25, 'en turno', NULL),
(26, 'En turno', NULL),
(27, 'en turno', NULL),
(28, 'en turno', NULL),
(29, 'en turno', NULL),
(32, 'En turno', NULL),
(33, 'en turno', NULL),
(34, 'en turno', NULL),
(35, 'en turno', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denunciante`
--

CREATE TABLE `denunciante` (
  `ID` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `causa_id` int(11) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `denunciante`
--

INSERT INTO `denunciante` (`ID`, `APELLIDO`, `APODO`, `DIRECCION`, `DNI`, `FECHANACIMIENTO`, `INSTUCCION`, `NOMBRE`, `OCUPACION`, `SEXO`, `TELEFONO`, `causa_id`, `ESTADOCIVIL_ID`, `NACIONALIDAD_ID`, `OCUPACION_ID`, `SEXO_ID`) VALUES
(34, '', NULL, '', '', NULL, NULL, '', NULL, NULL, '', 35, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detenido`
--

CREATE TABLE `detenido` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `CALIDAD` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `FECHAEGRESO` date DEFAULT NULL,
  `FECHAINGRESO` date DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT 3,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `causa_id` int(11) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detenido`
--

INSERT INTO `detenido` (`ID`, `NOMBRE`, `APELLIDO`, `DNI`, `APODO`, `CALIDAD`, `DIRECCION`, `FECHAEGRESO`, `FECHAINGRESO`, `FECHANACIMIENTO`, `INSTUCCION`, `OCUPACION_ID`, `SEXO_ID`, `TELEFONO`, `causa_id`, `ESTADOCIVIL_ID`, `NACIONALIDAD_ID`, `ESTADO`) VALUES
(33, 'Jonathan', 'Illescas', '38014100', 'ricki', 'APREHENDIDO', 'Rivadavia', NULL, '2024-10-17', '1994-08-28', 'SI', 12, 1, '02923530179', 35, 33, 35, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

CREATE TABLE `estadocivil` (
  `ID` int(11) NOT NULL,
  `DESCIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`ID`, `DESCIPCION`) VALUES
(33, 'Soltero/a'),
(34, 'Casado/a'),
(35, 'Divorciado/a'),
(36, 'Viudo/a'),
(37, 'Separado/a'),
(38, 'Unión convivencial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadousuario`
--

CREATE TABLE `estadousuario` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadousuario`
--

INSERT INTO `estadousuario` (`ID`, `DESCRIPCION`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiscalia`
--

CREATE TABLE `fiscalia` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fiscalia`
--

INSERT INTO `fiscalia` (`ID`, `DESCRIPCION`, `TITULAR`) VALUES
(11, '4 Depto Judicial: Trenque lauquen', 'talarico karina'),
(12, '4 Depto Judicial: Trenque lauquen', 'talarico karina'),
(13, '4 Depto Judicial: Trenque lauquen', 'talarico karina'),
(24, '5 Depto Judicial: trenque Lauquen', 'manuel iglesias'),
(25, '5 Depto Judicial: Trenque lauquen', 'manuel iglesias'),
(26, '5 Depto Judicial: Trenque Lauquen', 'Manuel Iglesias'),
(27, '5 Depto Judicial: Trenque Lauquen', 'manuel iglesias'),
(28, '5 Depto Judicial: Trenque lauquen', 'manuel iglesias'),
(29, '5 Depto Judicial: Trenque lauquen', 'manuel iglesias'),
(32, '5 Depto Judicial: trenque Lauquen', 'Manuel Perez'),
(33, '5 Depto Judicial: Trenque lauquen', 'manuel iglesias'),
(34, '5 Depto Judicial: Trenque lauquen', 'manuel iglesias'),
(35, '4 Depto Judicial: trenque Lauquen', 'manuel iglesias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgado`
--

CREATE TABLE `juzgado` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juzgado`
--

INSERT INTO `juzgado` (`ID`, `DESCRIPCION`, `TITULAR`) VALUES
(11, 'garantias 2', 'martin garriz       '),
(12, 'garantias 2', 'martin garriz        '),
(13, 'garantias 2, Trenque Lauquen', 'martin garriz            '),
(24, 'garantias 2', 'martin garriz'),
(25, 'garatias 3', 'martin garriz'),
(26, 'Correccional NÂ°2', 'Martin Garriz'),
(27, 'garatias 3', 'Alicia Cardosii'),
(28, 'garantias 2', 'Alicia Cardosii'),
(29, 'Correccional NÂ°2', 'martin garriz'),
(32, 'Garantias 1', 'Cardosii Alicia'),
(33, 'Correccional NÂ°2', 'martin garriz'),
(34, 'garantias 2', 'Alicia Cardosii'),
(35, 'Correccional NÂ°2', 'Alicia Cardosii');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `ID` int(11) NOT NULL,
  `DESCIPCION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`ID`, `DESCIPCION`) VALUES
(35, 'Argentina'),
(36, 'Brasil'),
(37, 'Uruguay'),
(38, 'Paraguay'),
(39, 'Chile'),
(40, 'Bolivia'),
(41, 'Peru'),
(42, 'Ecuador'),
(43, 'Colombia'),
(44, 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `ID` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ocupacion`
--

INSERT INTO `ocupacion` (`ID`, `descripcion`) VALUES
(1, 'Empleado/a'),
(2, 'Desempleado/a'),
(3, 'Estudiante'),
(4, 'Ama de casa'),
(5, 'Autónomo/a'),
(6, 'Jubilado/a'),
(7, 'Empresario/a'),
(8, 'Docente'),
(9, 'Funcionario/a público/a'),
(10, 'Comerciante'),
(11, 'Artista'),
(12, 'Deportista'),
(13, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `policia`
--

CREATE TABLE `policia` (
  `ID` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `JERARQUIA` varchar(255) DEFAULT NULL,
  `LEGAJO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT 1,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `policia`
--

INSERT INTO `policia` (`ID`, `APELLIDO`, `APODO`, `DIRECCION`, `DNI`, `FECHANACIMIENTO`, `INSTUCCION`, `JERARQUIA`, `LEGAJO`, `NOMBRE`, `OCUPACION`, `SEXO`, `TELEFONO`, `ESTADOCIVIL_ID`, `NACIONALIDAD_ID`, `ESTADO`, `OCUPACION_ID`, `SEXO_ID`) VALUES
(1, 'Illescas', NULL, NULL, '37757084', NULL, NULL, 'OFICIAL AYUDANTE', '195826', 'Michael ', NULL, NULL, '02923530179', NULL, NULL, 0, NULL, NULL),
(5, 'Pereyra', NULL, NULL, '123456', NULL, NULL, 'COMISARIO', '132222', 'Jose Luis', NULL, NULL, '12311231', NULL, NULL, 1, NULL, NULL),
(6, 'Illescas', NULL, NULL, '12121212', NULL, NULL, 'OFICIAL AYUDANTE', '195826', 'Jonathan', NULL, NULL, '122122', NULL, NULL, 1, NULL, NULL),
(8, 'Stangley', NULL, NULL, '124578', NULL, NULL, 'OFICIAL', '1234567', 'termo', NULL, NULL, '29235330179', NULL, NULL, 0, NULL, NULL),
(9, 'Arias', NULL, NULL, '37757084', NULL, NULL, 'OFICIAL', '123444', 'Julieta', NULL, NULL, '2923530179', NULL, NULL, 1, NULL, NULL),
(10, 'Gadea', NULL, NULL, '37757084', NULL, NULL, 'SARGENTO', '123456', 'juan Carlos', NULL, NULL, '2923530179', NULL, NULL, 0, NULL, NULL),
(14, 'perez', NULL, NULL, '3212345', NULL, NULL, 'OFICIAL', '12345678', 'jose', NULL, NULL, '2923530179', NULL, NULL, 0, NULL, NULL),
(15, 'botella', NULL, NULL, '1111111', NULL, NULL, 'OFICIAL', '12456', 'tapita', NULL, NULL, '112222', NULL, NULL, 0, NULL, NULL),
(16, 'solana', NULL, NULL, '33221144', NULL, NULL, 'SUBTENIENTE', '445566', 'Carlos', NULL, NULL, '12121', NULL, NULL, 0, NULL, NULL),
(17, 'acompaÃ±ada', NULL, NULL, '0303456', NULL, NULL, 'SUBTENIENTE', '0303456', 'chichi', NULL, NULL, '22333665', NULL, NULL, 1, NULL, NULL),
(18, 'Picapiedras', NULL, NULL, '1244557', NULL, NULL, 'MAYOR', '1245777', 'Pedro', NULL, NULL, '292365301', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `ID` int(11) NOT NULL,
  `FECHAREGISTRO` date DEFAULT NULL,
  `OBSERVACIONES` varchar(255) DEFAULT NULL,
  `CAUSA_ID` int(11) DEFAULT NULL,
  `USUARIO_ID` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`ID`, `FECHAREGISTRO`, `OBSERVACIONES`, `CAUSA_ID`, `USUARIO_ID`, `ESTADO`) VALUES
(33, '2024-10-17', '', 35, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `ID` int(11) NOT NULL,
  `FECHACREACION` date DEFAULT NULL,
  `FECHAFIN` date DEFAULT NULL,
  `FECHAINICIO` date DEFAULT NULL,
  `REGISTRO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id`, `descripcion`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `CONTADOR` int(11) DEFAULT 0,
  `NOMBREUSUARIO` varchar(255) DEFAULT NULL,
  `ROL` varchar(255) DEFAULT NULL,
  `ESTADO_ID` int(11) DEFAULT NULL,
  `POLICIA_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `CLAVE`, `CONTADOR`, `NOMBREUSUARIO`, `ROL`, `ESTADO_ID`, `POLICIA_ID`) VALUES
(1, '202cb962ac59075b964b07152d234b70', 5, 'jonaIlles', 'ADMINISTRADOR', 1, 1),
(10, '202cb962ac59075b964b07152d234b70', 1, 'prueba', 'ADMINISTRADOR', 1, 1),
(14, '202cb962ac59075b964b07152d234b70', 1, 'prueba1', 'USUARIO', 1, 5),
(15, '202cb962ac59075b964b07152d234b70', 1, 'illescas', 'ADMINISTRADOR', 1, 6),
(18, '202cb962ac59075b964b07152d234b70', 0, 'termo', 'ADMINISTRADOR', 1, 8),
(19, '9e8b3db6934a0e659a3e6458ba65d60c', 1, 'pruebaClaves', 'USUARIO', 1, 9),
(21, '0aa1dfb7aa30bf75502133fec53e2fc7', 1, 'PPIEDRAS', 'USUARIO', 2, 18),
(22, '202cb962ac59075b964b07152d234b70', 0, 'CGADEA', 'USUARIO', 1, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `causa`
--
ALTER TABLE `causa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CAUSA_FISCALIA_ID` (`FISCALIA_ID`),
  ADD KEY `FK_CAUSA_DEFENSORIA_ID` (`DEFENSORIA_ID`),
  ADD KEY `FK_CAUSA_JUZGADO_ID` (`JUZGADO_ID`);

--
-- Indices de la tabla `defensoria`
--
ALTER TABLE `defensoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `denunciante`
--
ALTER TABLE `denunciante`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DENUNCIANTE_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  ADD KEY `FK_DENUNCIANTE_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  ADD KEY `FK_DENUNCIANTE_causa_id` (`causa_id`);

--
-- Indices de la tabla `detenido`
--
ALTER TABLE `detenido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DETENIDO_causa_id` (`causa_id`),
  ADD KEY `FK_DETENIDO_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  ADD KEY `FK_DETENIDO_NACIONALIDAD_ID` (`NACIONALIDAD_ID`);

--
-- Indices de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `fiscalia`
--
ALTER TABLE `fiscalia`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `juzgado`
--
ALTER TABLE `juzgado`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PERSONA_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  ADD KEY `FK_PERSONA_NACIONALIDAD_ID` (`NACIONALIDAD_ID`);

--
-- Indices de la tabla `policia`
--
ALTER TABLE `policia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_POLICIA_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  ADD KEY `FK_POLICIA_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REGISTRO_CAUSA_ID` (`CAUSA_ID`),
  ADD KEY `FK_REGISTRO_USUARIO_ID` (`USUARIO_ID`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REPORTE_REGISTRO_ID` (`REGISTRO_ID`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USUARIO_ESTADO_ID` (`ESTADO_ID`),
  ADD KEY `FK_USUARIO_POLICIA_ID` (`POLICIA_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `causa`
--
ALTER TABLE `causa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `defensoria`
--
ALTER TABLE `defensoria`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `denunciante`
--
ALTER TABLE `denunciante`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `detenido`
--
ALTER TABLE `detenido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fiscalia`
--
ALTER TABLE `fiscalia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `juzgado`
--
ALTER TABLE `juzgado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `policia`
--
ALTER TABLE `policia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `causa`
--
ALTER TABLE `causa`
  ADD CONSTRAINT `FK_CAUSA_DEFENSORIA_ID` FOREIGN KEY (`DEFENSORIA_ID`) REFERENCES `defensoria` (`ID`),
  ADD CONSTRAINT `FK_CAUSA_FISCALIA_ID` FOREIGN KEY (`FISCALIA_ID`) REFERENCES `fiscalia` (`ID`),
  ADD CONSTRAINT `FK_CAUSA_JUZGADO_ID` FOREIGN KEY (`JUZGADO_ID`) REFERENCES `juzgado` (`ID`);

--
-- Filtros para la tabla `denunciante`
--
ALTER TABLE `denunciante`
  ADD CONSTRAINT `FK_DENUNCIANTE_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  ADD CONSTRAINT `FK_DENUNCIANTE_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`),
  ADD CONSTRAINT `FK_DENUNCIANTE_causa_id` FOREIGN KEY (`causa_id`) REFERENCES `causa` (`ID`);

--
-- Filtros para la tabla `detenido`
--
ALTER TABLE `detenido`
  ADD CONSTRAINT `FK_DETENIDO_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  ADD CONSTRAINT `FK_DETENIDO_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`),
  ADD CONSTRAINT `FK_DETENIDO_causa_id` FOREIGN KEY (`causa_id`) REFERENCES `causa` (`ID`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_PERSONA_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  ADD CONSTRAINT `FK_PERSONA_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`);

--
-- Filtros para la tabla `policia`
--
ALTER TABLE `policia`
  ADD CONSTRAINT `FK_POLICIA_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  ADD CONSTRAINT `FK_POLICIA_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `FK_REGISTRO_CAUSA_ID` FOREIGN KEY (`CAUSA_ID`) REFERENCES `causa` (`ID`),
  ADD CONSTRAINT `FK_REGISTRO_USUARIO_ID` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`);

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `FK_REPORTE_REGISTRO_ID` FOREIGN KEY (`REGISTRO_ID`) REFERENCES `registro` (`ID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_ESTADO_ID` FOREIGN KEY (`ESTADO_ID`) REFERENCES `estadousuario` (`ID`),
  ADD CONSTRAINT `FK_USUARIO_POLICIA_ID` FOREIGN KEY (`POLICIA_ID`) REFERENCES `policia` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
