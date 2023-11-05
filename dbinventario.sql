-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2023 a las 02:53:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbinventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `idArea` tinyint(4) NOT NULL,
  `name` varchar(60) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `abreviatura` varchar(6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcargo`
--

CREATE TABLE `tcargo` (
  `idCargo` tinyint(4) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tcargo`
--

INSERT INTO `tcargo` (`idCargo`, `name`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcategoria`
--

CREATE TABLE `tcategoria` (
  `idCategoria` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tcategoria`
--

INSERT INTO `tcategoria` (`idCategoria`, `name`, `status`) VALUES
(3, 'CATEGORIA PRUEBA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmedida`
--

CREATE TABLE `tmedida` (
  `idMedida` tinyint(4) NOT NULL,
  `name` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tmedida`
--

INSERT INTO `tmedida` (`idMedida`, `name`) VALUES
(1, 'UNIDAD'),
(3, 'CAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmovimientos`
--

CREATE TABLE `tmovimientos` (
  `idMovimiento` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `dateRegister` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `cantidad` int(11) NOT NULL,
  `typeMovimiento` varchar(10) DEFAULT NULL,
  `idProfesional` int(11) NOT NULL,
  `idArea` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproduct`
--

CREATE TABLE `tproduct` (
  `idProduct` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `idMedida` tinyint(4) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idCategoria` tinyint(4) DEFAULT NULL,
  `codProduct` varchar(10) DEFAULT NULL,
  `dateRegister` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tproduct`
--

INSERT INTO `tproduct` (`idProduct`, `name`, `stock`, `idMedida`, `precio`, `idCategoria`, `codProduct`, `dateRegister`, `status`) VALUES
(1, 'Carton C4', 100, 1, 2.00, 3, NULL, '2023-07-27 19:50:51', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tprofesional`
--

CREATE TABLE `tprofesional` (
  `idProfesional` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `idCargo` tinyint(4) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dateRegister` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tprofesional`
--

INSERT INTO `tprofesional` (`idProfesional`, `name`, `lastName`, `dni`, `idCargo`, `email`, `password`, `dateRegister`, `status`) VALUES
(1, 'Kevin', 'Giron', '44444', 1, 'kevin@gmail.com', '123', '2023-07-27 18:10:10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(40) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `idProfesional` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `clave`, `idProfesional`, `status`) VALUES
(7, 'admin', '123', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `tcargo`
--
ALTER TABLE `tcargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `tcategoria`
--
ALTER TABLE `tcategoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `tmedida`
--
ALTER TABLE `tmedida`
  ADD PRIMARY KEY (`idMedida`);

--
-- Indices de la tabla `tmovimientos`
--
ALTER TABLE `tmovimientos`
  ADD PRIMARY KEY (`idMovimiento`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idProfesional` (`idProfesional`),
  ADD KEY `idArea` (`idArea`);

--
-- Indices de la tabla `tproduct`
--
ALTER TABLE `tproduct`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idMedida` (`idMedida`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `tprofesional`
--
ALTER TABLE `tprofesional`
  ADD PRIMARY KEY (`idProfesional`),
  ADD KEY `idCargo` (`idCargo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idProfesional` (`idProfesional`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `idArea` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcargo`
--
ALTER TABLE `tcargo`
  MODIFY `idCargo` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tcategoria`
--
ALTER TABLE `tcategoria`
  MODIFY `idCategoria` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tmedida`
--
ALTER TABLE `tmedida`
  MODIFY `idMedida` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tmovimientos`
--
ALTER TABLE `tmovimientos`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tproduct`
--
ALTER TABLE `tproduct`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tprofesional`
--
ALTER TABLE `tprofesional`
  MODIFY `idProfesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tmovimientos`
--
ALTER TABLE `tmovimientos`
  ADD CONSTRAINT `tmovimientos_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `tproduct` (`idProduct`),
  ADD CONSTRAINT `tmovimientos_ibfk_2` FOREIGN KEY (`idProfesional`) REFERENCES `tprofesional` (`idProfesional`),
  ADD CONSTRAINT `tmovimientos_ibfk_3` FOREIGN KEY (`idArea`) REFERENCES `tarea` (`idArea`);

--
-- Filtros para la tabla `tproduct`
--
ALTER TABLE `tproduct`
  ADD CONSTRAINT `tproduct_ibfk_2` FOREIGN KEY (`idMedida`) REFERENCES `tmedida` (`idMedida`),
  ADD CONSTRAINT `tproduct_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `tcategoria` (`idCategoria`);

--
-- Filtros para la tabla `tprofesional`
--
ALTER TABLE `tprofesional`
  ADD CONSTRAINT `tprofesional_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `tcargo` (`idCargo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idProfesional`) REFERENCES `tprofesional` (`idProfesional`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
