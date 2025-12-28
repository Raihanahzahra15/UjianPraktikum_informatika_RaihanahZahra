-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2025 at 08:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posyandu_kasihibu`
--

-- --------------------------------------------------------

--
-- Table structure for table `balita`
--

CREATE TABLE `balita` (
  `id_balita` int(11) NOT NULL,
  `nama_balita` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `id_ibu` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `balita`
--

INSERT INTO `balita` (`id_balita`, `nama_balita`, `tanggal_lahir`, `jenis_kelamin`, `id_ibu`) VALUES
(1, 'hana', '2025-12-17', 'P', 1),
(2, 'kaka', '2025-12-08', 'L', 1),
(3, 'Arfan Maulana', '2023-01-12', 'L', 3),
(4, 'Khansa Adira', '2024-05-15', 'P', 14),
(5, 'Kenzo Alfarizqi', '2022-08-20', 'L', 7),
(6, 'Zidni Ilman', '2024-02-15', 'L', 5),
(7, 'Aisyah Humaira', '2021-01-30', 'P', 9),
(8, 'Muhammad Gibran', '2022-03-22', 'L', 11),
(9, 'Clarissa Putri', '2022-03-22', 'P', 12),
(10, 'Rafathar Malik', '2023-12-08', 'L', 12),
(11, 'Naura Shifa', '2024-07-17', 'P', 11),
(12, 'Bilqis Khumaira', '2022-05-01', 'P', 10),
(13, 'Raditya Pratama', '2023-08-25', 'L', 9),
(14, 'Yusuf Habibi', '2022-01-03', 'L', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ibu`
--

CREATE TABLE `ibu` (
  `id_ibu` int(11) NOT NULL,
  `nama_ibu` varchar(100) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ibu`
--

INSERT INTO `ibu` (`id_ibu`, `nama_ibu`, `umur`, `alamat`) VALUES
(1, 'zahra', 19, 'sawangan'),
(2, 'Siti Aminah', 28, 'Jl. Mawar No. 12, Kel. Mekarsari'),
(3, 'Ratna Sari', 34, 'Gang Haji Umar No. 05, Kel. Mekarsari'),
(4, 'Dewi Lestari', 24, 'Perumahan Asri Blok C-10, Kel. Mekarsari'),
(5, 'Linda Wahyuni', 30, 'Jl. Melati 2 No. 45, Kel. Mekarsari'),
(7, 'Anisa Putri', 31, 'Gang Kelinci No. 08, Kel. Sukamaju'),
(8, 'Fitri Handayani', 22, 'Perumahan Griya Indah Blok A-04, Kel. Sukamaju'),
(9, 'Endang Susilowati', 38, 'Jl. Kenanga No. 19, Kel. Sukamaju'),
(10, 'Sri Wahyuni', 29, 'Perum Permata B-12, Kel. Sukamaju'),
(11, 'Nurul Hidayah', 26, 'Jl. Kamboja No. 14, Kel. Sukamaju'),
(12, 'Dian Sastro', 32, 'Jl. Anggrek No. 55, Kel. Pasir Putih'),
(13, 'Kartika Sari', 25, 'Gang Masjid No. 03, Kel. Pasir Putih'),
(14, 'Maya Indah', 23, 'Jl. Cempaka No. 88, Kel. Pasir Putih'),
(15, 'Rizky Amelia', 35, 'Komp. Departemen No. 21, Kel. Pasir Putih'),
(16, 'Hana Pertiwi', 28, 'Jl. Flamboyan No. 07, Kel. Pasir Putih'),
(17, 'Sari Rahayu', 33, 'Gang Swadaya No. 15, Kel. Pondok Jaya'),
(18, 'Melati Suci', 21, 'Jl. Pepaya No. 11, Kel. Pondok Jaya'),
(19, 'Wahyu Ningsih', 36, 'Perum Citra Blok D-01, Kel. Pondok Jaya'),
(20, 'Laila Majnun', 27, 'Gang Damai No. 09, Kel. Pondok Jaya'),
(21, 'Eka Julianti', 29, 'Jl. Rambutan No. 32, Kel. Pondok Jaya');

-- --------------------------------------------------------

--
-- Table structure for table `imunisasi`
--

CREATE TABLE `imunisasi` (
  `id_imunisasi` int(11) NOT NULL,
  `id_balita` int(11) NOT NULL,
  `jenis_imunisasi` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imunisasi`
--

INSERT INTO `imunisasi` (`id_imunisasi`, `id_balita`, `jenis_imunisasi`, `tanggal`, `keterangan`) VALUES
(1, 1, 'cbt', '2025-12-28', 'sudah'),
(2, 9, 'campak', '2025-11-12', ''),
(3, 6, 'dpt', '2025-11-11', 'sudah');

-- --------------------------------------------------------

--
-- Table structure for table `penimbangan`
--

CREATE TABLE `penimbangan` (
  `id_timbang` int(11) NOT NULL,
  `id_balita` int(11) DEFAULT NULL,
  `berat` decimal(5,2) DEFAULT NULL,
  `tinggi` decimal(5,2) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penimbangan`
--

INSERT INTO `penimbangan` (`id_timbang`, `id_balita`, `berat`, `tinggi`, `tanggal`) VALUES
(1, 1, 25.00, 110.00, '2025-12-01'),
(2, 6, 0.27, 25.00, '2025-12-29'),
(3, 12, 7.05, 123.00, '2025-12-03'),
(4, 10, 1.01, 142.00, '2025-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('petugas','pengguna') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'scrypt:32768:8:1$be7LT5HYwxUjIrTf$8dd026ad5a406a3bf409a887e75f6ea2e65e3793448f6f92daa799e166c2d552a23ea6b5dee1b4bffbc9a4794820bc1593784424ea41f57c797f50592afd183e', ''),
(2, 'petugas', 'scrypt:32768:8:1$VKrDgavks0eLWuAi$3bd771c1ee7d11b736d14f15fdfd8ce2d9c64a1ff7edf9259731174bd541d9e9b85bc3b96ab59452e566208b06893479648090668d3ceec1cdf863b6f42af38e', 'petugas'),
(3, 'pengguna', 'scrypt:32768:8:1$icDHwFs8lmw4W8Vr$996b1d3782f8dd327ab5eee75ef89e5b5c089ecad368954d4c15b6c2918e7c69e555b98e59f082a6533449d0e8701c0bd86764f599a49b51b261a90a0216aa7f', 'pengguna'),
(4, 'Nur', 'scrypt:32768:8:1$GE0ASW9lCzfrR6RF$1b50b3de9ccfbc63ce6ae5a60f85e3732d83470a72991f37ea989b64a9e7d0e6e9b8de83b5bb0447733778e4ab6214c13038c6c0eb6f6ae17b512f60b9a0c808', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balita`
--
ALTER TABLE `balita`
  ADD PRIMARY KEY (`id_balita`),
  ADD KEY `id_ibu` (`id_ibu`);

--
-- Indexes for table `ibu`
--
ALTER TABLE `ibu`
  ADD PRIMARY KEY (`id_ibu`);

--
-- Indexes for table `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD PRIMARY KEY (`id_imunisasi`),
  ADD KEY `id_balita` (`id_balita`);

--
-- Indexes for table `penimbangan`
--
ALTER TABLE `penimbangan`
  ADD PRIMARY KEY (`id_timbang`),
  ADD KEY `balita_id` (`id_balita`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balita`
--
ALTER TABLE `balita`
  MODIFY `id_balita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ibu`
--
ALTER TABLE `ibu`
  MODIFY `id_ibu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `imunisasi`
--
ALTER TABLE `imunisasi`
  MODIFY `id_imunisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penimbangan`
--
ALTER TABLE `penimbangan`
  MODIFY `id_timbang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balita`
--
ALTER TABLE `balita`
  ADD CONSTRAINT `balita_ibfk_1` FOREIGN KEY (`id_ibu`) REFERENCES `ibu` (`id_ibu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD CONSTRAINT `imunisasi_ibfk_1` FOREIGN KEY (`id_balita`) REFERENCES `balita` (`id_balita`);

--
-- Constraints for table `penimbangan`
--
ALTER TABLE `penimbangan`
  ADD CONSTRAINT `penimbangan_ibfk_1` FOREIGN KEY (`id_balita`) REFERENCES `balita` (`id_balita`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
