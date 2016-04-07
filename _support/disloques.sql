-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2016 at 12:08 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `disloques`
--

-- --------------------------------------------------------

--
-- Table structure for table `disloques`
--

CREATE TABLE `disloques` (
  `id_disloque` int(11) NOT NULL,
  `disloque_numero` int(11) NOT NULL,
  `disloque_periodo` int(11) NOT NULL,
  `disloque_fecha_del` date NOT NULL,
  `disloque_fecha_al` date NOT NULL,
  `disloque_fecha_reunion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disloque_recaudadores`
--

CREATE TABLE `disloque_recaudadores` (
  `id_disloque_recaudador` int(11) NOT NULL,
  `reten_id` int(11) NOT NULL,
  `disloque_id` int(11) NOT NULL,
  `recaudador_id` int(11) NOT NULL,
  `disloque_recaudador_tipo` enum('lider','recaudador','volante') NOT NULL,
  `disloque_recaudador_fecha_del` date NOT NULL,
  `disloque_recaudador_fecha_al` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parametros`
--

CREATE TABLE `parametros` (
  `id_parametro` int(11) NOT NULL,
  `parametro_dias_periodo` int(11) NOT NULL,
  `parametro_dias_anterior_reunion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parametros`
--

INSERT INTO `parametros` (`id_parametro`, `parametro_dias_periodo`, `parametro_dias_anterior_reunion`) VALUES
(1, 20, 7);

-- --------------------------------------------------------

--
-- Table structure for table `recaudadores`
--

CREATE TABLE `recaudadores` (
  `id_recaudador` int(11) NOT NULL,
  `recaudador_nombres` text NOT NULL,
  `recaudador_apellidos` text NOT NULL,
  `recaudador_descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recaudadores`
--

INSERT INTO `recaudadores` (`id_recaudador`, `recaudador_nombres`, `recaudador_apellidos`, `recaudador_descripcion`) VALUES
(1, 'ELOY', 'ACOSTA LEDEZMA', ''),
(2, 'JHONNY', 'AMURRIO MERCADO', ''),
(3, 'LIZZETH', 'ARONI HUARACHI', ''),
(4, 'RICHARD HENRRY', 'AYALA GUZMAN', ''),
(5, 'RAMIRO ODON', 'BALLESTEROS MIRANDA', ''),
(6, 'ROBERTO CARLOS', 'CANAVIRI VILLCA', ''),
(7, 'JOHNY', 'CAYOLA LAMAS', ''),
(8, 'RUTH', 'CHOQUE CORI', ''),
(9, 'VICTOR HUGO', 'COCA TOLEDO', ''),
(10, 'LUIS ALBERTO', 'COCA AGREDA', ''),
(11, 'OLIMPIA', 'COPATITI NINA', ''),
(12, 'JENNY KAREN', 'CORDOVA CANEDO', ''),
(13, 'NELSON', 'CORNEJO GUTIERREZ', ''),
(14, 'EFRAIN', 'CRUZ GERONIMO', ''),
(15, 'JAVIER GONZALO', 'DURAN COSSIO', ''),
(16, 'JHOSEMAR', 'ELIAS LOPEZ', ''),
(17, 'JUAN CARLOS', 'GARVIZU ALELUYA', ''),
(18, 'HECTOR', 'GOMEZ ALMANZA', ''),
(19, 'MAURICIO', 'HERBAS GUTIERREZ', ''),
(20, 'DAMIAN', 'IGNACIO MARCANI', ''),
(21, 'MAURICIO', 'LAFUENTE GARCIA', ''),
(22, 'JOSUE ELMER', 'MARCA ROMERO', ''),
(23, 'ANGEL', 'MARTINEZ RAMIREZ', ''),
(24, 'IVET', 'MARZANA GALARZA', ''),
(25, 'MARIBEL', 'MEDRANO JAILLITA', ''),
(26, 'SABINO', 'MOLINA ROMERO', ''),
(27, 'MATEO', 'NINA VADILLO', ''),
(28, 'CELSO', 'NINANCURO QUISPE', ''),
(29, 'GRISBERT', 'OVANDO APAZA', ''),
(30, 'JORGE', 'POZADAS MARCA', ''),
(31, 'ARIEL', 'QUINTEROS FLORES', ''),
(32, 'HEIDY', 'QUINTEROS QUINTEROS', ''),
(33, 'NORA', 'RAMIREZ VARGAS', '');

-- --------------------------------------------------------

--
-- Table structure for table `retenes`
--

CREATE TABLE `retenes` (
  `id_reten` int(11) NOT NULL,
  `reten_nombre` text NOT NULL,
  `reten_recaudadores_requeridos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retenes`
--

INSERT INTO `retenes` (`id_reten`, `reten_nombre`, `reten_recaudadores_requeridos`) VALUES
(1, 'ARANI', 3),
(2, 'LOBO RANCHO', 1),
(3, 'PARACAYA', 4),
(4, 'EPIZANA', 4),
(5, 'AIQUILE', 2),
(6, 'PUENTE ARCE', 2),
(7, 'BULO BULO', 5),
(8, 'EL CASTILLO', 1),
(9, 'IVIRGARZAMA', 5),
(10, 'PADRESAMA', 4),
(11, 'KM 10', 5),
(12, 'AGUIRRE', 5),
(13, 'HUAYLLANI', 6),
(14, 'SUTICOLLO', 7),
(15, 'CONFITAL', 5),
(16, 'COLCAPIRHUA', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disloques`
--
ALTER TABLE `disloques`
  ADD PRIMARY KEY (`id_disloque`);

--
-- Indexes for table `disloque_recaudadores`
--
ALTER TABLE `disloque_recaudadores`
  ADD PRIMARY KEY (`id_disloque_recaudador`);

--
-- Indexes for table `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id_parametro`);

--
-- Indexes for table `recaudadores`
--
ALTER TABLE `recaudadores`
  ADD PRIMARY KEY (`id_recaudador`);

--
-- Indexes for table `retenes`
--
ALTER TABLE `retenes`
  ADD PRIMARY KEY (`id_reten`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disloques`
--
ALTER TABLE `disloques`
  MODIFY `id_disloque` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disloque_recaudadores`
--
ALTER TABLE `disloque_recaudadores`
  MODIFY `id_disloque_recaudador` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `recaudadores`
--
ALTER TABLE `recaudadores`
  MODIFY `id_recaudador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `retenes`
--
ALTER TABLE `retenes`
  MODIFY `id_reten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
