-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2026 a las 20:51:15
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
-- Base de datos: `muaythai_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trainings`
--

INSERT INTO `trainings` (`id`, `title`, `description`, `date`, `user_id`) VALUES
(1, 'Asaltos de saco', 'Asaltos de saco, 5 asaltos de 3 min cada uno.', '2026-02-24', 2),
(2, 'siesta', '10 horitas de siesta', '2006-06-01', 3),
(3, 'Comba', '3 Asaltos de 10 minss de comba', '2026-02-26', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'jaumemorte', 'jaume@gmail.com', 'scrypt:32768:8:1$kUVsMD2tIBkkDECZ$227964d0883e006ae4c7930bef18c5b28d862b5985f720d38de95a610b5245bbcd2a1f5c3674c8a3428db51f157dc14aa809bca3e94c8c28f0b12b85d236f535'),
(2, 'mortejaume', 'jaume1@gmail.com', 'scrypt:32768:8:1$xcOSSvSQWLeZZSa9$6564102f39856780ae681933723879e548e45f16b3f3012ffbb7128c9e490753624c451594ca1ef6bd6c06ccde8050f55e5d45ac05e94f6e5dc78069f79b848b'),
(3, 'diegoonlyfans', 'diego123@gmail.com', 'scrypt:32768:8:1$vIXsMAqS2zsYgh5v$7c012018c48977e3557bcd553acc0a1553196bbc17c3c54cd217dfaa2b5917429163749fc8c3e355d81f037e212b79a7d79607ea0596814bac7c92d0ecfc836b'),
(4, 'jp', 'jp@gmail.com', 'scrypt:32768:8:1$J3fvyd94jT1woFuk$9819ccea5fb96b83672fb882e590885ebdd1b273df15931d55775238a719bb752a552875b44e70fd18d437a5eb36c1c079eca5dad00bb121ff5334354aa87e41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trainings`
--
ALTER TABLE `trainings`
  ADD CONSTRAINT `trainings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
