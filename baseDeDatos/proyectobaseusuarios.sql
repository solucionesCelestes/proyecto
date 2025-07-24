-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2025 a las 17:52:48
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
(18, 1, 'fotosPerfiles/687abbdf5c76c.jpeg', 'Juan', 'Alberto', '1994-06-22', '094882301', 'JuanAlbertoGarcia@gmail.com', '$2y$10$2n2O7yckmdOyjcmR49E/x.u.Ogj0ZXQ6bisUNixVEzrbCVNP/nmo.', 1, '2025-07-18 21:25:51'),
(29, 1, 'fotosPerfiles/688247ddaddc5.jpeg', 'Jaime', 'Roos', '1953-11-12', '099674801', 'JaimeRoos@gmail.com', '$2y$10$YZ.TLEtZXJsirS2BzU6iWOaexcmBWqdpa1jicA8Hs62Paa3EZL7Py', 0, '2025-07-24 14:49:01'),
(30, 1, 'fotosPerfiles/68824b3607801.jpeg', 'Richie', 'Silver', '1943-07-16', '092376522', 'RichieSilver@gmail.com', '$2y$10$5.Pa6ASu.IBD21ZMdZTYP.JBn7z0uUi0ubqk.qMFNmuP1Nw5p5XPa', 1, '2025-07-24 15:03:18'),
(31, 1, 'fotosPerfiles/68824d3478773.jpeg', 'José', 'Mujica', '1935-05-20', '095620101', 'elpepemujica@gmail.com', '$2y$10$utRS8OVSfW7ru9edo.CJveZ/7crt9enZxJdHl4m0cTQagQsSQmURq', 0, '2025-07-24 15:11:48'),
(32, 0, 'fotosPerfiles/68824e6a27c22.jpeg', 'Tiago', 'Veras', '2006-09-23', '092220906', 'tiagoveras@gmail.com', '$2y$10$km/71w3tyuPW.vaLXVcuuenUxPmfwcXvgfDUYMyozTjVMbJqdbjNu', 0, '2025-07-24 15:16:58'),
(33, 0, 'fotosPerfiles/68824f73e7b68.webp', 'Guillermo', 'Díaz', '1993-05-09', '091485033', 'GuillermoDiaz1993@gmail.com', '$2y$10$OBs5/dRglmRbhoWORJ6rWOxNSVTBxIVLoc3JfnHYG.vC.dweQLKbq', 0, '2025-07-24 15:21:23'),
(34, 0, 'fotosPerfiles/688250cd41fbd.webp', 'Emanuel', 'Ginóbili', '1977-07-28', '097928310', 'ManuGinobili20@gmail.com', '$2y$10$Mtkb/VuhRALEuCF9cu4wT.c9plkZXZxhwphJs2JrvD9SB7O7Bdn1W', 0, '2025-07-24 15:27:09'),
(35, 1, 'fotosPerfiles/688253c781c7d.jpeg', 'Fermín', 'Santillan', '2007-02-20', '092728187', 'ferminsantillan633@gmail.com', '$2y$10$5RhUAkamFHjsdf1S0CIN1OoWkrzKJUWtKoZoWoelSmmOF1KFFzHoO', 0, '2025-07-24 15:39:51'),
(36, 0, 'fotosPerfiles/6882562f3298f.jpeg', 'Santiago', 'Lima', '2002-10-09', '099112703', 'santicap@gmail.com', '$2y$10$WrtDSqFDqA07Yx2aHokwAOn3skyXWpNGpj5QBSdW1iY1ADKXi.Z3.', 0, '2025-07-24 15:50:07');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
