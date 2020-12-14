-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2018 at 06:25 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pakarginjal`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `idadmin` int(3) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`idadmin`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbpasien`
--

CREATE TABLE `tbpasien` (
  `idpasien` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelamin` varchar(10) NOT NULL,
  `umur` varchar(3) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `noip` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbpasien`
--

INSERT INTO `tbpasien` (`idpasien`, `nama`, `kelamin`, `umur`, `alamat`, `noip`, `tanggal`, `pekerjaan`, `email`) VALUES
(1, 'Mala', 'Wanita', '33', 'Lhokseumawe', '127.0.0.1', '2017-09-12', '', 'malawai@gmail.com'),
(2, 'Mala', 'Wanita', '33', 'Lhokseumawe', '127.0.0.1', '2017-09-12', '', 'malawai@gmail.com'),
(3, 'Junaya', 'Wanita', '33', 'Mulieng', '::1', '2018-01-10', '', 'yunaa@gmail.com'),
(4, 'Rudi Anjani', 'Laki-laki', '15', 'Matang', '::1', '2018-01-11', '', 'rudi@gmail.com'),
(5, 'Rusli', 'Laki-laki', '33', 'Matang', '::1', '2018-01-14', '', 'ruslia@gmail.com'),
(6, 'Arun', 'Laki-laki', '33', 'Lhokseumawe', '::1', '2018-01-15', '', 'arun@gmail.com'),
(7, 'Fauzan', 'Laki-laki', '22', 'Matangkuli', '::1', '2018-01-16', '', 'zoelfathi@gmail.com'),
(8, 'Juanda', 'Laki-laki', '19', 'Lhokseumawe', '::1', '2018-02-09', '', 'juanda@gmail.com'),
(9, 'Uji', 'Laki-laki', '9', '9', '::1', '2018-02-09', '', '9'),
(10, 'JUnaidi', 'Laki-laki', '34', 'Matang', '::1', '2018-02-09', '', 'junaidi@gmail.com'),
(11, 'JUnaidi', 'Laki-laki', '34', 'Matang', '::1', '2018-02-09', '', 'junaidi@gmail.com'),
(12, 'Rudi', 'Laki-laki', '34', 'Blang raya', '::1', '2018-02-15', '', 'rudiblang@gmail.com'),
(13, 'Husna', 'Wanita', '22', 'Juang', '::1', '2018-02-15', '', 'husnaini@gmail.com'),
(14, 'Jusni', 'Laki-laki', '34', 'Leuhong', '::1', '2018-02-15', '', 'jusniag@gmail.com'),
(15, 'Halimah', 'Wanita', '54', 'Jumbok', '::1', '2018-02-15', '', 'halimah2@gmail.com'),
(16, 'test', 'Laki-laki', '25', 's', '::1', '2018-09-15', '', 's'),
(17, 'Didik', 'Laki-laki', '25', 'Sukabumi', '::1', '2018-09-17', '', 'azfa_rasikh@yahoo.co'),
(18, 'Test', 'Laki-laki', '25', 'Jabar', '::1', '2018-09-27', '', 'jabar@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `id` int(11) NOT NULL,
  `kdgejala` varchar(3) DEFAULT NULL,
  `gejala` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_gejala`
--

INSERT INTO `tb_gejala` (`id`, `kdgejala`, `gejala`) VALUES
(1, 'G1', 'Terjadi pembengkakan di pergelangan kaki dan sekitar mata'),
(2, 'G2', 'Mual, muntah, kehilangan nafsu makan, dan penurunan berat badan.'),
(3, 'G3', 'Volume urine dan frekuensi buang air kecil berkurang'),
(4, 'G4', 'Urine berbusa'),
(5, 'G5', 'Merasa lelah dan sesak napas'),
(6, 'G6', 'Kulit kering dan terasa gatal'),
(7, 'G7', 'Terjadi kram otot, terutama di tungkai'),
(8, 'G8', 'Susah tidur'),
(9, 'G9', 'Tekanan darah tinggi'),
(10, 'G10', 'Gangguan irama jantung'),
(11, 'G11', 'Penurunan kesadaran'),
(12, 'G12', 'Pada gagal ginjal akut dapat terlihat tanda dehidrasi.'),
(13, 'G13', 'Nyeri punggung bawah dan urine bercampur darah dapat terjadi pada penderita batu ginjal, penyakit ginjal polikistik, dan infeksi ginjal.'),
(14, 'G14', 'Pada penderita infeksi ginjal dan batu ginjal dapat timbul keluhan demam dan menggigil.'),
(15, 'G15', 'Sering mengambil mainan teman dengan paksa'),
(16, 'G16', 'Reaktif, sering merespon kembali apa yang dilakukan kepadanya'),
(17, 'G17', 'Sering mengulangi kata-kata yang diucapkan teman'),
(18, 'G18', 'Sering bertindak kasar dengan teman sebaya'),
(19, 'G19', 'Sikap menantang dan membangkang'),
(20, 'G20', 'Sering melanggar peraturan, bahkan peraturan yang sederhana'),
(21, 'G21', 'Selalu bermasalah dengan orang- orang yang memiliki otoritas'),
(22, 'G22', 'Mudah merasa terganggu, mudah marah'),
(23, 'G23', 'Terlihat sangat pemalu dan menarik diri'),
(24, 'G24', 'Mainan sering tertinggal'),
(25, 'G25', 'Mudah beralih perhatian (terutamarangsang suara)'),
(26, 'G26', 'Cenderung tidak mendengarkan ketika seseorang berbicara'),
(27, 'G27', 'Memiliki masalah dalam hal mengatur tugas / kegiatan sehari- hari'),
(28, 'G28', 'Sulit mengikuti petunjuk guru dan orang tua'),
(29, 'G29', 'Sulit menyelesaikan tugas atau kegiatan yang diberikan guru atau orang tua'),
(30, 'G30', 'Seringkali lupa dengan kebiasaan dan kegiatan sehari-hari'),
(31, 'G31', 'Selalu bergerak, seperti berjalan atau memanjat'),
(32, 'G32', 'Sering menggeliat'),
(33, 'G33', 'Sering membuat gaduh suasana'),
(34, 'G34', 'Selalu ingin memegang benda yang dilihat'),
(38, 'g35', 'pusing'),
(39, 'g36', 'susah buang air kecil');

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil`
--

CREATE TABLE `tb_hasil` (
  `idhasil` int(5) NOT NULL,
  `idpasien` int(5) NOT NULL,
  `kdpenyakit` varchar(4) NOT NULL,
  `persentase` double NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_hasil`
--

INSERT INTO `tb_hasil` (`idhasil`, `idpasien`, `kdpenyakit`, `persentase`, `tanggal`) VALUES
(61, 18, 'P1', 31.47, '2018-09-27 10:19:58'),
(62, 18, 'P3', 47.55, '2018-09-27 10:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyakit`
--

CREATE TABLE `tb_penyakit` (
  `id` int(11) NOT NULL,
  `kdpenyakit` varchar(3) DEFAULT NULL,
  `nama_penyakit` varchar(100) DEFAULT NULL,
  `definisi` text,
  `solusi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_penyakit`
--

INSERT INTO `tb_penyakit` (`id`, `kdpenyakit`, `nama_penyakit`, `definisi`, `solusi`) VALUES
(1, 'P1', 'Infeksi ginjal', 'Infeksi ginjal terjadi bila bakteri dari kandung kemih menyebar naik menuju ke salah satu atau kedua ginjal. Kondisi ini muncul akibat dari komplikasi infeksi saluran kemih.', 'Jenis-jenis obat yang biasanya akan diresepkan oleh dokter untuk mengatasi gejala infeksi ginjal adalah:\r\n\r\nAntibiotik oral. Antibiotik yang umumnya direkomendasikan adalah ciprofloxacin atau amoxicillin. Sedangkan khusus untuk wanita hamil, antibiotik yang umumnya diberikan adalah cephalexin dengan jangka penggunaan selama 14 hari. Gejala infeksi ginjal biasanya mulai membaik setelah beberapa hari  pengobatan. Namun untuk memastikan infeksi bersih sepenuhnya, pengobatan ini perlu dilanjutkan hingga obat yang diberikan habis.\r\n\r\nObat Pereda Nyeri. Untuk meredakan rasa sakit dan demam yang muncul akibat infeksi ginjal, dokter biasanya akan merekomendasikan paracetamol. Obat pereda rasa sakit golongan antiinflamasi nonsteroid (NSAIDs), seperti ibuprofen, aspirin, atau naproxen, tidak disarankan untuk digunakan pada kondisi ini karena dapat memperparah gangguan ginjal.'),
(2, 'P2', 'Batu ginjal', 'Garam dan mineral yang seharusnya disaring oleh ginjal tetapi malah mengeras dan tertimbun dalam ginjal sehingga terbentuk batu ginjal. Hal ini biasanya terjadi karena urine yang terlalu pekat, sehingga garam dan mineral mengkristal.', 'Pengobatan batu ginjal\r\n\r\nPengobatan penyakit batu ginjal yang dilakukan tergantung kepada ukuran dari batu. Jika batu ginjal masih tergolong kecil atau menengah, serta masih dapat melewati saluran kemih tanpa harus dilakukan operasi, dokter biasanya akan menyarankan pasien untuk minum air putih saja sesuai takaran yang disarankan. Dengan adanya aliran cairan secara terus-menerus, diharapkan batu ginjal dapat terdorong keluar dengan sendirinya. Apabila gejala yang dirasakan oleh pasien cukup mengganggu, biasanya dokter cukup meresepkan obat pereda rasa sakit, misalnya acetaminophen, ibuprofen atau obat anti radang non steroid.\r\n\r\nPenanganan batu ginjal yang dengan prosedur khusus (misalnya dengan energi laser, ultrasound, atau operasi) biasanya baru akan diterapkan jika batu berukuran lebih besar sehingga menyumbat saluran kemih pasien.'),
(3, 'P3', 'Ginjal polikistik', 'Merupakan penyakit keturunan berupa munculnya kista (kantong berisi cairan) yang berkelompok di dalam ginjal. Penyakit ginjal polikistik tidak ganas, namun dapat mengakibatkan penurunan fungsi ginjal. Selain terjadi di ginjal, kista pada ginjal polikistik juga bisa muncul di organ hati atau bagian lain dalam tubuh.', 'Sampai saat ini belum ditemukan obat untuk menyembuhkan penyakit ginjal polikistik. Dokter hanya akan mencoba meringankan gejala, serta mengatasi komplikasi yang muncul.\r\n\r\nBerikut ini adalah beberapa penanganan berdasarkan gejala atau komplikasi yang muncul:\r\n\r\n    Infeksi kandung kemih atau ginjal. Antibiotik dapat digunakan untuk mengatasi infeksi dan mencegah kerusakan ginjal lebih lanjut.\r\n    Kegagalan fungsi ginjal. Penderita akan disarankan untuk menjalani cuci darah atau transplantasi ginjal.\r\n    Nyeri kronis. Obat pereda nyeri, seperti paracetamol, dapat digunakan untuk mengontrol rasa nyeri kronis pada punggung.\r\n    Aneurisma. Dokter akan menganjurkan penderita untuk menjalani pemeriksaan aneurisma intrakranial secara rutin. Jika ditemukan, dapat dilakukan tindakan pembedahan untuk mengurangi risiko perdarahan.\r\n    Darah pada urine. Disarankan untuk mengonsumsi banyak cairan ketika muncul darah pada urine, serta melakukan bed rest untuk mengurangi perdarahan.\r\n    Komplikasi kista. Jika kista menghalangi organ lain atau pembuluh darah, menyebabkan nyeri yang hebat, atau menyebabkan infeksi, maka dapat dilakukan pembedahan untuk mengeluarkan cairan kista.\r\n    Kista pada organ hati. Pada keadaan ini dapat dilakukan pembedahan untuk mengangkat sebagian organ hati atau transplantasi hati.\r\n    Tekanan darah tinggi. Dianjurkan untuk makan makanan rendah garam dan lemak. Penderita juga diminta untuk tidak merokok, lebih sering olahraga dan menghindari stres. Obat jenis ACE-inhibitors dapat digunakan untuk mengontrol tekanan darah tinggi penderita.\r\n'),
(4, 'P4', 'Gagal ginjal akut', 'Gagal ginjal akut adalah kondisi dimana ginjal tidak dapat berfungsi normal secara tiba-tiba. Jika tidak segera ditangani, kondisi ini bisa menyebabkan menumpuknya garam dan zat kimia lainnya di dalam tubuh dan memengaruhi fungsi organ tubuh lainnya.', 'Gagal ginjal akut yang masih tergolong ringan bisa disembuhkan melalui rawat jalan. Sebaliknya, pasien gagal ginjal akut yang tergolong berat harus menjalani rawat inap. Durasi pengobatan tiap pasien tergantung dari penyebab gagal ginjal akut dan rentang waktu pemulihan ginjal itu sendiri.\r\n\r\nJika dapat menjalani rawat jalan, maka dokter akan menyarankan pasien gagal ginjal akut untuk:\r\n\r\n    Memperbanyak konsumsi air putih untuk mencegah terjadinya dehidrasi.\r\n    Menghentikan obat-obatan yang dapat memicu atau memperparah gagal ginjal akut.\r\n    Mengobati infeksi yang mendasari terjadinya gagal ginjal akut apabila ada.\r\n    Monitor kadar kreatinin dan elektrolit untuk melihat kesembuhan.\r\n    Berkonsultasi dengan dokter spesialis urologi atau spesialis ginjal apabila penyebab gagal ginjal akut tidak jelas, atau apabila terdeteksi adanya penyebab lain yang lebih serius.\r\n'),
(5, 'P5', 'Ginjal Kronis', 'Penyakit ginjal kronis atau gagal ginjal kronis yaitu penurunan fungsi ginjal yang menetap selama tiga bulan. Kondisi ini ditandai beberapa gejala, seperti sesak napas, mual, dan kelelahan. Namun kondisi ini tidak dirasakan oleh pasien bila masih stadium 1-3. Oleh karena itu, banyak orang tidak menyadari sedang mengalami kondisi ini hingga mencapai stadium lanjutan.', 'Terdiagnosis mengidap GGK dapat membuat Anda dan kerabat merasa cemas. Berkonsultasi dengan dokter dan sesama pengidap dapat membuat Anda menemukan cara agar penyakit ini tidak mengambil alih hidup Anda.\r\n\r\nIni dikarenakan memang tidak ada obat yang dapat menyembuhkan gagal ginjal. Perawatan terhadap penyakit ini hanya berfokus memperlambat atau menghentikan perkembangan penyakit dan mencegah munculnya kondisi serius lain. Selain itu, terapi juga bertujuan untuk mengurangi gejala yang timbul akibat GGK.\r\n\r\nPerubahan yang terjadi dalam sirkulasi tubuh membuat pengidap penyakit ginjal kronis menjadi lebih berisiko menderita stroke atau penyakit jantung.\r\n\r\nPada penderita gagal ginjal stadium akhir (End-Stage Renal Disease/ESRD) harus dilakukan cuci darah atau transplantasi ginjal untuk menggantikan fungsi ginjal yang telah rusak.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rules`
--

CREATE TABLE `tb_rules` (
  `id_problem` int(11) DEFAULT NULL,
  `id_evidence` int(11) DEFAULT NULL,
  `cf` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_rules`
--

INSERT INTO `tb_rules` (`id_problem`, `id_evidence`, `cf`) VALUES
(1, 1, 0.3),
(2, 1, 0.3),
(3, 1, 0.3),
(1, 2, 0.3),
(2, 2, 0.3),
(3, 2, 0.3),
(1, 3, 0.3),
(2, 3, 0.3),
(3, 3, 0.3),
(1, 4, 0.6),
(2, 4, 0.6),
(1, 5, 0.6),
(2, 5, 0.6),
(1, 6, 0.6),
(2, 6, 0.6),
(3, 6, 0.6),
(1, 7, 0.6),
(2, 7, 0.6),
(1, 8, 0.6),
(1, 9, 0.6),
(3, 9, 0.6),
(2, 10, 0.7),
(2, 11, 0.6),
(3, 11, 0.6),
(2, 12, 0.6),
(3, 12, 0.6),
(2, 13, 0.6),
(3, 13, 0.6),
(3, 14, 0.85),
(3, 15, 0.4),
(3, 16, 0.85),
(3, 17, 0.75),
(3, 18, 0.9),
(3, 19, 0.9),
(3, 20, 0.75),
(2, 21, 0.6),
(3, 21, 0.6),
(1, 22, 0.6),
(3, 22, 0.6),
(1, 23, 0.6),
(3, 23, 0.6),
(1, 24, 0.7),
(1, 25, 0.85),
(1, 26, 0.9),
(1, 27, 0.35),
(1, 28, 0.6),
(1, 29, 0.75),
(1, 30, 0.95),
(2, 31, 0.95),
(2, 32, 0.45),
(2, 33, 0.8),
(2, 34, 0.9),
(5, 39, 0.8),
(5, 38, 0.6),
(5, 1, 0.3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `tbpasien`
--
ALTER TABLE `tbpasien`
  ADD PRIMARY KEY (`idpasien`);

--
-- Indexes for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_hasil`
--
ALTER TABLE `tb_hasil`
  ADD PRIMARY KEY (`idhasil`);

--
-- Indexes for table `tb_penyakit`
--
ALTER TABLE `tb_penyakit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbpasien`
--
ALTER TABLE `tbpasien`
  MODIFY `idpasien` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tb_hasil`
--
ALTER TABLE `tb_hasil`
  MODIFY `idhasil` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tb_penyakit`
--
ALTER TABLE `tb_penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
