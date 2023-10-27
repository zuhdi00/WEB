-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2014 at 09:28 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbpakar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nmuser` varchar(25) DEFAULT NULL,
  `nmlogin` varbinary(25) DEFAULT NULL,
  `pslogin` varchar(55) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nmuser`, `nmlogin`, `pslogin`, `level`) VALUES
(3, 'Fery Purnama', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', NULL),
(2, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `analisa_hasil`
--

CREATE TABLE IF NOT EXISTS `analisa_hasil` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `analisa_hasil`
--

INSERT INTO `analisa_hasil` (`id`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `kd_solusi`, `noip`, `tanggal`) VALUES
(0101, 'aaaa', 'P', 'Jambi', 'Swasta', 'P008', '::1', '2014-12-10 03:26:18'),
(0100, 'Mira', 'W', 'Jalan Samudra Kota Jambi', 'Swasta', 'P008', '::1', '2014-06-10 16:16:34'),
(0099, 'Bibi', 'P', 'Jambi', 'Swasta', 'P015', '::1', '2014-06-10 16:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE IF NOT EXISTS `artikel` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `idadmin` varchar(55) DEFAULT NULL,
  `tgl` varchar(55) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi` text,
  `foto` varchar(100) DEFAULT NULL,
  `ket` enum('Y','T') DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  PRIMARY KEY (`id`),
  KEY `FK_news` (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `idadmin`, `tgl`, `judul`, `isi`, `foto`, `ket`, `keyword`, `deskripsi`) VALUES
(5, '', '2014-05-15', 'Menggosok Gigi Membuat Badan Bugar', '<p style="text-align: justify;"><strong>Vemale.com</strong>&nbsp;- Bunda, apakah Anda dan keluarga selalu menggosok gigi? Perlu Anda ketahui lho, Bunda. Menggosok itu penting, selain untuk menjaga gigi dan muut tetap sehat, juga membuat badan bugar.&nbsp;Bunda, jika Anda dan keluarga tidak merawat gigi dengan baik, dampaknya tidak hanya pada kerusakan gigi saja lho. Tetapi juga mempengaruhi kesehatan badan dan kebugaran tubuh Anda.&nbsp;Tidak menggosok gigi juga mengurangi sejumlah fungsi organ dalam tubuh dan akan menyebabkan penyakit seperti diabetes sampai jantung koroner.&nbsp;Hal ini tentu saja sangat mempengaruhi kualitas kesehatan Anda. Bagaimana tidak, seperti yang dijelaskan oleh fitbodynow.com bahwa saat Anda tidak menggosok gigi Anda, plak akan mudah terbentuk disela-sela gigi. Jika sudah lama, ini akan menjadi karang gigi dan membutuhkan tindak lanjut.</p>\r\n<p style="text-align: justify;">Bunda, disarankan untuk menggosok gigi minimal dua kali sehari yaitu setelah sarapan pagi dan sebelum tidur malam. Aktifitas ini akan sangat bermanfaat jika sudah menjadi kebiasaan Anda.</p>\r\n<p style="text-align: justify;">Memang membuat suatu kebiasaan itu tidak lah muda. Tapi, Anda cukup membutuhkan 21 hari untuk membiasakan aktifitas ini.</p>\r\n<p style="text-align: justify;">Bunda, perlu Anda ketahui pula bahwa Anda akan terhindar dari penyakit yang akan menyerang mulut Anda dan tubuh Anda. Dan tentunya, Anda akan merasakan tubuh yang sangat bugar dan sehat. Karena, pada dasarnya menggosok gigi sangat bermanfaat untuk kesehatan dan kebugaran Anda.</p>', 'menggosok-gigi-membuat-badan-bugar.jpg', 'Y', 'kesehatan gigi', 'menggosok gigi'),
(6, '', '2014-05-15', 'Inilah Tips Merawat Gigi Bagi Pengguna Behel', '<p style="text-align: justify;"><strong>Vemale.com</strong>&nbsp;- Gigi yang rapi adalah salah satu dari bagian keindahan yang Anda miliki. Tidak heran jika banyak dari Anda yang rela mengeluarkan banyak yang untuk mendapatkan gigi rapi dengan cara menggunakan behel. Akan tetapi, saat menggunakan behel atau kawat gigi, Anda justru membutuhkan perawatan ekstra. Jika tidak, gigi Anda akan menjadi sarang pertumbuhan bakteri akibat sisa makanan serta plak yang menodai gigi dan tentunya dapat merusak warna gigi Anda.</p>\r\n<p style="text-align: justify;">Menurut lansiran dari&nbsp;<a href="http://meetdoctor.com/" target="_top">MeetDoctor.com</a>, salah satu cara merawat gigi adalah dengan menggunakan pasta gigi yang mengandung fluoride dan selalu menggosok gigi Anda setelah makan. Setelah menggosokpun Anda disarankan untuk melakukan pengecekan guna melihat apakah masih ada sisa makanan yang menyangkut di sela-sela gigi. Sementara untuk sikat gigi, sebaiknya Anda memilih sikat yang berbulu lembut. Anda bisa menggosok gigi Anda dengan gerakan dari atas ke bawah dan sebaliknya.</p>\r\n<p style="text-align: justify;">Kemudian mulailah menggosok gigi dengan menggunakan sikat gigi proxabrush atau sikat gigi yang berbentuk seperti pohon natal. Proxabrush didesain secara khusus guna membersihkan di antara dua kawat. Gerakkan sikat dari atas ke bawah dan dari bawah ke atas di antara kedua jalur kawat. Gerakkan beberapa kali sebelum berpindah ke area lain hingga gigi bersih. Di samping itu, jangan lupa juga untuk menggunakan obat kumur yang juga mengandung fluoride</p>\r\n<p style="text-align: justify;">Dalam penggunaan kawat gigi Anda, terkadang Anda menemukan beberapa masalah seperti karet mengendur, kawat rusak, atau jalur kawat yang berada di tempatnya yang menimbulkan ketidaknyamanan. Oleh karena itu, ketika Anda mengalaminya, Anda bisa melakukan pertolongan seperti di bawah ini.</p>\r\n<ul style="text-align: justify;">\r\n<li>Karet dan kawat lepas. Jika Anda mengalami hal ini, Anda dapat menggunakan sedikit lilin ortodontis untuk menempelkan kawat ke posisi semula untuk sementara waktu. Anda juga seharusnya menyimpan karet dan segeralah jadwalkan pemeriksaan dengan dokter gigi yang menangani.</li>\r\n<li>Kawat rusak. Gunakanlah ujung pensil yang memiliki penghapus untuk menggerakkan kawat yang mencuat ke posisi yang tidak mengganggu. Jangan mencoba memotong kawat karena adanya risiko kawat tertelan atau terhirup e paru-paru. Jika terjadi sariawan atau luka akibat kawat yang mencuat, kumur dengan air gara atau obat kumur antiseptik.</li>\r\n</ul>\r\n<p style="text-align: justify;">Nah Ladies, jangan biarkan gigi dan organ mulut Anda bermasalah karena Anda malas melakukan perawatan gigi dan mulut. Terlebih lagi gigi tersambung dengan saraf penting lainnya dan jika terjadi kerusakan pada gigi maka akan membawa masalah terhadap organ lainnya.</p>', 'inilah-tips-merawat-gigi-bagi-pengguna-behel.jpg', 'Y', 'merawat, gigi', 'tips merawat gigi'),
(7, '', '2014-05-15', '12 Cara Menjaga Kesehatan Gigi dan Mulut Secara Alami', '<p style="text-align: justify;">Inilah tips&nbsp;<strong>12 cara menjaga kesehatan gigi dan mulut secara alami</strong>. Sakit gigi terjadi karena kurang memperhatikan kesehatan gigi dan mulut, sehingga bisa menimbulakan gigi berlubang, gusi berbengkak dan berdarah serta bau mulut. Apa lagi terkena yang namanya sakit gigi sungguh merasa menggangu dan tidak menyenangkan bahkan kesenanganpun terasa hilang.&nbsp;Nah ada baiknya Anda baca artikel dibawah ini cara menjaga kesehatan gigi dan mulut agar tidak terjadi hal-hal yang tidak menyenangkan. Berikut adalah 12 cara menjaga kesehatan gigi dan mulut, yuk simak:<br /><br /><strong>1. Makanan Sehat</strong><br /><br />Makan makanan yang sehat dan seimbang. Selain karbohidrat Anda juga memerlukan tambahan nutrisi seperti vitamin dan mineral agar gigi dan gusi tetap sehat. Terutama vitamin A, vitamin C dan vitamin D<br /><br /><strong>2. Air Putih</strong><br /><br />Air putih adalah komponen utama dari air liur yang berfungsi untuk menyimpan mineral-mineral yang diperlukan gigi, sekaligus membersihkan partikel makanan yang menempel di sela-sela gigi. Air juga mengandung fluoride yang dapat membuat gusi anda tetap lembab dan memperkuat enamel gigi.<br /><strong><br />3. Waktu Makan</strong><br /><br />Berikan jeda waktu antara makan dan ngemil. Ini membantu gigi agar tidak selalu terkena asam. Karena setelah makan, asam akan terbentuk antara 20 &ndash; 40 menit.<br /><br /><strong>4. Keju dan Susu</strong><br /><strong><br /></strong><br />Dua bahan makanan ini mengandung kalsium yang kaya dan baik bagi kesehatan gigi. Kandungan vitamin D dan fosfat juga akan memperkuat gigi agar tak gampang keropos dan dapat memperbaiki komponen gigi yang rusak dengan efektif.<br /><br /><strong>5. Hindari Gula</strong><br /><br />Minuman dengan gula tambahan seperti jus, teh dan kopi akan membentuk asam pada gigi. Batasi minum minuman dengan gula tambahan. Termasuk juga memakan permen lollipop.<br /><br /><strong>6. Kesehatan Gigi Anak</strong><br /><br />Jangan membiarkan bayi terlalu lama menggunakan botol susu. Kebiasaan ngedot ini akan membuat gigi terlalu lama terkena karbohidrat sehingga merusak gigi si kecil. Gantilah isi botol susunya dengan air putih, dan biasakan ia minum susu dari gelas.<br /><br /><strong>7. Sikat Gigi</strong><br /><br />Sikatlah gigi minimal dua kali sehari. Namun, bila memungkinkan sikat gigi setelah makan akan membantu menghilangkan plak yang dapat menciptakan asam.<br /><br /><strong>8. Konsumsi Teh</strong><br /><br />Teh mengandung polifenol yang dapat menekan pertumbuhan bakteri yang menyebabkan plak pada gigi. Selain itu, teh juga dapat mencegah gigi berlubang. Untuk hasil yang lebih baik, gunakan madu sebagai pengganti gula biasa. Namun jangan berlebihan karena teh juga bisa membuat gigi menjadi kuning.<br /><br /><strong>9. Benang Gigi</strong><br /><br />Untuk permukaan gigi yang lebih sehat, Anda bisa menggunakan benang gigi setiap sekali atau dua kali sehari.<br /><br /><strong>10. Berhentilah merokok</strong><br /><br />Tembakau akan meningkatkan resiko kerusakan gigi dan bahkan gangguan mulut lainnya.<br /><br /><strong>11. Kacang-kacangan</strong><br /><br />Kacang-kacangan terbukti mengandung kalsium dan vitamin D serta mineral yang tinggi. Ketiga komponen ini amat baik bagi gigi. Namun mengunyah kacang terlalu sering, apalagi kacang-kacangan yang keras, dapat merusak enamel gigi. Jadi tetaplah berhati-hati saat mengunyah kacang.<br /><br /><strong>12. Lakukan Pemeriksaan</strong><br /><br />Setiap 6 bulan sekali datanglah ke dokter gigi untuk pemeriksaan dan perawatan gigi Anda.<br /><br />Nah itulah sahabat sehat&nbsp;<span style="text-decoration: underline;">12 cara menjaga kesehatan gigi dan mulut secara alami</span>. Artikel diatas yang mungkin dapat membantu anda untuk menjaga kesehatan gigi dan mulut. Semoga cara diatas bisa membantu dan bermanfaat untuk Anda.</p>', 'gigi sehat.jpg', 'Y', 'kesehatan, gigi', 'menjaga kesehatan gigi dan mulut');

-- --------------------------------------------------------

--
-- Table structure for table `buku_tamu`
--

CREATE TABLE IF NOT EXISTS `buku_tamu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `isi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `buku_tamu`
--

INSERT INTO `buku_tamu` (`id`, `nama`, `email`, `isi`) VALUES
(1, 'Fery', 'f3rypurn4m4@gmail.com', 'Terima kasih atas bantuannya'),
(3, 'Niken', 'niken@gmail.com', 'Terima Kasih');

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE IF NOT EXISTS `gejala` (
  `kd_gejala` char(4) NOT NULL DEFAULT '',
  `nm_gejala` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kd_gejala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kd_gejala`, `nm_gejala`) VALUES
('G004', 'Bercak putih berlendir pada mulut'),
('G003', 'Bercak kecoklatan mendatar pada bibir'),
('G002', 'Benjolan putih pada bagian dalam bibir'),
('G001', 'Bau mulut tak sedap'),
('G005', 'Bercak putih pada lidah'),
('G006', 'Bercak putih pada rongga mulut'),
('G007', 'Bibir kemerahan'),
('G008', 'Bibir pecah-pecah'),
('G009', 'Bibir teras kering dan keras'),
('G010', 'Bibir terasa panas seperti terbakar'),
('G011', 'Bintik putih pada gigi'),
('G012', 'Bintik-bintik merah bersisik pada daerah mulut'),
('G013', 'Demam'),
('G014', 'Dentin terlihat'),
('G015', 'Disertai rasa gatal'),
('G016', 'Disertai sakit kepala'),
('G017', 'Gigi berlubang'),
('G018', 'Gigi keluar darah'),
('G019', 'Gigi nyeri saat terkena rangsangan (panas atau dingin)'),
('G020', 'Nyeri pada TMJ (Sendi Temporo Mandibuler)'),
('G021', 'Gusi bengkak'),
('G022', 'Gusi licin dan mengkilap'),
('G023', 'Gusi merah muda'),
('G024', 'Gusi mudah berdarah'),
('G025', 'Inferksi pada kelenjar lidah'),
('G026', 'Kemerahan pada sudut-sudut mulut'),
('G027', 'Lubang sangat besar pada gigi'),
('G028', 'Luka mudah berdarah'),
('G029', 'Luka terbuka berwarna biru keputihan'),
('G030', 'Luka terbuka pada lidah'),
('G031', 'Muncul benjolan kemerahan pada lubang gigi'),
('G032', 'Nanah pada pangkal gusi'),
('G033', 'Nyeri pada kelenjar ludah'),
('G034', 'Nyeri pada otot pengunyah'),
('G035', 'Nyeri saat berbaring'),
('G036', 'Nyeri saat gigi tertekan makanan'),
('G037', 'Nyeri saat mengunyah'),
('G038', 'Pembengkakan kelenjar getah bening'),
('G039', 'Pembengkakan pada kelenjar ludah'),
('G040', 'Pembusukan pada gigi'),
('G041', 'Pulpa mati rasa'),
('G042', 'Pulpa terinfeksi'),
('G043', 'Resesi Gusi'),
('G044', 'Sakit berdenyut tanpa rangsangan'),
('G045', 'Sudut mulut terasa nyeri'),
('G046', 'Sudut-sudut mulut bersisik'),
('G047', 'Terasa perih saat makan dan minum'),
('G048', 'Terbentuk kantong antara gigi dan gusi'),
('G049', 'Terdapat benjolan ungu dengan pinggiran bersiku pada daerah mulut'),
('G050', 'Terdapat endapan plak'),
('G051', 'Terdapat ulkus (luka) pada mukosa mulut'),
('G052', 'Terjadi daerah kemerahan pada mulut'),
('G053', 'Ulkus (luka) pada sudut mulut'),
('G054', 'Vesikel (gelembung) pada mukosa mulut'),
('G055', 'Terdapat karang gigi'),
('G056', 'Perkembangan penyakit cepat (bulanan)'),
('G057', 'Ruang pulpa terbuka'),
('G058', 'Luka atau benjolan yang muncul berulang');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE IF NOT EXISTS `rule` (
  `kd_solusi` char(4) NOT NULL,
  `kd_gejala` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`kd_solusi`, `kd_gejala`) VALUES
('P003', 'G008'),
('P003', 'G007'),
('P002', 'G001'),
('P001', 'G037'),
('P001', 'G032'),
('P001', 'G050'),
('P001', 'G055'),
('P001', 'G048'),
('P001', 'G043'),
('P001', 'G038'),
('P001', 'G024'),
('P001', 'G023'),
('P001', 'G022'),
('P001', 'G021'),
('P001', 'G013'),
('P001', 'G001'),
('P003', 'G009'),
('P003', 'G026'),
('P003', 'G045'),
('P003', 'G046'),
('P003', 'G053'),
('P004', 'G003'),
('P004', 'G007'),
('P004', 'G008'),
('P004', 'G009'),
('P004', 'G010'),
('P004', 'G013'),
('P005', 'G021'),
('P005', 'G022'),
('P005', 'G023'),
('P005', 'G024'),
('P005', 'G050'),
('P005', 'G055'),
('P006', 'G013'),
('P006', 'G021'),
('P006', 'G024'),
('P006', 'G038'),
('P006', 'G047'),
('P006', 'G051'),
('P006', 'G052'),
('P006', 'G054'),
('P007', 'G001'),
('P007', 'G024'),
('P007', 'G050'),
('P007', 'G055'),
('P008', 'G001'),
('P008', 'G005'),
('P008', 'G006'),
('P008', 'G047'),
('P008', 'G051'),
('P009', 'G002'),
('P009', 'G003'),
('P009', 'G004'),
('P009', 'G008'),
('P009', 'G028'),
('P009', 'G030'),
('P009', 'G052'),
('P009', 'G056'),
('P009', 'G058'),
('P010', 'G014'),
('P010', 'G017'),
('P010', 'G019'),
('P011', 'G014'),
('P011', 'G017'),
('P011', 'G019'),
('P011', 'G042'),
('P011', 'G044'),
('P012', 'G011'),
('P012', 'G017'),
('P013', 'G016'),
('P013', 'G020'),
('P013', 'G034'),
('P014', 'G012'),
('P014', 'G015'),
('P014', 'G029'),
('P014', 'G049'),
('P014', 'G058'),
('P015', 'G025'),
('P015', 'G033'),
('P015', 'G039'),
('P016', 'G017'),
('P016', 'G027'),
('P016', 'G040'),
('P016', 'G041'),
('P016', 'G057'),
('P017', 'G001'),
('P017', 'G021'),
('P017', 'G022'),
('P017', 'G023'),
('P017', 'G024'),
('P017', 'G043'),
('P017', 'G048'),
('P017', 'G050'),
('P017', 'G055'),
('P018', 'G017'),
('P018', 'G018'),
('P018', 'G019'),
('P018', 'G027'),
('P018', 'G035'),
('P018', 'G042'),
('P018', 'G044'),
('P019', 'G018'),
('P019', 'G027'),
('P019', 'G031'),
('P019', 'G035'),
('P019', 'G036'),
('P019', 'G037'),
('P019', 'G042'),
('P019', 'G057'),
('P020', 'G007'),
('P020', 'G013'),
('P020', 'G015'),
('P020', 'G028'),
('P020', 'G030'),
('P020', 'G047'),
('P020', 'G051');

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE IF NOT EXISTS `solusi` (
  `kd_solusi` char(4) NOT NULL,
  `nm_solusi` varchar(300) NOT NULL,
  `solusi` text NOT NULL,
  `definisi` text NOT NULL,
  PRIMARY KEY (`kd_solusi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`kd_solusi`, `nm_solusi`, `solusi`, `definisi`) VALUES
('P001', 'Abses Periodontal', '<p>Melakukan Scalling, root planing, curattage atau bedah flap yang disesuaikan dengan tingkat keparahannya</p>', '<p>Radang yang terlokalisasi dimana salah satu manifestasinya dalam bentuk nanah pada jaringan pendukung gigi</p>'),
('P002', 'Bau mulut', '<p>Menghilangkan faktor etiologi bisa juga menggunakan mouthwash</p>', '<p>Bau tak sedap pada rongga mulut</p>'),
('P003', 'Cheilitis', '<p>Memberikan pelembab pada bibir, menambah asupan vitamin, memberikan obat antibiotik/minosep, meningkatkan asupan air</p>', '<p>Peradangan yang terjadi pada bibir, umumnya ada pada sudut-sudut bibir</p>'),
('P004', 'Eritema Multiformis', '<p>pemberian obat-obat immunomodulasi , kortikosteroid sistemis dosis rendah dan atau azatropin Kumur-kumur paliatif topikal</p>', '<p>suatu penyakit kulit dan membran mulkosa yang terrbatas. Umumnya terjadi pada pria dewasa muda tapi bisa juga pada anak-anak. umumnya penyebab tidak diketahui, mungkin berupa reaksi terhadap mikroorganisme atau obat</p>'),
('P005', 'Gingivitis', '<p>Melakukan scalling dan meningkatkan DHE</p>', '<p>Radang gigi</p>'),
('P006', 'Herpes Simpleks (Primary herpetic Gingivostomatitis)', '<p>Pemberian antivirus, Perbaikan nutrisi tubuh, dan pemberian obat anti nyeri, istrahat yang cukup.</p>', '<p>Gelembung yang merupakan infeksi virus HSV (Herpes Simpleks Virus) pada bagian sudut.</p>'),
('P007', 'Kalkulus', '<p>Melakukan scalling, root planing, curattage atau bedah flap yang disesuaikan dengan tingkat keparahannya.</p>', '<p>Karang Gigi</p>'),
('P008', 'Kandidiasis', '<p>Pembersihan jamur pada daerah yang terserang, pemberian obat anti jamur, dan peningkatan DHE.</p>', '<p>Infeksi jamur (Candida Albicans) pada rongga mulut yang disebabkan ketidakseimbangan flora normal pada mulut.</p>'),
('P009', 'Kanker', '<p>Pemberian obat anti kanker atau kemoterapi, atau radioterapi, peningkatan DHE.</p>', '<p>Pertumbuhan sel yang tidak terkendali dan bersifat ganas.</p>'),
('P010', 'Karies Media', '<p>Restorasi</p>', '<p>Gigi berlubang yang baru mengenai lapisan dentin.</p>'),
('P011', 'karies Profunda', '<p>Restorasi, pembersihan dan sterilisasi saluran akar.</p>', '<p>Gigi berlubang yang sudah mengenai jaringan pulpa.</p>'),
('P012', 'Karies Superfisial', '<p>Restorasi</p>', '<p>Gigi berlubang yang hanya sampai la[isan terluar atau email.</p>'),
('P013', 'Kelainan Sendi Temporomandibuler', '<p>Perbaikan Oklusi Gigi, tindakan pembedahan jika parah.</p>', '<p>Kelainan pada otot atau sendi disekitar temporo mandibular joint.</p>'),
('P014', 'Linken Planus', '<p>Pemberian krim atau salep betametason valerat 0,1%, dirawat dengan steroid dan immunosupresan topikal atau sistemik.</p>', '<p>Penyakit gatal yang kambuhan, dimulai sebagai ruam dari benjolan kecil yang menyebar, yang kemudian menyatu membentuk plak yang bersisik dan kasar.</p>'),
('P015', 'Masalah Kelenjar ludah', '<p>Pemberian antibiotik atau antivirus sesuai faktor penyebabnya, pembedahan.</p>', '<p>Pembengkakan pada saluran kelenjar ludah.</p>'),
('P016', 'Nekrosis Pulpa', '<p>Perawatan saluran akar (PSA / Endodontic treatment) atau pencabutan gigi.</p>', '<p>Kematian jaringan pulpa akibat peradangan pada pulpa yang berlangsung kronis.</p>'),
('P017', 'Periodontitis', '<p>Melakukan scalling, root planing, curattage atau bedah flap yang disesuaikan dengan tingkat keparahannya, serta pemberian antibiotik jika sudah parah.</p>', '<p>Peradangan gusi yang sudah menyebar ke daerah penyangga gigi.</p>'),
('P018', 'Pulpitis Akut', '<p>Dipulpotomi (pemotongan pulpa), restorasi, pemberishan dan sterilisasi saluran kar serta pemberian obat pereda nyeri.</p>', '<p>Radang pada jaringan pulpa yang tidak parah, jika penyebab peradangan telah dihilangkan maka pulpa akan pulih seperti semula.</p>'),
('P019', 'Pulpitis Kronis', '<p>Dipulpotomi (pemotongan pulpa), Restorasi dan pemberian obat pereda nyeri, devitalisasi (syaraf dimatikan) dan dilakukan perawatan saluran akar (PSA / endodontic treatment).</p>', '<p>Peradangan parah pada pulpa yang tidak akan pulih kembali sekalipun penyebabnya dihilangkan, labat laun akan menyebabkan kematian jaringan.</p>'),
('P020', 'Sariawan', '<p>Penigkatan asupan nutrisi, vitamin dan air, pemberian minosep, meminimalisir faktor pencetus (predisposisi).</p>', '<p>Peradangan pada jaringan mukosa mulut</p>'),
('P021', 'Mohon Maaf, System tidak dapat mendiagnosis penyakit anda. Silahkan kirim pesan atau gejala anda.', '<p>-</p>', '<p>-</p>');

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('127.0.0.2', '2009-09-11', 1, '1252681630'),
('::1', '2014-12-09', 10, '1418156879'),
('::1', '2014-07-08', 1, '1404811988'),
('::1', '2014-07-04', 2, '1404441411'),
('::1', '2014-06-17', 4, '1402973989'),
('::1', '2014-06-13', 7, '1402651504'),
('127.0.0.1', '2010-04-16', 11, '1271389426'),
('::1', '2014-06-10', 90, '1402399216');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_analisa`
--

CREATE TABLE IF NOT EXISTS `tmp_analisa` (
  `noip` varchar(60) NOT NULL DEFAULT '',
  `kd_solusi` char(4) NOT NULL DEFAULT '',
  `kd_gejala` char(4) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_analisa`
--

INSERT INTO `tmp_analisa` (`noip`, `kd_solusi`, `kd_gejala`, `status`) VALUES
('::1', 'P008', 'G047', 'N'),
('::1', 'P008', 'G051', 'N'),
('::1', 'P008', 'G006', 'N'),
('::1', 'P008', 'G005', 'N'),
('::1', 'P008', 'G001', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_gejala`
--

CREATE TABLE IF NOT EXISTS `tmp_gejala` (
  `kd_gejala` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_gejala`
--

INSERT INTO `tmp_gejala` (`kd_gejala`, `noip`) VALUES
('G005', '::1'),
('G001', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pasien`
--

CREATE TABLE IF NOT EXISTS `tmp_pasien` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=151 ;

--
-- Dumping data for table `tmp_pasien`
--

INSERT INTO `tmp_pasien` (`id`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `noip`, `tanggal`) VALUES
(0150, 'aaaa', 'P', 'Jambi', 'Swasta', '::1', '2014-12-10 03:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_solusi`
--

CREATE TABLE IF NOT EXISTS `tmp_solusi` (
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_solusi`
--

INSERT INTO `tmp_solusi` (`kd_solusi`, `noip`) VALUES
('P008', '::1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
