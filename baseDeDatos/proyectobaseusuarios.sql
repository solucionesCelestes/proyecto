-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2025 a las 03:33:09
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
-- Base de datos: `proyectobaseusuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Aceptado` tinyint(1) NOT NULL DEFAULT 0,
  `FotoPerfil` varchar(255) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0,
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Aceptado`, `FotoPerfil`, `Nombre`, `Apellido`, `FechaNacimiento`, `Telefono`, `Email`, `Contrasena`, `Admin`, `FechaRegistro`) VALUES
(17, 1, 'fotosPerfiles/68797b53564bd.jpeg', 'roberto', 'juarez', '2001-02-15', '000000000', '3344@gmail.com', '$2y$10$fbfPqdB5VroqABoPS9Phbu4yDhwglA4v.CAjUFS923AuOyx6.cIk2', 0, '2025-07-17 22:38:11'),
(18, 1, 'fotosPerfiles/687abbdf5c76c.jpeg', 'Juan', 'Alberto', '1994-06-22', '094882301', 'JuanAlbertoGarcia@gmail.com', '$2y$10$2n2O7yckmdOyjcmR49E/x.u.Ogj0ZXQ6bisUNixVEzrbCVNP/nmo.', 1, '2025-07-18 21:25:51'),
(19, 1, 'fotosPerfiles/687abf734d921.jpeg', 'Cristiano', 'Ronaldo', '1983-06-16', '000000001', 'Siuu@gmail.com', '$2y$10$xkwfK6A6DNGG1BnT3jFYrukC3jNUsmhi.qBjeKTqCG8iVP2JTfLxu', 0, '2025-07-18 21:41:07'),
(20, 1, 'fotosPerfiles/687c1d19732b1.jpeg', 'Fermin', 'Puto', '2007-02-21', '092728187', 'horadeaventura@gmail.com', '$2y$10$Fp8JVhibm1GkHZ/Oo4uUce3c3OuJZK1wUYnA/l7KmJkMd7YuAbFQO', 0, '2025-07-19 22:32:57'),
(22, 1, 'fotosPerfiles/687c2439503fe.jpeg', 'Tiago', 'Veras', '2006-09-21', '099564892', 'tiagovergas@gmail.com', '$2y$10$P9hpaD6/aJoUw97wfk8Lxu6kgYEbzmkDK0Xro7bOj2wnnazgfsMGa', 0, '2025-07-19 23:03:21'),
(23, 1, 'fotosPerfiles/687c2871c2330.jpeg', 'Carlos', 'Rocha', '1978-09-03', '099999999', 'carlosrocha@gmail.com', '$2y$10$HidhYaHms8mLx15ZgkeBu.Q83.oVxTntYVJPEk9xjMRx6h2PXpKui', 0, '2025-07-19 23:21:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
