-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 12:40 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tpe`
--

-- --------------------------------------------------------

--
-- Table structure for table `estudio`
--

CREATE TABLE `estudio` (
  `id_nombre_fk` int(11) NOT NULL,
  `nombre_estudio` varchar(60) NOT NULL,
  `creacion` int(4) NOT NULL,
  `historia` varchar(500) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estudio`
--

INSERT INTO `estudio` (`id_nombre_fk`, `nombre_estudio`, `creacion`, `historia`, `imagen`) VALUES
(1, 'Walt Disney ', 1923, 'Historia: Forma parte de The Walt Disney Company, la mayor compañía de entretenimiento del mundo. El conglomerado incluye Hollywood Pictures (serie B), Pixar, Touchstone Pictures y el canal ABC. Su filial Miramax cerró en 2010. Algunas de sus franquicias son Toy Story, Piratas del Caribe y Alicia en el País de las Maravillas. El año 2012 consiguió el 14.3% de maket share.\r\n\r\n', 'img/estudios/waltDisney.jpg'),
(2, 'Warner Bros. ', 1923, 'Warner Bros. Entertainment Inc. (simplemente conocida como Warner Bros. y abreviada como WB), anteriormente conocida como Warner Bros. Pictures, Inc., es una compañía estadounidense filial de Warner Bros. Discovery y con sede en Burbank, California. Tiene operaciones en cine, televisión y videojuegos y es uno de los principales estudios de cinematografía estadounidenses, así como miembro de la Motion Picture Association of America', 'img/estudios/warnerBros.jpg'),
(3, 'Universal', 1920, 'NBC Universal Media, LLC (anteriormente conocida como NBCUniversal, Inc.)​ es una compañía estadounidense de los medios de comunicación de masas enfocada en la producción y mercadeo de entretenimiento, noticias, y productos y servicios informativos para una base global de clientes. La compañía posee y opera cadenas de televisión, varios canales de cable, y un grupo de estaciones locales a lo largo de los Estados Unidos, así como productoras de películas, compañías para producción de televisión, ', 'img/estudios/universal.jpg'),
(4, 'Sony Pictures', 1924, 'Sony Pictures Entertainment, Inc. (SPE) es una distribuidora y productora cinematográfica estadounidense subsidiaria de Sony Corporation, un conglomerado de tecnología multinacional y medios de comunicación con sede en Japón. En 2010 se informó que sus ventas habían sido de $7200 millones.​ Sony Pictures es miembro de la Motion Picture Association (MPA).', 'img/estudios/sony.jpg'),
(5, 'Paramount Global', 1912, 'Paramount Global, conocido simplemente como Paramount (anteriormente conocido como ViacomCBS, Inc.), es un conglomerado multinacional estadounidense de medios de comunicación con sede en Nueva York. La corporación se formó a través de la fusión de CBS Corporation y la segunda encarnación de Viacom el 4 de diciembre de 2019, que se crearon a partir del derrame y división del Viacom original en 2005.1​ La compañía tiene intereses en películas, televisión, publicaciones y medios digitales.', 'img/estudios/paramount.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pelis`
--

CREATE TABLE `pelis` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estreno` year(4) NOT NULL,
  `puntuacion` double NOT NULL,
  `director` varchar(150) NOT NULL,
  `fk_estudio` int(11) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelis`
--

INSERT INTO `pelis` (`id`, `nombre`, `estreno`, `puntuacion`, `director`, `fk_estudio`, `imagen`) VALUES
(1, 'Alicia en el pais de las Maravillas', 1951, 7.1, 'Wilfred Jackson, Hamilton Luske y Clyde Geronimi.', 1, 'img/peliculas/alicia.jpg'),
(2, 'Dumbo', 1941, 6.9, 'Ben Sharpteen, Norma Ferguson y Wilfred Jackson.', 1, 'img/peliculas/dumbo.jpg'),
(3, 'El libro de la Selva', 1967, 7.2, 'Larry Clemonds, Ralph Wright y Ken Anderson.', 1, 'img/peliculas/ellibro.jpg'),
(4, 'Harry Potter y la piedra filosofal', 2001, 6.8, 'Chris Columbus', 2, 'img/peliculas/harrypotter.jpg'),
(5, 'The Matrix Revolutions', 2003, 6, 'Hermanas Wachowski', 2, 'img/peliculas/matrix.jpg'),
(6, 'Escuadron Suicida', 2016, 6.3, 'David Ayer', 2, 'img/peliculas/escuadron.jpg'),
(7, 'Rapidos y furiosos 7', 2015, 5.8, 'James Wan', 3, 'img/peliculas/rapidosyfuriosos.jpg'),
(8, 'Jurassic World', 2015, 5, 'Colin Trevorrow', 3, 'img/peliculas/jurassic.jpg'),
(9, 'E.T., el extraterrestre', 1982, 7.5, 'Steven Spielberg', 3, 'img/peliculas/e.t.jpg'),
(10, 'Karate Kid', 1984, 5.8, 'John Avildsen', 4, 'img/peliculas/karate.jpg'),
(11, 'Jumanji', 1995, 5.2, 'Joe Johnston', 4, 'img/peliculas/jumanji.jpg'),
(12, 'Bad Boys', 1995, 5.5, 'Michael Bay', 4, 'img/peliculas/badboys.jpg'),
(13, 'Los angeles de Charlie', 2000, 3.8, 'Joseph McGinty Nichol', 4, 'img/peliculas/losangeles.jpg'),
(16, 'Top Gun: Maverick', 2022, 5.7, 'Joseph Kosinski', 5, 'img/peliculas/topgun.jpg'),
(21, 'Thor: El Mundo Oscuro', 2014, 7, 'Alan Taylor', 5, 'img/peliculas/thor.jpg'),
(22, 'Interstellar', 2015, 7.5, 'Christopher Nolan', 5, 'img/peliculas/interestellar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2a$12$VNeqFsDqaQJL/n9WOj1Vb.6ScaEQwdKX.uGdH.afhUcA6SrGEduAO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`id_nombre_fk`);

--
-- Indexes for table `pelis`
--
ALTER TABLE `pelis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estudio` (`fk_estudio`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estudio`
--
ALTER TABLE `estudio`
  MODIFY `id_nombre_fk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pelis`
--
ALTER TABLE `pelis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelis`
--
ALTER TABLE `pelis`
  ADD CONSTRAINT `pelis_ibfk_1` FOREIGN KEY (`fk_estudio`) REFERENCES `estudio` (`id_nombre_fk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
