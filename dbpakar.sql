/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.1.19-MariaDB : Database - dbpakar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbpakar` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbpakar`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nmuser` varchar(25) DEFAULT NULL,
  `nmlogin` varbinary(25) DEFAULT NULL,
  `pslogin` varchar(55) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`nmuser`,`nmlogin`,`pslogin`,`level`) values 
(3,'Muarti Novi','user','6ad14ba9986e3615423dfca256d04e3f',NULL),
(2,'Administrator','admin','0192023a7bbd73250516f069df18b500',1);

/*Table structure for table `analisa_hasil` */

DROP TABLE IF EXISTS `analisa_hasil`;

CREATE TABLE `analisa_hasil` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Data for the table `analisa_hasil` */

insert  into `analisa_hasil`(`id`,`nama`,`kelamin`,`alamat`,`pekerjaan`,`kd_solusi`,`noip`,`tanggal`) values 
(0116,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-02 10:40:14'),
(0117,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-02 10:40:50'),
(0118,'novi','W','tawangsari','pegawai bank','P001','::1','2021-01-02 12:11:17'),
(0119,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-02 12:52:22'),
(0120,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 00:40:09'),
(0121,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 15:03:12'),
(0122,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 15:08:16'),
(0123,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 15:21:06'),
(0124,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 15:31:18'),
(0125,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 15:44:31'),
(0126,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-09 19:33:43'),
(0127,'akbar','P','kepo','kepo','P003','::1','2021-01-09 21:15:57'),
(0128,'akbar','P','kepo','kepo','P005','::1','2021-01-09 22:44:52'),
(0129,'akbar','P','kepo','kepo','P002','::1','2021-01-09 22:45:56'),
(0130,'akbar','P','kepo','kepo','P001','::1','2021-01-09 22:59:28'),
(0131,'akbar','P','kepo','kepo','P013','::1','2021-01-10 15:58:21'),
(0132,'akbar','P','kepo','kepo','P012','::1','2021-01-10 15:59:54'),
(0133,'novi','W','tawangsari','pegawai bank','P003','::1','2021-01-10 16:16:41'),
(0134,'novi','W','tawangsari','mama cantik','P006','::1','2021-01-10 16:17:06'),
(0135,'novi','W','tawangsari','mama cantik','P004','::1','2021-01-10 16:19:58'),
(0136,'novi','W','tawangsari','mama cantik','P004','::1','2021-01-10 16:19:58'),
(0137,'akbar','P','kepo','kepo','P003','::1','2021-01-12 23:13:40'),
(0138,'akbar','P','kepo','kepo','P003','::1','2021-01-12 23:13:40'),
(0139,'akbar','P','kepo','kepo','P002','::1','2021-01-13 14:15:43');

/*Table structure for table `artikel` */

DROP TABLE IF EXISTS `artikel`;

CREATE TABLE `artikel` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `artikel` */

insert  into `artikel`(`id`,`idadmin`,`tgl`,`judul`,`isi`,`foto`,`ket`,`keyword`,`deskripsi`) values 
(1,'','2021-01-01','Mandiri traveloka','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Traveloka</strong> - Kini transaksi dimana pun selalu #DapatRewardLebih. Berikut adalah fitur-fitur dari mandiri traveloka:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Dapatkan 2x Traveloka Poin setiap pembelian Flight dan Hotel, diskon 10% setiap hari di Traveloka Xperience & Asuransi Mobil, dapatkan 1 Traveloka Poin setiap transaksi kelipatan Rp8.000 di semua merchant baik online maupun offline dan pertanggungan asuransi bebas premi dengan maksimal pertanggungan sampai dengan Rp 1 Miliar.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Berlaku untuk nilai transaksi di bawah Rp 1 juta, sedangkan pembelanjaan dengan nilai transaksi lebih besar dari Rp 1 juta tetap diperlukan otorisasi melalui PIN atau tanda tangan, gratis 1 tahun tanpa syarat apapun.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Penghasilan minimal Rp. 5 juta.</p>','mandiritraveloka.png','Y','mandiri, traveloka','Mandiri Traveloka'),
(2,'','2021-01-01','Mandiri Gold','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Gold</strong> - Jangan takut gak bisa exist, semua bisa dicicil. Gunakan Mandiri Gold di setiap transaksi. Berikut adalah fitur-fitur dari mandiri gold:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Bayar semua tagihan rutin dalam 1 kali pembayaran, cairkan limit Mandiri Gold untuk berbagai keinginan kamu yang tidak terbatas, Beli apapun, dimanapun, gak perlu pusing bayar tagihan, dan ubah transaksimu menjadi cicilan.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Dapatkan informasi tagihan yang lebih praktis dan mudah melalui e-mail.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Penghasilan minimal Rp. 3 juta.</p>','mandirigold.png','Y','mandiri, gold','Mandiri Gold'),
(3,'','2021-01-01','Everyday Card','<p style=\"text-align: justify;\">&nbsp;<strong>Everyday Card</strong> - Kartu pertama anda, pilih desain kartu yang sesuai dengan kepribadian anda. Berikut adalah fitur-fitur dari everyday card:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br/> nikmati kenyamanan dalam melakukan transaksi online dengan adanya fitur 3D secure yang memungkinkan Anda menerima PIN transaksi melalui SMS di website yang berlogo verified by VISA / Verified by MasterCard, ubah transaksi Anda menjadi cicilan tetap dengan bunga ringan hingga 1% per bulannya, dapatkan dana tunai dan kemudahan pembayaran melalui cicilan tetap hingga 12 bulan dengan bunga ringan.<br /><strong><br />3. Fitur Lain</strong><br /><br />-<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Penghasilan minimal Rp. 3 juta.</p>','everydaycard.png','Y','everyday, card','Everyday Card'),
(4,'','2021-01-01','Mandiri SKYZ','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri SKYZ</strong> - Mau liburan gak pake drama?\r\nGunakan Mandiri SKYZ, makin banyak surprize-nya, makin seru traveling-nya. Berikut adalah fitur-fitur dari mandiri skyz:<br /><br /><strong>1. Bonus</strong><br /><br />Cashback senilai Rp. 200 ribu.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br />2x fiestapoin, kemudahan pembayaran tagihan melalui ATM semua bank, Mandiri Online, Cabang, SMS Banking, Direct debit, dan menu transfer bank lain, dan dapat mengubah transaksi menjadi cicilan.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Belanja tak perlu khawatir hilang atau rusak dengan perlindungan hingga Rp 50 juta dengan pembelian menggunakan Mandiri SKYZ baik diluar maupun di dalam negeri, perlindungan bebas premi hingga Rp 1 Milyar setiap pembelian tiket perjalanan apapun.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 5 juta.</p>\r\n','mandiriskyz.png','Y','mandiri, skyz','Mandiri SKYZ'),
(5,'','2021-01-01','Mandiri Co Brand Hypermart','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Co Brand Hypermart</strong> - Lebih hemat dalam belanja groceries serta kebutuhan elektronik dan produk rumah tangga. Gunakan Mandiri Hypermart untuk setiap kebutuhan rumah tangga sehari-hari. Kartu ini telah dilengkapi teknologi Contactless. Nikmati berbagai benefitnya di merchant favoritmu. Berikut adalah fitur-fitur dari mandiri Co Brand Hypermart:<br/><br /><br /><strong>1. Bonus</strong><br /><br />Cashback senilai Rp. 200 ribu.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Cicilan 0% sampai 3 bulan untuk seluruh produk dan 12 bulan khusus produk elektronik, program GWP Bonus produk setiap hari untuk Visa Contacles dengan cara Tap.<br /><strong><br />3. Fitur Lain</strong><br /><br />-<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 5 juta.</p>','mandiricobrandhypermart.png','Y',NULL,'Mandiri Co Brand Hypermart'),
(6,'','2021-01-01','Mandiri Co Brand Pertamina','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Co Brand Pertamina</strong> - Kartu kredit yang dipersembahkan khusus untuk nasabah yang memiliki gaya hidup & peduli dengan kenyamanan berkendaraan menggunakan mobil serta kebutuhan terkait automotives. Berikut adalah fitur-fitur dari mandiri co brand pertamina:<br/><br /><br/><br /><strong>1. Bonus</strong><br /><br /> Cashback senilai Rp200 ribu setelah bertransaksi pertama kali.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br />2x fiestapoin Transaksi di SPBU Pertamina, no Surcharge di SPBU, dan pemegang kartu berhak atas perlindungan asuransi maksimal sebesar Rp 1 miliar dan mendapatkan fasilitas derek dan asistensi darurat kendaraan 24 jam.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Mendapatkan fasilitas lounge bandara jika penerbangan Anda ditunda, bantuan 24 jam untuk keperluan darurat. Hubungi Mastercard Service Representative Global bebas pulsa di 001-803-1-887-0623, komplemen satu botol wine untuk makan malam, dan memberikan pengalaman tidak ternilai di berbagai aspek: olahraga, hiburan, music, travel, seni & budaya, kuliner, filantropi, dan shopping.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 5 juta</p>','mandiricobrandpertamina.png','Y','mandiri, cobrand, pertamina','Mandiri Co Brand Pertamina'),
(7,'','2021-01-01','Mandiri Golf Signature','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Golf Signature</strong> - Kartu khusus bagi penggemar golf, gabungkan kemudahan hobi golf Anda dengan benefit travelling serta shopping. Berikut adalah fitur-fitur dari mandiri golf signature:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Diskon Lapangan & Merchant Golf hingga 50%, 3x fiestapoin, Mandiri Golf Tournament Series.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Gratis menikmati fasilitas Airport Lounge di berbagai bandara di Indonesia, layanan emergency medical evacuation yang sewaktu-waktu dibutuhkan di luar negeri dengan menghubungi Mandiri Visa Signature Call di 6221-5299-7765, mendapatkan akses ke lapangan golf terbaik dunia dengan layanan Visa Concierge melalui www.visasignatureconcierge.com atau telepon ke toll free number 001 803 441 242, akses pemesanan fasilitas private jet dengan menghubungi Mandiri Travel Center di 6221-526 8480 (hanya bisa dihubungi pada saat jam kerja, dan pemesanan dilakukan 1 minggu sebelum keberangkatan), pertanggungan asuransi bebas premi dengan maksimal pertanggungan sampai dengan Rp. 5 Miliar. Untuk syarat dan ketentuan lebih lengkap dan layanan telepon khusus untuk pemegang kartu Mandiri Visa Signature di 6221-5299-7765 yang dapat dihubungi kapanpun 24 jam / 7 hari seminggu, termasuk hari libur.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 20 juta.</p>','mandirigolfsignature.png','Y','mandiri, golf, signature','Mandiri Golf Signature'),
(8,'','2021-01-01','Mandiri Golf Gold','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Golf Gold</strong> - Satu-satunya kartu yang memberikan kesempatan untuk membuktikan performa Anda bermain golf di ajang mandiri golf tournament series. Berikut adalah fitur-fitur dari mandiri golf gold:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Diskon Lapangan & Merchant Golf hingga 50%, Mandiri Golf Tournament Series.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Program Golf Travelling Special price dengan fasilitas cicilan dengan atau tanpa bunga.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 5 juta.</p>','mandirigolfgold.png','Y','mandiri, golf, gold','Mandiri Golf Gold'),
(9,'','2021-01-01','Mandiri Golf Platinum','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Golf Platinum</strong> - Satu-satunya kartu yang memberikan kesempatan untuk membuktikan performa Anda bermain golf di ajang mandiri golf tournament series. Berikut adalah fitur-fitur dari mandiri golf platinum:<br /><br /><strong>1. Bonus</strong><br /><br />-<br /><br /><strong>2. Manfaat Spesial</strong><br /><br /> Diskon Lapangan & Merchant Golf hingga 50%, 2x fiestapoin, Mandiri Golf Tournament Series. <br /><strong><br />3. Fitur Lain</strong><br /><br /> Program Golf Travelling Special price dengan fasilitas cicilan dengan atau tanpa bunga, perlindungan barang yang dibeli baik di dalam maupun di luar negeri, pemegang kartu akan mendapat asuransi perjalanan bebas premi dengan nilai perlindungan hingga Rp5 Miliar untuk setiap pembelian tiket perjalanan menggunakan Mandiri Golf Platinum, pemegang kartu untuk melindungi dari keterlambatan pesawat, ketidaknyamanan missed connection ataupun kehilangan bagasi,dan layanan international concierge dari Visa yang dapat diakses melalui www.visasignatureconcierge.com atau melalui telepon ke toll free 001 803 441 568 (bahasa Inggris) dan 001 803 441 242 (bahasa melayu).<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 10 juta.</p>','mandirigolfplatinum.png','Y','mandiri, golf, platinum','Mandiri Golf Platinum'),
(10,'','2021-01-01','Mandiri Platinum','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Golf Gold</strong> - Berbagi momen bersama orang tersayang menjadi lebih mudah. Gunakan Mandiri Platinum untuk semua kebutuhan Anda dan keluarga. Kartu ini telah dilengkapi teknologi Contactless. Nikmati berbagai benefitnya di merchant favoritmu. Berikut adalah fitur-fitur dari mandiri platinum:<br/><br /><br /><strong><br/>1. Bonus</strong><br /><br />Cashback senilai Rp. 300 ribu.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br/> 2x fiestapoin, cicilan ringan dan bayar tagihan Mandiri Kartu Kredit melalui ATM semua bank, Mandiri Online, Cabang, SMS Banking, Direct debit, dan menu transfer bank lain. <br /><strong><br />3. Fitur Lain</strong><br /><br /> Kini Anda dapat membayar semua tagihan rutin dalam 1 kali pembayaran. Daftarkan tagihan rutin Anda seperti PLN, Telkom, Pascabayar Seluler, dan TV kabel, belanja tak perlu khawatir hilang atau rusak dengan perlindungan hingga Rp 100 juta (per kejadian) dan Rp 60 juta (per item) dengan pembelian menggunakan Mandiri Platinum baik di luar maupun di dalam negeri, dan perlindungan bebas premi hingga Rp 5 milyar setiap pembelian tiket perjalanan apapun dengan Mandiri Platinum.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Penghasilan minimal Rp. 10 juta.</p>','mandiriplatinum.png','Y','mandiri, platinum','Mandiri Platinum'),
(11,'','2021-01-01','Mandiri Signature','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Signature</strong> - Selalu setia mendukung kebutuhan lifestyle Anda dan keluarga. Gunakan Mandiri Signature untuk setiap kebutuhan traveling dan shopping Anda. Berikut adalah fitur-fitur dari mandiri signature:<br /><br /><strong>1. Bonus</strong><br /><br />Cashback senilai Rp. 300 ribu.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br />3x fiestapoin, mendapat kenyamanan saat menunggu penerbangan dengan bebas akses Lounge & Airport Merchant, terbang gratis lebih cepat.<br /><strong><br />3. Fitur Lain</strong><br /><br />Layanan emergency medical evacuation yang sewaktu-waktu dibutuhkan di luar negeri dengan menghubungi Mandiri Visa Signature Call di 6221-5299-7765, mendapatkan kartu keanggotaan Priority Pass yang bisa mengakses Priority Pass lounge di lebih dari 100 negara dengan menghubungi Mandiri Visa Signature Call Center di 6221-5299-7765 atau Mandiri Call 14000.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />Usia minimal 21 tahun, Penghasilan minimal Rp. 20 juta.</p>','mandirisignature.png','Y','mandiri, signature','Mandiri Signature'),
(12,'','2021-01-01','Mandiri Precious','<p style=\"text-align: justify;\">&nbsp;<strong>Mandiri Precious</strong> - Ikutin trend fashion, travel dan kuliner hits biar makin kekinian. Gunakan Mandiri Precious untuk kebutuhan traveling dan transaksi online. Berikut adalah fitur-fitur dari mandiri precious:<br /><br /><strong>1. Bonus</strong><br /><br />Cashback senilai Rp. 750 ribu.<br /><br /><strong>2. Manfaat Spesial</strong><br /><br />3x fiestapoin untuk transaksi diluar negeri, mendapat kenyaman saat menunggu penerbangan dengan bebas akses ke Airport Lounge & Merchant.<br /><strong><br />3. Fitur Lain</strong><br /><br /> Perlindungan bebas premi hingga Rp 1 Milyar setiap pembelian tiket perjalanan apapun dengan Mandiri Precious.<br /><br /><strong>4. Biaya dan Bunga</strong><br /><br />belum tau apa.<br /><br /><strong>5. Syarat Pengajuan</strong><br /><br />-</p>','mandiriprecious.gif','Y','mandiri, precious','Mandiri Precious');

/*Table structure for table `buku_tamu` */

DROP TABLE IF EXISTS `buku_tamu`;

CREATE TABLE `buku_tamu` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `isi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `buku_tamu` */

insert  into `buku_tamu`(`id`,`nama`,`email`,`isi`) values 
(1,'Fery','f3rypurn4m4@gmail.com','Terima kasih atas bantuannya'),
(3,'Niken','niken@gmail.com','Terima Kasih');

/*Table structure for table `gejala` */

DROP TABLE IF EXISTS `gejala`;

CREATE TABLE `gejala` (
  `kd_gejala` char(4) NOT NULL DEFAULT '',
  `nm_gejala` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kd_gejala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `gejala` */

insert  into `gejala`(`kd_gejala`,`nm_gejala`) values 
('G001','Penghasilan anda min. Rp20.000.000,00'),
('G002','Penghasilan anda min. Rp10.000.000,00'),
('G003','Penghasilan anda min. Rp5.000.000,00'),
('G005','Anda senang jalan-jalan'),
('G006','Anda senang menghabiskan waktu dengan keluarga'),
('G007','Anda senang berkumpul dengan teman-teman'),
('G008','Anda suka penawaran yang menarik di supermarket'),
('G009','Anda suka promo di lapangan golf'),
('G010','Anda tertarik dengan otomotif'),
('G004','Penghasilan anda min. Rp3.000.000,00'),
('G011','Anda tertarik dengan kegiatan luar ruangan'),
('G012','Anda tertarik dengan promo nilai tukar kurs yang rendah'),
('G013','Anda tertarik dengan promo diskon di berbagai tempat'),
('G014','Anda tertarik dengan promo cicilan');

/*Table structure for table `rule` */

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `kd_solusi` char(4) NOT NULL,
  `kd_gejala` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `rule` */

insert  into `rule`(`kd_solusi`,`kd_gejala`) values 
('P009','G007'),
('P008','G002'),
('P008','G014'),
('P008','G007'),
('P008','G005'),
('P007','G002'),
('P007','G009'),
('P007','G005'),
('P006','G003'),
('P006','G009'),
('P006','G005'),
('P005','G001'),
('P004','G002'),
('P004','G010'),
('P004','G006'),
('P004','G005'),
('P003','G004'),
('P003','G006'),
('P002','G001'),
('P002','G006'),
('P002','G005'),
('P001','G003'),
('P001','G012'),
('P001','G006'),
('P001','G005'),
('P009','G014'),
('P009','G004'),
('P010','G007'),
('P010','G014'),
('P010','G004'),
('P011','G006'),
('P011','G012'),
('P011','G008'),
('P011','G003'),
('P012','G005'),
('P012','G006'),
('P012','G003'),
('P003','G005'),
('P001','G005'),
('P001','G011'),
('P002','G011'),
('P003','G011'),
('P004','G011'),
('P008','G011'),
('P009','G011'),
('P010','G011'),
('P012','G011'),
('P011','G005'),
('P002','G012'),
('P003','G012'),
('P012','G012');

/*Table structure for table `solusi` */

DROP TABLE IF EXISTS `solusi`;

CREATE TABLE `solusi` (
  `kd_solusi` char(4) NOT NULL,
  `nm_solusi` varchar(300) NOT NULL,
  `solusi` varchar(100) NOT NULL,
  `bonus` text NOT NULL,
  `manfaat` text NOT NULL,
  `fiturlain` text NOT NULL,
  `biayadanbunga` text NOT NULL,
  `syaratpengajuan` text NOT NULL,
  PRIMARY KEY (`kd_solusi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `solusi` */

insert  into `solusi`(`kd_solusi`,`nm_solusi`,`solusi`,`bonus`,`manfaat`,`fiturlain`,`biayadanbunga`,`syaratpengajuan`) values 
('P001','Mandiri SKYZ','mandiriskyz.png','<p>Cashback senilai Rp200.000,00.</p>','<p>2x Fiestapoin.</br>\r\nKemudahan pembayaran tagihan melalui ATM semua bank, Mandiri Online, Cabang, SMS Banking, Direct debit, dan menu transfer bank lain.\r\n</p>','<p>Belanja tak perlu khawatir hilang atau rusak dengan perlindungan hingga Rp 50 juta dengan pembelian menggunakan Mandiri SKYZ baik diluar maupun di dalam negeri.</br>\r\nPerlindungan bebas premi hingga Rp 1 Milyar setiap pembelian tiket perjalanan apapun.\r\n</p>','<p>Rp300.000,00 </br>\r\n2%</p>','<p>Minimal 21 tahun</br>\r\nPenghasilan minimal Rp5.000.000,00.</p>'),
('P002','Mandiri Signature','mandirisignature.png','<p>Cashback senilai Rp300.000,00.</p>','<p>3x Fiestapoin.</br>\r\nMendapat kenyamanan saat menunggu penerbangan dengan bebas akses Lounge & Airport Merchant.</br>\r\nTerbang gratis lebih cepat.\r\n</p>','<p>Layanan emergency medical evacuation yang sewaktu-waktu dibutuhkan di luar negeri dengan menghubungi Mandiri Visa Signature Call di 6221-5299-7765.</br>\r\nDapatkan kartu keanggotaan Priority Pass yang bisa mengakses Priority Pass lounge di lebih dari 100 negara dengan menghubungi Mandiri Visa Signature Call Center di 6221-5299-7765 atau Mandiri Call 14000.\r\n</p>','<p>Rp900.000,00</br>\r\n2%</p>\r\n','<p>Usia minimal 21 tahun.</br>\r\nPenghasilan minimal Rp20.000.000,00.</p>'),
('P003','Mandiri Precious','mandiriprecious.gif','<p>Cashback senilai Rp750.000,00.</p>','<p>3x Fiestapoin untuk transaksi diluar negeri.</br>\r\nMendapat kenyaman saat menunggu penerbangan dengan bebas akses ke Airport Lounge & Merchant.\r\n</p>','<p>Perlindungan bebas premi hingga Rp1.000.000.000,00 setiap pembelian tiket perjalanan apapun dengan Mandiri Precious.</p>','<p>Rp500.000,00</br>\r\n2%</p>','<p>-</p>'),
('P004','Mandiri Co Brand Pertamina','mandiricobrandpertamina.png','<p>Cashback senilai Rp200.000,00 setelah bertransaksi pertama kali\r\n</p>','<p> 2x Fiestapoin Transaksi di SPBU Pertamina. </br>\r\nNo Surcharge di SPBU. </br>\r\nPemegang kartu berhak atas perlindungan asuransi maksimal sebesar Rp 1 miliar dan mendapatkan fasilitas derek dan asistensi darurat kendaraan 24 jam. </p>\r\n','<p> Mendapatkan fasilitas lounge bandara jika penerbangan Anda ditunda. </br>\r\nBantuan 24 jam untuk keperluan darurat. Hubungi Mastercard Service Representative Global bebas pulsa di 001-803-1-887-0623. </br>\r\nKomplemen satu botol wine untuk makan malam. </br>\r\nMemberikan pengalaman tidak ternilai di berbagai aspek: olahraga, hiburan, music, travel, seni & budaya, kuliner, filantropi, dan shopping. </p>\r\n','<p>Rp400.000,00</br>\r\n2%</p>','<p> Minimal berusia 21 tahun. </br>\r\nPenghasilan minimal 5 juta </p>'),
('P005','Mandiri Golf Signature','mandirigolfsignature.png','<p>-</p>','<p>Diskon Lapangan & Merchant Golf hingga 50%. 3x fiestapoin. Mandiri Golf Tournament Series. Layanan emergency medical evacuation yang sewaktu-waktu dibutuhkan di luar negeri dengan menghubungi Mandiri Visa Signature Call di 6221-5299-7765.</br>\r\nDapatkan akses ke lapangan golf terbaik dunia dengan layanan Visa Concierge melalui www.visasignatureconcierge.com atau telepon ke toll free number 001 803 441 242. Akses pemesanan fasilitas private jet dengan menghubungi Mandiri Travel Center di 6221-526 8480 (hanya bisa dihubungi pada saat jam kerja, dan pemesanan dilakukan 1 minggu sebelum keberangkatan). Pertanggungan asuransi bebas premi dengan maksimal pertanggungan sampai dengan Rp. 5 Miliar. Untuk syarat dan ketentuan lebih lengkap.</br>\r\nLayanan telepon khusus untuk pemegang kartu Mandiri Visa Signature di 6221-5299-7765 yang dapat dihubungi kapanpun 24 jam / 7 hari seminggu, termasuk hari libur.\r\n</p>','<p>Gratis menikmati fasilitas Airport Lounge di berbagai bandara di Indonesia.</br>\r\nLayanan emergency medical evacuation yang sewaktu-waktu dibutuhkan di luar negeri dengan menghubungi Mandiri Visa Signature Call di 6221-5299-7765.</br>\r\nDapatkan akses ke lapangan golf terbaik dunia dengan layanan Visa Concierge melalui www.visasignatureconcierge.com atau telepon ke toll free number 001 803 441 242.</br>\r\nAkses pemesanan fasilitas private jet dengan menghubungi Mandiri Travel Center di 6221-526 8480 (hanya bisa dihubungi pada saat jam kerja, dan pemesanan dilakukan 1 minggu sebelum keberangkatan).</br>\r\nPertanggungan asuransi bebas premi dengan maksimal pertanggungan sampai dengan Rp. 5 Miliar. Untuk syarat dan ketentuan lebih lengkap.</br> \r\nLayanan telepon khusus untuk pemegang kartu Mandiri Visa Signature di 6221-5299-7765 yang dapat dihubungi kapanpun 24 jam / 7 hari seminggu, termasuk hari libur.\r\n</p>','<p>Rp1.500.000,00</br>\r\n2%</p>','<p>Usia minimal 21 tahun.</br>\r\nPenghasilan minimal Rp20.000.000,00</p>'),
('P006','Mandiri Golf Gold','mandirigolfgold.png','<p>-</p>','<p>Diskon Lapangan & Merchant Golf hingga 50%. Mandiri Golf Tournament Series.</br\r\nProgram Golf Travelling Special price dengan fasilitas cicilan dengan atau tanpa bunga.\r\n</p>','<p>Program Golf Travelling Special price dengan fasilitas cicilan dengan atau tanpa bunga.</p>','<p>Rp500.000,00</br>\r\n2%</p>','<p>Penghasilan minimal Rp5.000.000,00.</p>'),
('P008','Mandiri Platinum','mandiriplatinum.png','<p>Cashback Rp300.000,00.\r\n</p>','<p>2x Fiestapoin.</br>\r\nCicilan ringan.</br>\r\nBayar tagihan Mandiri Kartu Kredit melalui ATM semua bank, Mandiri Online, Cabang, SMS Banking, Direct debit, dan menu transfer bank lain. \r\n</p>','<p>Kini Anda dapat membayar semua tagihan rutin dalam 1 kali pembayaran. Daftarkan tagihan rutin Anda seperti PLN, Telkom, Pascabayar Seluler, dan TV kabel.</br>\r\nBelanja tak perlu khawatir hilang atau rusak dengan perlindungan hingga Rp 100 juta (per kejadian) dan Rp 60 juta (per item) dengan pembelian menggunakan Mandiri Platinum baik di luar maupun di dalam negeri.</br>\r\nPerlindungan bebas premi hingga Rp 5 milyar setiap pembelian tiket perjalanan apapun dengan Mandiri Platinum.\r\n</p>','<p>Rp180.000,00</br>\r\n2%</p>','<p>Penghasilan minimal Rp10.000.000,00.</p>'),
('P009','Everyday Card','everydaycard.png','<p>-</p>','<p>Nikmati kenyamanan dalam melakukan transaksi online dengan adanya fitur 3D secure yang memungkinkan Anda menerima PIN transaksi melalui SMS di website yang berlogo verified by VISA / Verified by MasterCard. </br>\r\nUbah transaksi Anda menjadi cicilan tetap dengan bunga ringan hingga 1% per bulannya. </br>\r\nDapatkan dana tunai dan kemudahan pembayaran melalui cicilan tetap hingga 12 bulan dengan bunga ringan. </p>\r\n','<p>-</p>','<p>Rp500.000,00</br>\r\n2%</p>','<p>Penghasilan minimal Rp3.000.000,00 </p>'),
('P010','Mandiri Gold','mandirigold.png','<p>-</p>','<p>Bayar semua tagihan rutin dalam 1 kali pembayaran.</br>\r\nCairkan limit Mandiri Gold untuk berbagai keinginan kamu yang tidak terbatas.</br>\r\nBeli apapun, dimanapun, gak perlu pusing bayar tagihan. Ubah transaksimu menjadi cicilan.\r\n\r\n</p>','<p>Dapatkan informasi tagihan yang lebih praktis dan mudah melalui e-mail. </p>','<p>Rp300.000,00</br>\r\n2%</p>','<p>Penghasilan minimal Rp3.000.000,00 </p>'),
('P011','Mandiri Co Brand Hypermart','mandiricobrandhypermart.png','<p>Cashback Rp200.000,00.</p>','<p>Cicilan 0% sampai 3 bulan untuk seluruh produk dan 12 bulan khusus produk elektronik.</br>\r\nProgram GWP Bonus produk setiap hari untuk Visa Contacles dengan cara Tap.\r\n</p>','<p>-</p>','<p>Rp200.000,00</br>\r\n2%</p>','<p>Usia minimal 21 tahun.</br>\r\nPenghasilan minimal Rp5.000.00,00.</p>'),
('P007','Mandiri Golf Platinum','mandirigolfplatinum.png','<p>-</p>','<p>Diskon Lapangan & Merchant Golf hingga 50%.</br>\r\n2x fiestapoin.</br>\r\nMandiri Golf Tournament Series.\r\n</p>','<p>Program Golf Travelling Special price dengan fasilitas cicilan dengan atau tanpa bunga.</br>\r\nUntuk perlindungan barang yang dibeli baik di dalam maupun di luar negeri.</br>\r\nPemegang kartu akan mendapat asuransi perjalanan bebas premi dengan nilai perlindungan hingga Rp5 Miliar untuk setiap pembelian tiket perjalanan menggunakan Mandiri Golf Platinum.</br>\r\nPemegang kartu untuk melindungi dari keterlambatan pesawat, ketidaknyamanan missed connection ataupun kehilangan bagasi.</br>\r\nLayanan international concierge dari Visa yang dapat diakses melalui www.visasignatureconcierge.com atau melalui telepon ke toll free 001 803 441 568 (bahasa Inggris) dan 001 803 441 242 (bahasa melayu).\r\n</p>','<p>Rp600.000,00</br>\r\n2%</p>','<p>Usia minimal 21 tahun.</br>\r\nPenghasilan minimal Rp10.000.000,00.</p>'),
('P012','Mandiri Traveloka','mandiritraveloka.png','<p>-</p>','<p>Dapatkan 2x Traveloka Poin setiap pembelian Flight dan Hotel. </br>\r\ndiskon 10% setiap hari di Traveloka Xperience & Asuransi Mobil. </br>\r\nDapatkan 1 Traveloka Poin setiap transaksi kelipatan Rp8.000 di semua merchant baik online maupun offline. </br>\r\nWe got you covered! Pertanggungan asuransi bebas premi dengan maksimal pertanggungan sampai dengan Rp 1 Miliar. </p>\r\n','<p> Berlaku untuk nilai transaksi di bawah Rp 1 juta, sedangkan pembelanjaan dengan nilai transaksi ? Rp 1 juta tetap diperlukan otorisasi melalui PIN atau tanda tangan. </br>\r\nGratis 1 tahun tanpa syarat apapun. </p>\r\n','<p>Rp500.000,00</br>\r\n2%</p>','<p> Penghasilan minimal 5 juta </p>');

/*Table structure for table `statistik` */

DROP TABLE IF EXISTS `statistik`;

CREATE TABLE `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `statistik` */

insert  into `statistik`(`ip`,`tanggal`,`hits`,`online`) values 
('127.0.0.2','2009-09-11',1,'1252681630'),
('::1','2014-12-09',10,'1418156879'),
('::1','2014-07-08',1,'1404811988'),
('::1','2014-07-04',2,'1404441411'),
('::1','2014-06-17',4,'1402973989'),
('::1','2014-06-13',7,'1402651504'),
('127.0.0.1','2010-04-16',11,'1271389426'),
('::1','2014-06-10',90,'1402399216');

/*Table structure for table `tmp_analisa` */

DROP TABLE IF EXISTS `tmp_analisa`;

CREATE TABLE `tmp_analisa` (
  `noip` varchar(60) NOT NULL DEFAULT '',
  `kd_solusi` char(4) NOT NULL DEFAULT '',
  `kd_gejala` char(4) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_analisa` */

insert  into `tmp_analisa`(`noip`,`kd_solusi`,`kd_gejala`,`status`) values 
('::1','P002','G012','N'),
('::1','P002','G011','N'),
('::1','P002','G006','N'),
('::1','P002','G005','N'),
('::1','P002','G001','N');

/*Table structure for table `tmp_gejala` */

DROP TABLE IF EXISTS `tmp_gejala`;

CREATE TABLE `tmp_gejala` (
  `kd_gejala` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_gejala` */

insert  into `tmp_gejala`(`kd_gejala`,`noip`) values 
('G005','::1'),
('G001','::1');

/*Table structure for table `tmp_pasien` */

DROP TABLE IF EXISTS `tmp_pasien`;

CREATE TABLE `tmp_pasien` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

/*Data for the table `tmp_pasien` */

insert  into `tmp_pasien`(`id`,`nama`,`kelamin`,`alamat`,`pekerjaan`,`noip`,`tanggal`) values 
(0189,'akbar','P','kepo','kepo','::1','2021-01-13 14:15:43');

/*Table structure for table `tmp_solusi` */

DROP TABLE IF EXISTS `tmp_solusi`;

CREATE TABLE `tmp_solusi` (
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tmp_solusi` */

insert  into `tmp_solusi`(`kd_solusi`,`noip`) values 
('P002','::1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
