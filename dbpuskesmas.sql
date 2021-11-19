-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 05:14 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpuskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_dokter`
--

CREATE TABLE `data_dokter` (
  `id_dokter` int(11) NOT NULL,
  `id_rekam` int(11) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `diagnosa` varchar(100) NOT NULL,
  `idpasien` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_dokter`
--

INSERT INTO `data_dokter` (`id_dokter`, `id_rekam`, `tgl_periksa`, `diagnosa`, `idpasien`) VALUES
(7, 32, '2020-10-19', 'Demam', 19),
(8, 33, '2020-10-19', 'Flu', 20),
(9, 34, '2020-10-20', 'Flu Burung', 21),
(10, 37, '2020-10-22', 'Corona', 22),
(11, 39, '2020-10-25', 'Stroke', 24),
(12, 41, '2020-10-28', 'Corona', 26),
(13, 45, '2020-10-28', 'banyak pikiran', 27),
(14, 50, '2020-11-01', 'Kutu Air', 29),
(15, 45, '2020-11-30', 'Lambung', 27),
(16, 38, '2020-11-30', 'Diabetes', 23),
(17, 46, '2020-11-09', 'Asam Lambung', 28);

-- --------------------------------------------------------

--
-- Table structure for table `data_labor`
--

CREATE TABLE `data_labor` (
  `id_lab` int(11) NOT NULL,
  `idpasien` int(50) NOT NULL,
  `id_rekam` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `no_lab` varchar(50) NOT NULL,
  `ket_lab` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_labor`
--

INSERT INTO `data_labor` (`id_lab`, `idpasien`, `id_rekam`, `id_dokter`, `no_lab`, `ket_lab`) VALUES
(2, 19, 32, 7, 'LAB001', 'Batuk'),
(3, 20, 33, 8, 'LAB002', 'Kutu Air'),
(5, 21, 34, 9, 'LAB003', 'Asam Urat'),
(6, 22, 37, 10, 'LAB004', 'Usus Buntu'),
(7, 26, 41, 12, 'LAB005', 'Batuk bATUK');

-- --------------------------------------------------------

--
-- Table structure for table `data_obat`
--

CREATE TABLE `data_obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_obat`
--

INSERT INTO `data_obat` (`id_obat`, `nama_obat`, `kategori`, `satuan`, `harga`, `stok`, `ket`) VALUES
(4, 'Bodrex', 'Antibiotik', 'Pcs', 20000, 500, 'Dimium 2x Sehari setelah Makan'),
(5, 'Parasetamol', 'Antibiotik', 'Pcs', 10000, 200, 'Diminum 3x Sehari Setelah Makan'),
(6, 'Ciprofloxacin', 'Antibiotik', 'Pcs', 25000, 125, 'Obat Demam'),
(7, 'Promag', 'Antibiotik', 'Pcs', 5000, 600, 'Obat sakit maag dan kembung'),
(8, 'Acarbose', 'Antibiotik', 'Tablet', 25000, 353, 'Obat antidiabetes yang digunakan untuk menangani diabetes tipe 2 '),
(9, 'Amoxicilin', 'Antibiotik', 'Tablet', 30000, 500, 'Pengobatan infeksi bakteri gram - dangram +'),
(10, 'Digoxin', 'Antibiotik', 'Tablet', 20000, 125, 'Pengobatan dan Pencegahan TBC'),
(11, 'Nova Vitamin C', 'Vitamin', 'Tablet', 10000, 500, 'Obat Vitamin C'),
(12, 'Antimo', 'Vitamin', 'Botol', 25000, 200, 'Obat Penurun Panas'),
(13, 'Pertamax', 'Saluran Cerna', 'Botol', 50000, 500, 'Menambah Energi'),
(14, 'Antangin', 'Saluran Cerna', 'Tablet', 10000, 500, 'Obat Panas Dalam'),
(15, 'Penilbutason', 'Antibiotik', 'Tablet', 10000, 500, 'Ubtuk Badan Nyeri\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `data_pasien`
--

CREATE TABLE `data_pasien` (
  `idpasien` int(11) NOT NULL,
  `no_pasien` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `jen_kel` varchar(10) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tinggi` varchar(50) NOT NULL,
  `berat` varchar(50) NOT NULL,
  `jenis_pasien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pasien`
--

INSERT INTO `data_pasien` (`idpasien`, `no_pasien`, `nama`, `pekerjaan`, `alamat`, `jen_kel`, `tgl_lahir`, `tinggi`, `berat`, `jenis_pasien`) VALUES
(19, 'PS001', 'Mario Cahyo', 'mahasiswa', 'Jayapura', 'Laki-Laki', '2020-10-15', '170', '50', 'BPJS'),
(20, 'PS002', 'Julio Stiven', 'mahasiswa', 'APO BENGKEL', 'Laki-Laki', '2001-12-17', '165', '50', 'BPJS'),
(21, 'PS003', 'Asep', 'Guru', 'Jl. purnomo', 'Laki-Laki', '2020-10-06', '174', '56', 'BPJS'),
(22, 'PS004', 'Siti', 'Guru', 'apo', 'Perempuan', '1989-10-17', '162', '55', 'BPJS'),
(23, 'PS005', 'Hosea ', 'Supir Kapal ', 'Kayu Batu', 'Laki-Laki', '2001-10-24', '170', '79', 'BPJS'),
(24, 'PS006', 'Sudirman', 'PNS', 'Entrop Jayapura', 'Laki-Laki', '1995-07-05', '187', '76', 'BPJS'),
(25, 'PS007', 'Suparjo', 'Penjual Sayur', 'Dok 5', 'Laki-Laki', '2020-10-28', '180', '65', 'BPJS'),
(26, 'PS008', 'Alfa', 'Mahasiswa', 'Hamadi', 'Perempuan', '2020-10-29', '54', '76', 'BPJS'),
(27, 'PS009', 'tia', 'mahasiswa', 'resimen', 'Perempuan', '2018-07-26', '150', '40', 'BPJS'),
(28, 'PS010', 'Agus', 'Supir Grab', 'Klofkamp', 'Laki-Laki', '1994-10-11', '169', '76', 'BPJS'),
(29, 'PS011', 'Saipul', 'Pesulap', 'Jl Sabang merauke', 'Laki-Laki', '2007-07-17', '185', '67', 'BPJS');

-- --------------------------------------------------------

--
-- Table structure for table `data_pendaftaran`
--

CREATE TABLE `data_pendaftaran` (
  `id_daftar` int(11) NOT NULL,
  `no_pendaftaran` int(50) NOT NULL,
  `idpasien` int(50) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `biaya` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pendaftaran`
--

INSERT INTO `data_pendaftaran` (`id_daftar`, `no_pendaftaran`, `idpasien`, `tgl_daftar`, `biaya`) VALUES
(3, 1, 19, '2020-10-15', 50000),
(4, 2, 20, '2020-10-16', 50000),
(5, 3, 21, '2020-10-19', 34242),
(6, 4, 22, '2020-10-21', 120000),
(7, 5, 23, '2020-10-24', 15000),
(9, 6, 24, '2020-10-25', 20000),
(10, 7, 25, '2027-10-20', 50000),
(11, 8, 26, '2028-10-20', 20000),
(12, 112, 27, '2020-10-28', 20000),
(13, 10, 28, '2031-10-20', 75000),
(14, 11, 29, '2031-10-20', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `data_petugas`
--

CREATE TABLE `data_petugas` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_telp` int(15) NOT NULL,
  `posisi` enum('admin','dokter','apotek','pegawai','lab') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_petugas`
--

INSERT INTO `data_petugas` (`id_user`, `nama`, `email`, `password`, `no_telp`, `posisi`) VALUES
(6, 'Budi Setiawan', 'bionomskuy@gmail.com', '$2y$10$YAm4xCcCd0GPF7E/WZ30iuBdNsF5LT0/CLWa3EVyOXy19n7RC2XjC', 2147483647, 'pegawai'),
(7, 'dokter budi Setiawan', 'dokter', '$2y$10$zFzGLrLVTd4HiuwFhMfqy.vSrhpcsqeMTtFIK1JEhjmOY0GiSocw.', 854234234, 'dokter'),
(8, 'Joko Santoso', 'apotek@gmail.com', '$2y$10$KAYdE8.Uo/jMUg54pP5gveIjPiFEXEvu0skhbA4nNFGRueYb6fF.m', 2147483647, 'apotek'),
(14, 'udin', 'labor123@gmail.com', '$2y$10$Dzyzdf2K/zNLaQYX1z30UOcsTwkGx1AjyNZHzGhodKUyIxh9gSZ5m', 823564646, 'lab'),
(18, 'Mario Cahyo', 'admin123@gmail.com', '$2y$10$DuYS9U5PZZ3sZxIqbCX3vudDR/CI6AX1l0CzdC.ah2lupXJ1wCHba', 2147483647, 'admin'),
(19, 'admin SIMPUUS', 'admin69', '$2y$10$bfKEN8Fg/ZFMEbhOXnHtFOnWVVtnRX2Oc5cdoxtSzADrWuKwjA0je', 2147483647, 'admin'),
(20, 'Dr Lisa', 'lisa@gmail.com', '$2y$10$vU3dbiHQ9WdkXAlqiGHyjO85.R2FEZ9U/zoKxIDm1N2JVa8iJXbAe', 2147483647, 'dokter'),
(21, 'Alfa', 'alfa@gmail.com', '$2y$10$rMFl2kPX8iov90k6f6PMiO/M5HL7CBuXiGAmvDS3E8CYK5VSTrX4m', 2147483647, 'dokter'),
(22, 'nelvi', 'nelvi@gmail.com', '$2y$10$7quzfVnSZCe4S/a8sc/kWe/Q0GKkTwo3sml6naW7mH0kCLed8W2Ea', 2147483647, 'dokter'),
(23, 'Iverson', 'iverson123@gmail.com', '$2y$10$8Z5vZD1lHI441aZ55v9P2OlvwVCiwD0UxZTbXKzJeb1DqKB2JE.ou', 822453345, 'pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `data_resep`
--

CREATE TABLE `data_resep` (
  `id_resep` int(11) NOT NULL,
  `nama_obat` text NOT NULL,
  `jumlah` int(100) NOT NULL,
  `idpasien` int(50) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_rekam` int(11) NOT NULL,
  `status_rsp` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_resep`
--

INSERT INTO `data_resep` (`id_resep`, `nama_obat`, `jumlah`, `idpasien`, `id_dokter`, `id_rekam`, `status_rsp`) VALUES
(55, 'Bodrex', 2, 19, 7, 32, 1),
(57, 'Antimo', 1, 20, 8, 33, 1),
(58, 'Amoxilin, Zinc Pro, Paramex', 4, 21, 9, 34, 0),
(59, 'Paramek', 3, 22, 10, 37, 0),
(60, 'Paramec', 2, 26, 12, 41, 1),
(61, 'sianida', 5, 27, 13, 45, 0),
(62, 'Paramek', 1, 29, 14, 50, 1),
(63, 'Parasetamol', 3, 23, 16, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_rm`
--

CREATE TABLE `data_rm` (
  `id_rekam` int(11) NOT NULL,
  `no_rekam` varchar(50) NOT NULL,
  `idpasien` int(11) NOT NULL,
  `id_daftar` int(11) NOT NULL,
  `tgl_rekam` date NOT NULL,
  `klinik_tujuan` varchar(50) NOT NULL,
  `dokter_tujuan` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_rm`
--

INSERT INTO `data_rm` (`id_rekam`, `no_rekam`, `idpasien`, `id_daftar`, `tgl_rekam`, `klinik_tujuan`, `dokter_tujuan`, `status`) VALUES
(32, 'RM001', 19, 3, '2020-10-21', 'UMUM', 'Dr Trihayani', 1),
(33, 'RM002', 20, 4, '2020-10-19', 'KIA/KB imunisasi', 'Dr Bambang Susilo', 1),
(34, 'RM003', 21, 5, '2020-10-19', 'Lansia', 'Dr. Lisa Rani', 1),
(37, 'RM004', 22, 6, '2020-10-22', 'Lansia', 'Dr. Santoso', 1),
(38, 'RM005', 23, 7, '2020-10-24', 'Lansia', 'nelvi', 0),
(39, 'RM006', 24, 9, '2020-10-25', 'Kesehatan Gigi dan Mulut', 'Dr. Lisa Rani', 1),
(40, 'RM007', 25, 10, '2027-10-20', 'Anak /MTBS', 'Dr. Santoso', 0),
(41, 'RM008', 26, 11, '2028-10-20', 'Anak /MTBS', 'Dr. Lisa Rani', 1),
(45, 'RM012', 27, 12, '2028-10-20', 'Anak /MTBS', 'alfa', 1),
(46, 'RM013', 28, 13, '2031-10-20', 'KIA/KB imunisasi', 'Dr. Santoso', 0),
(50, 'RM014', 29, 14, '2020-11-01', 'Lansia', 'Dr. Santoso', 1);

-- --------------------------------------------------------

--
-- Table structure for table `list_dokter`
--

CREATE TABLE `list_dokter` (
  `id` int(11) NOT NULL,
  `nama_dok` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `klinik` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_dokter`
--

INSERT INTO `list_dokter` (`id`, `nama_dok`, `email`, `klinik`) VALUES
(2, 'Dr. Lisa Rani', 'lisa@gmail.com', 'Anak /MTBS'),
(4, 'Dr. Santoso', 'dokter', 'KIA/KB imunisasi'),
(5, 'alfa', 'alfa@gmail.com', 'UMUM'),
(6, 'nelvi', 'nelvi@gmail.com', 'Kesehatan Gigi dan Mulut');

-- --------------------------------------------------------

--
-- Table structure for table `rujuk_eksternal`
--

CREATE TABLE `rujuk_eksternal` (
  `idrujuk_eksternal` int(11) NOT NULL,
  `idpasien` int(11) NOT NULL,
  `id_rekam` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `rs_tujuan` varchar(50) NOT NULL,
  `dokter_tujuan_rs` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rujuk_eksternal`
--

INSERT INTO `rujuk_eksternal` (`idrujuk_eksternal`, `idpasien`, `id_rekam`, `id_dokter`, `rs_tujuan`, `dokter_tujuan_rs`) VALUES
(2, 19, 32, 7, 'RS Dok II', 'Dr. Wahyudi utomo'),
(3, 22, 37, 10, 'RS Dok II', 'Dr. Jhony'),
(4, 24, 39, 11, 'RS Aryoko', 'Dr. Budiman'),
(5, 26, 41, 12, 'RSUD Provita', 'Dr. Budiman'),
(6, 27, 45, 13, 'RS Aryoko', 'Dr. Budiman');

-- --------------------------------------------------------

--
-- Table structure for table `rujuk_internal`
--

CREATE TABLE `rujuk_internal` (
  `idrujuk_internal` int(11) NOT NULL,
  `id_rekam` int(11) NOT NULL,
  `idpasien` int(11) NOT NULL,
  `diagnosa` varchar(50) NOT NULL,
  `saran` varchar(50) NOT NULL,
  `id_dokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rujuk_internal`
--

INSERT INTO `rujuk_internal` (`idrujuk_internal`, `id_rekam`, `idpasien`, `diagnosa`, `saran`, `id_dokter`) VALUES
(3, 32, 19, 'Diare', 'Minum Obat dan istirahat', 7),
(4, 34, 21, 'Diare', 'Kerokan', 9),
(5, 33, 20, 'Corona', 'Isolah 14 hari', 8),
(6, 41, 26, 'Diare', 'IStirahat', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_rekam` (`id_rekam`),
  ADD KEY `idpasien` (`idpasien`);

--
-- Indexes for table `data_labor`
--
ALTER TABLE `data_labor`
  ADD PRIMARY KEY (`id_lab`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_rekam` (`id_rekam`),
  ADD KEY `idpasien` (`idpasien`);

--
-- Indexes for table `data_obat`
--
ALTER TABLE `data_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`idpasien`);

--
-- Indexes for table `data_pendaftaran`
--
ALTER TABLE `data_pendaftaran`
  ADD PRIMARY KEY (`id_daftar`),
  ADD KEY `idpasien` (`idpasien`) USING BTREE;

--
-- Indexes for table `data_petugas`
--
ALTER TABLE `data_petugas`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `data_resep`
--
ALTER TABLE `data_resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `no_pasien` (`idpasien`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_rekam` (`id_rekam`);

--
-- Indexes for table `data_rm`
--
ALTER TABLE `data_rm`
  ADD PRIMARY KEY (`id_rekam`),
  ADD KEY `idpasien` (`idpasien`),
  ADD KEY `id_daftar` (`id_daftar`);

--
-- Indexes for table `list_dokter`
--
ALTER TABLE `list_dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rujuk_eksternal`
--
ALTER TABLE `rujuk_eksternal`
  ADD PRIMARY KEY (`idrujuk_eksternal`),
  ADD KEY `id_rekam` (`id_rekam`),
  ADD KEY `idpasien` (`idpasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `rujuk_internal`
--
ALTER TABLE `rujuk_internal`
  ADD PRIMARY KEY (`idrujuk_internal`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_rekam` (`id_rekam`),
  ADD KEY `idpasien` (`idpasien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_dokter`
--
ALTER TABLE `data_dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `data_labor`
--
ALTER TABLE `data_labor`
  MODIFY `id_lab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `data_obat`
--
ALTER TABLE `data_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `data_pasien`
--
ALTER TABLE `data_pasien`
  MODIFY `idpasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `data_pendaftaran`
--
ALTER TABLE `data_pendaftaran`
  MODIFY `id_daftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `data_petugas`
--
ALTER TABLE `data_petugas`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `data_resep`
--
ALTER TABLE `data_resep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `data_rm`
--
ALTER TABLE `data_rm`
  MODIFY `id_rekam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `list_dokter`
--
ALTER TABLE `list_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rujuk_eksternal`
--
ALTER TABLE `rujuk_eksternal`
  MODIFY `idrujuk_eksternal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rujuk_internal`
--
ALTER TABLE `rujuk_internal`
  MODIFY `idrujuk_internal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD CONSTRAINT `data_dokter_ibfk_1` FOREIGN KEY (`id_rekam`) REFERENCES `data_rm` (`id_rekam`),
  ADD CONSTRAINT `data_dokter_ibfk_2` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`);

--
-- Constraints for table `data_labor`
--
ALTER TABLE `data_labor`
  ADD CONSTRAINT `data_labor_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`),
  ADD CONSTRAINT `data_labor_ibfk_2` FOREIGN KEY (`id_rekam`) REFERENCES `data_rm` (`id_rekam`),
  ADD CONSTRAINT `data_labor_ibfk_3` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`);

--
-- Constraints for table `data_pendaftaran`
--
ALTER TABLE `data_pendaftaran`
  ADD CONSTRAINT `data_pendaftaran_ibfk_1` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`);

--
-- Constraints for table `data_resep`
--
ALTER TABLE `data_resep`
  ADD CONSTRAINT `data_resep_ibfk_4` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`),
  ADD CONSTRAINT `data_resep_ibfk_6` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`),
  ADD CONSTRAINT `data_resep_ibfk_8` FOREIGN KEY (`id_rekam`) REFERENCES `data_rm` (`id_rekam`);

--
-- Constraints for table `data_rm`
--
ALTER TABLE `data_rm`
  ADD CONSTRAINT `data_rm_ibfk_1` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`),
  ADD CONSTRAINT `data_rm_ibfk_4` FOREIGN KEY (`id_daftar`) REFERENCES `data_pendaftaran` (`id_daftar`);

--
-- Constraints for table `rujuk_eksternal`
--
ALTER TABLE `rujuk_eksternal`
  ADD CONSTRAINT `rujuk_eksternal_ibfk_1` FOREIGN KEY (`id_rekam`) REFERENCES `data_rm` (`id_rekam`),
  ADD CONSTRAINT `rujuk_eksternal_ibfk_2` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`),
  ADD CONSTRAINT `rujuk_eksternal_ibfk_3` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`);

--
-- Constraints for table `rujuk_internal`
--
ALTER TABLE `rujuk_internal`
  ADD CONSTRAINT `rujuk_internal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`),
  ADD CONSTRAINT `rujuk_internal_ibfk_2` FOREIGN KEY (`id_rekam`) REFERENCES `data_rm` (`id_rekam`),
  ADD CONSTRAINT `rujuk_internal_ibfk_3` FOREIGN KEY (`idpasien`) REFERENCES `data_pasien` (`idpasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
