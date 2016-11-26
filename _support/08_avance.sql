-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2016 at 09:52 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

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
-- Table structure for table `parametros`
--

CREATE TABLE `parametros` (
  `id_parametro` int(11) NOT NULL,
  `parametro_dias_periodo` int(11) NOT NULL,
  `parametro_dias_anterior_reunion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recaudadores`
--

CREATE TABLE `recaudadores` (
  `id_recaudador` int(11) NOT NULL,
  `recaudador_nombres` text NOT NULL,
  `recaudador_apellidos` text NOT NULL,
  `recaudador_descripcion` text,
  `recaudador_ultimo_rotacion_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recaudadores`
--

INSERT INTO `recaudadores` (`id_recaudador`, `recaudador_nombres`, `recaudador_apellidos`, `recaudador_descripcion`, `recaudador_ultimo_rotacion_numero`) VALUES
(17, 'A', 'AAAAAA', 'aaaaaaaaaaaa', 1),
(18, 'B', 'BBBBB', 'bbbbbb', 1),
(19, 'C', 'CCCCCCCCC', 'ccccccccccc', 1),
(20, 'D', 'DDDDDDDD', 'ddddddddddddd', 1),
(21, 'E', 'EEEEE', 'eeeeee', 1),
(22, 'F', 'FFFFFF', 'fffff', 1),
(23, 'G', 'GGGGGGGGGGGG', 'ggggggggg', 1),
(24, 'H', 'HHHHHHH', 'hhhhhhhhhhh', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `rotaciones`
--

CREATE TABLE `rotaciones` (
  `id_rotacion` int(11) NOT NULL,
  `rotacion_numero` int(11) NOT NULL,
  `rotacion_fecha_del` date NOT NULL,
  `rotacion_fecha_al` date NOT NULL,
  `rotacion_fecha_reunion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rotaciones`
--

INSERT INTO `rotaciones` (`id_rotacion`, `rotacion_numero`, `rotacion_fecha_del`, `rotacion_fecha_al`, `rotacion_fecha_reunion`) VALUES
(59, 1, '2016-07-01', '2016-07-20', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `rotacion_recaudadores`
--

CREATE TABLE `rotacion_recaudadores` (
  `id_rotacion_recaudador` int(11) NOT NULL,
  `reten_id` int(11) NOT NULL,
  `recaudador_id` int(11) NOT NULL,
  `rotacion_numero` int(11) DEFAULT NULL,
  `rotacion_recaudador_plan` enum('plan1','plan2','plan3','plan4') NOT NULL DEFAULT 'plan4',
  `rotacion_recaudador_tipo` enum('lider','operador','volante') NOT NULL DEFAULT 'operador'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rotacion_recaudadores`
--

INSERT INTO `rotacion_recaudadores` (`id_rotacion_recaudador`, `reten_id`, `recaudador_id`, `rotacion_numero`, `rotacion_recaudador_plan`, `rotacion_recaudador_tipo`) VALUES
(1927, 1, 17, 1, 'plan1', 'operador'),
(1928, 2, 17, 1, 'plan4', 'operador'),
(1929, 3, 17, 1, 'plan4', 'operador'),
(1930, 4, 17, 1, 'plan4', 'operador'),
(1931, 1, 18, 1, 'plan1', 'operador'),
(1932, 2, 18, 1, 'plan4', 'operador'),
(1933, 3, 18, 1, 'plan4', 'operador'),
(1934, 4, 18, 1, 'plan4', 'operador'),
(1935, 1, 19, 1, 'plan4', 'operador'),
(1936, 2, 19, 1, 'plan2', 'operador'),
(1937, 3, 19, 1, 'plan4', 'operador'),
(1938, 4, 19, 1, 'plan4', 'operador'),
(1939, 1, 20, 1, 'plan4', 'operador'),
(1940, 2, 20, 1, 'plan2', 'operador'),
(1941, 3, 20, 1, 'plan4', 'operador'),
(1942, 4, 20, 1, 'plan4', 'operador'),
(1943, 1, 21, 1, 'plan4', 'operador'),
(1944, 2, 21, 1, 'plan4', 'operador'),
(1945, 3, 21, 1, 'plan3', 'operador'),
(1946, 4, 21, 1, 'plan4', 'operador'),
(1947, 1, 22, 1, 'plan4', 'operador'),
(1948, 2, 22, 1, 'plan4', 'operador'),
(1949, 3, 22, 1, 'plan3', 'operador'),
(1950, 4, 22, 1, 'plan4', 'operador'),
(1951, 1, 23, 1, 'plan4', 'operador'),
(1952, 2, 23, 1, 'plan4', 'operador'),
(1953, 3, 23, 1, 'plan4', 'operador'),
(1954, 4, 23, 1, 'plan4', 'operador'),
(1955, 1, 24, 1, 'plan4', 'operador'),
(1956, 2, 24, 1, 'plan4', 'operador'),
(1957, 3, 24, 1, 'plan4', 'operador'),
(1958, 4, 24, 1, 'plan4', 'operador');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `rotaciones`
--
ALTER TABLE `rotaciones`
  ADD PRIMARY KEY (`id_rotacion`);

--
-- Indexes for table `rotacion_recaudadores`
--
ALTER TABLE `rotacion_recaudadores`
  ADD PRIMARY KEY (`id_rotacion_recaudador`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recaudadores`
--
ALTER TABLE `recaudadores`
  MODIFY `id_recaudador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `retenes`
--
ALTER TABLE `retenes`
  MODIFY `id_reten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `rotaciones`
--
ALTER TABLE `rotaciones`
  MODIFY `id_rotacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `rotacion_recaudadores`
--
ALTER TABLE `rotacion_recaudadores`
  MODIFY `id_rotacion_recaudador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1959;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
