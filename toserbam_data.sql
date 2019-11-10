-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2017 at 11:34 AM
-- Server version: 5.5.57-cll
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toserbam_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `no_rek` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `nama_bank`, `pemilik`, `no_rek`, `logo`) VALUES
(1, 'BCA', 'Rizal Aditiya', '3250596595', 'bca.png');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `berita_id` int(11) NOT NULL,
  `berita_kategori_id` int(11) DEFAULT NULL,
  `judul` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `isi` longtext NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis` enum('berita','halaman') NOT NULL,
  `status` enum('draft','publish') NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`berita_id`, `berita_kategori_id`, `judul`, `slug`, `isi`, `tanggal`, `jenis`, `status`, `user_id`) VALUES
(4, NULL, 'Tentang Kami', 'tentang-kami', '<p>Tentang Kami</p>\r\n', '2016-05-13 14:54:24', 'halaman', 'publish', 4),
(5, NULL, 'Kontak Kami', 'kontak-kami', '<p>Kontak Kami</p>\r\n', '2016-05-13 14:54:33', 'halaman', 'publish', 4),
(6, NULL, 'Cara Pembelian', 'cara-pembelian', '<p>Cara Pembelian</p>\r\n', '2016-05-13 14:54:49', 'halaman', 'publish', 4),
(7, NULL, 'Konfirmasi Pembayaran', 'konfirmasi-pembayaran', '<p>Konfirmasi Pembayaran</p>\r\n', '2016-05-13 14:55:07', 'halaman', 'publish', 4),
(8, 4, 'tes', 'tes', '<p>tes</p>\r\n', '2017-01-11 15:10:42', 'berita', 'publish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `berita_kategori`
--

CREATE TABLE `berita_kategori` (
  `berita_kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita_kategori`
--

INSERT INTO `berita_kategori` (`berita_kategori_id`, `nama_kategori`, `slug`) VALUES
(4, 'Humor', 'humor');

-- --------------------------------------------------------

--
-- Table structure for table `cod`
--

CREATE TABLE `cod` (
  `cod_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cod`
--

INSERT INTO `cod` (`cod_id`, `nama`, `harga`, `keterangan`) VALUES
(1, 'Standar', 5000, 'Cash On Delivery dengan tarif Ekonomis.'),
(2, 'Cepat', 10000, 'Cash On Delivery kurang dari 1 jam sampai.');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `konfigurasi_id` int(11) NOT NULL,
  `nama_key` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tipe` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`konfigurasi_id`, `nama_key`, `isi`, `tipe`) VALUES
(1, 'nama-aplikasi', 'Toserba', 'umum'),
(2, 'company-name', 'Online', 'umum'),
(3, 'company-address', 'Jl. Wilis 523 Tretes, Prigen, Pasuruan', 'umum'),
(4, 'company-phone', '081332464546', 'umum'),
(5, 'company-email', 'contact@toserba.my.id', 'umum'),
(6, 'tema-aktif', 'lte', 'tema'),
(7, 'tema-logo', 'logo-c4ca4238a0b923820dcc509a6f75849b.png', 'tema');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kecamatan`
--

CREATE TABLE `lokasi_kecamatan` (
  `kecamatan_id` int(11) NOT NULL,
  `kota_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kelurahan`
--

CREATE TABLE `lokasi_kelurahan` (
  `kelurahan_id` int(11) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kota`
--

CREATE TABLE `lokasi_kota` (
  `kota_id` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi_kota`
--

INSERT INTO `lokasi_kota` (`kota_id`, `provinsi_id`, `nama_kota`) VALUES
(17, 1, 'Badung'),
(32, 1, 'Bangli'),
(94, 1, 'Buleleng'),
(114, 1, 'Denpasar'),
(128, 1, 'Gianyar'),
(161, 1, 'Jembrana'),
(170, 1, 'Karangasem'),
(197, 1, 'Klungkung'),
(447, 1, 'Tabanan'),
(27, 2, 'Bangka'),
(28, 2, 'Bangka Barat'),
(29, 2, 'Bangka Selatan'),
(30, 2, 'Bangka Tengah'),
(56, 2, 'Belitung'),
(57, 2, 'Belitung Timur'),
(334, 2, 'Pangkal Pinang'),
(106, 3, 'Cilegon'),
(232, 3, 'Lebak'),
(331, 3, 'Pandeglang'),
(403, 3, 'Serang'),
(456, 3, 'Tangerang'),
(457, 3, 'Tangerang Selatan'),
(62, 4, 'Bengkulu'),
(63, 4, 'Bengkulu Selatan'),
(64, 4, 'Bengkulu Tengah'),
(65, 4, 'Bengkulu Utara'),
(175, 4, 'Kaur'),
(183, 4, 'Kepahiang'),
(233, 4, 'Lebong'),
(294, 4, 'Muko Muko'),
(379, 4, 'Rejang Lebong'),
(397, 4, 'Seluma'),
(39, 5, 'Bantul'),
(135, 5, 'Gunung Kidul'),
(210, 5, 'Kulon Progo'),
(419, 5, 'Sleman'),
(501, 5, 'Yogyakarta'),
(151, 6, 'Jakarta Barat'),
(152, 6, 'Jakarta Pusat'),
(153, 6, 'Jakarta Selatan'),
(154, 6, 'Jakarta Timur'),
(155, 6, 'Jakarta Utara'),
(189, 6, 'Kepulauan Seribu'),
(77, 7, 'Boalemo'),
(88, 7, 'Bone Bolango'),
(130, 7, 'Gorontalo'),
(131, 7, 'Gorontalo Utara'),
(361, 7, 'Pohuwato'),
(50, 8, 'Batang Hari'),
(97, 8, 'Bungo'),
(156, 8, 'Jambi'),
(194, 8, 'Kerinci'),
(280, 8, 'Merangin'),
(293, 8, 'Muaro Jambi'),
(393, 8, 'Sarolangun'),
(442, 8, 'Sungaipenuh'),
(460, 8, 'Tanjung Jabung Barat'),
(461, 8, 'Tanjung Jabung Timur'),
(471, 8, 'Tebo'),
(22, 9, 'Bandung'),
(24, 9, 'Bandung Barat'),
(55, 9, 'Bekasi'),
(79, 9, 'Bogor'),
(103, 9, 'Ciamis'),
(104, 9, 'Cianjur'),
(107, 9, 'Cimahi'),
(109, 9, 'Cirebon'),
(115, 9, 'Depok'),
(126, 9, 'Garut'),
(149, 9, 'Indramayu'),
(171, 9, 'Karawang'),
(211, 9, 'Kuningan'),
(252, 9, 'Majalengka'),
(332, 9, 'Pangandaran'),
(376, 9, 'Purwakarta'),
(428, 9, 'Subang'),
(431, 9, 'Sukabumi'),
(440, 9, 'Sumedang'),
(469, 9, 'Tasikmalaya'),
(37, 10, 'Banjarnegara'),
(41, 10, 'Banyumas'),
(49, 10, 'Batang'),
(76, 10, 'Blora'),
(91, 10, 'Boyolali'),
(92, 10, 'Brebes'),
(105, 10, 'Cilacap'),
(113, 10, 'Demak'),
(134, 10, 'Grobogan'),
(163, 10, 'Jepara'),
(169, 10, 'Karanganyar'),
(177, 10, 'Kebumen'),
(181, 10, 'Kendal'),
(196, 10, 'Klaten'),
(209, 10, 'Kudus'),
(250, 10, 'Magelang'),
(344, 10, 'Pati'),
(349, 10, 'Pekalongan'),
(352, 10, 'Pemalang'),
(375, 10, 'Purbalingga'),
(377, 10, 'Purworejo'),
(380, 10, 'Rembang'),
(386, 10, 'Salatiga'),
(399, 10, 'Semarang'),
(427, 10, 'Sragen'),
(433, 10, 'Sukoharjo'),
(445, 10, 'Surakarta (Solo)'),
(473, 10, 'Tegal'),
(476, 10, 'Temanggung'),
(497, 10, 'Wonogiri'),
(498, 10, 'Wonosobo'),
(31, 11, 'Bangkalan'),
(42, 11, 'Banyuwangi'),
(51, 11, 'Batu'),
(74, 11, 'Blitar'),
(80, 11, 'Bojonegoro'),
(86, 11, 'Bondowoso'),
(133, 11, 'Gresik'),
(160, 11, 'Jember'),
(164, 11, 'Jombang'),
(178, 11, 'Kediri'),
(222, 11, 'Lamongan'),
(243, 11, 'Lumajang'),
(247, 11, 'Madiun'),
(251, 11, 'Magetan'),
(256, 11, 'Malang'),
(289, 11, 'Mojokerto'),
(305, 11, 'Nganjuk'),
(306, 11, 'Ngawi'),
(317, 11, 'Pacitan'),
(330, 11, 'Pamekasan'),
(342, 11, 'Pasuruan'),
(363, 11, 'Ponorogo'),
(369, 11, 'Probolinggo'),
(390, 11, 'Sampang'),
(409, 11, 'Sidoarjo'),
(418, 11, 'Situbondo'),
(441, 11, 'Sumenep'),
(444, 11, 'Surabaya'),
(487, 11, 'Trenggalek'),
(489, 11, 'Tuban'),
(492, 11, 'Tulungagung'),
(61, 12, 'Bengkayang'),
(168, 12, 'Kapuas Hulu'),
(176, 12, 'Kayong Utara'),
(195, 12, 'Ketapang'),
(208, 12, 'Kubu Raya'),
(228, 12, 'Landak'),
(279, 12, 'Melawi'),
(365, 12, 'Pontianak'),
(388, 12, 'Sambas'),
(391, 12, 'Sanggau'),
(395, 12, 'Sekadau'),
(415, 12, 'Singkawang'),
(417, 12, 'Sintang'),
(18, 13, 'Balangan'),
(33, 13, 'Banjar'),
(35, 13, 'Banjarbaru'),
(36, 13, 'Banjarmasin'),
(43, 13, 'Barito Kuala'),
(143, 13, 'Hulu Sungai Selatan'),
(144, 13, 'Hulu Sungai Tengah'),
(145, 13, 'Hulu Sungai Utara'),
(203, 13, 'Kotabaru'),
(446, 13, 'Tabalong'),
(452, 13, 'Tanah Bumbu'),
(454, 13, 'Tanah Laut'),
(466, 13, 'Tapin'),
(44, 14, 'Barito Selatan'),
(45, 14, 'Barito Timur'),
(46, 14, 'Barito Utara'),
(136, 14, 'Gunung Mas'),
(167, 14, 'Kapuas'),
(174, 14, 'Katingan'),
(205, 14, 'Kotawaringin Barat'),
(206, 14, 'Kotawaringin Timur'),
(221, 14, 'Lamandau'),
(296, 14, 'Murung Raya'),
(326, 14, 'Palangka Raya'),
(371, 14, 'Pulang Pisau'),
(405, 14, 'Seruyan'),
(432, 14, 'Sukamara'),
(19, 15, 'Balikpapan'),
(66, 15, 'Berau'),
(89, 15, 'Bontang'),
(214, 15, 'Kutai Barat'),
(215, 15, 'Kutai Kartanegara'),
(216, 15, 'Kutai Timur'),
(341, 15, 'Paser'),
(354, 15, 'Penajam Paser Utara'),
(387, 15, 'Samarinda'),
(96, 16, 'Bulungan (Bulongan)'),
(257, 16, 'Malinau'),
(311, 16, 'Nunukan'),
(450, 16, 'Tana Tidung'),
(467, 16, 'Tarakan'),
(48, 17, 'Batam'),
(71, 17, 'Bintan'),
(172, 17, 'Karimun'),
(184, 17, 'Kepulauan Anambas'),
(237, 17, 'Lingga'),
(302, 17, 'Natuna'),
(462, 17, 'Tanjung Pinang'),
(21, 18, 'Bandar Lampung'),
(223, 18, 'Lampung Barat'),
(224, 18, 'Lampung Selatan'),
(225, 18, 'Lampung Tengah'),
(226, 18, 'Lampung Timur'),
(227, 18, 'Lampung Utara'),
(282, 18, 'Mesuji'),
(283, 18, 'Metro'),
(355, 18, 'Pesawaran'),
(356, 18, 'Pesisir Barat'),
(368, 18, 'Pringsewu'),
(458, 18, 'Tanggamus'),
(490, 18, 'Tulang Bawang'),
(491, 18, 'Tulang Bawang Barat'),
(496, 18, 'Way Kanan'),
(14, 19, 'Ambon'),
(99, 19, 'Buru'),
(100, 19, 'Buru Selatan'),
(185, 19, 'Kepulauan Aru'),
(258, 19, 'Maluku Barat Daya'),
(259, 19, 'Maluku Tengah'),
(260, 19, 'Maluku Tenggara'),
(261, 19, 'Maluku Tenggara Barat'),
(400, 19, 'Seram Bagian Barat'),
(401, 19, 'Seram Bagian Timur'),
(488, 19, 'Tual'),
(138, 20, 'Halmahera Barat'),
(139, 20, 'Halmahera Selatan'),
(140, 20, 'Halmahera Tengah'),
(141, 20, 'Halmahera Timur'),
(142, 20, 'Halmahera Utara'),
(191, 20, 'Kepulauan Sula'),
(372, 20, 'Pulau Morotai'),
(477, 20, 'Ternate'),
(478, 20, 'Tidore Kepulauan'),
(1, 21, 'Aceh Barat'),
(2, 21, 'Aceh Barat Daya'),
(3, 21, 'Aceh Besar'),
(4, 21, 'Aceh Jaya'),
(5, 21, 'Aceh Selatan'),
(6, 21, 'Aceh Singkil'),
(7, 21, 'Aceh Tamiang'),
(8, 21, 'Aceh Tengah'),
(9, 21, 'Aceh Tenggara'),
(10, 21, 'Aceh Timur'),
(11, 21, 'Aceh Utara'),
(20, 21, 'Banda Aceh'),
(59, 21, 'Bener Meriah'),
(72, 21, 'Bireuen'),
(127, 21, 'Gayo Lues'),
(230, 21, 'Langsa'),
(235, 21, 'Lhokseumawe'),
(300, 21, 'Nagan Raya'),
(358, 21, 'Pidie'),
(359, 21, 'Pidie Jaya'),
(384, 21, 'Sabang'),
(414, 21, 'Simeulue'),
(429, 21, 'Subulussalam'),
(69, 22, 'Bima'),
(118, 22, 'Dompu'),
(238, 22, 'Lombok Barat'),
(239, 22, 'Lombok Tengah'),
(240, 22, 'Lombok Timur'),
(241, 22, 'Lombok Utara'),
(276, 22, 'Mataram'),
(438, 22, 'Sumbawa'),
(439, 22, 'Sumbawa Barat'),
(13, 23, 'Alor'),
(58, 23, 'Belu'),
(122, 23, 'Ende'),
(125, 23, 'Flores Timur'),
(213, 23, 'Kupang'),
(234, 23, 'Lembata'),
(269, 23, 'Manggarai'),
(270, 23, 'Manggarai Barat'),
(271, 23, 'Manggarai Timur'),
(301, 23, 'Nagekeo'),
(304, 23, 'Ngada'),
(383, 23, 'Rote Ndao'),
(385, 23, 'Sabu Raijua'),
(412, 23, 'Sikka'),
(434, 23, 'Sumba Barat'),
(435, 23, 'Sumba Barat Daya'),
(436, 23, 'Sumba Tengah'),
(437, 23, 'Sumba Timur'),
(479, 23, 'Timor Tengah Selatan'),
(480, 23, 'Timor Tengah Utara'),
(16, 24, 'Asmat'),
(67, 24, 'Biak Numfor'),
(90, 24, 'Boven Digoel'),
(111, 24, 'Deiyai (Deliyai)'),
(117, 24, 'Dogiyai'),
(150, 24, 'Intan Jaya'),
(158, 24, 'Jayapura'),
(159, 24, 'Jayawijaya'),
(180, 24, 'Keerom'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)'),
(231, 24, 'Lanny Jaya'),
(263, 24, 'Mamberamo Raya'),
(264, 24, 'Mamberamo Tengah'),
(274, 24, 'Mappi'),
(281, 24, 'Merauke'),
(284, 24, 'Mimika'),
(299, 24, 'Nabire'),
(303, 24, 'Nduga'),
(335, 24, 'Paniai'),
(347, 24, 'Pegunungan Bintang'),
(373, 24, 'Puncak'),
(374, 24, 'Puncak Jaya'),
(392, 24, 'Sarmi'),
(443, 24, 'Supiori'),
(484, 24, 'Tolikara'),
(495, 24, 'Waropen'),
(499, 24, 'Yahukimo'),
(500, 24, 'Yalimo'),
(124, 25, 'Fakfak'),
(165, 25, 'Kaimana'),
(272, 25, 'Manokwari'),
(273, 25, 'Manokwari Selatan'),
(277, 25, 'Maybrat'),
(346, 25, 'Pegunungan Arfak'),
(378, 25, 'Raja Ampat'),
(425, 25, 'Sorong'),
(426, 25, 'Sorong Selatan'),
(449, 25, 'Tambrauw'),
(474, 25, 'Teluk Bintuni'),
(475, 25, 'Teluk Wondama'),
(60, 26, 'Bengkalis'),
(120, 26, 'Dumai'),
(147, 26, 'Indragiri Hilir'),
(148, 26, 'Indragiri Hulu'),
(166, 26, 'Kampar'),
(187, 26, 'Kepulauan Meranti'),
(207, 26, 'Kuantan Singingi'),
(350, 26, 'Pekanbaru'),
(351, 26, 'Pelalawan'),
(381, 26, 'Rokan Hilir'),
(382, 26, 'Rokan Hulu'),
(406, 26, 'Siak'),
(253, 27, 'Majene'),
(262, 27, 'Mamasa'),
(265, 27, 'Mamuju'),
(266, 27, 'Mamuju Utara'),
(362, 27, 'Polewali Mandar'),
(38, 28, 'Bantaeng'),
(47, 28, 'Barru'),
(87, 28, 'Bone'),
(95, 28, 'Bulukumba'),
(123, 28, 'Enrekang'),
(132, 28, 'Gowa'),
(162, 28, 'Jeneponto'),
(244, 28, 'Luwu'),
(245, 28, 'Luwu Timur'),
(246, 28, 'Luwu Utara'),
(254, 28, 'Makassar'),
(275, 28, 'Maros'),
(328, 28, 'Palopo'),
(333, 28, 'Pangkajene Kepulauan'),
(336, 28, 'Parepare'),
(360, 28, 'Pinrang'),
(396, 28, 'Selayar (Kepulauan Selayar)'),
(408, 28, 'Sidenreng Rappang/Rapang'),
(416, 28, 'Sinjai'),
(423, 28, 'Soppeng'),
(448, 28, 'Takalar'),
(451, 28, 'Tana Toraja'),
(486, 28, 'Toraja Utara'),
(493, 28, 'Wajo'),
(25, 29, 'Banggai'),
(26, 29, 'Banggai Kepulauan'),
(98, 29, 'Buol'),
(119, 29, 'Donggala'),
(291, 29, 'Morowali'),
(329, 29, 'Palu'),
(338, 29, 'Parigi Moutong'),
(366, 29, 'Poso'),
(410, 29, 'Sigi'),
(482, 29, 'Tojo Una-Una'),
(483, 29, 'Toli-Toli'),
(53, 30, 'Bau-Bau'),
(85, 30, 'Bombana'),
(101, 30, 'Buton'),
(102, 30, 'Buton Utara'),
(182, 30, 'Kendari'),
(198, 30, 'Kolaka'),
(199, 30, 'Kolaka Utara'),
(200, 30, 'Konawe'),
(201, 30, 'Konawe Selatan'),
(202, 30, 'Konawe Utara'),
(295, 30, 'Muna'),
(494, 30, 'Wakatobi'),
(73, 31, 'Bitung'),
(81, 31, 'Bolaang Mongondow (Bolmong)'),
(82, 31, 'Bolaang Mongondow Selatan'),
(83, 31, 'Bolaang Mongondow Timur'),
(84, 31, 'Bolaang Mongondow Utara'),
(188, 31, 'Kepulauan Sangihe'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)'),
(192, 31, 'Kepulauan Talaud'),
(204, 31, 'Kotamobagu'),
(267, 31, 'Manado'),
(285, 31, 'Minahasa'),
(286, 31, 'Minahasa Selatan'),
(287, 31, 'Minahasa Tenggara'),
(288, 31, 'Minahasa Utara'),
(485, 31, 'Tomohon'),
(12, 32, 'Agam'),
(93, 32, 'Bukittinggi'),
(116, 32, 'Dharmasraya'),
(186, 32, 'Kepulauan Mentawai'),
(236, 32, 'Lima Puluh Koto/Kota'),
(318, 32, 'Padang'),
(321, 32, 'Padang Panjang'),
(322, 32, 'Padang Pariaman'),
(337, 32, 'Pariaman'),
(339, 32, 'Pasaman'),
(340, 32, 'Pasaman Barat'),
(345, 32, 'Payakumbuh'),
(357, 32, 'Pesisir Selatan'),
(394, 32, 'Sawah Lunto'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)'),
(421, 32, 'Solok'),
(422, 32, 'Solok Selatan'),
(453, 32, 'Tanah Datar'),
(40, 33, 'Banyuasin'),
(121, 33, 'Empat Lawang'),
(220, 33, 'Lahat'),
(242, 33, 'Lubuk Linggau'),
(292, 33, 'Muara Enim'),
(297, 33, 'Musi Banyuasin'),
(298, 33, 'Musi Rawas'),
(312, 33, 'Ogan Ilir'),
(313, 33, 'Ogan Komering Ilir'),
(314, 33, 'Ogan Komering Ulu'),
(315, 33, 'Ogan Komering Ulu Selatan'),
(316, 33, 'Ogan Komering Ulu Timur'),
(324, 33, 'Pagar Alam'),
(327, 33, 'Palembang'),
(367, 33, 'Prabumulih'),
(15, 34, 'Asahan'),
(52, 34, 'Batu Bara'),
(70, 34, 'Binjai'),
(110, 34, 'Dairi'),
(112, 34, 'Deli Serdang'),
(137, 34, 'Gunungsitoli'),
(146, 34, 'Humbang Hasundutan'),
(173, 34, 'Karo'),
(217, 34, 'Labuhan Batu'),
(218, 34, 'Labuhan Batu Selatan'),
(219, 34, 'Labuhan Batu Utara'),
(229, 34, 'Langkat'),
(268, 34, 'Mandailing Natal'),
(278, 34, 'Medan'),
(307, 34, 'Nias'),
(308, 34, 'Nias Barat'),
(309, 34, 'Nias Selatan'),
(310, 34, 'Nias Utara'),
(319, 34, 'Padang Lawas'),
(320, 34, 'Padang Lawas Utara'),
(323, 34, 'Padang Sidempuan'),
(325, 34, 'Pakpak Bharat'),
(353, 34, 'Pematang Siantar'),
(389, 34, 'Samosir'),
(404, 34, 'Serdang Bedagai'),
(407, 34, 'Sibolga'),
(413, 34, 'Simalungun'),
(459, 34, 'Tanjung Balai'),
(463, 34, 'Tapanuli Selatan'),
(464, 34, 'Tapanuli Tengah'),
(465, 34, 'Tapanuli Utara'),
(470, 34, 'Tebing Tinggi'),
(481, 34, 'Toba Samosir');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_provinsi`
--

CREATE TABLE `lokasi_provinsi` (
  `provinsi_id` int(11) NOT NULL,
  `nama_provinsi` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi_provinsi`
--

INSERT INTO `lokasi_provinsi` (`provinsi_id`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `ojek`
--

CREATE TABLE `ojek` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `alamat` text NOT NULL,
  `ojek` int(11) NOT NULL,
  `jemput` datetime DEFAULT NULL,
  `proses` datetime DEFAULT NULL,
  `selesai` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ojek`
--

INSERT INTO `ojek` (`id`, `user`, `lat`, `lng`, `alamat`, `ojek`, `jemput`, `proses`, `selesai`) VALUES
(1, 9, -7.65412, 112.701, 'tes', 0, '2017-10-04 13:28:34', NULL, NULL),
(2, 9, -7.58467, 112.744, 'tes2', 0, '2017-10-04 13:28:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelanggan_id` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `kota` varchar(60) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`pelanggan_id`, `nama_pelanggan`, `alamat`, `hp`, `email`, `kota`, `user_id`) VALUES
(1, 'Esti Oneng', 'Jalan Padang IV', '2347683', 'padang@yahoo.com', '48', 8),
(2, 'Coba', 'Alamat', '123192834', 'coba@gmail.com', '342', 9),
(6, 'rizal', '123', '123', 'rizaladitiya516@gmail.com', '342', 17);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `pembelian_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('daftar','selesai') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`pembelian_id`, `tanggal`, `supplier_id`, `user_id`, `status`) VALUES
(1, '2016-06-23 12:57:23', 3, 4, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `pembelian_detail_id` int(11) NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`pembelian_detail_id`, `pembelian_id`, `produk_id`, `qty`) VALUES
(1, 1, 8, 2),
(2, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_temp`
--

CREATE TABLE `pembelian_temp` (
  `pembelian_temp_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `penjualan_id` int(11) NOT NULL,
  `invoice` varchar(40) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `kota` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `total` bigint(20) NOT NULL,
  `kurir` varchar(20) NOT NULL,
  `pelayanan` varchar(50) NOT NULL,
  `ongkir` bigint(20) NOT NULL,
  `berat` int(11) NOT NULL,
  `status` enum('draft','konfirmasi','lunas') NOT NULL,
  `promo` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`penjualan_id`, `invoice`, `pelanggan_id`, `kota`, `alamat`, `tanggal`, `total`, `kurir`, `pelayanan`, `ongkir`, `berat`, `status`, `promo`) VALUES
(1, '1463764026', 1, '152', 'Jalan Padang IV', '2016-05-21 00:07:06', 389000, 'jne', 'OKE', 15000, 50, 'lunas', 0),
(2, '1463832706', 1, '48', 'Jalan Padang IV', '2016-05-21 19:11:46', 400000, 'jne', 'OKE', 17000, 30, 'lunas', 0),
(3, '1466109503', 2, '93', 'Alamat', '2016-06-17 03:38:23', 400000, 'jne', 'CTCYES', 13000, 30, 'lunas', 30000),
(4, '1466671419', 2, '93', 'Alamat', '2016-06-23 15:43:39', 170000, 'pos', 'Surat Kilat Khusus', 9000, 30, 'konfirmasi', 30000),
(5, '1466930733', 2, '93', 'Alamat', '2016-06-26 15:45:33', 359000, 'jne', 'CTCYES', 13000, 50, 'konfirmasi', 30000),
(6, '1468425819', 2, '93', 'Alamat', '2016-07-13 23:03:39', 170000, 'jne', 'CTC', 12000, 30, 'konfirmasi', 30000),
(7, '1468658824', 2, '93', 'Alamat', '2016-07-16 15:47:04', 139000, 'jne', 'CTC', 12000, 30, 'draft', 30000),
(8, '1468659086', 2, '93', 'Alamat', '2016-07-16 15:51:26', 139000, 'jne', 'CTC', 12000, 30, 'draft', 30000),
(9, '1468659105', 2, '93', 'Alamat', '2016-07-16 15:51:45', 139000, 'jne', 'CTC', 12000, 30, 'draft', 30000),
(10, '1484287207', 2, '342', 'Alamat', '2017-01-13 13:00:07', 2490, 'cod', 'Cepat', 10000, 69, 'lunas', 10),
(11, '1484292964', 2, '342', 'Alamat', '2017-01-13 14:36:04', 2490, 'cod', 'Cepat', 10000, 69, 'draft', 10),
(12, '1484726638', 2, '342', 'Alamat', '2017-01-18 15:03:58', 2480, 'jne', 'CTCYES', 11000, 75, 'lunas', 20),
(13, '1489807551', 2, '342', 'Alamat', '2017-03-18 10:25:51', 2500, 'cod', 'Cepat', 10000, 69, 'draft', 0),
(14, 'INV/17/III/18/1489811022', 2, '342', 'Alamat', '2017-03-18 11:23:42', 2500, 'cod', 'Cepat', 10000, 75, 'draft', 0),
(15, 'INV/17/III/21/1490072001', 6, '342', '123', '2017-03-21 11:53:21', 2500, 'cod', 'Cepat', 10000, 69, 'konfirmasi', 0),
(16, 'INV/17/III/22/1490143660', 6, '342', '123', '2017-03-22 07:47:40', 2500, 'cod', 'Cepat', 10000, 69, 'konfirmasi', 0),
(17, 'INV/17/III/24/1490338395', 6, '342', '123', '2017-03-24 13:53:15', 2500, 'cod', 'Standar', 5000, 69, 'konfirmasi', 0),
(18, 'INV/17/III/27/1490614643', 2, '342', 'Alamat', '2017-03-27 18:37:23', 2500, 'cod', 'Standar', 5000, 69, 'konfirmasi', 0),
(19, 'INV/17/X/04/1507107283', 2, '342', 'Alamat', '2017-10-04 15:54:43', 3000, 'cod', 'Cepat', 10000, 5, 'konfirmasi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_cod`
--

CREATE TABLE `penjualan_cod` (
  `penjualan_cod_id` int(11) NOT NULL,
  `penjualan_id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `alamat` text NOT NULL,
  `proses` enum('packing','kirim','selesai') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_cod`
--

INSERT INTO `penjualan_cod` (`penjualan_cod_id`, `penjualan_id`, `lat`, `lng`, `alamat`, `proses`) VALUES
(1, 13, -7.65667, 112.696, 'Pandaan', 'packing'),
(2, 14, -7.66552, 112.699, 'Depan Citra Swalayan', 'packing'),
(3, 15, -7.6528, 112.696, 'Tes', 'packing'),
(4, 16, -7.64417, 112.69, 'Jl. Patimura', 'packing'),
(5, 17, -7.59934, 112.781, 'Bangil', 'packing'),
(6, 18, -7.64981, 112.698, '', 'packing'),
(7, 19, -7.6531, 112.696, 'tes', 'packing');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `penjualan_detail_id` int(11) NOT NULL,
  `penjualan_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`penjualan_detail_id`, `penjualan_id`, `produk_id`, `qty`, `harga`, `subtotal`, `keterangan`) VALUES
(1, 1, 10, 1, 200000, 200000, ''),
(2, 1, 9, 1, 189000, 189000, ''),
(3, 2, 10, 2, 200000, 400000, ''),
(4, 3, 10, 2, 200000, 400000, ''),
(5, 4, 10, 1, 170000, 170000, ''),
(6, 5, 10, 1, 170000, 170000, ''),
(7, 5, 9, 1, 189000, 189000, ''),
(8, 6, 10, 1, 170000, 170000, 'esfsdfsdf'),
(9, 9, 7, 1, 139000, 139000, 'abcd'),
(10, 10, 13, 1, 2490, 2490, ''),
(11, 11, 13, 1, 2490, 2490, ''),
(12, 12, 12, 1, 2480, 2480, ''),
(13, 13, 13, 1, 2500, 2500, ''),
(14, 14, 12, 1, 2500, 2500, ''),
(15, 15, 13, 1, 2500, 2500, ''),
(16, 16, 13, 1, 2500, 2500, ''),
(17, 17, 13, 1, 2500, 2500, ''),
(18, 18, 13, 1, 2500, 2500, ''),
(19, 19, 14, 1, 3000, 3000, 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_konfirmasi`
--

CREATE TABLE `penjualan_konfirmasi` (
  `konfirmasi_id` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `tanggal` datetime NOT NULL,
  `tanggal_transfer` date NOT NULL,
  `bukti_transfer` varchar(100) NOT NULL,
  `penjualan_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_konfirmasi`
--

INSERT INTO `penjualan_konfirmasi` (`konfirmasi_id`, `invoice`, `bank_id`, `pemilik`, `tanggal`, `tanggal_transfer`, `bukti_transfer`, `penjualan_id`) VALUES
(1, '1463764026', 1, 'Esti Oneng', '2016-05-21 00:07:45', '2016-05-21', 'bukti-1463764026.jpg', 1),
(2, '1463832706', 1, 'Esti Oneng', '2016-05-21 19:12:44', '2016-05-21', 'bukti-1463832706.jpg', 2),
(3, '1466109503', 1, 'Heru', '2016-06-17 03:41:02', '2016-06-17', '', 3),
(4, '1466930733', 2, 'Heru', '2016-06-26 15:46:57', '2016-06-26', 'bukti-1466930733.jpg', 5),
(5, '1468425819', 1, 'Heru', '2016-07-13 23:04:55', '2016-07-13', '', 6),
(6, '1484287207', 1, 'Heru', '2017-01-18 14:50:42', '2017-01-18', '', 10),
(7, '1484726638', 1, 'Heru', '2017-01-18 15:04:30', '2017-01-18', '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `kode_produk` varchar(30) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `merek_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` double NOT NULL,
  `jumlah_lihat` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `kode_produk`, `nama_produk`, `supplier_id`, `merek_id`, `kategori_id`, `deskripsi`, `harga`, `berat`, `jumlah_lihat`, `jumlah_beli`) VALUES
(14, '456852001', 'Stiker Mt.Arjuno dan Mt.Welirang', 5, 7, 10, '<p>deskripsi</p>\r\n', 3000, 5, 0, 0),
(13, '089686010190', 'Indomie Kari Ayam', 4, 5, 7, '<p>Indomie Kari Ayam</p>\r\n', 2500, 69, 0, 1),
(12, '089686180657', 'Indomie Goreng', 4, 5, 7, '<p>Mie Instan Indomie Goreng 75gram</p>\r\n', 2500, 75, 0, 1),
(15, '456852002', 'Emblem Mt. Arjuna & Mt Welirang', 5, 7, 10, '<p><em><strong>Emblem Bordir</strong><br>\r\nTersedia 4 Warna ( PINK,ORANGE,HIJAU,BIRU )</em><br>\r\n </p>\r\n', 8000, 2.5, 0, 0),
(16, '456852003', 'Keychain Mt. Arjuna & Mt. Welirang', 5, 7, 10, '<p>Souvenir Gantungan Kunci</p>\r\n', 8000, 4.5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_kategori`
--

INSERT INTO `produk_kategori` (`kategori_id`, `nama_kategori`) VALUES
(8, 'Minuman'),
(7, 'Makanan'),
(9, 'Snack'),
(10, 'Aksesoris');

-- --------------------------------------------------------

--
-- Table structure for table `produk_merek`
--

CREATE TABLE `produk_merek` (
  `merek_id` int(11) NOT NULL,
  `nama_merek` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_merek`
--

INSERT INTO `produk_merek` (`merek_id`, `nama_merek`) VALUES
(5, 'Indomie'),
(6, 'Sarimi'),
(7, 'ArthaAcc');

-- --------------------------------------------------------

--
-- Table structure for table `produk_photo`
--

CREATE TABLE `produk_photo` (
  `photo_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_photo`
--

INSERT INTO `produk_photo` (`photo_id`, `produk_id`, `photo`) VALUES
(9, 1, 'produk_1-3.jpg'),
(8, 1, 'produk_1-2.jpg'),
(7, 1, 'produk_1-1.jpg'),
(10, 1, 'produk_1-4.jpg'),
(12, 2, 'produk_2-1.jpg'),
(17, 5, 'produk_5-1.jpg'),
(16, 4, 'produk_4-1.jpg'),
(18, 6, 'produk_6-1.jpg'),
(27, 8, 'produk_8-1.jpg'),
(22, 3, 'produk_3-1.jpg'),
(26, 7, 'produk_7-1.jpg'),
(28, 9, 'produk_9-1.jpg'),
(29, 10, 'produk_10-1.jpg'),
(30, 12, 'produk_12-1.png'),
(31, 13, 'produk_13-1.png'),
(37, 14, 'produk_14-1.jpg'),
(41, 15, 'produk_15-1.jpg'),
(45, 16, 'produk_16-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk_stok`
--

CREATE TABLE `produk_stok` (
  `stok_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `toko_id` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_mutasi` int(11) NOT NULL,
  `stok_jual` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_stok`
--

INSERT INTO `produk_stok` (`stok_id`, `produk_id`, `toko_id`, `stok`, `stok_mutasi`, `stok_jual`) VALUES
(19, 16, 1, 25, 0, 0),
(17, 14, 1, 20, 0, 0),
(16, 13, 1, 50, 0, 1),
(15, 12, 1, 50, 0, 1),
(18, 15, 1, 40, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk_ukuran`
--

CREATE TABLE `produk_ukuran` (
  `ukuran_id` int(11) NOT NULL,
  `nama_ukuran` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_ukuran`
--

INSERT INTO `produk_ukuran` (`ukuran_id`, `nama_ukuran`) VALUES
(7, '32'),
(6, '31'),
(5, '30'),
(8, '34'),
(9, '36'),
(10, '40');

-- --------------------------------------------------------

--
-- Table structure for table `produk_warna`
--

CREATE TABLE `produk_warna` (
  `warna_id` int(11) NOT NULL,
  `nama_warna` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_warna`
--

INSERT INTO `produk_warna` (`warna_id`, `nama_warna`) VALUES
(1, 'Hitam'),
(2, 'Putih'),
(3, 'Merah'),
(4, 'Biru'),
(5, 'Pink');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `promo_id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `nilai` bigint(20) NOT NULL,
  `mulai` date NOT NULL,
  `selesai` date NOT NULL,
  `banner_gambar` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`promo_id`, `judul`, `deskripsi`, `nilai`, `mulai`, `selesai`, `banner_gambar`) VALUES
(1, 'tes', '<p>tes</p>\r\n', 10, '2017-01-08', '2017-01-10', ''),
(2, 'tes2', '<p>tes2</p>\r\n', 20, '2017-01-09', '2017-01-18', '');

-- --------------------------------------------------------

--
-- Table structure for table `promo_data`
--

CREATE TABLE `promo_data` (
  `promo_data_id` int(11) NOT NULL,
  `promo_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo_data`
--

INSERT INTO `promo_data` (`promo_data_id`, `promo_id`, `produk_id`) VALUES
(4, 1, 13),
(7, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nama_supplier`, `alamat`, `telepon`, `user_id`) VALUES
(4, 'Citra Swalayan', 'Pandaan', '0343', NULL),
(5, 'Artha Wana', 'TWA Tretes', '085608319759', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `toko_id` int(11) NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `tipe` enum('pusat','cabang') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`toko_id`, `nama_toko`, `alamat`, `telepon`, `kota`, `tipe`) VALUES
(1, 'Artha Wana', 'Jl. Wilis 523 Tretes Prigen Pasuruan', '034388888', '342', 'pusat'),
(3, 'Toko Oky', 'Gang Ledok Asri 5 No 9 Jogosari Pandaan', '0343656666', '342', 'cabang'),
(4, 'Toko Mbak Mamik', 'Jl. PDAM Kavling C7', '085706003383', '342', 'cabang');

-- --------------------------------------------------------

--
-- Table structure for table `toko_mutasi`
--

CREATE TABLE `toko_mutasi` (
  `mutasi_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `toko_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko_mutasi`
--

INSERT INTO `toko_mutasi` (`mutasi_id`, `tanggal`, `toko_id`, `user_id`, `keterangan`) VALUES
(1, '2016-05-12 03:13:53', 3, 4, 'keterangan'),
(5, '2016-06-23 11:53:56', 3, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `toko_mutasi_detail`
--

CREATE TABLE `toko_mutasi_detail` (
  `mutasi_detail_id` int(11) NOT NULL,
  `mutasi_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `ukuran_id` int(11) NOT NULL,
  `warna_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko_mutasi_detail`
--

INSERT INTO `toko_mutasi_detail` (`mutasi_detail_id`, `mutasi_id`, `produk_id`, `ukuran_id`, `warna_id`, `qty`) VALUES
(1, 1, 2, 2, 1, 2),
(2, 5, 7, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `akses` enum('admin','member','op','bos','supplier') NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` enum('aktif','banned') NOT NULL,
  `terakhir_login` datetime NOT NULL,
  `toko_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`user_id`, `nama`, `username`, `password`, `email`, `akses`, `photo`, `status`, `terakhir_login`, `toko_id`) VALUES
(1, 'Administrator', 'admin', '94a1514ea726012250ec8e0009cf8b40', '', 'admin', 'ava-c4ca4238a0b923820dcc509a6f75849b.jpg', 'aktif', '2017-03-24 14:04:09', NULL),
(4, 'Oky Rahmadi', 'oky', '0c4327b22a08931d089f974135811af4', 'okyrahmadi@gmail.com', 'op', 'ava-a87ff679a2f3e71d9181a67b7542122c.jpg', 'aktif', '2017-04-27 18:27:00', NULL),
(5, 'Pimpinan', 'bos', '15fc4a53992beba40ae91e5244e79dff', '', 'bos', '', 'aktif', '2017-01-09 17:18:26', NULL),
(9, 'Coba', 'coba', 'c3ec0f7b054e729c5a716c8125839829', '', 'member', '', 'aktif', '2017-10-04 15:51:24', NULL),
(12, 'Supplier Akun 1', 's1', '8ddf878039b70767c4a5bcf4f0c4f65e', '', 'supplier', '', 'aktif', '2017-01-09 17:16:13', NULL),
(13, 'Mamik Ariyanti', 'mamik', '23deb09c91a4d319f9f5b3b65eff2bcf', 'mamikariyanti@ymail.coom', 'op', '', 'aktif', '2017-01-09 17:16:34', NULL),
(17, 'rizal', 'rizal', '202cb962ac59075b964b07152d234b70', 'rizaladitiya516@gmail.com', 'member', '', 'aktif', '2017-03-24 13:52:18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`berita_id`),
  ADD KEY `berita_kategori_id` (`berita_kategori_id`);

--
-- Indexes for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  ADD PRIMARY KEY (`berita_kategori_id`);

--
-- Indexes for table `cod`
--
ALTER TABLE `cod`
  ADD PRIMARY KEY (`cod_id`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`konfigurasi_id`),
  ADD UNIQUE KEY `nama_key` (`nama_key`);

--
-- Indexes for table `lokasi_kecamatan`
--
ALTER TABLE `lokasi_kecamatan`
  ADD PRIMARY KEY (`kecamatan_id`);

--
-- Indexes for table `lokasi_kelurahan`
--
ALTER TABLE `lokasi_kelurahan`
  ADD PRIMARY KEY (`kelurahan_id`);

--
-- Indexes for table `lokasi_kota`
--
ALTER TABLE `lokasi_kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indexes for table `lokasi_provinsi`
--
ALTER TABLE `lokasi_provinsi`
  ADD PRIMARY KEY (`provinsi_id`);

--
-- Indexes for table `ojek`
--
ALTER TABLE `ojek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelanggan_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`pembelian_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`pembelian_detail_id`);

--
-- Indexes for table `pembelian_temp`
--
ALTER TABLE `pembelian_temp`
  ADD PRIMARY KEY (`pembelian_temp_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`penjualan_id`);

--
-- Indexes for table `penjualan_cod`
--
ALTER TABLE `penjualan_cod`
  ADD PRIMARY KEY (`penjualan_cod_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`penjualan_detail_id`);

--
-- Indexes for table `penjualan_konfirmasi`
--
ALTER TABLE `penjualan_konfirmasi`
  ADD PRIMARY KEY (`konfirmasi_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `produk_merek`
--
ALTER TABLE `produk_merek`
  ADD PRIMARY KEY (`merek_id`);

--
-- Indexes for table `produk_photo`
--
ALTER TABLE `produk_photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `produk_stok`
--
ALTER TABLE `produk_stok`
  ADD PRIMARY KEY (`stok_id`);

--
-- Indexes for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD PRIMARY KEY (`ukuran_id`);

--
-- Indexes for table `produk_warna`
--
ALTER TABLE `produk_warna`
  ADD PRIMARY KEY (`warna_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `promo_data`
--
ALTER TABLE `promo_data`
  ADD PRIMARY KEY (`promo_data_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`toko_id`);

--
-- Indexes for table `toko_mutasi`
--
ALTER TABLE `toko_mutasi`
  ADD PRIMARY KEY (`mutasi_id`);

--
-- Indexes for table `toko_mutasi_detail`
--
ALTER TABLE `toko_mutasi_detail`
  ADD PRIMARY KEY (`mutasi_detail_id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `berita_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  MODIFY `berita_kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cod`
--
ALTER TABLE `cod`
  MODIFY `cod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `konfigurasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `lokasi_kecamatan`
--
ALTER TABLE `lokasi_kecamatan`
  MODIFY `kecamatan_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lokasi_kelurahan`
--
ALTER TABLE `lokasi_kelurahan`
  MODIFY `kelurahan_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lokasi_kota`
--
ALTER TABLE `lokasi_kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;
--
-- AUTO_INCREMENT for table `lokasi_provinsi`
--
ALTER TABLE `lokasi_provinsi`
  MODIFY `provinsi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `ojek`
--
ALTER TABLE `ojek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `pelanggan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `pembelian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `pembelian_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pembelian_temp`
--
ALTER TABLE `pembelian_temp`
  MODIFY `pembelian_temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `penjualan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `penjualan_cod`
--
ALTER TABLE `penjualan_cod`
  MODIFY `penjualan_cod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `penjualan_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `penjualan_konfirmasi`
--
ALTER TABLE `penjualan_konfirmasi`
  MODIFY `konfirmasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `produk_merek`
--
ALTER TABLE `produk_merek`
  MODIFY `merek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `produk_photo`
--
ALTER TABLE `produk_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `produk_stok`
--
ALTER TABLE `produk_stok`
  MODIFY `stok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  MODIFY `ukuran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `produk_warna`
--
ALTER TABLE `produk_warna`
  MODIFY `warna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `promo_data`
--
ALTER TABLE `promo_data`
  MODIFY `promo_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `toko_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `toko_mutasi`
--
ALTER TABLE `toko_mutasi`
  MODIFY `mutasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `toko_mutasi_detail`
--
ALTER TABLE `toko_mutasi_detail`
  MODIFY `mutasi_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
