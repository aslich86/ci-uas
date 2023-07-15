-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2023 at 04:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ijazah`
--

CREATE TABLE `Ijazah` (
  `ID` int(11) NOT NULL,
  `Taruna` int(11) DEFAULT NULL,
  `Program_Studi` int(11) DEFAULT NULL,
  `Tanggal_Ijazah` date DEFAULT NULL,
  `Tanggal_Pengesahan` date DEFAULT NULL,
  `Gelar_Akademik` varchar(255) DEFAULT NULL,
  `Nomor_SK` varchar(255) DEFAULT NULL,
  `Wakil_Direktur` int(11) DEFAULT NULL,
  `Direktur` int(11) DEFAULT NULL,
  `Nomor_Ijazah` varchar(255) DEFAULT NULL,
  `Nomor_Seri` varchar(255) DEFAULT NULL,
  `Tanggal_Yudisium` date DEFAULT NULL,
  `Judul_KKW` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Kota`
--

CREATE TABLE `Kota` (
  `ID` int(11) NOT NULL,
  `Kode_Kota` varchar(255) DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Matakuliah`
--

CREATE TABLE `Matakuliah` (
  `ID` int(11) NOT NULL,
  `Kode` varchar(255) DEFAULT NULL,
  `Matakuliah` varchar(255) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL,
  `Nilai_Angka` int(11) DEFAULT NULL,
  `Nilai_Huruf` varchar(255) DEFAULT NULL,
  `Semester` enum('Semester I','Semester II','Semester III','Semester IV','Semester V','Semester VI') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Nilai`
--

CREATE TABLE `Nilai` (
  `ID` int(11) NOT NULL,
  `Taruna` int(11) DEFAULT NULL,
  `Nilai_Angka` int(11) DEFAULT NULL,
  `Nilai_Huruf` varchar(255) DEFAULT NULL,
  `Matakuliah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Pejabat`
--

CREATE TABLE `Pejabat` (
  `ID` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `NIP` varchar(255) DEFAULT NULL,
  `Golongan` varchar(255) DEFAULT NULL,
  `Jabatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Program_Studi`
--

CREATE TABLE `Program_Studi` (
  `ID` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Program_Pendidikan` enum('Diploma III','Diploma IV') DEFAULT NULL,
  `Akreditasi` enum('Baik','Baik Sekali','Unggul') DEFAULT NULL,
  `SK_Akreditasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Taruna`
--

CREATE TABLE `Taruna` (
  `ID` int(11) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Nomor_Taruna` varchar(255) DEFAULT NULL,
  `Tempat_Lahir` int(11) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Program_Studi` int(11) DEFAULT NULL,
  `Foto` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Transkrip_Nilai`
--

CREATE TABLE `Transkrip_Nilai` (
  `ID` int(11) NOT NULL,
  `Taruna` int(11) DEFAULT NULL,
  `Ijazah` int(11) DEFAULT NULL,
  `Program_Studi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ijazah`
--
ALTER TABLE `Ijazah`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Taruna` (`Taruna`),
  ADD KEY `Program_Studi` (`Program_Studi`),
  ADD KEY `Wakil_Direktur` (`Wakil_Direktur`),
  ADD KEY `Direktur` (`Direktur`);

--
-- Indexes for table `Kota`
--
ALTER TABLE `Kota`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Matakuliah`
--
ALTER TABLE `Matakuliah`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Nilai`
--
ALTER TABLE `Nilai`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Taruna` (`Taruna`),
  ADD KEY `Matakuliah` (`Matakuliah`);

--
-- Indexes for table `Pejabat`
--
ALTER TABLE `Pejabat`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Program_Studi`
--
ALTER TABLE `Program_Studi`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Taruna`
--
ALTER TABLE `Taruna`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Tempat_Lahir` (`Tempat_Lahir`),
  ADD KEY `Program_Studi` (`Program_Studi`);

--
-- Indexes for table `Transkrip_Nilai`
--
ALTER TABLE `Transkrip_Nilai`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Taruna` (`Taruna`),
  ADD KEY `Ijazah` (`Ijazah`),
  ADD KEY `Program_Studi` (`Program_Studi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ijazah`
--
ALTER TABLE `Ijazah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Kota`
--
ALTER TABLE `Kota`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Matakuliah`
--
ALTER TABLE `Matakuliah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Nilai`
--
ALTER TABLE `Nilai`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Pejabat`
--
ALTER TABLE `Pejabat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Program_Studi`
--
ALTER TABLE `Program_Studi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Taruna`
--
ALTER TABLE `Taruna`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Transkrip_Nilai`
--
ALTER TABLE `Transkrip_Nilai`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ijazah`
--
ALTER TABLE `Ijazah`
  ADD CONSTRAINT `Ijazah_ibfk_1` FOREIGN KEY (`Taruna`) REFERENCES `Taruna` (`ID`),
  ADD CONSTRAINT `Ijazah_ibfk_2` FOREIGN KEY (`Program_Studi`) REFERENCES `Program_Studi` (`ID`),
  ADD CONSTRAINT `Ijazah_ibfk_3` FOREIGN KEY (`Wakil_Direktur`) REFERENCES `Pejabat` (`ID`),
  ADD CONSTRAINT `Ijazah_ibfk_4` FOREIGN KEY (`Direktur`) REFERENCES `Pejabat` (`ID`);

--
-- Constraints for table `Nilai`
--
ALTER TABLE `Nilai`
  ADD CONSTRAINT `Nilai_ibfk_1` FOREIGN KEY (`Taruna`) REFERENCES `Taruna` (`ID`),
  ADD CONSTRAINT `Nilai_ibfk_2` FOREIGN KEY (`Matakuliah`) REFERENCES `Matakuliah` (`ID`);

--
-- Constraints for table `Taruna`
--
ALTER TABLE `Taruna`
  ADD CONSTRAINT `Taruna_ibfk_1` FOREIGN KEY (`Tempat_Lahir`) REFERENCES `Kota` (`ID`),
  ADD CONSTRAINT `Taruna_ibfk_2` FOREIGN KEY (`Program_Studi`) REFERENCES `Program_Studi` (`ID`);

--
-- Constraints for table `Transkrip_Nilai`
--
ALTER TABLE `Transkrip_Nilai`
  ADD CONSTRAINT `Transkrip_Nilai_ibfk_1` FOREIGN KEY (`Taruna`) REFERENCES `Taruna` (`ID`),
  ADD CONSTRAINT `Transkrip_Nilai_ibfk_2` FOREIGN KEY (`Ijazah`) REFERENCES `Ijazah` (`ID`),
  ADD CONSTRAINT `Transkrip_Nilai_ibfk_3` FOREIGN KEY (`Program_Studi`) REFERENCES `Program_Studi` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
