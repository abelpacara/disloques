-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2016 at 08:40 PM
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
  `recaudador_descripcion` text NOT NULL,
  `recaudador_ultimo_disloque_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recaudadores`
--

INSERT INTO `recaudadores` (`id_recaudador`, `recaudador_nombres`, `recaudador_apellidos`, `recaudador_descripcion`, `recaudador_ultimo_disloque_numero`) VALUES
(1, 'ELOY', 'ACOSTA LEDEZMA', '', 0),
(2, 'JHONNY', 'AMURRIO MERCADO', '', 0),
(3, 'LIZZETH', 'ARONI HUARACHI', '', 0),
(4, 'RICHARD HENRRY', 'AYALA GUZMAN', '', 0),
(5, 'RAMIRO ODON', 'BALLESTEROS MIRANDA', '', 0),
(6, 'ROBERTO CARLOS', 'CANAVIRI VILLCA', '', 0),
(7, 'JOHNY', 'CAYOLA LAMAS', '', 0),
(8, 'RUTH', 'CHOQUE CORI', '', 0),
(9, 'VICTOR HUGO', 'COCA TOLEDO', '', 0),
(10, 'LUIS ALBERTO', 'COCA AGREDA', '', 0),
(11, 'OLIMPIA', 'COPATITI NINA', '', 0),
(12, 'JENNY KAREN', 'CORDOVA CANEDO', '', 0),
(13, 'NELSON', 'CORNEJO GUTIERREZ', '', 0),
(14, 'EFRAIN', 'CRUZ GERONIMO', '', 0),
(15, 'JAVIER GONZALO', 'DURAN COSSIO', '', 0),
(16, 'JHOSEMAR', 'ELIAS LOPEZ', '', 0),
(17, 'JUAN CARLOS', 'GARVIZU ALELUYA', '', 0),
(18, 'HECTOR', 'GOMEZ ALMANZA', '', 0),
(19, 'MAURICIO', 'HERBAS GUTIERREZ', '', 0),
(20, 'DAMIAN', 'IGNACIO MARCANI', '', 0),
(21, 'MAURICIO', 'LAFUENTE GARCIA', '', 0),
(22, 'JOSUE ELMER', 'MARCA ROMERO', '', 0),
(23, 'ANGEL', 'MARTINEZ RAMIREZ', '', 0),
(24, 'IVET', 'MARZANA GALARZA', '', 0),
(25, 'MARIBEL', 'MEDRANO JAILLITA', '', 0),
(26, 'SABINO', 'MOLINA ROMERO', '', 0),
(27, 'MATEO', 'NINA VADILLO', '', 0),
(28, 'CELSO', 'NINANCURO QUISPE', '', 0),
(29, 'GRISBERT', 'OVANDO APAZA', '', 0),
(30, 'JORGE', 'POZADAS MARCA', '', 0),
(31, 'ARIEL', 'QUINTEROS FLORES', '', 0),
(32, 'HEIDY', 'QUINTEROS QUINTEROS', '', 0),
(33, 'NORA', 'RAMIREZ VARGAS', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `retenes`
--

CREATE TABLE `retenes` (
  `id_reten` int(11) NOT NULL,
  `reten_nombre` text NOT NULL,
  `reten_recaudadores_requeridos` int(11) NOT NULL,
  `reten_estado` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retenes`
--

INSERT INTO `retenes` (`id_reten`, `reten_nombre`, `reten_recaudadores_requeridos`, `reten_estado`) VALUES
(1, 'ARANI', 3, 'activo'),
(2, 'LOBO RANCHO', 1, 'activo'),
(3, 'PARACAYA', 4, 'activo'),
(4, 'EPIZANA', 4, 'activo'),
(5, 'AIQUILE', 2, 'inactivo'),
(6, 'PUENTE ARCE', 2, 'inactivo'),
(7, 'BULO BULO', 5, 'inactivo'),
(8, 'EL CASTILLO', 1, 'inactivo'),
(9, 'IVIRGARZAMA', 5, 'inactivo'),
(10, 'PADRESAMA', 4, 'inactivo'),
(11, 'KM 10', 5, 'inactivo'),
(12, 'AGUIRRE', 5, 'inactivo'),
(13, 'HUAYLLANI', 6, 'inactivo'),
(14, 'SUTICOLLO', 7, 'inactivo'),
(15, 'CONFITAL', 5, 'inactivo'),
(16, 'COLCAPIRHUA', 8, 'inactivo');

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
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
