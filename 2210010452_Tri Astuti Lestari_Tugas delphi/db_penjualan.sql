-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2024 at 12:27 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `suplier_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `suplier_id`) VALUES
(500100130, 39123439, 'malkis roma', 7500, 7000, 7, 22500101, 225001011, 22500120, 500100141),
(500100131, 1234567890, 'seprite', 14500, 13000, 15, 22500102, 225001012, 22500121, 500100142),
(500100132, 522730706, 'penggaris', 9000, 8000, 10, 22500103, 225001013, 22500122, 500100143),
(500100133, 501234123, 'sweater', 85000, 75000, 3, 22500104, 225001014, 22500123, 500100144),
(500100134, 701986018, 'flatshoes', 130000, 120000, 5, 22500105, 225001015, 22500124, 500100145);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `barang-id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`id`, `harga`, `qty`, `subtotal`, `pembelian_id`, `barang-id`) VALUES
(500100160, 7000, 7, 49000, 500100280, 500100130),
(500100161, 13000, 15, 195000, 500100281, 500100131),
(500100162, 8000, 10, 80000, 500100282, 500100132),
(500100163, 75000, 3, 225000, 500100283, 500100133),
(500100164, 120000, 5, 600000, 500100284, 500100134);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `harga`, `qty`, `subtotal`, `penjualan_id`, `barang_id`) VALUES
(500100150, 7500, 1, 7500, 500100170, 500100130),
(500100151, 14500, 3, 43500, 500100171, 500100131),
(500100152, 9000, 1, 9000, 500100172, 500100132),
(500100153, 85000, 2, 170000, 500100173, 500100134),
(500100154, 130000, 2, 260000, 500100174, 500100134);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(22500101, 'makanan'),
(22500102, 'minuman'),
(22500103, 'alat tulis'),
(22500104, 'pakaian'),
(22500105, 'sepatu');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`) VALUES
(500100391, 1406084500, 'meli noviani', '081394834575', 'melinoviani66@gmail.com', 'jl. kelayan A GG.setia budi'),
(500100392, 1801176502, 'sudarmi', '085220341772', '⁠sudarmialuh11@gmail.com', 'jl. Banjar raya GG.sukun'),
(500100393, 1807045506, 'tukiyem', '085220341772', '⁠tukiyemcntk86@gmail.com', 'jl. jend Sudirman komplek mandiri permai'),
(500100394, 1807044101, 'ketut sumini', '082130598201', '⁠ketutsuminiarJo7@gmail.com', 'jl. brigjen Hasan Basri'),
(500100395, 1807040511, 'untung warsidi', '085222482934', '⁠untungwrsdi46@gmail.com', 'jl. sultan adam');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `suplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `diskripsi`, `tanggal`, `suplier_id`, `user_id`) VALUES
(500100280, 11202025, 49000, 49000, 'makanan', '2024-05-05', 500100141, 22500120),
(500100281, 12212026, 195000, 195000, 'minuman', '2024-06-08', 500100142, 22500121),
(500100282, 13222027, 80000, 80000, 'alat tulis', '2024-07-12', 500100143, 22500122),
(500100283, 14232028, 2255000, 225000, 'pakaian', '2024-05-16', 500100144, 22500123),
(500100284, 152420029, 600000, 600000, 'sepatu', '2024-05-17', 500100145, 22500124);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(200) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(500100170, 20021201, 7500, 10000, 2500, '2024-05-01', 500100391, 22500120),
(500100171, 20031102, 43500, 45000, 1500, '2024-05-02', 500100392, 22500121),
(500100172, 20041003, 9000, 10000, 1000, '2024-05-03', 500100393, 22500122),
(500100173, 20050904, 170000, 200000, 30000, '2024-05-04', 500100394, 22500123),
(500100284, 20060805, 260000, 300000, 40000, '2024-05-05', 500100395, 22500124);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(225001011, 'malkis roma', 'makanan'),
(225001012, 'seprite', 'minuman'),
(225001013, 'penggaris', 'alat tulis'),
(225001014, 'sweater', 'pakaian'),
(225001015, 'flatshoes', 'sepatu');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(500100141, 332616700, 'Tari', '0822340759938', 'Tarilestari.tkj1@gmail.com', 'Jl. S Parman', 'PT. Indomarco Prisma', 'Bank Mandiri Persero', 'Kas Kecil', '11100'),
(500100142, 332616600, 'Caroline', '081394834575', 'Caroline1415@gmail.com', 'Jl. Samudra', 'PT. Laut Timur Persero', 'Bank Central Asia', 'Surat Berharga', '11102'),
(500100143, 332616441, 'Andre', '083873733031', 'Andrea1617@gmail.com', 'Jl. Kamboja', 'PT. Pinus Merah Abadi', 'Bank Rakyat Indonesia', 'Piutang Usaha', '11103'),
(500100144, 332616010, 'Razif', '089601725753', 'Lanarazif@gmail.com', 'Jl. Antasari', 'PT. Laut Indah Jaya', 'Bank Mega', 'Persediaan Barang Dagang', '11106'),
(500100145, 332616091, 'Devon', '085659852600', 'Tarilestari.tkj1@gmail.com', 'Jl. Adhiyaksa', 'PT. Diari Montain', 'Bank CIMB Niaga', 'Bangunan Dalam Proses', '131000');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `role`, `email`, `telp`, `alamat`, `is_active`) VALUES
(22500120, 332616700, 'tarilestari', 'Tri Astuti Lestari', 'tari123', 'admin', 'Tarilestari.tkj1@gmail.com', '0822340759938', 'Jl. S Parman', 'True'),
(22500121, 332616600, 'Carolinedaly65', 'Caroline Daly', 'linedely456', 'penjual', 'Caroline1415@gmail.com', '081394834575', 'Jl. Samudra', 'True'),
(22500122, 332616441, 'Andreabotwin311', 'Andrea Botwin', 'ndrea789', 'pembeli', 'Andrea1617@gmail.com', '083873733031', 'Jl. Kamboja', 'True'),
(22500123, 332616010, 'Rzf_mln', 'Muhammad Razif Maulana', 'zaira1011', 'pembeli', 'Lanarazif@gmail.com', '089601725753', 'Jl. Antasari', 'True'),
(22500124, 332616091, 'Devoncharles504', 'Devon Charles', 'charles1213', 'pembeli', 'Charlesdev20@gmail.com', '089601725753', 'Jl. Adhiyaksa', 'True');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100135;

--
-- AUTO_INCREMENT for table `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100165;

--
-- AUTO_INCREMENT for table `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100155;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225001005;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100396;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100285;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100285;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225001016;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500100146;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22500125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
