-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 08:52 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hpk`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `KodeDokter` varchar(5) NOT NULL,
  `NamaDokter` varchar(40) NOT NULL,
  `Spesialis` varchar(30) NOT NULL,
  `AlamatDokter` varchar(50) NOT NULL,
  `TeleponDokter` varchar(13) NOT NULL,
  `Tarif` decimal(15,2) NOT NULL,
  `KodePoli` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`KodeDokter`, `NamaDokter`, `Spesialis`, `AlamatDokter`, `TeleponDokter`, `Tarif`, `KodePoli`) VALUES
('DO-1', 'Dokter Gigi', 'Gigi', 'Jakarta', '0000', '100000.00', 'PO-1'),
('DO-2', 'Dokter Jantung', 'Jantung', 'Bandung', '0000', '700000.00', 'PO-2'),
('DO-3', 'Dokter Ginjal', 'Ginjal', 'Cimahi', '0000', '50000.00', 'PO-2');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `KodePasien` int(11) NOT NULL,
  `NamaPasien` varchar(40) NOT NULL,
  `AlamatPasien` varchar(50) NOT NULL,
  `GenderPasien` varchar(1) NOT NULL,
  `UmurPasien` tinyint(4) NOT NULL,
  `TeleponPasien` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`KodePasien`, `NamaPasien`, `AlamatPasien`, `GenderPasien`, `UmurPasien`, `TeleponPasien`) VALUES
(1, 'Pasien 1', 'Bandung', 'L', 8, '0000'),
(2, 'Pasien 2', 'Cimahi', 'L', 17, '0000'),
(3, 'Pasien 3', 'Jakarta', 'L', 20, '0000'),
(4, 'Pasien 4', 'Banyumas', 'P', 15, '0000');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `NoDaftar` int(11) NOT NULL,
  `WaktuDaftar` datetime NOT NULL,
  `KodePasien` int(11) NOT NULL,
  `KodeDokter` varchar(5) NOT NULL,
  `IdUser` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`NoDaftar`, `WaktuDaftar`, `KodePasien`, `KodeDokter`, `IdUser`) VALUES
(1, '2017-02-23 08:38:58', 2, 'DO-1', 'ID-1'),
(2, '2017-02-23 10:27:35', 1, 'DO-1', 'ID-1'),
(3, '2022-05-25 13:34:12', 3, 'DO-1', 'ID-1');

--
-- Triggers `pendaftaran`
--
DELIMITER $$
CREATE TRIGGER `tambah_resep` AFTER INSERT ON `pendaftaran` FOR EACH ROW BEGIN
	INSERT INTO resep values('',now(),0,0,0,NEW.NoDaftar,NEW.IdUser);
	UPDATE resep SET TotalHarga = (SELECT Tarif FROM dokter WHERE KodeDokter = NEW.KodeDokter) where NEW.NoDaftar=NoDaftar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `KodePoli` varchar(5) NOT NULL,
  `NamaPoli` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`KodePoli`, `NamaPoli`) VALUES
('PO-1', 'Gigi'),
('PO-2', 'Penyakit Dalam'),
('PO-3', 'Ortopedi');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `NomorResep` int(11) NOT NULL,
  `TanggalTebus` date NOT NULL,
  `TotalHarga` decimal(15,2) DEFAULT NULL,
  `Bayar` decimal(15,2) DEFAULT NULL,
  `Kembali` decimal(15,2) DEFAULT NULL,
  `NoDaftar` int(11) NOT NULL,
  `IdUser` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`NomorResep`, `TanggalTebus`, `TotalHarga`, `Bayar`, `Kembali`, `NoDaftar`, `IdUser`) VALUES
(0, '2022-05-25', '100000.00', '0.00', '0.00', 3, 'ID-1'),
(1, '2017-02-23', '121000.00', '125000.00', '4000.00', 1, 'ID-1'),
(2, '2017-02-23', '100000.00', '0.00', '0.00', 2, 'ID-1');

--
-- Triggers `resep`
--
DELIMITER $$
CREATE TRIGGER `hapus_resep` AFTER DELETE ON `resep` FOR EACH ROW BEGIN
	DELETE from pendaftaran where OLD.NoDaftar=NoDaftar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `IdUser` varchar(5) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `JenisKelamin` varchar(1) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `NoTelp` varchar(13) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`IdUser`, `Nama`, `JenisKelamin`, `Alamat`, `NoTelp`, `Username`, `Password`, `Level`) VALUES
('ID-1', 'Nabil Satya Pramana', 'L', 'Malang', '0000', 'admin', 'admin', 'Superadmin'),
('ID-2', 'Pasien', 'P', 'Malang', '0000', 'pasien', 'pasien', 'Pasien'),
('ID-3', 'Dokter', 'L', 'Malang', '0000', 'dokter', 'dokter', 'Dokter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`KodeDokter`),
  ADD KEY `KodePoli` (`KodePoli`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`KodePasien`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`NoDaftar`),
  ADD KEY `KodePasien` (`KodePasien`),
  ADD KEY `KodeDokter` (`KodeDokter`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`KodePoli`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`NomorResep`),
  ADD KEY `IdUser` (`IdUser`),
  ADD KEY `resep_ibfk_1` (`NoDaftar`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`IdUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `NomorResep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`KodePoli`) REFERENCES `poli` (`KodePoli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`KodePasien`) REFERENCES `pasien` (`KodePasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftaran_ibfk_2` FOREIGN KEY (`KodeDokter`) REFERENCES `dokter` (`KodeDokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftaran_ibfk_3` FOREIGN KEY (`IdUser`) REFERENCES `useradmin` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`NoDaftar`) REFERENCES `pendaftaran` (`NoDaftar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_ibfk_2` FOREIGN KEY (`IdUser`) REFERENCES `useradmin` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
