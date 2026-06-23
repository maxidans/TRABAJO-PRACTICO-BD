-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3310
-- Tiempo de generación: 18-06-2026 a las 14:03:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp1`
--

DELIMITER $$

--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE  IF NOT EXISTS `crear_usuario` (IN `id` VARCHAR(10), IN `nombre` VARCHAR(50))   
BEGIN
INSERT INTO usuario(carnet_usuario,nombre_usuario)
values(id, nombre);
end$$

DELIMITER ;
--
-- Estructura de tabla para la tabla `libro`
–
CREATE TABLE IF NOT EXISTS `autor` (
  `id_autor` INT PRIMARY KEY NOT NULL,
  `nombre_autor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `libro` (
  `libro_isbn` varchar(7) NOT NULL,
  `titulo_libro` varchar(50) DEFAULT NULL,
  `id_autor` INT DEFAULT NULL,
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devuelta` date DEFAULT NULL,
  `carnet_usuario` varchar(10) DEFAULT NULL,
  `libro_isbn` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `carnet_usuario` varchar(10) NOT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`carnet_usuario`, `nombre_usuario`) VALUES
('U001', 'Ana Lopez'),
('U002', 'Luis Perez');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`libro_isbn`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `carnet_usuario` (`carnet_usuario`),
  ADD KEY `libro_isbn` (`libro_isbn`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`carnet_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`carnet_usuario`) REFERENCES `usuario` (`carnet_usuario`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`libro_isbn`) REFERENCES `libro` (`libro_isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
