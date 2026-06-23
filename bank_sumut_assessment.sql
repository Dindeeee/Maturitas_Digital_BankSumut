-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2026 at 12:31 PM
-- Server version: 8.0.30
-- PHP Version: 8.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_sumut_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_control_results`
--

CREATE TABLE `assessment_control_results` (
  `id` bigint UNSIGNED NOT NULL,
  `assessment_period_id` bigint UNSIGNED NOT NULL,
  `control_id` bigint UNSIGNED NOT NULL,
  `penjelasan_aktor` text COLLATE utf8mb4_unicode_ci,
  `penjelasan_dokumen` text COLLATE utf8mb4_unicode_ci,
  `penjelasan_kontrol` text COLLATE utf8mb4_unicode_ci,
  `rekomendasi` text COLLATE utf8mb4_unicode_ci,
  `referensi_dokumen` text COLLATE utf8mb4_unicode_ci,
  `review_progress` enum('pending','in_progress','done') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reviewed_by` bigint UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `approval_status` enum('approved','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_control_results`
--

INSERT INTO `assessment_control_results` (`id`, `assessment_period_id`, `control_id`, `penjelasan_aktor`, `penjelasan_dokumen`, `penjelasan_kontrol`, `rekomendasi`, `referensi_dokumen`, `review_progress`, `reviewed_by`, `reviewed_at`, `approval_status`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Stratetgis TI\n- Rencana Bisnis Bank \n- Laporan Tahunan PT Bank Sumut 2023', 'Kontrol\nBerdasarkan review dokumen Rencana Strategis TI dan Rencana Bisnis Bank, Bank telah menetapkan rencana pengembangan TI yang terdapat pada dokumen Rencana Strategis TI Bank. Selanjutnya untuk mendukung rencana pengembangan TI tersebut, Bank telah menetapkan alokasi anggaran untuk pengembangan TI yang termuat dalam dokumen Rencana Bisnis Bank. Kemudian, Bank telah menunjukkan komitmen dari Direksi untuk mendukung permodalan Bank dalam pengembangan TI melalui pengesahan dokumen Rencana Strategis TI dan Rencana Bisnis Bank.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Penguatan dokumentasi dan komitmen modal yang mecakup:\n- memastikan pembahasan terkait komitemen Direksi dan pemegang saham  dalam mendukung permodalan untuk pengembangan TI. Hal ini harus terdokumentasi secara spesifik pada dokumen strategis sebagai bukti komitmen.\n- alokasi anggaran untuk pengembangan TI dalam Rencana Bisnis Bank lebih transparan dan terperinci\n2. Evaluasi dan penyesuaian Rencana Strategis TI mencakup:\n- melakukan evaluasi berkala terhadap Rencana Strategis TI dan Rencana Bisnis Bank\n- menyesuaikan rencana dan alokasi anggaran berdasarkan hasil evaluasi tersebut\n3. Optimalisasi Investasi Teknologi mencakup:\n- memantau secara ketat penggunaan belanja modal (Capex) untuk proyek-proyek TI\n- melakukan evaluasi terhadap return on investment (ROI) dari setiap investasi TI', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(2, 1, 2, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Pengembangan Teknologi Informasi PT Bank Sumut\n- COB Biller BNI CC Phase 1', 'Kontrol\nBerdasarkan review dokumen dan hasil interview dengan Divisi Teknologi Informasi, Bank telah memiliki pengaturan  terkait studi kelayakan dan Bank telah melakukan analisis studi kelayakan atas rencana investasi yang akan dilakukan. Hasil dari analisis studi kelayakan dicatat dalam bentuk Memo lalu dilampirkan dalam Dokumen BRD untuk diteruskan kepada Manajemen/Direksi.\n\nNamun, Bank belum melakukan pengukuran kinerja portofolio investasi menggunakan pengukuran tingkat pengembalian investasi.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Memastikan pembahasan terkait komitemen Direksi dan pemegang saham  dalam mendukung permodalan untuk pengembangan TI. Hal ini harus terdokumentasi secara spesifik pada dokumen strategis sebagai bukti komitmen.\n2. Meninjau dan memperbarui alokasi anggaran dalam Rencana Bisnis Bank secara terperinci,\n3. Memperkuat pemantauan terhadap implementasi biaya belanja modal (Capex)\n4. Melakukan evaluasi terhadap kecukupan dan efisiensi permodalan yang diperlukan', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(3, 1, 3, '/Fungsi\n- Divisi Teknologi Informasi\n- Divisi Keuangan dan Akuntansi', 'Rencana Bisnis Bank\n- Analisis Cost & Benefit', 'Kontrol\nBerdasarkan review dokumen Rencana Bisnis Bank dan Analisis Cost & benefit serta hasil interview dengan Divisi Teknologi Informasi dan Divisi Keuangan dan Akuntansi, Bank telah melakukan pemantauan terhadap proyeksi dan realisasi anggaran. Bank telah melakukan analisis biaya dan manfaat namun hanya dilakukan per produk, bukan keseluruhan atas investasi TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Pengaturan pemantauan rutin terkait deviasi anggaran, proyeksi biaya, dan realisasi biaya, termasukan analisis biaya dan manfaat dalam seluruh kegiatan terkait dengan seluruh penyelenggaraan TI yang ada di lingkungan Bank. \n2. Pelaksanaan pemantauan terkait seluruh penggunaan anggaran sesuai dengan manfaat yang diterima, termasuk jika penyelenggaraan TI disediakan oleh pihak penyedia jasa TI secara menyeluruh.\n3. Memastikan tersedianya standarisasi dan dokumentasi yang baik atas pemantauan deviasi anggaran, proyeksi biaya, dan realisasi biaya, termasukan analisis biaya dan manfaat dalam seluruh kegiatan terkait dengan seluruh penyelenggaraan TI yang ada di lingkungan Bank', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(4, 1, 4, '/Fungsi\nDivisi SDM', 'Laporan Tahunan Bank Sumut', 'Kontrol\nBerdasarkan review dokumen dan hasil interview dengan Divisi SDM, Bank telah menerapkan program pelatihan kepemimpinan kepada Direksi, Dewan Komisaris dan jajaran manajemen yang berorientasi digital. Berdasarkan dokumen Laporan Tahunan Bank Sumut, berikut merupakan contoh program pelatihan yang telah dilaksanakan yaitu:\n- Executive Program Governance Risk Compliance (GRC) Sustainability Remap and Reshape GRC Implementation\n- Program Refreshment Sertifikasi Manajemen Risiko Strengthening Bank Business Strategies in The Era of Technology Disruption and Post Covid-19 Pandemic\n- Workshop Transformasi Digital', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Meningkatkan frekuensi dan kualitas pelatihan kepada jajaran Direksi, Dewan Komisaris dan jajaran manajemen.\n2) Mengukur dampak pelatihan yang diberikan kepada jajaran Direksi, Dewan Komisaris dan jajaran manajemen.\n3) Mendorong inovasi Digital kepada Direksi, Dewan Komisaris, dan jajaran manajemen untuk aktif dalam menginisiasi dan mendukung proyek-proyek inovasi digital.\n4) Meningkatkan komunikasi dan kolaborasi antar departemen terkait inisiatif digital.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(5, 1, 5, '/Fungsi\n- Divisi Strategi & Transformasi\n- Divisi Teknologi Informasi', 'Struktur Organisasi dan Profil Jabatan Divisi Strategi dan Transformasi\n- Sruktur Organisasi dan Profil Jabatan Divisi Teknologi Informasi', 'Kontrol\nBerdasarkan review dokumen Struktur Organisasi dan Profil Jabatan Divisi Strategi dan Transformasi dan Teknologi Informasi serta hasil interview dengan Divisi Strategi & Transformasi, Bank telah mendefinisikan struktur organisasi yang kolaboratif dengan mendefinisikan hubungan kerja antar Divisi Internal Bank. Divisi Strategi & Transformasi, Bidang Digital Banking, dapat melakukan kolaborasi dengan Divisi Teknologi Informasi untuk membangun dan mengembangkan sistem sesuai kebijakan strategis bank terkait layanan perbankan digital.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Memperkuat struktur organisasi kolaboratif yang memungkinkan interaksi yang lebih luas antar unit kerja\n2) Meningkatkan desentralisasi kewenangan untuk memastikan pengambilan keputusan yang lebih cepat dan responsif terhadap perubahan. \n3) Bank perlu terus meningkatkan pemanfaatan teknologi informasi untuk mendukung kolaborasi, komunikasi, dan konektivitas.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(6, 1, 6, '/Fungsi\nDivisi SDM, Sekertaris Perusahaan', 'Laporan Tahunan Bank Sumut', 'Kontrol\nBerdasarkan review dokumen serta interview, Bank khususnya Direksi dan Dewan Komisaris telah menunjukkan komitmen untuk mengembangkan budaya digital dengan fokus pada peningkatan kualitas SDM dan melakukan digitalisasi pada Bank serta menanamkan digital mindset.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perlu memastikan bahwa komitmen ini ditampilkan secara lebih jelas dan terukur\n2) Memperkuat penerapan pengembangan budaya digital yang  berfokus antara lain kolaborasi, data driven, berfokus pada pelanggan (customer centric), inovasi digital, serta integrasi teknologi digital dalam semua proses bisnis kepada seluruh lapisan pegawai.\n3) Menedokumentasikan seluruh proses pengembangan budaya digital dari proses perencanaan hingga evaluasi untuk memastikan keberlanjutan pelaksanaan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(7, 1, 7, '/Fungsi\nDivisi SDM', 'Sampel Dokumen Pelatihan DTI 2023', 'Kontrol\nBerdasarkan hasil interview dengan Divisi SDM, Bank telah melakukan penyusunan program pengembangan dan pelatihan sumber daya manusia melakukan Training Need Analysis (TNA) untuk menyesuaikan dengan kebutuhan dari setiap divisi.\n\nNamun, Bank belum memiliki kebijakan khusus terkait pengembangan talenta digital.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perlu menyusun panduan implementasi kebijakan yang rinci, termasuk proses rekrutmen, perencanaan karir, evaluasi kinerja, dan program pengembangan yang spesifik. \n2) Memperluas program pengembangan talenta digital melalui rekrutmen, pelatihan, dan sertifikasi, khususnya dalam bidang teknologi terkini, bisnis digital, cybersecurity, dan customer engagement.\n3) Memastikan bahwa program pengembangan talenta digital dievaluasi secara berkala untuk menilai efektivitasnya dan melakukan perbaikan yang diperlukan.\n4) Bank harus memastikan keberlanjutan program pengembangan talenta digital dengan menciptakan lingkungan kerja yang mendukung pembelajaran dan inovasi berkelanjutan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(8, 1, 8, '/Fungsi\nDivisi Teknologi Informasi', 'Dokumen Pedoman Pelaksanaan Penerapan Tata Kelola PT Bank Sumut\n- Kebijakan SMKI dan menjadwalkan assessment ISO 27001 secara berkala', 'Kontrol\nBerdasarkan review Pedoman Pelaksanaan Penerapan Tata Kelola  PT Bank Sumut, Bank telah membentuk komite pendukung penyelengaraan TI yaitu Komite Pengarah Teknologi Informasi (KPTI) untuk mendukung keselarasan proses. \nNamun, Bank belum secara konsisten menyelaraskan proses dan praktik tata kelola TI dengan prinsip tata kelola Bank.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perluk melakukan penguatan lebih lanjut untuk memastikan bahwa semua elemen ini berfungsi secara efektif dan efisien.\n2) Bank perlu memperkuat mekanisme koordinasi dan pelaporan terkait tata kelola TI untuk meningkatkan pengawasan dan pengambilan keputusan yang lebih cepat dan akurat.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(9, 1, 9, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Bisnis Bank', 'Kontrol\nBerdasarkan review dokumen dan hasil interview dengan Divisi Teknologi Informasi, Bank telah menetapkan alokasi anggaran untuk investasi TI yang termuat pada dokumen Rencana Bisnis Bank. Dalam penyusunan Rencana Bisnis Bank telah mempertimbangkan strategi bisnis bank serta tingkat risiko atas investasi TI tersebut. \n\nNamun, Bank belum melakukan analisis tingkat pengembalian investasi terkait investasi TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank dapat memperkuat proses analisis biaya dan manfaat (cost-benefit analysis) untuk setiap proyek TI yang diajukan. Hal ini dapat mencakup penggunaan metrik yang lebih jelas untuk mengukur tingkat pengembalian investasi (ROI) dan risiko yang terlibat, serta memastikan bahwa setiap investasi TI secara langsung mendukung tujuan strategis Bank.\n2) Mengimplementasikan sistem pelaporan yang lebih terstruktur untuk memantau realisasi pendapatan baru yang dihasilkan dari investasi TI. Selain itu, Bank perlu melibatkan secara aktif pemangku kepentingan terkait (stakeholders) dalam evaluasi dan pemantauan proyek TI untuk memastikan bahwa inisiatif-inisiatif tersebut memenuhi harapan.\n3) Memperkuat dan memastikan komite yang bertanggung jawab untuk meninjau dan menilai secara berkala atas portofolio investasi TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(10, 1, 10, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Perencanaan dan Perorganisasian Teknologi Informasi PT Bank Sumut', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah memiliki ketentuan terkait manajemen risiko yang mencakup\n1. Manajemen Risiko TI merujuk kepada kerangka kerja Manajemen Risiko yang diimplmentasikan Bank.\n2. Seluruh fungsi di DTI harus melakukan risk assessment, menyusun risk treatment plan dan mengimplementasikan risk treatment plan dalam tahun anggaran berjalan.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank dapat mengadakan sesi workshop rutin dengan tim TI dan manajemen risiko untuk melakukan review terhadap risiko-risiko TI yang telah diidentifikasi dan memastikan bahwa metode evaluasi risiko yang digunakan adalah sesuai dengan standar industri dan kebijakan internal Bank.\n2) Mengadopsi pendekatan holistik dalam manajemen risiko TI dengan mengintegrasikan sistem manajemen risiko TI ke dalam platform manajemen risiko Bank yang sudah ada. \n3)  Memperkuat penggunaan dashboard risiko TI yang real-time untuk memantau secara kontinu eksposur risiko TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(11, 1, 11, '/Fungsi\n- Divisi Teknologi Informasi, \n- Divisi SDM', 'Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut\n- SOP Manajemen SDM TI', 'Kontrol\nBerdasarkan hasil review dokumen  Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut dan SOP Manajemen SDM TI serta hasil interview dengan Divisi SDM, Bank telah memiliki ketentuan terkait proses identifikasi kecukupan dan pengajuan kebutuhan SDM TI. Proses identifikasi dan evaluasi kebutuhan sumber daya manusia didasarkan dari inisiasi divisi terkait kebutuhan SDM dan melakukan analisis manpower planning yang kemudian diajukan melalui rencana bisnis bank.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank dapat meningkatkan kolaborasi antara tim TI, keuangan, dan unit bisnis dalam proses identifikasi kebutuhan sumber daya TI.\n2) Bank dapat mengimplementasikan dashboard atau sistem pelaporan yang real-time untuk memantau penggunaan sumber daya TI, termasuk pendanaan, SDM, dan teknologi.\n3) Bank dapat melakukan survei kepuasan internal dan eksternal secara berkala untuk mengevaluasi tingkat kepuasan terhadap layanan dan dukungan TI yang disediakan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(12, 1, 12, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut\n- Rencana Strategis TI', 'Kontrol\nBerdasarkan hasil review dokumen Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut dan Rencana Strategis TI serta hasil interview dengan Divisi Teknologi Informasi, Bank telah memiliki pengaturan terkait keterlibatan pemangku kepentingan dalam tata kelola TI. Selanjutnya, Bank juga telah melakukan aktivitas pelaporan atas hasil penerapan rencana TI kepada Komite Pengarah TI dan jajaran Direksi secara berkala. Berdasarkan hasil review dokumen Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut, Bank telah memiliki pengaturan terkait keterlibatan Direksi dan Komite Pengarah TI dalam penyusunan rencana strategis TI. Kemudian, Divisi Teknologi Informasi juga telah melakukan aktivitas evaluasi atas rencana strategis TI dan rencana kerja TI yang hasil evaluasinya disampaikan kepada pemangku kepentingan.\n\nHal ini juga didukung dengan kegiatan Rapat Komite TI yang dilakukan secara berkala sebagai bentuk evaluasi rutin atas penyelenggaraan TI yang ada di lingkungan Bank. Rapat Komite TI didokumentasikan dalam Risalah Rapat Komite TI untuk dan terdapat absensi keterlibatan pemangku kepentingan terkait serta terdapat bagian hasil keputusan rapat KPTI sebagai instruksi dan strategi atas pelaksanaan evaluasi.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perlu terus mengoptimalkan proses identifikasi dan evaluasi pemangku kepentingan yang terlibat dalam tata kelola TI, serta memastikan kebutuhan komunikasi dan pelaporan kepada pemangku kepentingan yang relevan telah dipahami dengan baik.\n2) Bank dapat meningkatkan transparansi dalam komunikasi dengan memperluas penggunaan portal atau platform digital yang menyediakan informasi terkini terkait proyek-proyek TI dan inisiatif strategis. \n3) Bank dapat mengimplementasikan sistem pengelolaan dokumen digital yang terintegrasi untuk memastikan bahwa laporan-laporan yang dihasilkan dari sistem TI Bank memiliki akurasi yang tinggi dan dapat diakses dengan mudah oleh pemangku kepentingan yang berwenang.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(13, 1, 13, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah mempertimbangkan hal-hal yang dibutuhkan dalam merancangan sistem TI, yaitu:\n1) visi dan misi Bank; \n2) strategi Bisnis Bank; \n3) tantangan yang dihadapi Bank; \n4) lingkungan internal Bank, termasuk budaya, toleransi risiko, keamanan dan kebijakan privasi, nilai etika, kode etik, dan akuntabilitas; dan\n5) standar maupun regulasi terkait.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank dapat melakukan evaluasi berkala terhadap sistem manajemen TI untuk memastikan bahwa desain sistem tersebut tetap relevan dengan perubahan visi, misi, dan strategi bisnis Bank. \n2) Mengadakan workshop secara rutin untuk seluruh pegawai terkait tujuan dan arah penggunaan TI. \n3) Bank dapat melakukan peninjauan berkala terhadap struktur organisasi dan fungsi TI untuk memastikan bahwa penempatan fungsi TI tetap sesuai dengan model operasional Bank dan strategi penempatan sumber daya. Hal ini dapat mencakup evaluasi terhadap efisiensi struktur organisasi TI, baik yang terpusat, terdesentralisasi, maupun kombinasi.\n4) Bank perlu memastikan bahwa kebijakan dan prosedur kontrol TI pada area utama seperti kualitas, keamanan, privasi, kontrol internal, penggunaan aset TI, etika, dan hak kekayaan intelektual telah ditetapkan dan dikomunikasikan secara efektif.\n5) Bank dapat melakukan audit internal terhadap infrastruktur TI untuk memastikan bahwa semua komponen telah berfungsi sesuai dengan harapan dan mendukung tata kelola TI secara efektif. Selain itu, Bank dapat terus mengevaluasi dan memperbarui aplikasi serta layanan TI untuk menyesuaikan dengan kebutuhan operasional dan strategi bisnis yang berkembang.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(14, 1, 14, '/Fungsi\nDivisi Teknologi Informasi', 'Corporate Plan Bank\n- Rencana Strategis TI', 'Kontrol\nBerdasarkan review dokumen Corporate Plan Bank dan Rencana Strategis TI, Bank telah melakukan analisis teradap lingkungan bisnis Bank serta mempertimbangkan visi dan misi Bank ke depan, termasuk perubahan industri, regulasi terkait dan target tingkat maturitas.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Memperkuat pemahaman terhadap lingkungan bisnis dan arah pengembangan Bank ke depan, termasuk faktor penentu perubahan industri, regulasi terkait, tingkat persaingan, model operasional saat ini, dan target tingkat maturitas digitalisasi.\n2) Bank perlu terus meningkatkan penilaian terhadap kemampuan, kinerja, dan tingkat maturitas digitalisasi saat ini untuk memastikan bahwa inisiatif transformasi digital berjalan sesuai dengan rencana.\n3) Menentukan target kapabilitas digital yang jelas dan terukur berdasarkan pemahaman terhadap lingkungan bisnis dan arah pengembangan Bank ke depan.\n4) Melakukan analisis dengan metode analisis kesenjangan yang terstruktur untuk mengidentifikasi area yang perlu ditingkatkan, serta menyusun laporan penilaian kesehatan TI yang rinci dan transparan. Laporan ini harus dikomunikasikan secara efektif kepada OJK dan pemangku kepentingan internal.\n5) Menetapkan rencana strategis dan peta jalan transformasi yang jelas dan terperinci, serta memastikan bahwa rencana tersebut tercantum dalam RSTI.\n6) Bank perlu memastikan bahwa strategi dan arah pengembangan TI dikomunikasikan dengan efektif kepada seluruh pemangku kepentingan dan satuan kerja pengguna TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(15, 1, 15, '/Fungsi\nDivisi Teknologi Informasi', 'Corporate Plan Bank\n- Rencana Strategis TI', 'Kontrol\nBerdasarkan review dokumen Corporate Plan Bank dan Rencana Strategis TI , Bank dalam melakukan penyusunan dokumen rencana strategis TI telah mempertimbangkan visi dan misi Bank serta kondisi internal dan eksternal bank. Selain itu Bank juga telah mendefinisikan kondisi target TI yang ingin dicapai ke depannya.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perlu terus meningkatkan pemahaman terhadap isu bisnis, tujuan, dan ekspektasi atas TI yang dipergunakan Bank agar dapat mendukung kebutuhan operasional dan strategis.\n2) Bank perlu memperkuat hubungan bisnis yang baik antara organisasi TI dan unit bisnis dengan memperjelas dan mengomunikasikan peran serta tanggung jawab hubungan secara memadai.\n3) Bank perlu mengoptimalkan sistem komunikasi internal yang transparan dengan semua pemangku kepentingan yang relevan untuk mengoordinasikan layanan TI yang diberikan kepada unit bisnis.\n4) Bank perlu secara berkesinambungan memperbaiki dan mengembangkan layanan TI agar tetap relevan dengan perkembangan bisnis Bank dan teknologi.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(16, 1, 16, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Operasional Teknologi Informasi PT Bank Sumut', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah melakukan analisis layanan TI saat ini untuk mengidentifikasi kinerja layanan terhadap aktivitas bisnis Bank, baik aktivitas bisnis yang\ntelah ditunjang layanan TI / aplikasi, atau aktivitas bisnis yang belum ditunjang layanan TI / aplikasi.\nNamun, Bank belum mendokumentasikan katalog layanan TI secara memadai.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Bank perlu melakukan analisis terhadap kinerja layanan TI saat ini dan kebutuhan untuk mengembangkan seluruh layanan TI guna mendukung aktivitas bisnis secara optimal.\n2) Bank perlu mengoptimalkan pengelolaan dan publikasi katalog layanan TI yang mencakup perbandingan layanan dan paket layanan TI yang ditawarkan, serta memastikan pembaruan portofolio layanan dilakukan secara rutin.\n3)Memantau kinerja layanan TI untuk secara berkala dan mengidentifikasi pelanggaran layanan, dan menganalisis tren kepuasan nasabah. Data yang diperoleh dapat digunakan untuk membuat laporan berkala dan menyusun rencana perbaikan yang konkret untuk meningkatkan kinerja layanan TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(17, 1, 17, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi', 'Kontrol\nBerdasarkan review  dokumen tersebut, Bank telah memiliki standar terkait manajemen mutu. Bank melakukan dari mulai aktivitas identifikasi sampai pemantauan pengelolaan dan penyesuaian mutu untuk kebutuhan bisnis dan ekspektasi setiap proses bisnis, layanan operasional, dan solusi/aplikasi baru.\n\nNamun, Bank belum melaporkan hasil identifikasi dari pengaturan mutu TI secara konsisten.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1) Memperkuat penerapan manajemen mutu yang dijadikan standar dan pendekatan untuk sistem manajemen informasi guna memastikan kualitas yang konsisten dan tinggi.\n2) Bank perlu lebih lanjut memastikan bahwa kebutuhan pemangku kepentingan terintegrasi dalam praktik manajemen kualitas agar dapat memberikan layanan yang sesuai dengan ekspektasi.\n3) Bank perlu mengelola dan mengintegrasikan standar, praktik, dan prosedur kualitas ke dalam semua proses bisnis untuk memastikan konsistensi dan kualitas yang tinggi.\n4) Bank perlu melakukan pemantauan, pengendalian, dan evaluasi terhadap kualitas proses dan layanan secara berkesinambungan sesuai dengan standar manajemen kualitas.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(18, 1, 18, '/Fungsi\nDivisi Teknologi Informasi', 'Kebijakan Manajemen Sistem Keamanan Informasi  PT Bank Sumut\n- SOP Pengamanan Informasi dalam Menggunakan TI PT Bank Sumut', 'Kontrol\nBerdasarkan review dokumen Kebijakan Manajemen Sistem Keamanan Informasi  PT Bank Sumut dam SOP Pengamanan Informasi dalam Menggunakan TI PT Bank Sumut, didapatkan bahwa Bank telah membangun dan memelihara sistem keamanan informasi', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Bank perlu melakukan pemantauan terus-menerus dan audit tahunan dilakukan untuk memastikan kepatuhan dan mendeteksi ancaman baru. contoh penerapan:\n- melakukan simulasi serangan untuk menguji respons terhadap insiden keamanan.\n2. Bank perlu menyusun perencanaan atas penanganan risiko (identifikasi risiko, dampak risiko, dll) keamanan informasi dan data pribadi secara konsisten.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(19, 1, 19, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi PT Bank Sumut', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank telah memiliki pengaturan terkait manajemen proyek TI. \n\nNamun, berdasarkan dokumen tersebut, tidak terdapat informasi bahwa Bank menggunakan project management tools dalam mengelola proyek pengembangan TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Bank perlu mempertimbangkan penggunaan project management tools dalam mengelola proyek penyelenggaraan TI, seperti:\n- JIRA\n- Microsoft teams/project\n- Trello', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(20, 1, 20, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Operasional Teknologi Informasi PT Bank Sumut', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank telah memiliki pengaturan terkait manajemen perjanjian tingkat layanan TI (SLA).', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\nBank perlu melakukan evaluasi & pemantauan atas penetapan manajemen perjanjian tingkat layanan TI atau SLA.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(21, 1, 21, '/Fungsi\nDivisi Manajemen Risiko', 'Peraturan PT Bank SUMUT tentang Business Continuity Management', 'Kontrol\nBerdasarkan review dokumen tersebut, bank telah memiliki kebijakan, tujuan, dan ruang lingkup kelangsungan bisnis.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\nBank perlu melakukan evaluasi & pemantauan atas implementasi kelangsungan bisnis pada Bank.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(22, 1, 22, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Pengembangan Teknologi Informasi PT Bank Sumut\n- Petunjuk Pelaksanaan Vulnerability Assessment/Penetration Testing Bank Sumut\n- Laporan Pentest Aplikasi PMS Ritel Bank Sumut, Aplikasi E-Catalog, Aplikas SILK', 'Kontrol\nBerdasarkan review dokumen Petunjuk Pelaksanaan Pengembangan Teknologi Informasi PT Bank Sumut dan Petunjuk Pelaksanaan Vulnerability Assessment/Penetration Testing Bank Sumut serta hasil interview dengan Divisi Teknologi Informasi, Bank telah memiliki pengaturan terkait persyaratan keamanan pada pengembangan dan akuisisi software aplikasi. Kemudian, Bank dalam melakukan pengembangan dengan Security Assurance yang di fasilitasi oleh Tim Developer menggunakan Two-Factor Authentication (2FA) seperti OTP dan QR Authentication. Selain itu, menggunakan HTTPS & Web Token. \n\nNamun, Bank belum melakukan dokumentasi atas pengelolaan keamanan pada sistem atau aplikasi.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\nBank perlu membuat pengaturan terkait pencatatan pengelolaan keamanan pada sistem/aplikasi.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(23, 1, 23, '/Fungsi\n- Divisi Teknologi Informasi\n- Divisi SDM', 'Petunjuk Pelaksanaan Perencanaan dan Pengorganisasian Teknologi Informasi\n- Laporan Evaluasi Rencana Strategis TI\n- Petunjuk Pelaksanaan Pengembangan Teknologi Informasi PT. Bank Sumut', 'Kontrol\nBerdasarkan review dokumen dan hasil interview dengan Divisi Teknologi Informasi, Bank telah melakukan evaluasi terhadap kesesuaian TI dengan rencana strategis dan bersama dengan Divisi SDM, Divisi Teknologi Informasi yang juga telah melakukan kajian atau review kinerja menggunakan KPI yang diagendakan 6 bulan sekali. Bank juga memiliki laporan pengembangan teknologi informasi yang dilaporkan setiap 1 (satu) tahun sekali.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\nBank perlu melakukan kajian dan pemantauan atas aktivitas evaluasi terhadap kesesuaian TI dengan rencana strategis TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(24, 1, 24, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan review dokumen dan hasil interview dengan Divisi Teknologi Informasi, diketahui bahwa Direksi berperan dalam memastikan dan menyetujui bahwa Arsitektur TI yang tercantum dalam dokumen Rencana Strategis TI telah disusun selaras dengan strategi dan kebutuhan bisnis Bank.\n\nDireksi juga memiliki peran untuk menyetujui Dokumen Rencana Strategi TI yang diantaranya terdapat bagian Arsitektur TI.', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. mengevaluasi secara berkala efektivitas strategi TI dan menyesuaikannya dengan perubahan strategi bisnis, kondisi pasar, dan perkembangan teknologi terbaru.\n2. memastikan bahwa Direksi mengawasi pelaksanaan strategi TI untuk memastikan proyek-proyek TI sesuai rencana, termasuk memantau anggaran, pencapaian milestones, dan manajemen risiko', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(25, 1, 25, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI\n- Petunjuk Pelaksanaan Perencanaan dan Perorganisasian Teknologi\n- Risalah Rapat KPTI 2024', 'Kontrol\nBerdasarkan review dokumen Rencana Strategis TI, Petunjuk Pelaksanaan Perencanaan dan Perorganisasian Teknologi dan Risalah Rapat KPTI 2024 hasil interview dengan Divisi Teknologi Informasi, Bank telah memiliki pengaturan terkait keterlibatan Direksi dan Komite Pengarah TI dalam penyusunan arsitektur TI (arsitektur data, informasi, aplikasi, server, jaringan dan security) yang terdapat pada dokumen rencana strategis TI.\n\nPembahasan mengenai terkait dengan arsitektur TI telah dilaksanakan pada Rapat KPTI sejalan dengan pembahasan RSTI', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. mengambil peran yang lebih aktif dalam memastikan bahwa semua aspek arsitektur TI, termasuk arsitektur data, informasi, aplikasi, server, jaringan, dan keamanan, terintegrasi dengan strategi bisnis secara komprehensif sesuai dengan kebutuhan Bank.\n2. memastikan direksi aktif dalam perumusan kebijakan terkait arsitektur TI, termasuk memastikan bahwa setiap perubahan atau penyesuaian strategis bisnis tercermin dalam arsitektur tersebut.\n3. mengembangkan keterampilan dan pengetahuan direksi dan komite pengarah TI dalam domain arsitektur TI', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(26, 1, 26, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI\n- Petunjuk Pelaksanaan Perencanaan dan Perorganisasian Teknologi', 'Kontrol\nBerdasarkan review dokumen Rencana Strategis TI dan Petunjuk Pelaksanaan Perencanaan dan Perorganisasian Teknologi serta hasil interview dengan Divisi Teknologi Informasi, Bank telah mempertimbangkan faktor-faktor yang diperlukan dalam menyusun arsitektur TI, yaitu:\n1) visi dan misi Bank;\n2) rencana korporasi Bank;\n3) proses dan kapabilitas bisnis Bank;\n4) tata kelola TI Bank;\n5) prinsip pengelolaan data, aplikasi, dan teknologi Bank;\n6) ukuran dan kompleksitas bisnis Bank;\n7) kemampuan permodalan bank;\n8) standar yang berlaku secara nasional dan internasional; dan\n9) ketentuan peraturan perundang-udangan', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. memastikan bahwa semua faktor yang dipertimbangkan dalam penyusunan arsitektur TI benar-benar terintegrasi secara menyeluruh. Ini artinya, visi, misi, dan rencana korporasi Bank harus tercermin dengan konsisten dalam setiap elemen arsitektur TI yang disusun\n2. diperbarui secara berkala sesuai dengan perkembangan rencana korporasi Bank, proses bisnis yang berubah, dan kebutuhan teknologi baru. Termasuk:\n- evaluasi terhadap kemampuan bisnis,\n- evaluasi pengelolaan data dan aplikasi\n- evaluasi adaptasi terhadap standar nasional, internasional, dan peraturan yang berlaku.\n3. evaluasi secara berkala terhadap kepatuhan dan penerapan praktik  pengelolaan TI\n4. memastikan bahwa setiap elemen dalam arsitektur TI mencakup implementasi kebijakan keamanan TI yang sesuai dengan standar industri dan regulasi yang berlaku', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(27, 1, 27, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan interview dengan Divisi Teknologi Informasi, pada penyusunan Arsitektur TI disusun dengan melibatkan stakeholder terkait baik dari Internal Divisi Teknologi Informasi dan bagian lainnya (Digital Banking & Digital Channel) untuk penyusunan Arsitektur TI.', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. memperluas keterlibatan stakeholder untuk mencakup unit-unit bisnis lainnya yang memiliki kepentingan terhadap arsitektur TI.\n2. melakukan evaluasi secara teratur terhadap keterlibatan dan kontribusi stakeholder dalam proses penyusunan arsitektur TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(28, 1, 28, '/Fungsi\n Divisi Teknologi Informasi', 'Risalah Rapat Komite TI\nLayanan Aplikasi e-Doc\nMemorandum', 'Kontrol\nBerdasarkan hasil interview dengan Divisi Teknologi Informasi, Bank telah melakukan komunikasi mengenai Arsitektur TI yang tercantum pada dokumen Rencana Strategis TI kepada para pemangku kepentingan melalui mekanisme Rapat Komite TI maupun Direksi. Penyampaian kepada Divisi lain di Internal Bank dilakukan melalui sistem HRIS.\n\nPermintaan informasi arsitektur TI difasilitasi melalui aplikasi e-DOC dan memorandum secara tertulis terhadap persetujuan mengenai arsitektur TI', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. memiliki mekanisme spesifik terkait persetujuan, tata cara pemberian informasi, dan media komunikasi atas pemberian dan permintaan informasi terkait aristektur TI kepada pemangku kepentingan, yang mencakup aspek:\n- aturan yang jelas tentang bagaimana setiap permintaan informasi arsitektur TI harus disetujui sebelum informasi tersebut diberikan kepada pihak terkait.\n- membuat prosedur tertulis yang menjelaskan langkah-langkah apa yang harus diikuti dalam meminta dan memberikan informasi arsitektur TI\n- melakukan pemantauan atas implementasi yang dilakukan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(29, 1, 29, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan hasil review  dokumen rencana strategis TI, Bank telah menyampaikan bahwa seluruh investasi TI dirancang selaras dengan arsitektur TI dan rencana strategis TI mengingat Arsitektur TI tercantum sebagai landasan arahan strategis TI di Bank. Berdasarkan hasil interview dengan Divisi Teknologi Informasi disampaikan bahwa Arsitektur TI dijadikan landasan dasar atas Investasi terkait TI yang ada di lingkungan Bank.', 'Berdasarkan assessment tersebut, bank perlu:\n1. meningkatkan proses evaluasi untuk memastikan setiap investasi baru dan akuisisi TI dinilai secara menyeluruh. Evaluasi ini harus mempertimbangkan bagaimana proyek tersebut akan berintegrasi dengan infrastruktur TI yang sudah ada dan apakah akan mendukung arsitektur TI yang telah ditetapkan.\n2. memastikan bahwa keputusan ini tidak hanya berbasis pada keuntungan bisnis tetapi juga sejalan dengan visi arsitektur TI jangka panjang Bank.\n3. menambahkan arsitektur TI sebagai salah satu refrensi dalam pengambilan keputusan terkait investasi TI maupun keputusan bisnis terkait TI pada dokumen BRD.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(30, 1, 30, '/Fungsi\nDivisi Manajemen Risiko', 'Pedoman Penerapan Manajamen Risiko PT. Bank Sumut\n- Dokumen Risk Appetite, Risk Tolerance dan Risk Limit Bank', 'Kontrol\nBerdasarkan review atas Dokumen PP Manajemen Risiko Bank Sumut terdapat penjelasan yang dapat yang menyatakan bahwa Bank melakukan identifikasi risiko TI dengan memastika adanya risk awareness  di seluruh lini Bank, yaitu:\n\n1) Wewenang dan Tanggungjawab terdapat informasi yang menyatakan bahwa  Direksi harus memiliki pemahaman yang memadai mengenai Risiko yang melekat pada seluruh aktivitas fungsional Bank dan mampu mengambil tindakan yang diperlukan sesuai dengan Profil Risiko Bank.\n2) Bank telah menyampaikan terkait risk appetite, risk limit, dan risk tolerance melalui dokumen terkait yang ditentukan setelah rapat bersama Komenko.\n3) Bank telah menjadikan Peraturan Otoritas Jasa Keuangan Nomor 11/POJK.03/2022 tanggal 6 Juli 2022 tentang Penyelenggaraan Teknologi lnformasi Oleh Bank Umum sebagai salah satu acuan penerapan manajemen risiko.\n4) Seluruh jenjang jabatan pada Bank berkewajiban melaksanakan penerapan manajemen risiko dalam kegiatan sehari-hari sesuai dengan bidang tugas, wewenang dan tanggung jawabnya; Bank telah menetapkan wewenang dan tanggung jawab yang jelas pada setiap jenjang jabatan terkait dengan penerapan Manajemen Risiko. Bank juga telah mengadopsi Risk Management System Information (RMIS) untuk memastikan transparansi dan integrasi mengenai risiko dari setiap aspek penyelenggaraan TI.', 'Berdasarkan hasil assessment yang telah dilakukan, bank perlu.\n1. mengembangkan sistem yang secara otomatis mengirimkan notifikasi kepada karyawan mengenai tentang perubahan regulasi terkait TI secara up to date, seperti email blast sehingga memastikan semua pihak terkait memiliki informasi yang sama. \n2.  melakukan monitoring atas identifikasi risiko terkait penyelenggaraan TI , seperti bank dapat melakukan pemantauan atas dashboard dan dilakukan update secara berkala\n3. mengembangkan dan memperbarui RMIS dengan fitur-fitur yang mampu mendeteksi dan memantau risiko operasional TI lebih akurat dan real-time, seperti Integrasi dengan sistem lain untuk mendapatkan data yang lebih komprehensif dan laporan otomatis yang memberikan insight tentang kondisi risiko operasional secara berkala.\n4. menyusun daftar lengkap yang mencakup semua infrastruktur informasi vital yang dimiliki oleh bank dengan cara:\n- mengumpulkan data mengenai semua sistem TI, server, jaringan, aplikasi, dan perangkat keras yang digunakan.\n- mengkategorikan infrastruktur berdasarkan tingkat kritikalitas dan fungsi bisnisnya.\n- mendokumentasikan semua infrastruktur informasi vital dalam satu database yang mudah diakses.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(31, 1, 31, '/Fungsi\n- Divisi Teknologi Informasi\n- Manajemen Risiko', 'Laporan RCSA\n- Laporan KRI\n- Dokumen Narasi TI - RBB\n- Laporan tahunan Bank SUMUT 2023\n- Dokumen Profil risiko Divisi TI tahun 2024', 'Kontrol\nBerdasarkan inteview  bersama Divisi Manajemen Risiko, disampaikan bahwa seluruh kegiatan Manajemen Risiko pada kegiatan operasional pada Bank SUMUT dilakukan melalui proses Manajemen Risiko. Proses Manajemen Risiko dimulai dari tahap identifikasi risiko, pengukuran risiko, pemantauan risiko, dan pengendalian risiko secara berkesinambungan. Sistem aplikasi Risk Management Information System (RMIS) Bank SUMUT digunakan  untuk mendukung kegiatan manajemen risiko yang ada di lingkungan Bank.\n\nBank memiliki Risk Register, Loss Event Database  (LED), Key Risk Indicator  (KRI) dan Risk Control Self Assessment (RCSA) dalam kegiatan pengelolaan Risiko Operasional. \n\nBerdasarkan laporan tahunan Bank SUMUT 2023, Pada bagian Mekanisme Mitigasi Risiko Operasional Bank memiliki ketentuan mengenai Penilaian Risiko Penyelenggaraan Teknologi Informasi yang bertujuan untuk memitigasi dan menilai penyelenggaraan teknologi Informasi pada Bank dan merekomendasikan mitigasi-mitigasi yang diperlukan terkait dengan risiko yang mungkin ditimbulkan.', 'Berdasarkan assessment yang telah dilakukan, Bank perlu:\n1. memperkuat cara pengumpulan data dan dokumen terkait dengan semua aktivitas yang berkaitan dengan teknologi informasi, seperti mengulas kembali rencana strategis bisnis, menilai secara menyeluruh kinerja penyedia jasa TI, memeriksa kembali laporan atau keluhan dari nasabah atau pengguna teknologi informasi, melakukan penilaian diri sendiri oleh semua unit kerja terkait pengendalian TI, dan meninjau hasil audit terkait pengelolaan dan penggunaan TI.\n2. lebih menekankan penggunaan dashboard untuk menganalisis risiko TI, yang mencakup semua aspek operasional bank, dengan fokus pada seberapa mungkin risiko tersebut terjadi, dampak yang mungkin timbul, serta efektivitas langkah-langkah mitigasi yang telah atau akan diterapkan.\n3. melakukan pemantauan berkala terhadap tim yang terlibat dalam manajemen risiko TI, serta mengevaluasi kembali seberapa efektif proses dan dashboard yang digunakan dalam mengelola risiko tersebut.\n4. membuat langkah-langkah yang jelas untuk mengelola risiko potensial yang teridentifikasi dalam Risk Register. termasuk merencanakan strategi kontrol dan tindakan mitigasi untuk mengurangi risiko tersebut. Setiap risiko harus dievaluasi apakah akan diterima dengan risikonya, dihindari sepenuhnya, dikendalikan dengan langkah-langkah tertentu, atau ditransfer ke pihak lain.\n5. secara rutin mengidentifikasi teknologi atau sistem kontrol yang dapat digunakan untuk mencegah atau memperbaiki risiko yang tercatat dalam Risk Register.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(32, 1, 32, '/Fungsi\nDivisi Manajemen Risiko', 'Laporan Portofolio Risiko\n- Dokumen Laporan KRI', 'Kontrol\nBerdasarkan Laporan Portofolio Risiko dan hasil interview  dengan Divisi Manajemen Risiko, diketahui bahwa Bank telah melakukan pemantauan atas risiko penyelenggaraan TI dengan mengevaluasi kesesuaian, kecukupan, dan efektivitas kinerja penyelenggaraan TI, khususnya terkait dengan Risiko Siber.\nHal-hal yang dievaluasi adalah :\n- Trafik anomali berdasarkan parameter jenis serangan yang dialami\n- Trafik anomali berdasarakan parameter target serangan\n\nBank juga telah melakukan pengukuran atas efektivitas penyelenggaraan TI dan evaluasi terhadap mitigasi yang dilakukan atas kemungkinan risiko yang terjadi.\n\nBerdasarkan Dokumen Laporan KRI, Bank telah menerapkan Risk Control Self Assessment (RCSA) yang dilakukan oleh masing-masing unit kantor dengan tujuan untuk mengidentifikasi, mengevaluasi, dan mengelola risiko yang ada pada unit kantor tersebut secara efektif.  Salah satu aspek yang diisi dalam RCSA adalah status pelaksanaan (aksi) dari mitigasi risiko yang telah diidentifikasikan unit.', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. memastikan bahwa proses pengendalian risiko teknologi informasi mencakup evaluasi risiko secara menyeluruh, cara penanganan risiko yang sesuai, dan mematuhi semua peraturan hukum yang berlaku.\n2. melakukan peninjauan berkala dengan frekuensi yang  perlu ditingkatkan menjadi minimal bulanan untuk aspek-aspek kritis seperti keamanan TI dan tindak lanjut terhadap kebijakan keamanan informasi yang diterapkan dan memastikan bahwa penyedia jasa teknologi informasi memenuhi standar keamanan yang sesuai. dengan tinfak lanjut meliputi: \n1) pengkinian profil risiko, pengukuran risiko, dan rencana penanganan risiko;\n2) penyempurnaan kebijakan, standar, dan prosedur di bidang TI;\n3) pemenuhan kebutuhan SDM;\n4) penetapan dan pelaksanaan tindakan preventif dan korektif berdasarkan penilaian atas ketidaksesuaian yang ada maupun yang masih bersifat potensi, dengan mempertimbangkan skala prioritas; \n5) pemantauan dan evaluasi atas pelaksanaan tindakan preventif dan korektif; dan\n6) pendokumentasian hasil evaluasi dan tindak lanjut harus secara memadai.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(33, 1, 33, '/Fungsi\nDivisi Manajmen Risiko', 'Pedoman Penerapan Manajemen Risiko Bank Sumut\n- Laporan Tahunan Bank Sumut 2023', 'Kontrol\nBerdasarkan Laporan Tahunan, Bank SUMUT telah melakukan Proses pengendalian risiko disesuaikan dengan eksposur risiko maupun tingkat risiko yang akan diambil dan toleransi risiko yang sudah ditetapkan. Pengendalian risiko dapat dilakukan oleh Bank, antara lain dengan cara mekanisme lindung nilai, asuransi, serta penambahan modal Bank untuk menyerap potensi kerugian maupun metode pengendalian risiko lainnya yang relevan dengan kondisi Bank.\n\nNamun, hal ini belum terdefinisikan pada Pedoman Penerapan Manajemen Risiko yang ada.', 'Berdasarkan assessment yang telah dilakukan, bank perlu:\n1. mendefinisikan mekanisme pengendalian risiko TI dalam Pedoman Penerapan Manajemen Risiko, termasuk:\n- mekanisme lindung nilai, \n- asuransi, \n- penambahan modal Bank untuk menyerap potensi kerugian maupun metode pengendalian risiko lainnya yang relevan dengan kondisi Bank.\n2.  konisten melakukan evaluasi dalam melakukan pengendalian risiko penyelenggaraan TI.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(34, 1, 34, '/Fungsi\nDireksi', 'Laporan Tahunan Bank SUMUT Tahun 2023', 'Kontrol\nBerdasarkan Laporan Tahunan Bank SUMUT Tahun 2023, Direksi mempunyai wewenang dan tugas terhadap pelaksanaan manajemen risiko dalam Bank SUMUT, yaitu bertanggungjawab atas pelaksanaan kebijakan, strategi, dan kerangka Manajemen Risiko yang telah disetujui oleh Dewan Komisaris serta mengevaluasi dan memberikan arahan berdasarkan laporan- laporan yang disampaikan oleh Satuan Kerja Manajemen Risiko Bank SUMUT serta memastikan seluruh Risiko yang material dan dampak yang ditimbulkan oleh Risiko dimaksud telah ditindaklanjuti dan menyampaikan laporan pertanggungjawaban kepada Dewan Komisaris secara berkala.', 'Berdasarkan assessment yang telah dilakukan, bank perlu:\na. direksi perlu memperjelas tujuan dan sasaran sistem informasi manajemen risiko TI secara berkala \nb. melakukan evaluasi perbaikan terkait sistem informasi manajemen risiko terkait penyelenggaraan TI secara berkala \nc. memiliki ketentuan spesifik terkait dengan pengendalian manajemen pangkalan data (database) yang mencakup aspek:\n- prosedur pencadangan (backup), \n- pemulihan (recovery), \n- pengelolaan akses, dan \n- pemantauan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(35, 1, 35, '/Fungsi\nDivisi Teknologi Informasi', '/ Pengaturan\nDokumen Hasil Tingkat Maturitas Keamanan Siber', 'atas Kontrol\nPemenuhan Kontrol atas Domain Tingkat Maturitas Kemanan Siber disadur berdasarkan hasil Dokumen Hasil Tingkat Maturitas Keamanan Siber yang telah dilaksanakan oleh Bank Sumut dan tidak dilakukan penilaian ulang terkait kontrol ini.', NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(36, 1, 36, '/Fungsi\nDivisi Teknologi Informasi', 'Petunjuk Pelaksanaan Pengembangan Teknologi Informasi PT. Bank Sumut\n- Dokumen BRD', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank telah melakukan spesifikasi fungsional atas solusi TI yang sejalan dengan kebutuhan bisnis perusahaan dan melakukan spesifikasi non-fungsional solusi TI, yang terkait dengan keamanan, skalabilitas, integrasi, dan teknologi spesifik lainnya. Proses identifikasi terdefinisikan pada dokumen BRD sebagai landasan atas identifikasi kebutuhan adopsi TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memastikan bahwa proses identifikasi ini terus diperbarui dan disesuaikan dengan dinamika bisnis dan perkembangan teknologi terbaru.\n2. menyertakan lebih banyak detail mengenai metodologi yang digunakan dalam proses ini, serta memastikan bahwa hasilnya terdokumentasi dengan baik dan tersedia untuk pengambilan keputusan\n3. meningkatkan kesadaran dan partisipasi karyawan dalam inisiatif digitalisasi, serta mengukur dampaknya terhadap pencapaian tujuan bisnis.\n4. menetapkan matriks evaluasi untuk mengukur efektivitas kolaborasi dengan pihak ketiga.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44');
INSERT INTO `assessment_control_results` (`id`, `assessment_period_id`, `control_id`, `penjelasan_aktor`, `penjelasan_dokumen`, `penjelasan_kontrol`, `rekomendasi`, `referensi_dokumen`, `review_progress`, `reviewed_by`, `reviewed_at`, `approval_status`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(37, 1, 37, '/Fungsi\nDivisi Teknologi Informasi', 'Business Requirment Definition (BRD) Penambahan Fitur Top Up dan Update Saldo Kartu Uang Elektronik (SMARTCash/TapCash) Melalui Channel Sumut Mobile dan Channel ATM Bank Sumut', 'Kontrol\nPada Dokumen BRD tersebut, potensi dari inovasi yang dihasilkan dari penggunaan TI bagi Bank dan nasabah terdefinisikan pada bagian 1.4 Manfaat Pengembangan yang dimana terdapat poin yang menyatakan bahwa:\na. Manfaat yang diperoleh Mitra\nb. Manfaat yang diperoleh Bank Sumut\nc. Manfaat Bagi Nasabah', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. melakukan analisis yang lebih terperinci mengenai manfaat potensial, termasuk dampak finansial, operasional, dan strategis yang dapat diperoleh dari penggunaan TI yang mencakup:\n- penilaian ROI (Return on Investment)\n- penghematan biaya\n- peningkatan efisiensi operasional\n- peningkatan pengalaman nasabah\n2. Menerapkan mitigasi risiko yang komprehensif mencakup:\n- Menerapkan redundansi pada sistem TI penting untuk memastikan keberlangsungan operasional jika terjadi kegagalan\n3. Memperkuat metode pengukuran dan pemantauan risiko yang mencakup:\n- Menggunakan perangkat lunak manajemen risiko seperti RSA Archer untuk mengidentifikasi, mengevaluasi, dan memantau risiko\n- Melakukan analisis skenario dan uji tekanan (stress testing) untuk mengidentifikasi potensi risiko dan dampaknya\n- Mengembangkan kerangka kerja pemantauan risiko yang mencakup seluruh siklus pengembangan TI.\n4. melakukan perhitungan anggaran lebih rinci untuk setiap tahap implementasi adopsi TI yang mencakup:\n- biaya pengadaan perangkat keras dan perangkat lunak\n- biaya pelatihan\n- biaya operasional\n- biaya pemeliharaan', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(38, 1, 38, '/Fungsi\nDivisi Teknologi Informasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank memiliki proses penyelarasan atau sinergi terhadap implementasi proyek RSTI, yaitu salah satunya dengan Pengembangan Produk dan Layanan Berbasis Teknologi oleh beberapa pihak yang terlibat seperti Inisiatif Owner, Divisi Teknologi Informasi, Supporting Group, dan IT PMO.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mekanisme monitoring dan evaluasi yang lebih komprehensif yang mencakup:\n-  indikator kinerja utama (KPI) yang spesifik\n- metode evaluasi yang terstruktur\n- laporan berkala untuk menilai progres dan mengidentifikasi area yang memerlukan perbaikan\n2. menyusun metode implementasi TI yang spesifik mencakup:\n- identifikasi metode pada contoh dokumen berjudul \"Evaluasi dan Pemilihan Metode Implementasi TI\" yang menjelaskan keuntungan dan kelemahan masing-masing metode serta skenario penggunaan yang sesuai.\n- menyusun definisi rinci untuk setiap metode. Ini termasuk prosedur langkah demi langkah, kriteria keberhasilan, serta alat dan teknik yang digunakan.\n3. menyusun ketentuan terkait penggunaan sistem pendukung atau utama dalam kebijakan yang mencakup:\n- penjelasan kapan sistem pendukung atau utama yang lama harus diberhentikan\n- bagaimana transisi ke sistem baru harus dilakukan', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(39, 1, 39, '/Fungsi\nDivisi Teknologi Informasi', 'Dokumen Sample Post Implementation Review (CBS/Switching)', 'Kontrol\nBerdasarkan hasil review dokumen tersebut dan interview dengan Divisi Teknologi Informasi, diketahui bahwa Bank telah melakukan Post Implementation Review (PIR) dengan tujuan mengidentifikasi kesesuaian antara rencana dan realisasi dari pelaksanaannya.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat proses pemantauan secara terus-menerus terhadap penerapan dan penggunaan TI, serta memastikan bahwa manfaat atau hasil yang diharapkan tercapai sesuai dengan perencanaan awal.\n2. menetapkan periode evaluasi yang jelas dan meluas serta mencakup aspek-aspek kritis yang relevan dengan kebutuhan bisnis Bank.\n3. memastikan perbaikan berkelanjutan atas proses pengembangan TI', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(40, 1, 40, '/Fungsi\n- Divisi Umum\n- Divisi Manajemen Risiko', 'Peraturan PT Bank Sumut tentang Pedoman Pengadaan Barang/Jasa di Lingkungan PT Bank Sumut\n- Pedoman Pengadaan Barang/Jasa', 'Kontrol\nBerdasarkan review terhadap dokumen Peraturan PT Bank Sumut, Bank telah memiliki ketentuan terkait pengelolaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank secara memadai. Berdasarkan interview bersama Divisi Umum disampaikan bahwa proses manajemen risiko terkait penyedia jasa TI dilakukan dalam bentuk penyampaian opini oleh Divisi Manajemen Risiko sebagai bentuk penerapan manajemen risiko sebelum dilakukannya kerja sama dengan penyedia jasa TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. meningkatkan pengaturan yang lebih spesifik untuk mengakomodasi aspek teknis dari penyelenggaraan TI dengan pihak penyedia jasa TI mencakup:\n- aspek keamanan\n- aspek keandalan,\n- aspek kesiapan infrastruktur yang diperlukan.\n2. menyusun kebijakan dan prosedur yang lebih terperinci terkait penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI  mencakup langkah-langkah:\n- evaluasi\n- seleksi\n- pemantauan kinerja\n- mekanisme mitigasi risiko yang dapat diterapkan selama masa kontrak dengan penyedia jasa TI.\n3. mendefinisikan dengan lebih jelas wewenang dan tanggung jawab:\n- Dewan Komisaris\n- Komite Pengarah TI,\n- pejabat tertinggi yang memimpin satuan kerja TI terkait dengan penggunaan pihak penyedia jasa TI.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(41, 1, 41, '/Fungsi\nDivisi Teknologi Informasi,\nDivisi Manajemen Risiko\nDivisi Umum', 'Peraturan PT Bank Sumut tentang Pedoman Pengadaan Barang/Jasa di Lingkungan PT Bank Sumut', 'Kontrol\nBerdasarkan document review dan interview dengan Divisi Teknologi Informasi, disampaikan bahwa proses manajemen risiko terkait penyedia jasa TI dilakukan dalam bentuk penyampaian opini oleh Divisi Manajemen Risiko sebagai bentuk penerapan manajemen risiko sebelum dilakukannya kerja sama dengan penyedia jasa TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat proses evaluasi risiko sebelum kerja sama dimulai dan memastikan bahwa metode evaluasi risiko dapat mengakomodasi risiko khusus yang terkait dengan penggunaan pihak penyedia jasa TI.\n2. menyusun & mengimplementasikan rencana pemulihan bencana (DRP) yang spesifik untuk mempertimbangkan penggunaan pihak penyedia jasa TI  mencakup\n- skenario bencana yang mungkin terjadi\n- langkah-langkah pemulihan yang diharapkan\n- prosedur untuk mengembalikan operasi TI sesuai dengan waktu pemulihan yang ditargetkan.\n3. melakukan audit keamanan secara teratur dan memastikan bahwa semua persyaratan keamanan telah diintegrasikan dalam setiap tahap kerja sama dengan pihak penyedia jasa TI.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(42, 1, 42, '/Fungsi\nDivisi Umum', 'Pedoman Pengadaan Barang / Jasa di Lingkungan PT Bank Sumut', 'Kontrol\nBerdasarkan review dokumen tersebut, terdapat klasifikasi dan kualifikasi penyedia barang/jasa yaitu Prakualifikasi dan Pascakualifikasi.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1.  memastikan bahwa proses pemilihan pihak penyedia jasa TI mencakup evaluasi yang komprehensif terhadap:\n- kualifikasi\n- kompetensi \n2. memperkuat analisis biaya dan manfaat dengan lebih mengintegrasikan tanggapan dan penyesuaian dari Divisi Teknologi Informasi\n3. meningkatkan pendokumentasian terkait komitmen pihak penyedia jasa TI untuk menyampaikan hasil audit TI secara berkala mencakup:\n- pembuatan perjanjian yang jelas dan terukur\n- proses pemantauan yang sistematis terhadap keterpenuhan komitmen tersebut.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(43, 1, 43, '/Fungsi\nDivisi Umum', 'SE Pelaksanaan Barang & Jasa\n- Dokumen PKS', 'Kontrol\nBerdasarkan hasil review dokumen SE Pelaksanaan Barang & Jasa dan Dokumen PKS, dan dikonfirmasi oleh hasil interview dengan Divisi umum terdapat ketentuan terkait kualifikasi dan kompetensi SDM yang dimiliki oleh pihak penyedia jasa.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat komitmen keamanan data dengan menambahkan klausul yang spesifik dalam perjanjian kerja sama dengan pihak penyedia jasa TI. Contohnya:\n- Memastikan bahwa pihak penyedia jasa TI menetapkan kebijakan internal yang ketat terkait pengelolaan keamanan informasi, termasuk mekanisme enkripsi dan pengamanan data.\n- Menyediakan audit keamanan secara berkala yang dilakukan oleh pihak independen untuk memverifikasi kepatuhan terhadap standar keamanan yang ditetapkan.\n2. memperbaiki perjanjian dengan menambahkan kewajiban pihak penyedia jasa TI untuk menyampaikan hasil audit TI secara rutin. Contohnya:\n- Menetapkan jadwal audit tahunan yang melibatkan auditor independen untuk mengevaluasi keamanan sistem, kepatuhan, dan kinerja layanan TI.\n- Menyertakan klausul yang mengharuskan penyedia jasa TI untuk mengirimkan laporan audit secara tertulis dan memberikan rekomendasi perbaikan jika diperlukan.\n3. mengembangkan mekanisme pelaporan kejadian kritis yang lebih terstruktur. Contohnya:\n- Menyediakan formulir atau portal khusus yang dapat diakses oleh pihak penyedia jasa TI untuk melaporkan insiden atau kejadian kritis dengan detail yang jelas.\n- Menetapkan waktu respons yang singkat untuk menanggapi dan menyelesaikan kejadian kritis sesuai dengan SLA yang telah disepakati.\n4. emperkuat perjanjian dengan menambahkan ketentuan yang jelas terkait penghentian perjanjian kerja sama. Contohnya:\n- Menyertakan klausul yang menjelaskan syarat dan prosedur yang harus diikuti baik oleh Bank maupun oleh penyedia jasa TI jika ingin menghentikan kerja sama sebelum jangka waktu perjanjian berakhir.\n- Menetapkan mekanisme negosiasi dan mediasi untuk menyelesaikan sengketa atau perubahan kebutuhan yang mungkin timbul selama masa kerja sama.\n5. memastikan bahwa perjanjian kerja sama mencakup klausul yang memastikan kepatuhan terhadap regulasi dan peraturan yang berlaku. Contohnya:\n-  Menyertakan klausul yang menegaskan bahwa pihak penyedia jasa TI harus mematuhi semua hukum dan peraturan terkait privasi data, keamanan informasi, dan perlindungan konsumen.\nb. Meminta bukti kepatuhan secara berkala dalam bentuk sertifikasi atau laporan audit dari pihak penyedia jasa TI.\n6. menambahkan klausula yang menjamin kelangsungan SLA dalam perjanjian kerja sama. Contohnya:\n- Menyertakan klausul yang menyatakan bahwa SLA yang sudah disepakati akan tetap berlaku dalam situasi perubahan kepemilikan baik pada Bank maupun pada penyedia jasa TI.\n- Memastikan bahwa perubahan kepemilikan tidak akan mempengaruhi kualitas layanan atau komitmen yang telah ditetapkan dalam SLA.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(44, 1, 44, '/Fungsi\nDivisi Sekertariat Perusahaan', NULL, 'Kontrol\nBerdasarkan interview dengan Divisi Umum, Sekertaris Perusahaan dan dengan Divisi Kepatuhan, Dokumen PKS sebelum disahkan wajib dilakukan review dan evaluasi oleh Sekertariat Perusahaan Bagian hukum untuk memastikan ketentuan secara hukum atas kerjasama yang dilakukan sebagai pihak yang berkompeten untuk melakukan evaluasi atas perjanjian kerja sama yang terkait dengan penyediaan jasa TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengembangkan panduan yang komprehensif untuk evaluasi perjanjian kerja sama dengan pihak penyedia jasa TI  mencakup:\n- prosedur yang jelas tentang bagaimana pegawai atau konsultan hukum Bank meninjau ulang setiap perjanjian sebelum ditandatangani.\n2. memastikan bahwa pegawai atau konsultan hukum yang terlibat dalam evaluasi perjanjian memiliki kompetensi yang memadai dalam domain TI dan keamanan data melalui:\n- pelatihan berkala dan pengembangan profesional', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(45, 1, 45, '/Fungsi\nDivisi Teknologi Informasi', 'Sampel Perjanjian Kerjasama antara PT Bank Sumut dengan Veda Praxis', 'Kontrol\nBerdasarkan interview, Bank telah melakukan koordinasi dan komunikasi atas penyelenggaraan kerjasama dengan penyedia jasa TI untuk memastikan kesepakatan atas cakupan kerja dilaksanakan secara sesuai secara berkala.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mendefinisikan prosedur yang spesifik dan terstruktur untuk koordinasi dan komunikasi dengan pihak penyedia jasa TI. Contohnya:\na. Pengembangan TOR yang komprehensif yang mencakup rincian pekerjaan, deliverables, jadwal, dan kriteria keberhasilan yang dapat dijadikan acuan bersama.\nb. review dan persetujuan bersama  oleh semua pihak terkait sebelum dimulainya pekerjaan, untuk meminimalkan risiko kesalahpahaman dan meningkatkan akuntabilitas.\n2. meningkatkan mekanisme transfer knowledge terkait dengan area pekerjaan yang dialihdayakan kepada pihak penyedia jasa TI. contohnya:\na. menyelenggarakan sesi pelatihan reguler atau workshop untuk membahas hasil pekerjaan, teknologi terkini, dan kebijakan keamanan data', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(46, 1, 46, '/Fungsi\nSekretaris Perusahaan', 'Sampel Perjanjian Kerja Sama antara PT Bank Sumut dengan PT FInnet', 'Kontrol\nBerdasarkan hasil interview dengan Sekretaris Perusahaan,  didapatkan informasi bahwa direksi terlibat pada proses pengadaan barang dan jasa dengan memberikan approval untuk memastikan pelaksanaan yang lebih akuntabel.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. meningkatkan dokumentasi tertulis atau laporan mengenai peninjauan klausul perjanjian dengan penyedia jasa TI secara berkala. Contohnya:\na. menyediakan laporan secara periodik yang mengidentifikasi klausul perjanjian yang perlu dinegosiasikan atau diperbaharui, serta justifikasi mengapa perubahan tersebut diperlukan berdasarkan perubahan strategi bisnis Bank\n2. memperkuat koordinasi dan komunikasi dengan pihak penyedia jasa TI terkait penyesuaian perjanjian kerja sama. contohnya:\na. menyelenggarakan pertemuan tatap muka secara berkala dengan pihak penyedia jasa TI untuk membahas penyesuaian klausul perjanjian.\nb. memastikan bahwa semua perubahan atau kesepakatan tertulis secara jelas dalam bentuk surat atau email untuk menghindari kesalahpahaman.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(47, 1, 47, '/Fungsi\nDivisi Umum', 'Sampel Perjanjian Kerja Sama antara PT Bank Sumut dengan PT FInnet', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah menerapkan standar keamanan terkait informasi dalam Perjanjian Kerja Sama (PKS) dengan pihak penyedia jasa TI. Standar ini mencakup pengamanan informasi di masing-masing pihak.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyempurnakan Perjanjian Kerja Sama (PKS) dengan pihak penyedia jasa TI untuk memasukkan standar keamanan informasi yang jelas dan terinci mengatur:\n- penggunaan API\n- lokasi data center yang harus dipatuhi oleh penyedia jasa TI\n- prosedur pemusnahan data/informasi pada akhir perjanjian\n2. menetapkan ketentuan yang mengikat secara hukum mengenai lokasi data center yang harus digunakan oleh penyedia jasa TI yang sesuai dengan kebijakan dan peraturan perundang-undangan yang berlaku.\n3. menambahkan klausul yang mengatur prosedur pemusnahan data nasabah pada akhir periode retensi ke dalam setiap PKS, dengan persyaratan yang spesifik dan jelas', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(48, 1, 48, '/Fungsi\nDivisi Umum', 'Pedoman Pengadaan Barang / Jasa di Lingkungan PT Bank Sumut', 'Kontrol\nBerdasarkan hasil interview dengan Divisi Umum, Bank telah melakukan pemantauan terhadap keandalan pihak penyedia jasa TI pada tahap inisiasi pengadaan barang/jasa.\nNamun, belum ada ketentuan yang secara spesifik mengatur evaluasi terhadap keandalan pihak penyedia jasa TI.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengatur secara spesifik evaluasi (setiap tahun atau setiap periode tertentu) terhadap keandalan dan kinerja pihak penyedia jasa TI dalam kebijakan dan prosedur internal \n2. menambahkan ketentuan dalam PKS yang mengharuskan pihak penyedia jasa TI:\n- menyediakan laporan audit yang dilakukan oleh auditor independen secara berkala\n3. melakukan pemantauan secara berkala terhadap pemenuhan SLA yang disediakan oleh pihak penyedia jasa TI, dengan mengintegrasikan hasil pemantauan ini dalam proses evaluasi kinerja secara keseluruhan.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(49, 1, 49, '/Fungsi\nDivisi Teknologi Informasi\nDivisi Manajemen Risiko', 'Petunjuk Pelaksanaan Operasional TI Bank Sumut', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank telah menetapkan RTO (Recovery Time Objective) dan RPO (Recovery Point Objective) per layanan dan per sumber daya TI, serta mengklasifikasikan kritikalitas layanan berdasarkan RTO dan RPO tersebut.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat proses BCP dengan mengintegrasikan persyaratan RTO dan RPO dari setiap layanan yang disediakan oleh pihak penyedia jasa TI misalnya:\n-  Tim manajemen risiko dan tim TI akan bekerja sama untuk mengidentifikasi kebutuhan RTO dan RPO berdasarkan kritikalitas layanan dan potensi dampaknya terhadap operasional Bank\n- Setelah RTO dan RPO ditetapkan, informasi ini akan diintegrasikan ke dalam rencana BCP\n2. menyusun rencana prosedur pengujian BCP yang melibatkan pihak penyedia jasa TI  mencakup:\n- jadwal pengujian\n- tujuan pengujian\n- skenario pengujian\n- pihak-pihak yang terlibat.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(50, 1, 50, '/Fungsi\nDivisi Pengawasan', 'Rencana Audit Tahunan', 'Kontrol\nBerdasarkan interview dengan Divisi Pengawasan, Bank telah melakukan pemantauan berkala atas DC/DRC untuk melakukan pengecekan atas kondisi riil yang ada dan menyampaikan temuan untuk segera dipenuhi oleh penyedia jasa TI\n\nNamun, Bank belum memiliki rencana kerja tahunan audit intern yang mencakup pemeriksaan berkala terhadap proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengembangkan dan menetapkan rencana kerja tahunan audit intern yang mencakup:\n- pemeriksaan berkala terhadap proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI.\n2. menyusun prosedur audit yang spesifik terkait dengan pihak penyedia jasa TI  mencakup:\n- penugasan audit baik oleh tim audit intern Bank maupun pihak audit ekstern yang ditunjuk\n- jelasnya tahapan audit yang mencakup seluruh proses kerja sama.\n3. meningkatkan cakupan dan kedalaman audit terhadap proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI  mencakup:\n- semua aspek yang signifikan terkait dengan aktivitas penyelenggaraan TI Bank\n4. memastikan bahwa auditor intern memiliki kompetensi yang sesuai dengan kompleksitas aktivitas pihak penyedia jasa TI.\n5. meningkatkan kelengkapan dokumentasi atas audit yang dilakukan termasuk:\n- cakupan\n- prosedur\n- temuan audit,\n- tanggapan manajemen terhadap temuan audit', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(51, 1, 51, '/Fungsi\nDivisi Teknologi Informasi', 'Sampel Perjanjian Kerjasama antara PT Finnet Indonesia dengan PT Bank Pembangunan Daerah Sumatera Utara tentang Penyedia Layanan Multibiller Pada Channel Secara Host to Host.', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah memasukkan ketentuan penghentian penggunaan pihak penyedia jasa TI dalam dokumen Perjanjian Kerja Sama (PKS).\n\nNamun, Bank belum memiliki kebijakan dan prosedur internal yang spesifik mengenai rencana penghentian penggunaan pihak penyedia jasa TI berdasarkan kondisi tertentu', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun kebijakan dan prosedur internal dengan mengumpulkan tim lintas departemen yang mempertimbangkan kondisi-kondisi yang memicu penghentian seperti:\n- masalah kinerja\n- insolvensi\n- pelanggaran hukum\n2. merencanakan pengujian atau simulasi rutin terhadap ketahanan dan kelangsungan bisnis terkait layanan yang diserahkan kepada pihak penyedia jasa TI.\n3. memastikan bahwa semua proses penghentian penggunaan pihak penyedia jasa TI didokumentasikan secara lengkap dan konsisten mencakup:\n- pembuatan template laporan audit yang standar\n- catatan rapat tim penghentian vendor\n- evaluasi hasil pengujian kelangsungan bisnis', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(52, 1, 52, '/Fungsi\nDivisi Teknologi Informasi', 'SOP Pengamanan Informasi dalam Penggunaan TI\n- SOP Manajemen Data', 'Kontrol\nBerdasarkan hasil revirew dokumen tersebut, Bank telah menyusun kebijakan dan melaksanakan kegiatan operasional pengelolaan data/informasi.\n\nNamun, Bank belum memiliki ketentuan khusus terkait pengelolaan kualitas data', 'Bank perlu membuat Dokumen Standar Operasional terkait pengelolaan data.\nAspek-aspek yang perlu diperhatikan:\n- mekanisme & persyaratan pengumpulan, penyimpanan, pemrosesan, dan penghapusan data;\n- RACI atas pengelolaan data;\n- ketentuan Direksi & Komisaris mengkaji serta menyetujui prinsip pengelolaan data yang dijalankan;\n- klasifikasi data/informasi;\n- kritikalitas data;\n- spesifikasi penerapan kontrol kualitas data (akurasi, validasi, kelengkapan); dan\n- aktivitas pengawasan dan pemantauan atas pengelolaan data (data audit).', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(53, 1, 53, '/Fungsi\nDivisi Teknologi Informasi & APU PPT', 'Standarisasi Data Customer ldentification File (CIF) dan Produk di Lingkungan PT Bank Sumut\nProsedur Customer Due Dilligence (CDD) Yang Lebih Sederhana Terhadap Calon Nasabah', 'Kontrol\nBerdasarkan hasil review dokumen tersebut, Bank sudah memiliki standar, persyaratan, dan spesifikasi penerapan kontrol kualitas data.', 'Bank perlu membuat Dokumen Standar Operasional terkait pengelolaan data.\nAspek-aspek yang perlu diperhatikan:\n- mekanisme & persyaratan pengumpulan, penyimpanan, pemrosesan, dan penghapusan data;\n- RACI atas pengelolaan data;\n- ketentuan Direksi & Komisaris mengkaji serta menyetujui prinsip pengelolaan data yang dijalankan;\n- klasifikasi data/informasi;\n- kritikalitas data;\n- spesifikasi penerapan kontrol kualitas data (akurasi, validasi, kelengkapan); dan\n- aktivitas pengawasan dan pemantauan atas pengelolaan data (data audit).', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(54, 1, 54, '/Fungsi\nDivisi Teknologi Informasi', 'Standarisasi Data Customer ldentification File (CIF) dan Produk di Lingkungan PT Bank Sumut\nProsedur Customer Due Dilligence (CDD) Yang Lebih Sederhana Terhadap Calon Nasabah', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah menetapkan kebijakan manajemen data\n\nNamun, kebijakan ini belum mencakup ketentuan terkait pembuatan, akuisisi, keamanan, kualitas, dan penggunaan data dan informasi', 'Bank perlu membuat Dokumen Standar Operasional terkait pengelolaan data.\nAspek-aspek yang perlu diperhatikan:\n1. mekanisme & persyaratan pengumpulan, penyimpanan, pemrosesan, dan penghapusan data sesuai dengan klasifikasinya;\n- hak dan kewajiban pemilik data;\n- hal dan kewajiban pemroses data;\n2. ketentuan klasifikasi data/informasi termasuk terkait data pribadi merujuk pada UU No. 27 PDP;\n- kritikalitas & sensitivitas data;\n- mekanisme pengamanan data sesuai klasifikasinya;\n- mekanisme kontrol akses data sesuai klasifikasinya;\n3. RACI atas pengelolaan data;\n- ketentuan Direksi & Komisaris mengkaji serta menyetujui prinsip pengelolaan data yang dijalankan;\n4. spesifikasi penerapan kontrol kualitas data (akurasi, validasi, kelengkapan)\n5. Identifikasi risiko dan dampak atas masing-masing klasifikasi data; dan\n6. aktivitas pengawasan dan pemantauan atas pengelolaan data (ex: data audit)\n- pelaporan (pelaporan setiap pemrosesan data kritikal, pelaporan kebocoran data)\n- pemantauan\n- pengawasan', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(55, 1, 55, '/Fungsi\nDivisi Teknologi Informasi', 'Dokumen Rencana Strategis TI Bank Sumut 2020-2024', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah memiliki dan melakukan pemutakhiran atas arsitektur data yang menjadi bagian dari Arsitektur TI.', 'Bank perlu membuat Dokumen Standar Operasional terkait pengelolaan data.\nAspek-aspek yang perlu diperhatikan:\n1. mekanisme & persyaratan pengumpulan, penyimpanan, pemrosesan, retensi dan penghapusan data sesuai dengan klasifikasinya;\n- integrasi dan interoperabilitas data (penggunaan API, integrasi sistem)\n- hak dan kewajiban pemilik data\n- hal dan kewajiban pemroses data\n- pengelolaan penyimpanan data pada Database\n2. ketentuan klasifikasi data/informasi termasuk terkait data pribadi merujuk pada UU No. 27 PDP;\n- Klasifikasi data pribadi meliputi, data umum & data spesifik; dan\n- pengelolaan data pribadi sesuai dengan klasifikasinya.\n- kritikalitas & sensitivitas data;\n- mekanisme pengamanan data sesuai klasifikasinya;\n- mekanisme kontrol akses data sesuai klasifikasinya;\n3. RACI atas pengelolaan data;\n- ketentuan Direksi & Komisaris mengkaji serta menyetujui prinsip pengelolaan data yang dijalankan;\n4. spesifikasi penerapan kontrol kualitas data (akurasi, validasi, kelengkapan)\n5. Identifikasi risiko dan dampak atas masing-masing klasifikasi data; dan\n6. aktivitas pengawasan dan pemantauan atas pengelolaan data (ex: data audit)\n- pelaporan (pelaporan setiap pemrosesan data kritikal, pelaporan kebocoran data)\n- pemantauan\n- pengawasan', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(56, 1, 56, '/Fungsi\nDivisi Teknologi Informasi', NULL, 'Kontrol\nBerdasarkan hasil interview dengan Divisi teknologi Informasi, Bank telah mengelola teknologi pangkalan data (database) dengan baik dan melakukan proses evaluasi secara berkala pada pangkalan data yang terdapat di Data Center (DC) dan Disaster Recovery Center (DRC)\n\nNamun, dokumentasi terkait perencanaan, pengelolaan, dan proses evaluasi teknologi pangkalan data belum dilakukan secara konsisten', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun dokumen perencanaan teknologi pangkalan data yang mencakup:\n- analisis kebutuhan kapasitas penyimpanan\n- pemilihan teknologi database yang sesuai dengan kebutuhan bisnis\n- rencana jangka panjang untuk pengembangan infrastruktur pangkalan data\n2. menyusun pengelolaan teknologi pangkalan data mencakup:\n- pemeliharaan rutin\n- pembaruan perangkat lunak\n- pengelolaan akses pengguna\n- penanganan insiden terkait pangkalan data\n3. menyusun proses evaluasi:\n- audit performa\n- kepatuhan terhadap kebijakan keamanan informasi\n- penilaian risiko', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(57, 1, 57, '/Fungsi\nSekretaris Perusahaan', 'Peraturan Direksi terkait penggunaan data pribadi konsumen Bank Sumut\nPBS Pelindungan Data Pribadi\n- SK/SE terkait Pelindungan Data Pribadi', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah menerapkan langkah-langkah untuk melindungi data pribadi dari gangguan pemrosesan yang tidak sesuai.\n\nBank sudah memenuhi ketentuan yang tercantum dalam peraturan perundang-undangan UU No. 27 tentang Pelindungan Data Pribadi, namun belum ada mekanisme/ketentuan tata cara pelaksanaan secara spesifik', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat penyusunan dan penerapan langkah-langkah untuk melindungi data pribadi secara komprehensif sesuai dengan ketentuan yang diatur dalam UU No. 27 tahun 2019 tentang Pelindungan Data Pribadi\n2. mengkaji ulang dan memperbarui implementasi keamanan data pribadi agar sepenuhnya memenuhi standar dan ketentuan yang diharuskan oleh peraturan perundang-undangan terkait.\n3. memperkuat sistem monitoring dan evaluasi terhadap kebijakan keamanan data pribadi \n4. melakukan audit secara rutin terhadap kepatuhan terhadap kebijakan keamanan data pribadi', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(58, 1, 58, '/Fungsi\nDivisi Operasional', 'formulir pembukaan rekening\n- SK & SE terkait Pelindungan Data Pribadi', 'Kontrol\nBerdasarkan hasil interview dengan Sekretaris Perusahaan, Bank telah menerapkan prosedur permintaan consent untuk pemrosesan data pribadi saat nasabah atau calon nasabah mendaftar untuk pembukaan rekening produk Bank dan sudah menerapkan berdasarkan UU No. 27 Tahun 2022 mengenai Perlindungan Data Pribadi, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Memperkuat Proses Identifikasi Dasar Pemrosesan Data Pribadi mencakup:\n- persetujuan\n- pemenuhan kewajiban perjanjian\n- pemenuhan kewajiban hukum\n- pelindungan kepentingan vital\n- pelaksanaan tugas dalam rangka kepentingan umum\n- pemenuhan kepentingan lain yang sah\n2. meningkatkan  implementasi prosedur permintaan persetujuan (consent) dari nasabah atau calon nasabah untuk pemrosesan data pribadi, sehingga sesuai dengan standar yang diatur dalam peraturan perundang-undangan\n3. Memperkuat Implementasi proses permintaan consent yang mencakup:\n- penyempurnaan formulir permintaan consent yang disediakan kepada nasabah atau calon nasabah\n-  prosedur verifikasi identitas nasabah atau calon nasabah telah diintegrasikan ke dalam proses permintaan consent\n4. Menyempurnakan dokumentasi dan pelaksanaan pemenuhan kewajiban perjanjian yang mencakup:\n- mengembangkan template perjanjian yang mengacu pada UU No. 27 tahun 2019 tentang Pelindungan Data Pribadi\n- melakukan audit internal terhadap semua dokumen perjanjian yang telah dibuat', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(59, 1, 59, '/Fungsi\nSekretaris Perusahaan', 'Formulir pembukaan rekening\nMemorandum Divisi Operasional (283/DOps-SPO/MM/2024)\nPBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut', 'Kontrol\nBerdasarkan hasil interview dengan Sekretaris Perusahaan, Bank telah mengimplementasikan Form Persetujuan Nasabah yang mewajibkan nasabah untuk memberikan persetujuan secara langsung dengan tanda tangan.\n\nBerdasarkan hasil interview dengan Sekretaris Perusahaan, Bank telah mengimplementasikan Form Persetujuan Nasabah yang mewajibkan nasabah untuk memberikan persetujuan secara langsung dengan tanda tangan, bank sudah memiliki  mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperkuat implementasi aturan yang mengakomodir UU PDP yang mencakup:\n- prosedur permintaan persetujuan nasabah dengan menyertakan kotak centang (tick box) dalam form persetujuan\n- menetapkan aturan yang jelas terkait penggunaan dan penyimpanan data pribadi.\n- Mengembangkan aturan yang spesifik untuk memberikan informasi legalitas terkait pemrosesan data pribadi\n- memastikan bahwa penghapusan data pribadi dilakukan setelah masa retensi data pribadi berakhir, hanya untuk kepentingan maintenance/audit/rekam jejak sesuai dengan peraturan perundang-undangan', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(60, 1, 60, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut', 'Kontrol\nBank sudahmengadopsi kebijakan khusus yang mengakomodir ketentuan UU PDP. Saat ini, Bank sudah memiliki aturan yang jelas terkait menerapkan sistem pencatatan yang mendokumentasikan secara akurat mengenai kapan dan bagaimana persetujuan nasabah dan/atau calon nasabah diperoleh tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1.  menggunakan sistem elektronik untuk mencatat secara otomatis waktu dan metode perolehan persetujuan nasabah misalnya:\n- OneTrust\n- TrustArc\n- Cookiebot\n2. Menggunakan penyimpanan elektronik yang aman untuk menyimpan catatan persetujuan nasabah misalnya DMS (Document Management System) seperti:\n- SharePoint\n- Alfresco\n3. Menetapkan tim internal yang bertanggung jawab untuk secara teratur memeriksa kepatuhan terhadap persetujuan nasabah misalnya Audit Management Software seperti:\n-  ACL GRC\n- TeamMate\n- AuditBoard\n4. Menetapkan jadwal pembaruan persetujuan nasabah secara rutin\n5. Menyediakan platform online yang memungkinkan nasabah untuk dengan mudah menarik persetujuan seperti:\n- Website Bank\n- Dokumen informasi nasabah\n- Aplikasi Mobile Banking', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(61, 1, 61, '/Fungsi\nDivisi Umum', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank sudah memuat informasi spesifik mengenai pemrosesan data pribadi, termasuk ruang lingkup dan durasi pemrosesan, sifat dan tujuan pemrosesan, jenis data pribadi dan kategori data nasabah, serta kewajiban dan hak pengendali data. tertuang dalam  PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Memastikan bahwa setiap kerja sama dengan pihak ketiga dalam aktivitas pemrosesan data pribadi mencakup:\n- Ruang Lingkup Pemrosesan:\n\"Bank dan Pihak Ketiga sepakat bahwa ruang lingkup pemrosesan data pribadi mencakup informasi terkait [spesifikasi data]\"\n- Sifat dan Tujuan Pemrosesan Data:\n\" Pihak Ketiga setuju untuk memproses data pribadi yang diperlukan untuk [tujuan pemrosesan, misalnya: pengelolaan akun nasabah, analisis risiko kredit, dll.].\"\n\"Pemrosesan data dilakukan sesuai dengan kebutuhan Bank untuk menyediakan layanan yang diminta oleh nasabah.\"\n- Jenis Data Pribadi dan Kategori Data Nasabah:\n\"Data pribadi yang diproses mencakup namun tidak terbatas pada: informasi identitas pribadi, informasi keuangan, riwayat transaksi, dan informasi lain yang relevan untuk tujuan pemrosesan yang disepakati.\"\n- Kewajiban dan Hak Pengendali Data:\n\" Bank bertanggung jawab untuk memastikan bahwa Pihak Ketiga mematuhi semua ketentuan hukum yang berlaku terkait dengan pemrosesan data pribadi.\"', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(62, 1, 62, '/Fungsi\nDivisi Operasional dan Divisi Dana & Jasa', 'Formulir Pembukaan rekening\nPBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan hasil interview dengan Divisi Dana dan Jasa, Bank telah melakukan pengambilan persetujuan atau consent kepada nasabah.\nBank sudah secara konsisten mendokumentasikan hal ini sesuai dengan persyaratan Undang-Undang Data Pribadi. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Proses Identifikasi Tujuan Pengumpulan dan Pemrosesan Data Pribadi misalnya:\n- saat nasabah mengajukan permohonan kartu kredit, tujuan dapat diidentifikasi sebagai evaluasi kelayakan kredit\n2. Memperbaiki Dokumentasi Tujuan Pemrosesan Data Pribadi misalnya:\n- memperbarui template formulir permohonan kartu kredit untuk mencantumkan dengan jelas tujuan pengumpulan data pribadi nasabah\n3. Menyempurnakan Informasi kepada Nasabah/Calon Nasabah misalnya:\n- meningkatkan brosur informasi kepada calon nasabah mengenai mencantumkan penggunaan data untuk analisis risiko kredit\n4. mengembangkan format standar untuk mengidentifikasi tujuan dari setiap pengumpulan data pribadi yang mencakup:\n- tujuan pengumpulan data pribadi jelas dan spesifik.\n- kategori dan jenis data yang dikumpulkan\n- dilakukan secara sah dan sesuai dengan peraturan perundang-undangan yang berlaku\n- menyediakan informasi yang jelas kepada nasabah mengenai tujuan pengumpulan data\n- penggunaan data hanya untuk tujuan yang sudah ditentukan.\n- menerapkan langkah-langkah keamanan yang tepat untuk melindungi data pribadi', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(63, 1, 63, '/Fungsi\nDivisi Dana & Jasa', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan khusus yang mengatur pengelolaan data pribadi, termasuk prosedur untuk memastikan akurasi data pribadi yang dikumpulkan dan merekam sumber perolehan data pribadi yang dimiliki. hal ini tertuang  dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1.  mengadopsi prosedur yang memastikan akurasi data pribadi yang dikumpulkan dan merekam dengan jelas sumber perolehan data tersebut mencakup:\n- langkah-langkah verifikasi yang ketat melalui dokumen resmi atau sumber yang terpercaya\n- mencatat tanggal dan jenis informasi yang dikumpulkan dari nasabah, seperti formulir aplikasi atau interaksi langsung\n2. memiliki prosedur yang jelas terkait proses perubahan data pribadi mencakup:\n-  formulir perubahan data atau akses ke portal online \n- meminta bukti atau dokumen pendukung yang relevan kepada nasabah\n3. mengimplementasikan sistem audit trail yang efektif untuk mencatat setiap perubahan data pribadi mencakup:\n- pencatatan otomatis seperti waktu perubahan, jenis perubahan, dan pengguna yang melakukan perubahan tersebut\n- audit trail dapat diakses dan dimonitor secara teratur oleh pihak yang berwenang\n4. Hak Nasabah untuk Mengelola Data Pribadi mencakup:\n- akses ke portal self-service\n- menyediakan panduan yang jelas kepada nasabah tentang cara melaksanakan hak tersebut', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(64, 1, 64, '/Fungsi\nDivisi Dana & Jasa', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan yang sesuai dengan UU PDP dan belum terdapat mekanisme pengkinian, perbaikan, penghapusan, dan pemusnahan data pribadi nasabah. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Mengembangkan Kebijakan Pengkinian, Perbaikan, Penghapusan, dan Pemusnahan Data Pribadi Nasabah mencakup:\n- langkah-langkah detail tentang bagaimana nasabah dapat mengajukan permintaan perubahan data\n- batas waktu untuk pemrosesan permintaan\n- tindakan yang diambil untuk memverifikasi keabsahan permintaan tersebut.\n2. Menerapkan Kebijakan atau Prosedur Penolakan Permintaan Perubahan Data mencakup:\n- alasan-alasan yang dapat diterima untuk menolak permintaan\n- cara komunikasi yang jelas kepada nasabah mengenai keputusan penolakan tersebut\n3. Menyusun Prosedur Komunikasi kepada Nasabah dalam hal pengkinian, perbaikan, penghapusan, atau pemusnahan yang mencakup:\n- alasan\n- waktu\n- dampak dari tindakan yang dilakukan terhadap data pribadi nasabah', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(65, 1, 65, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan atau pengaturan yang memenuhi persyaratan UU PDP terkait dengan klasifikasi data pribadi nasabah, dan belum ada dokumentasi yang menunjukkan adanya klasifikasi tersebut. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengklasifikasikan data pribadi nasabah berdasarkan tingkat sensitivitasnya, misalnya:\n- nama lengkap\n- alamat\n- nomor identitas\n2. menetapkan jangka waktu retensi data pribadi nasabah berdasarkan pada regulasi perundang-undangan dan kebutuhan internal, misalnya:\n- data transaksi keuangan disimpan selama 5 tahun setelah hubungan dengan nasabah berakhir\n- data pribadi nasabah akan disimpan selama periode tertentu setelah pemrosesan selesai sesuai dengan kebutuhan operasional dan hukum yang berlaku\n3. mengidentifikasi data pribadi yang diperlukan untuk keperluan riset dan statistik disaring secara anonim atau diagregat sebelum digunakan untuk memastikan kerahasiaan dan privasi nasabah terjaga', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(66, 1, 66, '/Fungsi\nDivisi Teknologi Informasi', 'SOP Pengamanan Informasi dalam Penggunaan TI PT Bank Sumut\nPBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah memiliki kebijakan informasi yang terdokumentasi.\nBank sudah memiliki kebijakan secara khusus mencakup aspek keamanan data pribadi. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. memperbarui kebijakan keamanan data pribadi untuk mencakup aspek:\n- kontrol akses\n- penggunaan data\n- penyimpanan data yang sensitif.\n2. meningkatkan frekuensi peninjauan kebijakan keamanan data pribadi:\n- peninjauan rutin setiap enam bulan\n- peninjauan rutin setiap tiga bulan\n3. menyesuaikan implemtasi enkripsi dan pseudonimisasi data pribadi nasabah mencakup:\n- jaringan internal\n- jaringan eksternal\n- memperbarui algoritma enkripsi sesuai\n4. menyusun pengujian sistem keamanan data pribadi secara berkala mencakup:\n- penetapan jadwal pengujian\n- metodologi pengujian\n- pelaksanaan pengujian\n- evaluasi hasil pengujian\n- pelaporan dan tindak lanjut', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(67, 1, 67, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan atau pengaturan yang memenuhi persyaratan UU PDP terkait dengan identifikasi kriteria data pribadi yang berisiko tinggi.  hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengadopsi kriteria berikut untuk mengidentifikasi data pribadi yang berisiko tinggi mencakup:\n- sensitivitas data\n- jumlah data\n- potensi dampak negatif\n2. penilaian dampak yang terstruktur ketika akan memproses data pribadi yang berisiko tinggi mencakup:\n- identifikasi potensi ancaman\n- evaluasi kerentanan\n- penentuan dampak (termasuk dampak finansial, reputasi, dsb)\n- pengendalian dan mitigasi\n3. Penyusunan Data Privacy Impact Analysis (DPIA) atau Penilaian Dampan (PD PDP) sesuai dengan persyaratan UU No. 27 tentang PDP.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(68, 1, 68, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan atau pengaturan yang memenuhi persyaratan UU PDP terkait dengan dokumentasi aktivitas pemrosesan data pribadi oleh Bank. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut, bank sudah memiliki mekanisme/ketentuan tata cara pelaksanaannya', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengadopsi prosedur yang sistematis untuk mendokumentasikan setiap aktivitas pemrosesan data pribadi mencakup:\n- jenis data yang diproses\n- tujuan penggunaan data\n- waktu dan lokasi pemrosesan\n- identitas petugas yang melakukan pemrosesan.\n- dasar hukum pemrosesan\n2. menyediakan dokumen pemberitahuan privasi yang mencakup:\n- informasi tentang penggunaan data pribadi\n- hak-hak nasabah terkait data pribadi\n- kontak untuk pertanyaan lebih lanjut\n3. menggunakan sistem manajemen dokumen elektronik yang memungkinkan pengelolaan data pribadi secara efisien termasuk:\n- menambah\n- menghapus\n- mengubah informasi dengan mudah.\n4. Penyusunan Record of Processing Activities (RoPA) atau Perekaman Kegiatan PDP (PK PDP) sesuai dengan persyaratan UU No. 27 tentang PDP.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(69, 1, 69, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan interview dengan Sekretaris Perusahaan, Bank telah memberikan informasi kepada nasabah mengenai tujuan permintaan dan penggunaan data pribadi nasabah, yang terdokumentasikan dalam formulir yang diisi oleh nasabah/calon nasabah, baik dalam bentuk formulir digital maupun manual\n\nBank sudah memiliki prosedur yang terdokumentasi terkait pemberian informasi pemrosesan data kepada nasabah. hal ini tertuang dalam  PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. mengadopsi prosedur berikut untuk memberikan informasi yang jelas kepada nasabah tentang pemrosesan data pribadi yang mencakup:\n- prosedur penyusunan informasi (termasuk identitas yang mengumpulkan data, tujuan pengumpulan, dasar hukum, dan penggunaan data tersebut.)\n- formulir standar\n2. memperbarui format informasi yang disampaikan kepada nasabah yang mencakup:\n- menyediakan dokumen elektronik yang dapat diunduh oleh nasabah\n- menyediakan informasi yang sama di website dan portal nasabah\n- menggunakan bahasa sederhana dan menjelaskan istilah teknis', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(70, 1, 70, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan atau pengaturan yang memenuhi persyaratan UU PDP terkait dengan permintaan akses data pribadi yang dikelola oleh Bank. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun kebijakan tertulis permintaan akses data pribadi yang mencakup:\n- Formulir standar untuk pengajuan akses data pribadi yang dapat diisi nasabah.\nProses verifikasi yang mencakup langkah-langkah untuk memvalidasi identitas nasabah yang mengajukan permintaan.\nProsedur untuk mengelola dan merespons permintaan akses dalam waktu yang ditentukan\n2.  mengimplementasikan prosedur verifikasi yang mencakup:\n- Verifikasi identitas nasabah melalui informasi pribadi yang diberikan, seperti nomor identitas atau informasi lain yang relevan.\n- Penggunaan sistem keamanan yang aman untuk menghindari akses yang tidak sah atau penyalahgunaan data pribadi nasabah.\n3. mengklasifikasikan kondisi yang memungkinkan untuk penolakan permintaan akses, seperti:\n- Situasi di mana pengungkapan informasi dapat membahayakan kepentingan pribadi nasabah atau pihak ketiga.\n- Kebutuhan untuk mematuhi undang-undang yang mengatur perlindungan data pribadi.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44');
INSERT INTO `assessment_control_results` (`id`, `assessment_period_id`, `control_id`, `penjelasan_aktor`, `penjelasan_dokumen`, `penjelasan_kontrol`, `rekomendasi`, `referensi_dokumen`, `review_progress`, `reviewed_by`, `reviewed_at`, `approval_status`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(71, 1, 71, '/Fungsi\nSekretaris Perusahaan', 'PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBank sudah memiliki kebijakan atau pengaturan yang memenuhi persyaratan UU PDP terkait dengan penanganan permintaan nasabah untuk pembatasan pemrosesan data pribadi. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n\n1. menyusun kebijakan yang mengatur bahwa setiap permintaan nasabah untuk pembatasan pemrosesan data pribadi harus diajukan secara tertulis\n\"Nasabah dapat mengajukan permintaan pembatasan pemrosesan data pribadi melalui formulir yang tersedia di situs web Bank atau di kantor cabang terdekat. Permintaan ini harus disertakan dengan identifikasi yang sah untuk verifikasi.\"\n2. menetapkan batas waktu menanggapi permintaan\n\" Bank akan menanggapi setiap permintaan pembatasan pemrosesan data pribadi dalam waktu maksimal 30 hari kerja. Jika terjadi keterlambatan yang disebabkan oleh kebutuhan untuk verifikasi tambahan atau kompleksitas permintaan, nasabah akan diberitahukan tentang alasan keterlambatan dan waktu tambahan yang diperlukan\"\n3. Pembatasan Pemrosesan Data Pribadi di Sistem Bank\n\"Setiap permintaan pembatasan pemrosesan data pribadi akan diimplementasikan dalam sistem kami dengan mengaktifkan fitur pembatasan akses ke data yang relevan. Tim IT akan memastikan bahwa setiap akses berikutnya ke data pribadi yang dibatasi akan memerlukan otorisasi tambahan dari manajemen yang berwenang\"\n4. informasi kepada pihak ketiga\n\"Ketika Bank menerapkan pembatasan pemrosesan data pribadi, pihak ketiga yang terlibat akan menerima pemberitahuan tertulis yang menjelaskan batasan yang berlaku. Pihak ketiga diharapkan untuk mengikuti kebijakan ini sesuai dengan perjanjian kerja sama yang berlaku antara Bank dan pihak ketiga.\"\"', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(72, 1, 72, '/Fungsi\nSekretaris Perusahaan', 'Dokumen Peraturan Bank Sumut terkait Transparansi Penggunaan Produk\nPBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah mengatur prosedur mengenai permintaan persetujuan konsumen Bank untuk memberikan data kepada pihak lain serta menjelaskan tujuan dan konsekuensi dari persetujuan yang diberikan oleh nasabah\n\nBank sudah memiliki kebijakan resmi untuk mentransfer data pribadi milik nasabah kepada pihak ketiga yang dimulai dari permintaan nasabah. Selain itu, Bank juga belum memiliki pengaturan yang memenuhi persyaratan UU PDP terkait hal ini. hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut. Bank  memiliki mekanisme secara khusus terkait penanganan permintaan nasabah untuk mentransfer data pribadi milik nasabah kepada pihak ketiga telah memadai', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun prosedur penanganan permintaan nasabah untuk mentransfer data pribadi milik nasabah ke pihak ketiga mencakup:\n-  penggunaan formulir standar yang memuat informasi verifikasi identitas dan persetujuan nasabah\n- penjelasan mengenai tujuan penggunaan data pribadi oleh pihak ketiga\n- menggunakan protokol enkripsi untuk melindungi data selama pengiriman.\n- mengatur kriteria untuk menolak permintaan transfer data pribadi seperti jika tidak ada persetujuan nasabah', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(73, 1, 73, '/Fungsi\nSekretaris Perusahaan', 'Dokumen Peraturan Bank Sumut terkait Transparansi Penggunaan Produk\n- PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah mengatur transparansi penggunaan data pribadi konsumen dengan menyampaikan kewajiban Bank untuk meminta persetujuan serta menjelaskan tujuan dan konsekuensi dari persetujuan yang diberikan nasabah. Informasi ini disampaikan kepada nasabah melalui dokumen terpisah dari formulir syarat umum pembukaan rekening dan/atau dipublikasikan di situs resmi Bank.\n\nBank sudah memiliki pengaturan khusus untuk mengakomodir ketentuan UU PDP terkait hal ini dan sudah memiliki kebijakan atau prosedur bagi nasabah untuk mengajukan keberatan atas pemrosesan data pribadi secara otomatis.  hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut. Bank memiliki mekanisme secara khusus terkait nasabah untuk mengajukan keberatan atas pemrosesan data pribadi secara otomatis telah memadai', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1.  kebijakan dan prosedur yang memungkinkan nasabah untuk mengajukan keberatan misalnya:\n- menyediakan formulir online dan offline yang mudah diakses \n- menyampaikan penolakan kepada nasabah secara tertulis\n- memperbarui pemberitahuan privasi dan materi komunikasi lainnya (seperti brosur dan website Bank)', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(74, 1, 74, '/Fungsi\nDivisi Teknologi Informasi', 'PBS 004/Dir/DMR-MROL/L/2024 tentang Pelindungan Data Pribadi', 'Kontrol\nBank sudah memiliki kebijakan / prosedur dalam hal mengidentifikasi jenis data nasabah yang digunakan untuk pertukaran atau transfer data/informasi. hal ini tertuang dalam PBS 004/Dir/DMR-MROL/L/2024 tentang Pelindungan Data Pribadi. Namun, mekanisme secara khusus terkait pertukaran atau transfer data dan informasi berdasarkan  jenis data nasabah untuk pertukaran atau transfer data dan informasi belum memadai', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menentukan jenis data pribadi yang dapat dipertukarkan atau ditransfer seperti:\n- nama\n- alamat\n- nomor telepon\n- informasi akun, dll\n2. sistem persetujuan digital  melalui aplikasi perbankan online atau platform digital lainnya\n3. menetapkan form permintaan informasi yang harus diisi oleh pihak ekstern\n4. menyediakan materi edukasi yang mudah diakses oleh nasabah melalui situs web atau brosur, menjelaskan hak-hak mereka terkait pertukaran data\n5. menyusun perjanjian kerja sama dengan pihak ketiga yang mencakup\n-  tanggung jawab dan kewajiban terkait perlindungan data pribadi\n-  prosedur yang harus diikuti jika terjadi kebocoran data\n6. mencantumkan media yang diizinkan seperti:\n- email terenkripsi\n- VPN\n- portal web aman\n- media penyimpanan fisik yang dienkripsi', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(75, 1, 75, '/Fungsi\nDivisi Teknologi Informasi', 'PBS 004/Dir/DMR-MROL/L/2024 tentang Pelindungan Data Pribadi', 'Kontrol\nBank sudah memiliki perjanjian terkait pertukaran atau transfer data,  namun belum diatur secara spesifik  mengenai pihak pengendali data pada setiap tahap pertukaran atau transfer data', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1.  menetapkan pihak pengendali data pada setiap tahap proses pertukaran atau transfer data mencakup:\n- identifikasi siapa yang bertanggung jawab atas data\n- tujuan pertukaran data seperti untuk analisis risiko kredit atau peningkatan layanan nasabah\n2. mendokumentasikan standar data yang digunakan dalam PKS mencakup:\n- spesifikasi teknis format data yang digunakan, seperti XML, JSON, atau CSV\n- frekuensi pengiriman data, tanggung jawab dan kompensasi jika terjadi keterlambatan atau kegagalan pengiriman', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(76, 1, 76, '/Fungsi\nDivisi Teknologi Informasi', NULL, 'Kontrol\nBerdasarkan interview dengan Divisi IT Network & Infrastructure, Bank telah menerapkan langkah-langkah keamanan jaringan seperti IP Filtering, Web Filtering, VPN, dan SDWAN\n\nNamun, belum ada dokumentasi yang mencatat secara rinci implementasi pengamanan jaringan dengan menggunakan IP Filtering, Web Filtering, VPN, dan SDWAN', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun dan memelihara dokumentasi yang mencatat secara rinci langkah-langkah keamanan jaringan:\n- Konfigurasi IP Filtering: Detil tentang aturan-aturan yang diterapkan untuk memfilter lalu lintas jaringan berdasarkan alamat IP.\nProsedur Web Filtering: Panduan tentang bagaimana konten web difilter dan kriteria yang digunakan.\nPengaturan VPN: Dokumentasi tentang bagaimana koneksi VPN diatur dan dikelola, termasuk jenis enkripsi yang digunakan.\nImplementasi SDWAN: Detail tentang penerapan SDWAN untuk mengamankan dan mengelola lalu lintas jaringan antara cabang-cabang Bank.\n2. mencatat secara rinci  enkripsi data yang dipertukarkan:\n- Algoritma Enkripsi yang Disetujui:\n- Panduan Penerapan Enkripsi:\n- Manajemen Kunci Enkripsi\n3. menyusun pengaturan khusus UU PDP:\n- Mekanisme Verifikasi dan Validasi Data\n- Prosedur Perlindungan Data\n- Pemberitahuan Nasabah', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(77, 1, 77, '/Fungsi\nDivisi Teknologi Informasi', NULL, 'Kontrol\nBerdasarkan interview dengan Divisi Teknologi Informasi, Bank sudah memiliki mekanisme permintaan persetujuan atau consent untuk pemrosesan data nasabah.\n\nNamun, implementasi dari mekanisme tersebut belum sepenuhnya konsisten.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Memastikan konsistensi permintaan persetujuan (Consent) mencakup:\n- menyediakan panduan dan pelatihan untuk seluruh karyawan\n- semua formulir dan aplikasi yang digunakan untuk memperoleh persetujuan nasabah mematuhi standar yang telah ditetapkan\n- Formulir digital dan manual harus dirancang dengan jelas\n2. membuat kebijakan internal yang merinci langkah-langkah untuk memastikan kepatuhan terhadap UU PDP\n3. menyusun daftar negara-negara yang dianggap memiliki tingkat pelindungan data pribadi yang memadai\n4. merumuskan perjanjian kontraktual dengan pihak ketiga di luar negeri mencakup:\n- keamanan data\n- persetujuan nasabah\n- mekanisme penanganan pelanggaran data.', NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(78, 1, 78, '/Fungsi\n- Divisi Teknologi Informasi\n- Divisi Strategi dan Transformasi', 'Rencana Strategis TI', 'Kontrol\nBerdasarkan review  dokumen dan hasil interview  dengan Divisi Strategi dan Transformasi, Bank telah menyatakan bahwa Bank memiliki inisiasi strategi kemitraan yang termuat dalam rencana strategis TI untuk mengembangkan bisnis Bank ke depannya. \n\nsudah diakomodir dalam RSTI 2024-2028', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. Menyusun dan mendokumentasikan strategi kemitraan yang terstruktur dalam Rencana Strategis TI dan rencana bisnis Bank, mencakup:\n- target kemitraan (contoh: implementasi terkait teknologi interface dengan mitra; Bank sebagai penyedia jasa)\n- langkah-langkah implementasinya.\n2. Menetapkan kebijakan kemitraan yang secara konsisten termasuk analisis risiko dan manajemen risiko yang terintegrasi untuk strategi kemitraan yang diusulkan.\n3. Mengembangkan dan menerapkan ketentuan terkait kebijakan kemitraan yang mencakup:\n- analisis biaya dan manfaat secara menyeluruh selaras dengan Rencana Bisnis Bank\n4.  memastikan bahwa SDM yang terlibat memiliki kecukupan dan kesiapan yang memadai untuk mengelola kemitraan, termasuk pelatihan dan pengembangan kompetensi yang relevan.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(79, 1, 79, '/Fungsi\n- Divisi Teknologi Informasi\n- Divisi Strategi dan Transformasi\n- Divisi Umum', NULL, 'Kontrol\nBank belum memiliki ketentuan ataupun standar baku terkait perjanjian kerja sama kemitraan oleh Bank.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun dan mengadopsi standar baku perjanjian kerja sama kemitraan yang mencakup:\n- prinsip kehati-hatian termasuk pengelolaan risiko, perlindungan data, dan keamanan informasi.\n- analisis biaya dan manfaat seperti menyampaikan laporan biaya dan manfaat secara berkala\n- kepatuhan terhadap ketentuan peraturan perundang-undangan.\n2. memastikan bahwa setiap perjanjian kerja sama kemitraan memenuhi prinsip kehati-hatian dengan menilai risiko terkait dan menetapkan kontrol yang sesuai untuk mengelola risiko tersebut\n3. memastikan bahwa analisis biaya dan manfaat menjadi bagian integral dari setiap perjanjian kerja sama kemitraan. Analisis ini harus didokumentasikan dengan baik dan digunakan sebagai dasar untuk keputusan kemitraan.\n4. memastikan bahwa perjanjian kerja sama kemitraan mencakup prinsip-prinsip kerja sama yang wajar, termasuk:\n- penjelasan tanggung jawab masing-masing pihak dan keadilan dalam pembagian risiko dan keuntungan.\n5. menambahkan klausul dalam perjanjian kerja sama yang menetapkan bahwa masing-masing pihak bertanggung jawab atas keamanan sistem mereka sendiri. Ini mencakup:\n- kewajiban mitra untuk segera melaporkan setiap pelanggaran keamanan yang berpotensi berdampak pada layanan Bank.\n6. memastikan bahwa perjanjian kemitraan mencakup klausul yang mengatur bahwa:\n- mitra hanya berkomunikasi dengan Bank berdasarkan instruksi nasabah yang telah disetujui nasabah, terutama dalam hal layanan penerusan instruksi nasabah', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(80, 1, 80, '/Fungsi\n- Divisi Teknologi Informasi, \n- Divisi Strategi dan Transformasi, \n- Divisi Umum', 'Pedoman Pengadaan Barang / Jasa di Lingkungan PT. Bank Sumut', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah mempertimbangkan kualifikasi mitra berdasarkan Pasal 20 terkait Kualifikasi Penyedia Barang/Jasa ataupun mitra.', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun dan mengadopsi kebijakan yang jelas terkait tindakan dan kontrol keamanan mitra mencakup:\n- prosedur keamanan siber yang ketat\n- mekanisme pemantauan yang terus menerus\n- tindakan korektif untuk mengatasi pelanggaran keamanan yang mungkin terjadi.\n2.menetapkan persyaratan keamanan yang jelas bagi mitra yang ingin mengikuti pelaksanaan pengadaan  mencakup standar keamanan siber yang harus dipatuhi oleh mitra termasuk:\n- enkripsi data\n- otentikasi dua faktor,\n- manajemen akses yang ketat.\n3. memastikan bahwa semua mitra memiliki BCP dan DRP yang terkini dan relevan untuk menghadapi kemungkinan gangguan atau bencana.\n4. menetapkan ketentuan yang mengadopsi praktik terbaik mencakup:\n- pelatihan pegawai\n- kepatuhan terhadap undang-undang kerahasiaan data\n- prosedur untuk penyimpanan dan penghancuran data yang aman.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(81, 1, 81, '/Fungsi\n- Divisi Teknologi Informasi\n- Divisi Umum', 'PKS PT BPD  Sumut dengan Rintis Sejahtera sebagai Penyedia dan Pengelola Infrastruktur BI-FAST secara Sharing/Multi-tenancy', 'Kontrol\nBerdasarkan review  dokumen dan interview dengan Divisi Umum, Bank telah memiliki ketentuan terkait salah satu pihak dapat mengakhiri perjanjian ketika terdapat pengakuan salah satu pihak atas kepailitannya dan dugaan pelanggaran keamanan dimana pihak yang dirugikan dapat menuntut ganti rugi terhadap pihak yang melakukan pelanggaran. Bank sudah melakukan pemantauan dan evaluasi, objek kesesuaian dengan kesepakatan dalam PKS serta mencakup kontrol yang dimaksud salah satunya pengaturan terkait mitra tidak lagi memenuhi kriteria kelayakan.\n\nNamun, Bank belum sepenuhnya melakukan pemantauan dan evaluasi hubungan kerja sama dengan mitra pada beberapa aspek yang diperlukan dalam melakukan evaluasi hubungan kerja sama.', 'Mengacu pada rekomendasi row 306', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(82, 1, 82, NULL, NULL, 'Kontrol ini not applicable karena Bank tidak melakukan kerja sama dengan mitra terkait layanan Bank yang dapat diakses melalui mitra', NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(83, 1, 83, '/Fungsi\nDivisi Teknologi Informasi', 'PKS PT BPD  Sumut dengan Rintis Sejahtera sebagai Penyedia dan Pengelola Infrastruktur BI-FAST secara Sharing/Multi-tenancy\n- Kontrak CoreSwitching Multipolar', 'Kontrol\nBerdasarkan review dokumen PKS tersebut, terdapat  standar teknis terkait pelaksanaan kemitraan yaitu Spesifikasi Teknis Multitenancy dan Spesifikasi Teknis BI-FAST serta Coreswitching\n\nCoreswitching telah memiliki aspek yang diharapkan, seperti metode autentikasi, metode otorisasi, metode enkripsi, dan persyaratan pengelolaan akses termasuk manajemen pengelolaan kunci (key management).', 'Berdasarkan hasil assessment yang telah dilakukan, Bank perlu:\n1. menyusun  standar teknis dengan fokus pada:\n-  metode autentikasi yang kuat\n- penggunaan metode otorisasi yang tepat\n- serta implementasi yang kokoh untuk metode enkripsi dan pengelolaan kunci.\n2. menyediakan dokumentasi yang lebih mendetail mengenai:\n- protokol komunikasi yang digunakan\n- struktur dan format data yang diterima dan dikirim\n- persyaratan keamanan lainnya yang diterapkan dalam setiap interaksi dengan mitra\n3. memastikan standar tersebut akan diterapkan secara konsisten', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(84, 1, 84, NULL, NULL, 'Kontrol ini not applicable karena Bank tidak menyediakan jasa TI kepada lembaga jasa keuangan lainnya', NULL, NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(85, 1, 85, NULL, NULL, 'Kontrol ini not applicable karena Bank tidak menyediakan jasa TI kepada lembaga jasa keuangan lainnya', NULL, NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(86, 1, 86, '/Fungsi\n- Divisi Dana dan Jasa\n- Divisi Strategi dan Transformasi', 'Sample dokumen hasil survey (Survey Layanan Operasional Cabang)', 'Kontrol\nBerdasarkan review dokumen dan interview dengan Divisi Dana & Jasa serta Divisi Strategi dan Transformasi, diketahui bahwa bank telah melakukan survey untuk mengetahui tingkat kepuasan nasabah atas produk dan layanan yang diberikan oleh Bank. \n\nNamun, Bank belum memiliki mekanisme pengukuran keterlibatan nasabah secara baku', 'Berdasarkan hasil assessment yang telah dilakukan, bank perlu: \nBank perlu mengembangkan dokumen Customer Engagement dengan mencakup aspek mekanisme mengukur keterlibatan nasabah yang standar dan terstruktur. Aspek tersebut harus mencakup: \n1. Bank dapat menggunakan data transaksi dan perilaku nasabah untuk mengidentifikasi pola dan tren yang dapat digunakan untuk meningkatkan produk dan layanan. \n2. Bank dapat mengelola feedback melalui berbagai saluran, seperti call center, media sosial, dan layanan pelanggan.\n3. Bank dapat melakukan forum untuk memahami kebutuhan dan preferensi nasabah secara komprehensif.\n4. Bank terus berinovasi dalam pengembangan produk dan layanan untuk memenuhi kebutuhan nasabah yang \nberkembang seperti produk baru atau fitur layanan yang diluncurkan berdasarkan kebutuhan nasabah..\n5. Bank menerapkan personalisasi layanan untuk memberikan pengalaman yang lebih relevan dan memuaskan bagi nasabah. \n\nSelain itu, hasil dari pengukuran ini harus dilakukan evaluasi secara rutin untuk melakukan penyesuaian dan perbaikan terhadap produk dan layanan. Bank juga harus mendokumentasikan seluruh proses dan hasil pengukuran keterlibatan nasabah tersebut.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(87, 1, 87, '/Fungsi\nDivisi Operasional', 'Peraturan Perlindungan Konsumen PT Bank Sumut', 'Kontrol\nBerdasarkan interview dengan Divisi Dana & Jasa, diketahui bahwa Bank belum memiliki standar pelayanan keuangan yang diberikan kepada penyandang disabilitas.', 'Berdasarkan hasil assessment yang telah dilakukan, bank perlu: \nBank perlu menyusun Dokumen Standar Operasional Prosedur terkait pelayanan keuangan untuk nasabah Disabilitas.\nAspek-aspek yang perlu ada, seperti:\n- ketersediaan fasilitas fisik yang ramah disabilitas (rampa & lift ramah disabilitas, pintu otomatis, dll)\n- pengaturan penyelenggaraan pelatihan untuk staff membantu nasabah disabilitas\n- teknologi yang mendukung aksesibilitas (perangkat lunak pembaca layar, layanan perbankan berbasis suara)\n- pengaturan aktivitas pemantauan penerapan pelayanan operasional ramah disabilitas', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(88, 1, 88, '/Fungsi\nDivisi Dana dan Jasa', NULL, 'Kontrol\nBerdasarkan interview dengan Divisi Dana & Jasa, Bank sudah melakukan pemanfaatan data nasabah  (demografi, perilaku, preferensi dan kebutuhan nasabah) sebagai salah satu landasan pertimbangan dalam pengembangan produk dan layanan yang akan diberikan. \n\nNamun, pemanfaatan yang dilakukan masih minim dan belum secara konsisten dilakukan', 'Berdasarkan hasil assessment yang telah dilakukan, bank perlu: \nBank perlu memiliki dokumen terkait customer engagement  yang meliputi pemanfaatan data nasabah dalam menciptakan produk dan layanan bank dengan melibatkan nasabah.\n\nBank perlu memastikan bahwa data nasabah, termasuk demografi, perilaku, preferensi, dan kebutuhan nasabah, dimanfaatkan secara maksimal dan terintegrasi dalam semua tahap pengembangan produk dan layanan. \nBank dapat melakukan dengan cara berikut, meliputi:\n1. Menggunakan analitik data\n2. Menggunakan teknologi big data untuk mengidentifikasi tren dan pola yang dapat mendukung inovasi produk dan peningkatan layanan\n3. Melakukan pelatihan dan pengembangan kapasitas bagi tim yang bertanggung jawab atas pengembangan produk dan layanan', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(89, 1, 89, '/Fungsi\nDivisi Operasional', 'Corporate Plan Bank\n- Survei Kepuasan Nasabah atas Produk Digital Bank', 'Kontrol\nBerdasarkan review dokumen dan interview dengan Divisi Operasional, Bank telah memiliki program survei terkait tingkat kepuasan Nasabah untuk layanan Bank, operasional Bank, produk Bank, dan lainnya. Dalam rangka peningkatan pelayanan, Bank melakukan survei dengan menyebarkan kuesioner kepada nasabah. \n\nNamun, Bank belum memiliki mekanisme pelaksanaan perolehan persepsi nasabah dan tata cara analisis data secara baku', 'Berdasarkan hasil assessment yang telah dilakukan, bank perlu: \nBank perlu menyusun mekanisme dalam customer engagement yang lebih terstruktur dan standar dalam pelaksanaan perolehan persepsi nasabah. Ini termasuk metode pengumpulan data yang konsisten dan sistematis, yang meliputi:\n1) product quality yaitu persepsi nasabah terhadap kualitas produk dan layanan Bank;\n2) customer support quality yaitu persepsi nasabah terhadap kualitas customer support Bank;\n3) positioning yaitu persepsi nasabah terhadap produk dan layanan Bank dibandingkan dengan produk dan layanan kompetitor;\n4) price yaitu persepsi nasabah terhadap biaya, contoh suku bunga simpanan dan kredit yang ditawarkan oleh Bank; dan\n5) reputation yaitu persepsi nasabah terhadap citra produk dan layanan Bank, yang diperoleh melalui antara lain media sosial, atau reviu aplikasi Bank pada platform distribusi.\n\nBank juga perlu menyusun dokumen mengenai tata cara analisis data yang mencakup aspek cara bank dapat memanfaatkan teknologi analitik dan big data untuk memperoleh wawasan yang lebih mendalam tentang persepsi dan tingkat kepercayaan nasabah.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(90, 1, 90, '/Fungsi\nDivisi Operasional', 'Survei Kepuasan Nasabah atas Produk Digital Bank \n- Rencana Strategis TI', 'Kontrol\nBerdasarkan review document dan interview dengan Divisi Operasional, Bank telah melakukan analisis hasil survei yang telah diberikan kepada nasabah dalam peningkatan layanan bank, yaitu meliputi:\na. kemudahan yang dirasakan nasabah dalam penggunaan channel,\nb. penggunaan fitur channel oleh nasabah Bank Sumut,\nc. kecepatan channel yang digunakan nasabah dalam melakukan transaksi.', 'Berdasarkan assessment yang telah dilakukan, bank perlu:\na. memperbarui dan mengoptimalkan desain aplikasi mobile untuk meningkatkan kenyamanan dan kemudahan penggunaan oleh nasabah dengan melakukan penelitian pengguna secara rutin untuk memahami kebutuhan dan preferensi nasabah.\nb. meningkatkan komunikasi dengan nasabah mengenai perubahan dan peningkatan yang dilakukan pada aplikasi mobile.\nc. menambah atau memperbaiki fitur-fitur yang ada dalam aplikasi mobile berdasarkan umpan balik nasabah untuk meningkatkan kegunaan dan kepuasan nasabah.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(91, 1, 91, '/Fungsi\nSekretaris Perusahaan', 'Dokumen Peraturan Bank Sumut terkait Transparansi Penggunaan Produk.\nPBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\nSK & SE terkait Pelindungan Data Pribadi Nasabah PT. Bank Sumut tahun 2025', 'Kontrol\nBerdasarkan review dokumen tersebut, Bank telah memiliki dan memantau pelaksanaan kewajiban pihak ketiga untuk menjamin keamanan seluruh informasi termasuk rahasia bank sehubungan dengan pelaksanaan pekerjaan dalam kerja sama. \nBank sudah memiliki pengaturan khusus untuk mengakomodir UU PDP hal ini tertuang dalam PBS 009/Dir/DMR-MROL/L/2025 tentang Pelindungan Data Pribadi Nasabah PT. Bank Sumut\ndan sudah melakukan beberapa penyesuaian pada Dokumen PKS khususnya terkait dengan persetujuan antara konsumen dan mitra.', 'Berdasarkan assessment yang dilakukan, bank perlu: \n1. mempertimbangkan data pribadi yang terlibat yang mengacu pada UU No 27 PDP. Pengaturan ini harus mencakup semua aspek yang dipersyaratkan untuk memastikan bahwa perlindungan data nasabah dilakukan sesuai dengan standar hukum yang berlaku. \n2. melakukan penyesuaian pada Dokumen Perjanjian Kerja Sama (PKS) untuk mencakup persetujuan eksplisit antara konsumen dan mitra terkait keterlibatan data pribadi.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(92, 1, 92, '/Fungsi\n- Sekretaris Perusahaan\n- Divisi Teknologi Informasi\n- Unit Perlindungan Konsumen', 'Pedoman Pelaksanaan Layanan Pengaduan Konsumen PT Bank Sumut', 'Kontrol\nBerdasarkan review dokumen dan interview dengan Sekretaris Perusahaan, bank memiliki kebijakan terkait saluran untuk menerima pengaduan nasabah setiap saat secara daring, melalui aplikasi penerimaan pengaduan secara elektronik atau melalui Aplikasi Layanan Pengaduan Konsumen (ALPAN).', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. melakukan peninjauan berkala terhadap aplikasi ALPAN,  memastikan bahwa aplikasi tersebut tetap efektif saat diakses secara daring oleh nasabah. \n2. memberikan pelatihan kepada fungsi/unit kerja yang berwenang dalam penyelesaian pengaduan nasabah, seperti dalam memanfaatkan teknologi untuk meningkatkan efisiensi dalam proses penyelesaian pengaduan nasabah.\n3. melakukan evaluasi terkait pengaduan nasabah dari penerimaan hingga penyelesaian, bank memberikan feedback kepada nasabah terkait aplikasi ALPAN serta menanggapi komentar di media sosial dan monitoring mengenai kesesuaian SLA dengan ketentuan yang diberikan. \n4. mengadakan rapat evaluasi berkala dengan tim terkait untuk membahas hasil evaluasi berdasarkan tindak lanjut perbaikan yang telah dilakukan divisi-divisi terkait dan dilakukan notulensi sehingga terdokumentasinya rencana perbaikan tersebut berhasil dilakukan atau tidak.\n5. memberikan pemberitahuan kepada nasabah mengenai status pengaduan banding mereka dan menunjukkan langkah-langkah yang diambil dalam penanganan banding jika nasabah tidak setuju dengan keputusan pengaduan oleh Bank kepada LAPS.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(93, 1, 93, '/Fungsi\n- Divisi Teknologi Informasi\n- Sekretaris Perusahaan', 'Website Resmi Bank Sumut https://www.banksumut.co.id/layanan-nasabah/', 'Kontrol\nBerdasarkan interview dengan Divisi Teknologi Informasi, Divisi Governance bekerja sama dengan Sekretaris Perusahaan melalui sosial media atau website untuk publik mengenai awareness terkait keamanan. Untuk Tim internal, sosialisasi dilakukan menggunakan Email blast dan Portal.', 'Berdasarkan assessment yang dilakukan, bank perlu:\n1. mangagendakan kegiatan awareness rutin langsung dengan narasumber terkait literasi keuangan.\n2. mengadakan workshop dan seminar di pusat komunitas atau daerah terpencil tentang manajemen keuangan. \n3. membuat awareness berupa video edukasi yang menggambarkan skenario keamanan dalam bertransaksi digital dengan simulasi kasus nyata.\n4. memiliki pop up message terkait edukasi keamanan saat pertama kali nasabah mengunduh atau membuka aplikasi.\n3.  mengadakan kuis online tentang pengetahuan keamanan digital pada platform media sosial', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(94, 1, 94, '/Fungsi\nSekretaris Perusahaan', 'Instagram @Banksumut', 'Kontrol\nBerdasarkan media sosial instagram official Bank Sumut, bank telah memberikan penjelasan mengenai pemahaman umum tentang sistem berbasis TI yang digunakan oleh Bank dalam memberikan layanan kepada nasabah, seperti penjelasan layanan-layanan yang ada di Bank Sumut dan tata cara penggunaan mobile banking.', 'Berdasarkan assessment yang telah dilakukan, bank pelru:\n1. menambahkan bagian dalam aplikasi mobile yang secara khusus menjelaskan sistem berbasis TI dan layanan-layanan yang tersedia.\n2. mengirimkan informasi yang dapat berupa email blast/SMS kepada nasabah tentang prosedur klarifikasi kepada Bank Sumut.', NULL, 'done', 3, '2026-06-22 13:57:44', NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(95, 3, 1, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(96, 3, 2, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(97, 3, 3, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(98, 3, 4, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(99, 3, 5, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(100, 3, 6, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(101, 3, 7, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(102, 3, 8, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(103, 3, 9, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(104, 3, 10, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(105, 3, 11, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(106, 3, 12, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(107, 3, 13, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(108, 3, 14, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(109, 3, 15, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(110, 3, 16, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(111, 3, 17, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(112, 3, 18, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(113, 3, 19, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(114, 3, 20, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(115, 3, 21, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(116, 3, 22, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(117, 3, 23, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(118, 3, 24, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(119, 3, 25, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(120, 3, 26, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(121, 3, 27, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(122, 3, 28, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(123, 3, 29, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(124, 3, 30, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(125, 3, 31, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(126, 3, 32, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(127, 3, 33, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(128, 3, 34, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(129, 3, 35, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(130, 3, 36, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(131, 3, 37, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(132, 3, 38, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(133, 3, 39, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(134, 3, 40, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(135, 3, 41, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(136, 3, 42, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(137, 3, 43, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(138, 3, 44, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(139, 3, 45, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(140, 3, 46, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(141, 3, 47, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(142, 3, 48, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(143, 3, 49, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(144, 3, 50, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(145, 3, 51, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(146, 3, 52, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(147, 3, 53, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(148, 3, 54, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(149, 3, 55, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(150, 3, 56, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(151, 3, 57, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(152, 3, 58, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(153, 3, 59, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(154, 3, 60, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(155, 3, 61, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(156, 3, 62, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(157, 3, 63, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(158, 3, 64, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(159, 3, 65, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(160, 3, 66, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(161, 3, 67, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(162, 3, 68, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(163, 3, 69, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(164, 3, 70, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(165, 3, 71, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(166, 3, 72, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(167, 3, 73, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(168, 3, 74, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(169, 3, 75, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(170, 3, 76, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(171, 3, 77, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(172, 3, 78, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(173, 3, 79, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(174, 3, 80, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(175, 3, 81, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(176, 3, 82, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(177, 3, 83, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(178, 3, 84, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(179, 3, 85, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(180, 3, 86, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(181, 3, 87, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(182, 3, 88, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(183, 3, 89, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(184, 3, 90, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(185, 3, 91, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(186, 3, 92, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(187, 3, 93, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(188, 3, 94, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_periods`
--

CREATE TABLE `assessment_periods` (
  `id` bigint UNSIGNED NOT NULL,
  `year` year NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','active','submitted','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_periods`
--

INSERT INTO `assessment_periods` (`id`, `year`, `name`, `status`, `start_date`, `end_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2025', 'Assessment Maturitas Digital 2025 (Impor Excel)', 'completed', '2025-01-01', '2025-12-31', 1, '2026-06-22 13:57:44', '2026-06-23 03:53:53'),
(3, '2026', 'Assesment Maturitas Digitall', 'active', '2026-06-01', '2026-06-10', 1, '2026-06-23 03:53:24', '2026-06-23 04:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_sub_control_results`
--

CREATE TABLE `assessment_sub_control_results` (
  `id` bigint UNSIGNED NOT NULL,
  `assessment_control_result_id` bigint UNSIGNED NOT NULL,
  `sub_control_id` bigint UNSIGNED NOT NULL,
  `status` enum('ada','partial','tidak') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skor` tinyint UNSIGNED DEFAULT NULL,
  `filled_by` bigint UNSIGNED DEFAULT NULL,
  `filled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_sub_control_results`
--

INSERT INTO `assessment_sub_control_results` (`id`, `assessment_control_result_id`, `sub_control_id`, `status`, `skor`, `filled_by`, `filled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(2, 2, 2, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(3, 2, 3, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(4, 2, 4, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(5, 3, 5, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(6, 3, 6, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(7, 4, 7, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(8, 5, 8, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(9, 5, 9, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(10, 5, 10, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(11, 6, 11, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(12, 6, 12, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(13, 6, 13, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(14, 7, 14, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(15, 7, 15, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(16, 7, 16, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(17, 7, 17, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(18, 8, 18, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(19, 8, 19, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(20, 9, 20, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(21, 9, 21, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(22, 10, 22, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(23, 10, 23, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(24, 11, 24, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(25, 11, 25, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(26, 12, 26, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(27, 13, 27, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(28, 13, 28, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(29, 13, 29, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(30, 13, 30, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(31, 13, 31, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(32, 13, 32, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(33, 13, 33, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(34, 13, 34, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(35, 13, 35, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(36, 14, 36, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(37, 14, 37, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(38, 14, 38, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(39, 14, 39, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(40, 14, 40, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(41, 14, 41, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(42, 15, 42, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(43, 15, 43, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(44, 15, 44, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(45, 15, 45, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(46, 16, 46, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(47, 16, 47, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(48, 16, 48, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(49, 16, 49, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(50, 17, 50, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(51, 17, 51, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(52, 17, 52, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(53, 17, 53, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(54, 18, 54, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(55, 18, 55, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(56, 18, 56, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(57, 19, 57, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(58, 19, 58, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(59, 19, 59, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(60, 19, 60, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(61, 19, 61, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(62, 19, 62, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(63, 19, 63, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(64, 19, 64, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(65, 19, 65, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(66, 19, 66, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(67, 19, 67, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(68, 20, 68, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(69, 20, 69, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(70, 20, 70, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(71, 21, 71, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(72, 21, 72, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(73, 21, 73, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(74, 21, 74, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(75, 21, 75, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(76, 21, 76, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(77, 22, 77, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(78, 22, 78, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(79, 22, 79, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(80, 22, 80, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(81, 22, 81, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(82, 22, 82, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(83, 22, 83, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(84, 23, 84, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(85, 23, 85, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(86, 23, 86, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(87, 23, 87, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(88, 25, 88, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(89, 26, 89, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(90, 26, 90, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(91, 26, 91, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(92, 28, 92, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(93, 29, 93, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(94, 29, 94, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(95, 30, 95, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(96, 30, 96, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(97, 30, 97, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(98, 30, 98, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(99, 31, 99, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(100, 31, 100, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(101, 31, 101, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(102, 31, 102, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(103, 32, 103, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(104, 32, 104, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(105, 33, 105, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(106, 33, 106, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(107, 34, 107, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(108, 34, 108, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(109, 34, 109, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(110, 36, 110, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(111, 36, 111, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(112, 36, 112, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(113, 36, 113, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(114, 37, 114, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(115, 37, 115, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(116, 37, 116, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(117, 38, 117, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(118, 38, 118, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(119, 38, 119, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(120, 39, 120, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(121, 39, 121, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(122, 39, 122, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(123, 40, 123, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(124, 40, 124, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(125, 40, 125, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(126, 40, 126, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(127, 40, 127, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(128, 41, 128, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(129, 41, 129, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(130, 41, 130, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(131, 42, 131, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(132, 42, 132, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(133, 42, 133, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(134, 42, 134, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(135, 43, 135, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(136, 43, 136, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(137, 43, 137, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(138, 43, 138, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(139, 43, 139, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(140, 43, 140, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(141, 43, 141, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(142, 43, 142, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(143, 43, 143, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(144, 43, 144, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(145, 43, 145, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(146, 44, 146, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(147, 45, 147, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(148, 45, 148, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(149, 46, 149, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(150, 46, 150, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(151, 47, 151, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(152, 47, 152, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(153, 47, 153, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(154, 47, 154, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(155, 47, 155, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(156, 47, 156, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(157, 47, 157, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(158, 47, 158, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(159, 48, 159, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(160, 48, 160, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(161, 48, 161, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(162, 49, 162, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(163, 49, 163, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(164, 49, 164, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(165, 50, 165, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(166, 50, 166, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(167, 50, 167, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(168, 50, 168, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(169, 50, 169, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(170, 51, 170, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(171, 51, 171, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(172, 51, 172, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(173, 52, 173, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(174, 52, 174, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(175, 52, 175, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(176, 52, 176, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(177, 52, 177, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(178, 53, 178, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(179, 53, 179, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(180, 53, 180, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(181, 53, 181, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(182, 54, 182, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(183, 54, 183, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(184, 54, 184, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(185, 54, 185, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(186, 54, 186, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(187, 55, 187, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(188, 55, 188, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(189, 55, 189, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(190, 55, 190, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(191, 55, 191, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(192, 55, 192, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(193, 55, 193, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(194, 55, 194, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(195, 56, 195, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(196, 56, 196, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(197, 57, 197, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(198, 57, 198, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(199, 58, 199, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(200, 58, 200, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(201, 58, 201, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(202, 58, 202, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(203, 58, 203, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(204, 58, 204, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(205, 59, 205, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(206, 59, 206, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(207, 59, 207, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(208, 59, 208, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(209, 60, 209, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(210, 60, 210, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(211, 60, 211, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(212, 60, 212, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(213, 60, 213, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(214, 61, 214, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(215, 61, 215, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(216, 62, 216, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(217, 62, 217, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(218, 62, 218, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(219, 62, 219, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(220, 62, 220, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(221, 63, 221, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(222, 63, 222, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(223, 63, 223, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(224, 63, 224, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(225, 64, 225, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(226, 64, 226, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(227, 64, 227, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(228, 65, 228, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(229, 65, 229, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(230, 65, 230, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(231, 65, 231, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(232, 65, 232, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(233, 65, 233, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(234, 66, 234, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(235, 66, 235, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(236, 66, 236, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(237, 66, 237, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(238, 66, 238, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(239, 67, 239, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(240, 67, 240, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(241, 68, 241, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(242, 68, 242, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(243, 68, 243, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(244, 69, 244, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(245, 69, 245, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(246, 70, 246, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(247, 70, 247, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(248, 70, 248, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(249, 71, 249, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(250, 71, 250, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(251, 71, 251, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(252, 72, 252, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(253, 72, 253, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(254, 72, 254, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(255, 73, 255, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(256, 73, 256, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(257, 73, 257, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(258, 73, 258, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(259, 74, 259, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(260, 74, 260, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(261, 74, 261, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(262, 74, 262, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(263, 74, 263, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(264, 74, 264, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(265, 74, 265, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(266, 74, 266, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(267, 75, 267, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(268, 75, 268, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(269, 75, 269, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(270, 75, 270, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(271, 75, 271, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(272, 75, 272, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(273, 75, 273, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(274, 76, 274, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(275, 76, 275, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(276, 76, 276, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(277, 76, 277, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(278, 76, 278, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(279, 77, 279, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(280, 77, 280, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(281, 77, 281, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(282, 77, 282, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(283, 77, 283, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(284, 77, 284, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(285, 78, 285, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(286, 78, 286, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(287, 78, 287, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(288, 78, 288, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(289, 79, 289, 'tidak', 0, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(290, 80, 290, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(291, 80, 291, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(292, 80, 292, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(293, 80, 293, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(294, 80, 294, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(295, 80, 295, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(296, 81, 296, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(297, 82, 297, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(298, 82, 298, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(299, 82, 299, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(300, 82, 300, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(301, 82, 301, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(302, 82, 302, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(303, 83, 303, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(304, 83, 304, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(305, 84, 305, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(306, 84, 306, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(307, 84, 307, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(308, 84, 308, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(309, 84, 309, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(310, 84, 310, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(311, 84, 311, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(312, 85, 312, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(313, 85, 313, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(314, 85, 314, NULL, NULL, NULL, NULL, '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(315, 86, 315, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(316, 86, 316, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(317, 87, 317, 'tidak', 0, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(318, 87, 318, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(319, 87, 319, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(320, 88, 320, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(321, 88, 321, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(322, 89, 322, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(323, 89, 323, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(324, 90, 324, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(325, 90, 325, 'partial', 1, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(326, 91, 326, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(327, 92, 327, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(328, 92, 328, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(329, 92, 329, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(330, 92, 330, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(331, 92, 331, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(332, 92, 332, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(333, 93, 333, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(334, 93, 334, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(335, 94, 335, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(336, 94, 336, 'ada', 2, 2, '2026-06-22 13:57:44', '2026-06-22 13:57:44', '2026-06-22 13:57:44'),
(337, 95, 1, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(338, 96, 2, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(339, 96, 3, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(340, 96, 4, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(341, 97, 5, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(342, 97, 6, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(343, 98, 7, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(344, 99, 8, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(345, 99, 9, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(346, 99, 10, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(347, 100, 11, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(348, 100, 12, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(349, 100, 13, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(350, 101, 14, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(351, 101, 15, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(352, 101, 16, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(353, 101, 17, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(354, 102, 18, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(355, 102, 19, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(356, 103, 20, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(357, 103, 21, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(358, 104, 22, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(359, 104, 23, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(360, 105, 24, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(361, 105, 25, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(362, 106, 26, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(363, 107, 27, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(364, 107, 28, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(365, 107, 29, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(366, 107, 30, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(367, 107, 31, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(368, 107, 32, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(369, 107, 33, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(370, 107, 34, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(371, 107, 35, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(372, 108, 36, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(373, 108, 37, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(374, 108, 38, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(375, 108, 39, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(376, 108, 40, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(377, 108, 41, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(378, 109, 42, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(379, 109, 43, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(380, 109, 44, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(381, 109, 45, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(382, 110, 46, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(383, 110, 47, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(384, 110, 48, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(385, 110, 49, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(386, 111, 50, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(387, 111, 51, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(388, 111, 52, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(389, 111, 53, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(390, 112, 54, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(391, 112, 55, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(392, 112, 56, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(393, 113, 57, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(394, 113, 58, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(395, 113, 59, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(396, 113, 60, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(397, 113, 61, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(398, 113, 62, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(399, 113, 63, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(400, 113, 64, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(401, 113, 65, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(402, 113, 66, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(403, 113, 67, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(404, 114, 68, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(405, 114, 69, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(406, 114, 70, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(407, 115, 71, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(408, 115, 72, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(409, 115, 73, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(410, 115, 74, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(411, 115, 75, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(412, 115, 76, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(413, 116, 77, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(414, 116, 78, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(415, 116, 79, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(416, 116, 80, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(417, 116, 81, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(418, 116, 82, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(419, 116, 83, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(420, 117, 84, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(421, 117, 85, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(422, 117, 86, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(423, 117, 87, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(424, 119, 88, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(425, 120, 89, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(426, 120, 90, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(427, 120, 91, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(428, 122, 92, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(429, 123, 93, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(430, 123, 94, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(431, 124, 95, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(432, 124, 96, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(433, 124, 97, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(434, 124, 98, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(435, 125, 99, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(436, 125, 100, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(437, 125, 101, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(438, 125, 102, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(439, 126, 103, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(440, 126, 104, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(441, 127, 105, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(442, 127, 106, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(443, 128, 107, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(444, 128, 108, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(445, 128, 109, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(446, 130, 110, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(447, 130, 111, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(448, 130, 112, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(449, 130, 113, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(450, 131, 114, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(451, 131, 115, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(452, 131, 116, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(453, 132, 117, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(454, 132, 118, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(455, 132, 119, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(456, 133, 120, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(457, 133, 121, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(458, 133, 122, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(459, 134, 123, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(460, 134, 124, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(461, 134, 125, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(462, 134, 126, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(463, 134, 127, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(464, 135, 128, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(465, 135, 129, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(466, 135, 130, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(467, 136, 131, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(468, 136, 132, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(469, 136, 133, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(470, 136, 134, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(471, 137, 135, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(472, 137, 136, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(473, 137, 137, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(474, 137, 138, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(475, 137, 139, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(476, 137, 140, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(477, 137, 141, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(478, 137, 142, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(479, 137, 143, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(480, 137, 144, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(481, 137, 145, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(482, 138, 146, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(483, 139, 147, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(484, 139, 148, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(485, 140, 149, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(486, 140, 150, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(487, 141, 151, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(488, 141, 152, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(489, 141, 153, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(490, 141, 154, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(491, 141, 155, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(492, 141, 156, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(493, 141, 157, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(494, 141, 158, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(495, 142, 159, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(496, 142, 160, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(497, 142, 161, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(498, 143, 162, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(499, 143, 163, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(500, 143, 164, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(501, 144, 165, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(502, 144, 166, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(503, 144, 167, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(504, 144, 168, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(505, 144, 169, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(506, 145, 170, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(507, 145, 171, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(508, 145, 172, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(509, 146, 173, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(510, 146, 174, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(511, 146, 175, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(512, 146, 176, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(513, 146, 177, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(514, 147, 178, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(515, 147, 179, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(516, 147, 180, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(517, 147, 181, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(518, 148, 182, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(519, 148, 183, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(520, 148, 184, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(521, 148, 185, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(522, 148, 186, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(523, 149, 187, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(524, 149, 188, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(525, 149, 189, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(526, 149, 190, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(527, 149, 191, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(528, 149, 192, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(529, 149, 193, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(530, 149, 194, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(531, 150, 195, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(532, 150, 196, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(533, 151, 197, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(534, 151, 198, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(535, 152, 199, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(536, 152, 200, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(537, 152, 201, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(538, 152, 202, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(539, 152, 203, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(540, 152, 204, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(541, 153, 205, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(542, 153, 206, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(543, 153, 207, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(544, 153, 208, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39');
INSERT INTO `assessment_sub_control_results` (`id`, `assessment_control_result_id`, `sub_control_id`, `status`, `skor`, `filled_by`, `filled_at`, `created_at`, `updated_at`) VALUES
(545, 154, 209, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(546, 154, 210, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(547, 154, 211, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(548, 154, 212, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(549, 154, 213, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(550, 155, 214, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(551, 155, 215, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(552, 156, 216, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(553, 156, 217, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(554, 156, 218, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(555, 156, 219, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(556, 156, 220, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(557, 157, 221, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(558, 157, 222, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(559, 157, 223, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(560, 157, 224, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(561, 158, 225, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(562, 158, 226, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(563, 158, 227, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(564, 159, 228, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(565, 159, 229, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(566, 159, 230, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(567, 159, 231, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(568, 159, 232, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(569, 159, 233, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(570, 160, 234, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(571, 160, 235, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(572, 160, 236, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(573, 160, 237, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(574, 160, 238, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(575, 161, 239, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(576, 161, 240, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(577, 162, 241, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(578, 162, 242, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(579, 162, 243, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(580, 163, 244, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(581, 163, 245, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(582, 164, 246, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(583, 164, 247, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(584, 164, 248, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(585, 165, 249, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(586, 165, 250, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(587, 165, 251, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(588, 166, 252, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(589, 166, 253, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(590, 166, 254, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(591, 167, 255, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(592, 167, 256, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(593, 167, 257, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(594, 167, 258, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(595, 168, 259, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(596, 168, 260, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(597, 168, 261, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(598, 168, 262, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(599, 168, 263, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(600, 168, 264, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(601, 168, 265, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(602, 168, 266, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(603, 169, 267, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(604, 169, 268, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(605, 169, 269, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(606, 169, 270, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(607, 169, 271, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(608, 169, 272, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(609, 169, 273, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(610, 170, 274, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(611, 170, 275, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(612, 170, 276, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(613, 170, 277, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(614, 170, 278, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(615, 171, 279, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(616, 171, 280, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(617, 171, 281, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(618, 171, 282, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(619, 171, 283, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(620, 171, 284, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(621, 172, 285, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(622, 172, 286, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(623, 172, 287, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(624, 172, 288, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(625, 173, 289, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(626, 174, 290, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(627, 174, 291, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(628, 174, 292, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(629, 174, 293, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(630, 174, 294, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(631, 174, 295, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(632, 175, 296, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(633, 176, 297, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(634, 176, 298, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(635, 176, 299, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(636, 176, 300, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(637, 176, 301, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(638, 176, 302, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(639, 177, 303, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(640, 177, 304, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(641, 178, 305, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(642, 178, 306, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(643, 178, 307, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(644, 178, 308, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(645, 178, 309, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(646, 178, 310, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(647, 178, 311, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(648, 179, 312, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(649, 179, 313, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(650, 179, 314, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(651, 180, 315, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(652, 180, 316, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(653, 181, 317, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(654, 181, 318, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(655, 181, 319, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(656, 182, 320, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(657, 182, 321, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(658, 183, 322, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(659, 183, 323, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(660, 184, 324, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(661, 184, 325, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(662, 185, 326, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(663, 186, 327, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(664, 186, 328, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(665, 186, 329, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(666, 186, 330, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(667, 186, 331, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(668, 186, 332, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(669, 187, 333, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(670, 187, 334, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(671, 188, 335, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39'),
(672, 188, 336, NULL, NULL, NULL, NULL, '2026-06-23 03:53:39', '2026-06-23 03:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

CREATE TABLE `controls` (
  `id` bigint UNSIGNED NOT NULL,
  `subdomain_id` bigint UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `controls`
--

INSERT INTO `controls` (`id`, `subdomain_id`, `code`, `title`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, '1.A.1', 'Bank memiliki permodalan yang memadai untuk mendukung rencana pengembangan TI.', NULL, 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, 1, '1.A.2', 'Bank mengelola portofolio investasi TI secara memadai.', NULL, 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, 1, '1.A.3', 'Bank melakukan pengelolaan biaya terkait TI secara efektif.', NULL, 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, 1, '1.A.4', 'Direksi dan Dewan Komisaris memiliki komitmen untuk menerapkan kepemimpinan yang berorientasi  digital (digital leadership).', NULL, 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(5, 1, '1.A.5', 'Bank memiliki desain organisasi yang mendukung transformasi digital.', NULL, 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(6, 1, '1.A.6', 'Bank memiliki program pengembangan budaya digital dan menerapkan budaya digital untuk mendukung transformasi digital.', NULL, 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(7, 1, '1.A.7', 'Bank melakukan pengembangan talenta digital.', NULL, 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(8, 2, '1.B.1', 'Bank memastikan pengaturan dan pengelolaan tata kelola TI telah memadai.', NULL, 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(9, 2, '1.B.2', 'Bank mengoptimalkan nilai bisnis dari investasi dalam proses bisnis, layanan \ndan aset TI.', NULL, 9, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(10, 2, '1.B.3', 'Bank memastikan risiko terkait penggunaan TI telah diidentifikasi dan dikelola secara memadai.', NULL, 10, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(11, 2, '1.B.4', 'Bank memastikan sumber daya terkait TI, meliputi Sumber Daya Manusia (SDM), proses, dan teknologi tersedia untuk mendukung Bank secara efektif dan dengan biaya optimal.', NULL, 11, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(12, 2, '1.B.5', 'Bank mengidentifikasi, mengevaluasi, dan melibatkan seluruh pemangku kepentingan dalam tata kelola TI.', NULL, 12, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(13, 2, '1.B.6', 'Sistem manajemen TI Bank dirancang secara memadai.', NULL, 13, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(14, 2, '1.B.7', 'Bank memastikan bahwa setiap inisiatif digitalisasi atau transformasi digital yang dimuat dalam RSTI Bank  telah sesuai dengan arah dan strategi Bank.', NULL, 14, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(15, 2, '1.B.8', 'Pengelolaan hubungan dengan pemangku kepentingan bisnis dengan cara yang formal dan transparan.', NULL, 15, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(16, 2, '1.B.9', 'Bank mengelola layanan TI secara memadai bagi pihak internal dan eksternal.', NULL, 16, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(17, 2, '1.B.10', 'Bank menerapkan praktik dan standar pengendalian kualitas dalam semua proses dan prosedur.', NULL, 17, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(18, 2, '1.B.11', 'Sistem manajemen keamanan informasi sudah didefinisikan, dioperasikan, dan dipantau.', NULL, 18, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(19, 2, '1.B.12', 'Aktivitas pengembangan, akuisisi, dan implementasi solusi/adopsi TI dan integrasinya dalam proses bisnis telah memadai.', NULL, 19, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(20, 2, '1.B.13', 'Aktivitas operasional layanan dan dukungan TI yang memadai.', NULL, 20, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(21, 2, '1.B.14', 'Bank menetapkan rencana dan memastikan keberlangsungan rencana pemeliharaan untuk memungkinkan bisnis dan organisasi TI merespons insiden dan beradaptasi dengan cepat terhadap gangguan.', NULL, 21, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(22, 2, '1.B.15', 'Pelindungan terhadap informasi Bank berdasarkan tingkat risiko keamanan informasi yang dapat diterima oleh Bank sesuai kebijakan keamanan, melakukan penerapan dan pemeliharaan peran keamanan informasi dan hak akses, serta melakukan pemantauan keamanan terhadap informasi Bank.', NULL, 22, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(23, 2, '1.B.16', 'Aktivitas pemantauan kinerja layanan TI yang memadai.', NULL, 23, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(24, 3, '2.A.1', 'Direksi memastikan arsitektur TI disusun selaras dengan strategi bisnis dan sesuai dengan kebutuhan bisnis Bank.', NULL, 24, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(25, 3, '2.A.2', 'Direksi dan Komite Pengarah TI terlibat secara aktif dalam penyusunan arsitektur TI.', NULL, 25, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(26, 3, '2.A.3', 'Pengelolaan arsitektur TI yang memadai oleh Bank.', NULL, 26, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(27, 3, '2.A.4', 'Penyusunan arsitektur TI melibatkan partisipasi dari pemangku kepentingan (stakeholders) terkait.', NULL, 27, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(28, 3, '2.A.5', 'Bank memiliki mekanisme permintaan dan pemberian informasi terkait arsitektur TI.', NULL, 28, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(29, 3, '2.A.6', 'Pelaksanaan strategi investasi TI, akuisisi TI, dan pengambilan keputusan bisnis TI selaras dengan arsitektur TI Bank serta RSTI.', NULL, 29, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(30, 4, '3.A.1', 'Bank melakukan identifikasi risiko terkait penyelenggaraan TI secara memadai.', NULL, 30, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(31, 4, '3.A.2', 'Bank melakukan pengukuran risiko terkait penyelenggaraan TI secara memadai.', NULL, 31, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(32, 4, '3.A.3', 'Bank menerapkan pemantauan risiko terkait penyelenggaraan TI secara memadai.', NULL, 32, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(33, 4, '3.A.4', 'Bank menerapkan pengendalian risiko penyelenggaraan TI secara memadai.', NULL, 33, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(34, 4, '3.A.5', 'Bank memiliki sistem informasi manajemen risiko terkait penyelenggaraan TI yang memadai disampaikan secara rutin kepada Direksi.', NULL, 34, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(35, 5, '4.A', 'Sesuai dengan peringkat tingkat maturitas keamanan siber dengan mengacu pada ketentuan \nOtoritas Jasa Keuangan mengenai ketahanan dan keamanan siber bagi bank umum.', NULL, 35, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(36, 6, '5.A.1', 'Bank memiliki kebijakan terkait adopsi TI.', NULL, 36, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(37, 6, '5.A.2', 'Bank melakukan studi kelayakan  untuk adopsi TI.', NULL, 37, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(38, 6, '5.A.3', 'Bank memiliki strategi implementasi TI.', NULL, 38, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(39, 6, '5.A.4', 'Bank melakukan evaluasi atas adopsi TI.', NULL, 39, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(40, 7, '5.B.1', 'Bank mengelola penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank secara  memadai termasuk yang diselenggarakan di luar wilayah Indonesia.', NULL, 40, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(41, 7, '5.B.2', 'Bank melakukan proses manajemen risiko atas penggunaan pihak  penyedia jasa TI secara memadai.', NULL, 41, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(42, 7, '5.B.3', 'Satuan Kerja TI/ satuan kerja terkait melakukan proses pemilihan pihak penyedia jasa TI dalam menentukan perusahaan penyedia jasa TI.', NULL, 42, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(43, 7, '5.B.4', 'Satuan kerja yang menjalankan fungsi TI memiliki standar isi perjanjian kerja sama dengan penyedia jasa TI.', NULL, 43, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(44, 7, '5.B.5', 'Satuan kerja hukum atau konsultan hukum Bank meninjau ulang perjanjian kerja sama antara Bank dan pihak penyedia jasa TI sebelum ditandatangani kedua belah pihak.', NULL, 44, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(45, 7, '5.B.6', 'Bank melakukan koordinasi dan komunikasi yang efektif dengan pihak penyedia jasa TI mengenai aspek yang telah disepakati dalam perjanjian kerja sama untuk memastikan kedua belah pihak memiliki pemahaman yang sama dan pihak penyedia jasa TImemahami dan mematuhi hal yang diperjanjikan.', NULL, 45, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(46, 7, '5.B.7', 'Bank meninjau isi perjanjian kerja sama secara berkala untuk mengidentifikasi klausul yang perlu dinegosiasikan dan diperbaharui,  disesuaikan dengan perubahan strategi bisnis Bank.', NULL, 46, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(47, 7, '5.B.8', 'Bank memiliki standar keamanan informasi yang memadai dalam kebijakan dan prosedur internal serta dalam perjanjian kerja sama dengan pihak penyedia jasa TI.', NULL, 47, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(48, 7, '5.B.9', 'Bank memiliki prosedur pemantauan dan kontrol yang efektif untuk memantau kinerja pihak penyedia jasa TI dan mengelola risiko terkait kegiatan yang dialihdayakan, terutama jika penggunaan jasa TI yang bersifat material terkonsentrasi pada satu pihak penyedia jasa TI.', NULL, 48, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(49, 7, '5.B.10', 'BCP Bank mencakup aspek terkait aktivitas penyelenggaraan jasa TI oleh pihak penyedia jasa TI dan \ndampaknya terhadap bisnis Bank', NULL, 49, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(50, 7, '5.B.11', 'Bank melaksanakan audit secara berkala untuk menilai pelaksanaan proses dan standar perjanjian kerja sama antara Bank dan pihak penyedia jasa TI serta dilakukan tindak lanjut atas temuan pemeriksaan.', NULL, 50, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(51, 7, '5.B.12', 'Bank memiliki rencana penghentian penggunaan pihak penyedia jasa TI (exit plan) apabila terjadi gangguan pada pihak penyedia jasa TI yang digunakan, melakukan penilaian atas keberlangsungan layanan dan data, dan melakukan pengujian/simulasi \nterhadap kelangsungan bisnis Bank.', NULL, 51, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(52, 8, '6.A.1', 'Bank memiliki kebijakan mengenai pembagian tugas dan kewenangan pengelolaan data', NULL, 52, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(53, 8, '6.A.2', 'Bank melakukan pengembangan dan upaya menjaga dan/atau memperbaiki kualitas data.', NULL, 53, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(54, 8, '6.A.3', 'Bank memiliki kebijakan dan prosedur pengelolaan data.', NULL, 54, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(55, 8, '6.A.4', 'Bank melakukan pengelolaan data secara memadai.', NULL, 55, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(56, 8, '6.A.5', 'Bank melakukan pengelolaan pangkalan data secara optimal, baik dari sisi desain dan dukungan penyimpanan data.', NULL, 56, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(57, 9, '6.B.1', 'Bank melakukan pengembangan dan/atau penyelenggaraan TI dengan mempertimbangkan aspek pelindungan data pribadi.', NULL, 57, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(58, 9, '6.B.2', 'Proses identifikasi dasar pemrosesan data pribadi nasabah dan/atau calon nasabah dilakukan secara memadai.', NULL, 58, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(59, 9, '6.B.3', 'Proses permintaan persetujuan nasabah dalam rangka pemrosesan data pribadi nasabah dan/atau calon nasabah dilakukan secara memadai.', NULL, 59, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(60, 9, '6.B.4', 'Proses rekam dan pengelolaan persetujuan nasabah dalam rangka pemrosesan data pribadi dilakukan secara memadai.', NULL, 60, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(61, 9, '6.B.5', 'Kerja sama antara Bank dan pihak ketiga untuk aktivitas pemrosesan data pribadi didukung oleh perjanjian kerja sama yang memadai.', NULL, 61, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(62, 9, '6.B.6', 'Proses identifikasi, dokumentasi, dan evaluasi tujuan proses pengumpulan dan pemrosesan data pribadi dilakukan secara memadai.', NULL, 62, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(63, 9, '6.B.7', 'Bank melakukan pemrosesan data pribadi secara akurat, lengkap, dan dapat dipertanggungjawabkan..', NULL, 63, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(64, 9, '6.B.8', 'Prosedur penanganan permintaan nasabah untuk pengkinian, perbaikan, penghapusan, atau pemusnahan data pribadi nasabah dilakukan secara memadai.', NULL, 64, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(65, 9, '6.B.9', 'Proses retensi data pribadi dilakukan secara memadai.', NULL, 65, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(66, 9, '6.B.10', 'Proses pengamanan data pribadidilakukan secara memadai.', NULL, 66, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(67, 9, '6.B.11', 'Proses penilaian dampak atas penerapan pelindungan data pribadi dilakukan secara memadai.', NULL, 67, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(68, 9, '6.B.12', 'Proses dokumentasi aktivitas pemrosesan data pribadi dilakukan secara memadai.', NULL, 68, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(69, 9, '6.B.13', 'Prosedur pemberian informasi pemrosesan data kepada nasabah yang memadai.', NULL, 69, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(70, 9, '6.B.14', 'Prosedur pemberian akses datapribadi dan informasi kepada nasabah yang memadai', NULL, 70, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(71, 9, '6.B.15', 'Proses penanganan permintaan nasabah untuk pembatasan pemrosesan data pribadi milik nasabah dilakukan secara memadai.', NULL, 71, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(72, 9, '6.B.16', 'Proses penanganan permintaan nasabah untuk mentransfer datapribadi milik nasabah ke pihak ketigadilakukan secara memada', NULL, 72, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(73, 9, '6.B.17', 'Proses penanganan penolakan nasabah atas pemrosesan data pribadi dilakukan secara memadai.', NULL, 73, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(74, 10, '6.C.1', 'Bank memiliki kebijakan, prosedur,dan standar mengenai pengendalian pertukaran atau transfer data dan infomasi yang memadai.', NULL, 74, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(75, 10, '6.C.2', 'Bank memiliki perjanjian kerja sama dengan pihak ketiga dalam rangka pertukaran atau transfer data.', NULL, 75, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(76, 10, '6.C.3', 'Bank menerapkan pengamanan atas data nasabah yang dipertukarkan sesuai dengan klasifikasi data.', NULL, 76, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(77, 10, '6.C.4', 'Bank menerapkan pelindungan data pribadi nasabah dalam pertukaran data pribadi nasabah.', NULL, 77, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(78, 11, '7.A.1', 'Direksi dan Dewan Komisaris menetapkan strategi dan kebijakan terkait kemitraan.', NULL, 78, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(79, 11, '7.A.2', 'Perjanjian kemitraan oleh Bank memiliki standar baku perjanjian kerja sama kemitraan.', NULL, 79, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(80, 11, '7.A.3', 'Bank memiliki kebijakan terkait pengujian kelayakan mitra.', NULL, 80, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(81, 11, '7.A.4', 'Bank melakukan pemantauan dan evaluasi hubungan kerja sama dengan mitra.', NULL, 81, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(82, 11, '7.A.5', 'Bank memastikan penerapan metode autentikasi secara aman bagi nasabah yang mengakses layanan Bank melalui mitra.', NULL, 82, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(83, 11, '7.A.6', 'Bank menentukan dan mendokumentasikan standar teknis interkoneksi antara mitra dan Bank.', NULL, 83, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(84, 12, '7.B.1', 'Penyediaan jasa TI oleh Bank sesuai ketentuan peraturan perundang-undangan dan menerapkan aspek kehati-hatian.', NULL, 84, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(85, 12, '7.B.2', 'Satuan kerja terkait melakukan identifikasi, pengukuran, pemantauan, dan pengendalian risiko atas penyediaan jasa TI oleh Bank.', NULL, 85, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(86, 13, '8.A.1.', 'Bank memperhatikan aspek keterlibatan nasabah (customer engagement) dan memiliki strategi untuk mempertahankan nasabah dalam menilai keberhasilan produk dan layanan Bank.', NULL, 86, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(87, 13, '8.A.2', 'Bank menyediakan layanan dan/atau produk yang ramah bagi penyandang disabilitas dan memiliki standar minimal pelayanan keuangan kepada nasabah dan/atau calon nasabah dengan disabilitas.', NULL, 87, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(88, 13, '8.A.3', 'Bank memanfaatkan data nasabah dalam mengembangkan produk dan layanan.', NULL, 88, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(89, 13, '8.A.4', 'Bank mengevaluasi produk dan layanan berdasarkan persepsi dan tingkat kepercayaan nasabah.', NULL, 89, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(90, 13, '8.A.5', 'Bank mengevaluasi produk dan layanan berdasarkan pengalaman nasabah.', NULL, 90, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(91, 14, '8.B.1', 'Bank memastikan aspek pelindungan data nasabah dalam perjanjian kerja sama kemitraan..', NULL, 91, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(92, 14, '8.B.2', 'Bank memiliki kebijakan dan mekanisme penyelesaian pengaduan nasabah layanan digital.', NULL, 92, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(93, 14, '8.B.3', 'Bank memiliki komitmen untuk melakukan sosialisasi terkait literasi keuangan di era digital.', NULL, 93, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(94, 14, '8.B.4', 'Bank menerapkan transparansi dan pengungkapan yang bertanggung jawab atas TI yang digunakan dalam hal adopsi TI berdampak langsung terhadap nasabah untuk memastikan bahwa nasabah memahami output yang dihasilkan oleh sistem berbasis TI.', NULL, 94, '2026-06-22 13:57:43', '2026-06-22 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `control_divisions`
--

CREATE TABLE `control_divisions` (
  `id` bigint UNSIGNED NOT NULL,
  `control_id` bigint UNSIGNED NOT NULL,
  `division_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `control_divisions`
--

INSERT INTO `control_divisions` (`id`, `control_id`, `division_id`) VALUES
(1, 1, 5),
(2, 2, 5),
(4, 3, 1),
(3, 3, 5),
(5, 4, 3),
(6, 5, 4),
(7, 5, 5),
(8, 6, 3),
(10, 6, 5),
(9, 6, 7),
(11, 7, 3),
(12, 7, 5),
(13, 8, 5),
(14, 9, 5),
(16, 10, 2),
(15, 10, 5),
(18, 11, 3),
(17, 11, 5),
(19, 12, 5),
(20, 13, 5),
(22, 14, 3),
(21, 14, 5),
(23, 14, 6);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'DAK', 'Divisi Akuntansi', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, 'DMR', 'Divisi Manajemen Risiko', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, 'DSDM', 'Divisi Sumber Daya Manusia', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, 'DST', 'Divisi Strategi & Transformasi', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(5, 'DTI', 'Divisi Teknologi Informasi', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(6, 'DUM', 'Divisi Umum', '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(7, 'SEKPER', 'Sekretariat Perusahaan', '2026-06-22 13:57:43', '2026-06-22 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `code`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, '1', 'Tata Kelola', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, '2', 'Arsitektur', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, '3', 'Manajemen Risiko', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, '4', 'Ketahanan dan Keamanan Siber', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(5, '5', 'Teknologi', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(6, '6', 'Data', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(7, '7', 'Kolaborasi', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(8, '8', 'Perlindungan Konsumen', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_01_000001_create_divisions_table', 1),
(5, '2025_01_01_000002_create_domains_table', 1),
(6, '2025_01_01_000003_create_subdomains_table', 1),
(7, '2025_01_01_000004_create_controls_table', 1),
(8, '2025_01_01_000005_create_sub_controls_table', 1),
(9, '2025_01_01_000006_create_control_divisions_table', 1),
(10, '2025_01_01_000007_add_role_and_division_to_users_table', 1),
(11, '2025_01_01_000008_create_assessment_periods_table', 1),
(12, '2025_01_01_000009_create_assessment_control_results_table', 1),
(13, '2025_01_01_000010_create_assessment_sub_control_results_table', 1),
(14, '2025_01_01_000011_create_score_caches_table', 1),
(15, '2025_01_02_000001_add_skor_to_score_caches', 1),
(16, '2025_06_23_000001_rename_viewer_to_approval_and_add_approval_columns', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `score_caches`
--

CREATE TABLE `score_caches` (
  `id` bigint UNSIGNED NOT NULL,
  `assessment_period_id` bigint UNSIGNED NOT NULL,
  `scoreable_type` enum('control','subdomain','domain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `scoreable_id` bigint UNSIGNED NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `skor` decimal(4,2) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` tinyint UNSIGNED NOT NULL,
  `calculated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `score_caches`
--

INSERT INTO `score_caches` (`id`, `assessment_period_id`, `scoreable_type`, `scoreable_id`, `percentage`, `skor`, `category`, `nilai`, `calculated_at`) VALUES
(1, 1, 'control', 1, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(2, 1, 'control', 2, 66.67, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(3, 1, 'control', 3, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(4, 1, 'control', 4, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(5, 1, 'control', 5, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(6, 1, 'control', 6, 66.67, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(7, 1, 'control', 7, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(8, 1, 'control', 8, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(9, 1, 'control', 9, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(10, 1, 'control', 10, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(11, 1, 'control', 11, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(12, 1, 'control', 12, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(13, 1, 'control', 13, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(14, 1, 'control', 14, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(15, 1, 'control', 15, 87.50, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(16, 1, 'control', 16, 62.50, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(17, 1, 'control', 17, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(18, 1, 'control', 18, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(19, 1, 'control', 19, 72.73, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(20, 1, 'control', 20, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(21, 1, 'control', 21, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(22, 1, 'control', 22, 85.71, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(23, 1, 'control', 23, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(24, 1, 'control', 25, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(25, 1, 'control', 26, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(26, 1, 'control', 28, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(27, 1, 'control', 29, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(28, 1, 'control', 30, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(29, 1, 'control', 31, 87.50, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(30, 1, 'control', 32, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(31, 1, 'control', 33, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(32, 1, 'control', 34, 83.33, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(33, 1, 'control', 36, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(34, 1, 'control', 37, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(35, 1, 'control', 38, 66.67, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(36, 1, 'control', 39, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(37, 1, 'control', 40, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(38, 1, 'control', 41, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(39, 1, 'control', 42, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(40, 1, 'control', 43, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(41, 1, 'control', 44, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(42, 1, 'control', 45, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(43, 1, 'control', 46, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(44, 1, 'control', 47, 81.25, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(45, 1, 'control', 48, 66.67, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(46, 1, 'control', 49, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(47, 1, 'control', 50, 70.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(48, 1, 'control', 51, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(49, 1, 'control', 52, 60.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(50, 1, 'control', 53, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(51, 1, 'control', 54, 90.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(52, 1, 'control', 55, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(53, 1, 'control', 56, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(54, 1, 'control', 57, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(55, 1, 'control', 58, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(56, 1, 'control', 59, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(57, 1, 'control', 60, 90.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(58, 1, 'control', 61, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(59, 1, 'control', 62, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(60, 1, 'control', 63, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(61, 1, 'control', 64, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(62, 1, 'control', 65, 91.67, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(63, 1, 'control', 66, 90.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(64, 1, 'control', 67, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(65, 1, 'control', 68, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(66, 1, 'control', 69, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(67, 1, 'control', 70, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(68, 1, 'control', 71, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(69, 1, 'control', 72, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(70, 1, 'control', 73, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(71, 1, 'control', 74, 56.25, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(72, 1, 'control', 75, 57.14, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(73, 1, 'control', 76, 70.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(74, 1, 'control', 77, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(75, 1, 'control', 78, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(76, 1, 'control', 79, 0.00, 5.00, 'Tidak Memadai (Unsatisfactory)', 5, '2026-06-22 13:57:44'),
(77, 1, 'control', 80, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(78, 1, 'control', 81, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(79, 1, 'control', 83, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(80, 1, 'control', 86, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(81, 1, 'control', 87, 33.33, 4.00, 'Kurang Memadai (Marginal)', 4, '2026-06-22 13:57:44'),
(82, 1, 'control', 88, 50.00, 3.00, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(83, 1, 'control', 89, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(84, 1, 'control', 90, 75.00, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(85, 1, 'control', 91, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(86, 1, 'control', 92, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(87, 1, 'control', 93, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(88, 1, 'control', 94, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(89, 1, 'subdomain', 1, 83.33, 1.57, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(90, 1, 'subdomain', 2, 83.34, 1.56, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(91, 1, 'subdomain', 3, 93.75, 1.25, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(92, 1, 'subdomain', 4, 84.17, 1.60, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(93, 1, 'subdomain', 6, 79.17, 1.75, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(94, 1, 'subdomain', 7, 88.99, 1.42, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(95, 1, 'subdomain', 8, 70.00, 2.20, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(96, 1, 'subdomain', 9, 98.33, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(97, 1, 'subdomain', 10, 58.35, 2.75, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(98, 1, 'subdomain', 11, 70.00, 2.20, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(99, 1, 'subdomain', 13, 61.67, 2.60, 'Cukup Memadai (Fair)', 3, '2026-06-22 13:57:44'),
(100, 1, 'subdomain', 14, 100.00, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(101, 1, 'domain', 1, 83.34, 1.57, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(102, 1, 'domain', 2, 93.75, 1.33, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(103, 1, 'domain', 3, 84.17, 1.60, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(104, 1, 'domain', 5, 86.54, 1.63, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(105, 1, 'domain', 6, 86.73, 1.65, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(106, 1, 'domain', 7, 70.00, 1.83, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(107, 1, 'domain', 8, 78.70, 1.89, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(108, 1, 'control', 24, 92.50, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(109, 1, 'control', 27, 92.50, 1.00, 'Sangat Memadai (Strong)', 1, '2026-06-22 13:57:44'),
(110, 1, 'control', 35, 72.50, 2.00, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44'),
(111, 1, 'control', 82, 10.00, 5.00, 'Tidak Memadai (Unsatisfactory)', 5, '2026-06-22 13:57:44'),
(112, 1, 'domain', 4, NULL, 1.96, 'Memadai (Satisfactory)', 2, '2026-06-22 13:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subdomains`
--

CREATE TABLE `subdomains` (
  `id` bigint UNSIGNED NOT NULL,
  `domain_id` bigint UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subdomains`
--

INSERT INTO `subdomains` (`id`, `domain_id`, `code`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, '1.A', 'Tatanan Institusi', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, 1, '1.B', 'Tata Kelola TI', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, 2, '2.A', 'Arsitektur TI', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, 3, '3.A', 'Manajemen Risiko TI', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(5, 4, '4.A', 'Tingkat Maturitas Keamanan Siber', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(6, 5, '5.A', 'Adopsi teknologi yang bertanggung jawab', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(7, 5, '5.B', 'Penggunaan Pihak Penyedia Jasa TI dalam Penyelenggaraan TI Bank (IT outsourcing)', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(8, 6, '6.A', 'Tata Kelola Data', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(9, 6, '6.B', 'Perlindungan Data Pribadi', 9, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(10, 6, '6.C', 'Transfer Data', 10, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(11, 7, '7.A', 'Kerja Sama Kemitraan', 11, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(12, 7, '7.B', 'Penyediaan Jasa TI Oleh Bank', 12, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(13, 8, '8.A', 'Pemenuhan Aspek Pelindungan dan Pelayanan Konsumen', 13, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(14, 8, '8.B', 'Pemenuhan Aspek Pelindungan Konsumen', 14, '2026-06-22 13:57:43', '2026-06-22 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `sub_controls`
--

CREATE TABLE `sub_controls` (
  `id` bigint UNSIGNED NOT NULL,
  `control_id` bigint UNSIGNED NOT NULL,
  `label` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `criteria_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_controls`
--

INSERT INTO `sub_controls` (`id`, `control_id`, `label`, `criteria_description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'a', 'Bank memiliki kecukupan serta dukungan permodalan yang memadai untuk mendukung rencana pengembangan TI.\nb. Terdapat dokumen pendukung yang menunjukkan komitmen dari pemegang saham untuk mendukung permodalan Bank dalam pengembangan TI, antara lain laporan rapat umum pemegang saham, rencana strategis TI (RSTI), rencana korporasi maupun rencana bisnis Bank yang memuat alokasi anggaran untuk pengembangan TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, 2, 'a', 'Bank melakukan analisis kelayakan rencana investasi yang akan didanai, memuat antara lain keselarasan rencana investasi TI dengan strategi Bank, keuntungan dan risiko bagi Bank, ketersediaan sumber pendanaan, \nperhitungan ekspektasi tingkat pengembalian investasi, serta dampak penambahan investasi terhadap portofolio investasi Bank secara keseluruhan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, 2, 'b', 'Bank menetapkan prioritas alokasi sumber dana pada investasi TI yang bernilai tinggi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, 2, 'c', 'Bank memantau kinerja portofolio investasi, seperti tren tingkat pengembalian investasi, deviasi anggaran, dan realisasi investasi.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(5, 3, 'a', 'Bank melakukan pengelolaan biaya secara efektif antara lain: \na. melakukan pemantauan deviasi anggaran, proyeksi biaya, dan realisasi biaya, termasuk analisis biaya dan manfaat; dan', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(6, 3, 'b', 'melakukan pemantauan penggunaan anggaran sesuai dengan manfaat yang diterima, termasuk jika penyelenggaraan TI disediakan oleh pihak penyedia jasa TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(7, 4, 'a', 'Bank memiliki komitmen untuk mengembangkan kepemimpinan yang berorientasi digital bagi Direksi, Dewan Komisaris, dan jajaran manajemen antara lain dengan menyediakan program pelatihan bagi Direksi, Dewan Komisaris, dan jajaran manajemen terkait pengembangan kepemimpinan yang berorientasi digital. Kepemimpinan yang berorientasi digital yaitu kepemimpinan strategis yang dapat memanfaatkan aset digital Bank untuk mencapai tujuan organisasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(8, 5, 'a', 'Bank memiliki desain organisasi yang memungkinkan Bank dapat melakukan pekerjaan yang mendukung transformasi digital, antara lain memuat aspek sebagai berikut: \na. Bank memiliki struktur organisasi yang kolaboratif, sehingga memungkinkan interaksi yang lebih luas antar unit kerja agar proses bisnis Bank berjalan lebih adaptif;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(9, 5, 'b', 'melaksanakan kewenangan yang terdesentralisasi di unit kerja sehingga pengambilan keputusan dapat dilakukan dengan lebih cepat; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(10, 5, 'c', 'pemanfaatan TI yang mendukung kolaborasi, komunikasi, dan konektivitas untuk menyelesaikan pekerjaan pada Bank.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(11, 6, 'a', 'Terdapat informasi yang menunjukkan komitmen Direksi dan Dewan Komisaris untuk mengembangkan budaya digital pada laporan tahunan dan rencana bisnis Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(12, 6, 'b', 'Bank memiliki pengembangan budaya digital antara lain kolaborasi, data driven, berfokus pada pelanggan (customer centric), inovasi digital, serta integrasi teknologi digital dalam semua proses bisnis.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(13, 6, 'c', 'Bank melakukan evaluasi program pengembangan budaya digital.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(14, 7, 'a', 'Bank memiliki kebijakan terkait pengembangan talenta digital secara terstruktur dan memadai mulai dari proses rekrutmen, perencanaan, evaluasi, dan pengembangan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(15, 7, 'b', 'Bank melakukan pengembangan talenta digital melalui rekrutmen atau pelatihan/sertifikasi, antara lain pada jenis keahlian terkait: \n1) perkembangan teknologi terkini, antara lain machine learning, blockchain, cloud integration, biometrics, dan experience design;\n2) digital business dan marketing;\n3) cybersecurity dan data privacy; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(16, 7, 'c', 'Bank melakukan evaluasi terhadap program pengembangan talenta digital secara berkala.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(17, 7, 'd', 'Bank memastikan keberlanjutan atas program pengembangan talenta digital.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(18, 8, 'a', 'Bank menyelaraskan tata kelola TI sesuai dengan prinsip tata kelola TI yang baik, melalui: \na. penetapan struktur, proses, dan praktik tata kelola TI yang selaras dengan prinsip tata kelola Bank; dan', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(19, 8, 'b', 'penetapan mekanisme koordinasi dan pelaporan terkait tata kelola TI untuk pengawasan dan pengambilan keputusan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(20, 9, 'a', 'Bank menyusun target investasi TI yang selaras dengan aspek berikut:\n1) strategi bisnis Bank;\n2) analisis biaya dan tingkat pengembalian investasi; dan\n3) tingkat risiko dan jenis manfaat yang akan diperoleh.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(21, 9, 'b', 'Bank memantau kesesuaian investasi TI dengan keuntungan yang diharapkan. Hal yang perlu diperhatikan Bank dalam melakukan pemantauan, yaitu:\n1) jumlah peluang pendapatan bisnis baru yang direalisasikan sebagai akibat langsung dari investasi TI; \n2) tujuan strategis Bank yang dicapai sebagai hasil dari inisiatif TI; dan \n3) tingkat kepuasan pemangku kepentingan terhadap inisiatif TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(22, 10, 'a', 'Bank mengidentifikasi dan mengevaluasi risiko penggunaan TI serta memastikan bahwa risiko penggunaan TI tidak melebihi toleransi risiko Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(23, 10, 'b', 'Bank menerapkan praktik manajemen risiko terhadap penggunaan TI, yaitu:\n1) Bank memiliki strategi pengelolaan risiko TI yang terintegrasi dalam praktik manajemen risiko Bank secara keseluruhan; dan\n2) Bank memiliki mekanisme atau proses untuk identifikasi, monitor, mitigasi, dan pelaporan risiko.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(24, 11, 'a', 'Bank mengidentifikasi dan mengevaluasi kebutuhan sumber daya terkait TI minimal 1 (satu) tahun sekali yang mencakup kebutuhan pendanaan, SDM, strategi, dan pengembangan kapabilitas yang diperlukan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(25, 11, 'b', 'Bank memonitor pengelolaan sumber daya telah dijalankan secara optimal. Hal yang perlu diperhatikan Bank yaitu:\n1) Bank memiliki mekanisme atau proses untuk identifikasi, respon atau mitigasi dan pelaporan suatu permasalahan; \n2) tingkat umpan balik (feedback) pemangku kepentingan tentang optimalisasi sumber daya;\n3) jumlah manfaat yang dicapai melalui optimalisasi pemanfaatan sumber daya, misalnya penghematan biaya; \n4) jumlah target kinerja pengelolaan sumber daya yang direalisasikan; dan\n5) jumlah proyek dan program dengan status berisiko sedang atau tinggi karena masalah pengelolaan sumber daya.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(26, 12, 'a', 'Bank melakukan identifikasi dan evaluasi terhadap pemangku kepentingan yang terlibat dalam tata kelola TI dan kebutuhan terkait komunikasi maupun pelaporan kepada pemangku kepentingan yang relevan. \n\nb. Bank memastikan keterlibatan pemangku kepentingan dan efektivitas komunikasi dengan pemangku kepentingan. Hal yang perlu diperhatikan Bank dalam memastikan keterlibatan pemangku kepentingan yaitu:\n\n1) tingkat keterlibatan pemangku kepentingan dengan TI Bank; \n2) tingkat kepuasan pemangku kepentingan dengan strategi komunikasi dan pelaporan; \n3) persentase laporan yang tidak akurat; dan \n4) persentase laporan yang disampaikan tepat waktu.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(27, 13, 'a', 'Bank merancang sistem manajemen TI sesuai dengan kebutuhan Bank. Hal yang perlu diperhatikan Bank dalam merancang sistem manajemen TI, yaitu:\n\n1) visi dan misi Bank; \n2) strategi Bisnis Bank; \n3) tantangan yang dihadapi Bank; \n4) lingkungan internal Bank, termasuk budaya, toleransi risiko, keamanan dan kebijakan privasi, nilai etika, kode etik, dan akuntabilitas; dan\n5) standar maupun regulasi terkait.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(28, 13, 'b', 'Bank mengkomunikasikan tujuan dan arah penggunaan TI ke seluruh pegawai. Hal yang perlu diperhatikan Bank yaitu memastikan informasi yang dikomunikasikan mencakup misi, tujuan layanan, dan pengendalian internal.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(29, 13, 'c', 'Bank menetapkan struktur organisasi sesuai dengan desain sistem manajemen, antara lain adanya komite pengarah TI.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(30, 13, 'd', 'Bank menetapkan peran dan tanggung jawab untuk pengelolaan TI Bank termasuk limit, tanggung jawab, dan akuntabilitas.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(31, 13, 'e', 'Bank mengoptimalkan penempatan fungsi TI dalam struktur organisasi. Penempatan fungsi TI dalam organisasi, baik terpusat, terdesentralisasi, maupun kombinasi, mencerminkan kepentingan strategis dan ketergantungan operasional TI dalam Bank, model operasional Bank dan strategi penempatan sumber daya pada fungsi TI.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(32, 13, 'f', 'Bank menentukan kepemilikan data dan informasi, serta sistem informasi.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(33, 13, 'g', 'Bank menentukan standar kompetensi yang diperlukan untuk mencapai tujuan bisnis bank yang relevan.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(34, 13, 'h', 'Bank menetapkan dan mengkomunikasikan kebijakan dan prosedur kontrol TI pada area utama seperti kualitas, keamanan, privasi, kontrol internal, penggunaan aset TI, etika, dan hak kekayaan intelektual.', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(35, 13, 'i', 'Bank menetapkan dan mengimplementasikan infrastruktur, layanan, dan aplikasi untuk mendukung tata kelola dan sistem manajemen.', 9, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(36, 14, 'a', 'Bank memahami lingkungan bisnis dan arah pengembangan Bank ke depan. Yang dimaksud lingkungan bisnis yaitu faktor penentu perubahan industri, regulasi terkait, tingkat persaingan, model operasional saat ini, dan target tingkat maturitas digitalisasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(37, 14, 'b', 'Bank menilai kemampuan, kinerja, dan tingkat maturitas digitalisasi Bank saat ini.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(38, 14, 'c', 'Bank menentukan target kapabilitas digital berdasarkan hasil pemahaman lingkungan bisnis dan arah pengembangan Bank ke depan. Target kapabilitas digital dapat mencakup produk dan layanan serta kapabilitas digital yang diperlukan untuk menghasilkan produk dan layanan tersebut.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(39, 14, 'd', 'Bank melakukan analisis kesenjangan antara lingkungan TI saat ini dan target ke depan, yang dapat dituangkan pada penilaian tingkat kesehatan Bank setelah dikomunikasikan kepada OJK terlebih dahulu.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(40, 14, 'e', 'Bank menetapkan rencana strategis dan peta jalan transformasi yang akan dilakukan. Rencana tersebut tercantum pada Rencana Strategis TI', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(41, 14, 'f', 'Bank mengkomunikasikan strategi dan arah pengembangan TI kepada seluruh pengampu kepentingan dan satuan kerja pengguna TI.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(42, 15, 'a', 'Bank memahami isu bisnis, tujuan dan ekspektasi atas TI yang dipergunakan Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(43, 15, 'b', 'Bank telah menjaga hubungan bisnis yang baik antara organisasi TI dan unit bisnis, antara lain peran dan tanggung jawab hubungan telah ditentukan, ditetapkan, dan dikomunikasikan secara memadai.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(44, 15, 'c', 'Bank telah melakukan komunikasi melalui sistem internal yang transparan dengan semua pemangku kepentingan yang relevan dan mengoordinasikan layanan TI yang diberikan kepada unit bisnis.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(45, 15, 'd', 'Bank secara berkesinambungan memperbaiki dan mengembangkan layanan TI yang diperlukan oleh organisasi agar tetap relevan dengan perkembangan bisnis Bank dan teknologi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(46, 16, 'a', 'Bank menganalisis layanan TI saat ini untuk mengidentifikasi kinerja layanan terhadap aktivitas bisnis yang didukung oleh layanan tersebut serta analisis kebutuhan untuk mengembangkan layanan TI.\nBank menganalisis persyaratan bisnis dan sejauh mana tingkat dan layanan yang mendukung TI, mendukung proses bisnis yang dapat dilakukan antara lain melalui analisis:\n\n1) jumlah aktivitas bisnis yang tidak didukung oleh layanan TI; dan \n2) jumlah layanan usang yang telah teridentifikasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(47, 16, 'b', 'Bank menganalisis layanan TI saat ini untuk mengidentifikasi kinerja layanan terhadap aktivitas bisnis mitra terkait penyediaan jasa TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(48, 16, 'c', 'Bank memiliki dan mengelola katalog layanan TI serta melakukan publikasi layanan aktif, yang mencakup: \n1) perbandingan layanan dan paket layanan TI langsung yang ditawarkan dengan portofolio; dan \n2) waktu sejak pembaruan portofolio layanan terakhir.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(49, 16, 'd', 'Bank memantau tingkat layanan TI, mengamati tren layanan TI, dan menetapkan langkah tindak lanjut atas penurunan kinerja layanan TI. Hal yang perlu diperhatikan dalam memantau tingkat layanan TI yaitu:\n1) tingkat beratnya pelanggaran layanan; \n2) persentase nasabah yang puas terhadap layanan; dan \n3) persentase target layanan terpenuhi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(50, 17, 'a', 'Bank mengembangkan manajemen mutu yang dijadikan standar dan pendekatan untuk sistem manajemen informasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(51, 17, 'b', 'Bank mengetahui kebutuhan pemangku kepentingan dan memastikan kebutuhan tersebut telah terintegrasi pada praktik manajemen kualitas.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(52, 17, 'c', 'Bank mengelola standar, praktik, dan prosedur kualitas serta mengintegrasikan manajemen kualitas ke dalam semua proses.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(53, 17, 'd', 'Bank melakukan pemantauan, pengendalian, dan evaluasi terhadap kualitas proses dan layanan secara berkesinambungan sesuai standar manajemen kualitas.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(54, 18, 'a', 'Bank membangun dan memelihara sistem manajemen keamanan informasi yang menyediakan pendekatan standar, formal, dan berkelanjutan untuk manajemen keamanan informasi, memungkinkan teknologi yang aman, dan proses bisnis yang selaras dengan kebutuhan bisnis.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(55, 18, 'b', 'Bank menetapkan dan mengelola rencana penanganan risiko keamanan informasi dan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(56, 18, 'c', 'Bank memantau dan meninjau sistem manajemen keamanan informasi secara berkala yang memperhitungkan paling sedikit: \n1) frekuensi tinjauan keamanan terjadwal; \n2) jumlah temuan dalam tinjauan keamanan yang dijadwalkan secara teratur; \n3) tingkat kepuasan pemangku kepentingan dengan rencana keamanan; dan \n4) jumlah insiden terkait keamanan yang disebabkan oleh kegagalan untuk mematuhi rencana keamanan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(57, 19, 'a', 'Bank mengelola seluruh proyek yang diinisiasi secara terkoordinasi dengan menggunakan pendekatan project management tools.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(58, 19, 'b', 'Bank mengelola seluruh program dari portofolio investasi terkait TI sesuai dengan strategi Bank secara terkoordinasi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(59, 19, 'c', 'Bank melakukan identifikasi solusi dan analisis persyaratan sebelum akuisisi atau pengembangan untuk memastikan bahwa solusi tersebut selaras dengan sasaran strategis Bank yang mencakup proses bisnis, aplikasi, informasi/data, infrastruktur, dan layanan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(60, 19, 'd', 'Bank merancang solusi TI, proses bisnis, dan alur kerja sesuai dengan persyaratan Bank membangun solusi TI yang mencakup tahap mengelola persiapan pengujian, pengujian, mengelola persyaratan, dan pemeliharaan proses bisnis, aplikasi, informasi/data, infrastruktur, dan layanan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(61, 19, 'e', 'Bank menyeimbangkan kebutuhan saat ini dan masa depan untuk ketersediaan, kinerja, dan kapasitas penyediaan layanan, termasuk menilai kemampuan saat ini, memprediksi kebutuhan masa depan berdasarkan kebutuhan bisnis, analisis dampak bisnis, dan penilaian risiko untuk merencanakan dan mengimplementasikan tindakan untuk memenuhi persyaratan yang diidentifikasi.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(62, 19, 'f', 'Bank melakukan berbagai upaya untuk memaksimalkan keberhasilan perubahan bisnis akibat solusi TI seperti mempersiapkan dan memperoleh komitmen dari seluruh pemangku kepentingan yang terdampak perubahan atas solusi TI.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(63, 19, 'g', 'Bank mengelola perubahan terkait TI, antara lain perubahan standar dan pemeliharaan yang berkaitan dengan proses bisnis, aplikasi, dan infrastruktur, yang mencakup evaluasi dampak perubahan, prioritisasi dan otorisasi permintaan perubahan, monitoring status perubahan, pelaporan, penutupan, dan dokumentasi.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(64, 19, 'h', 'Bank melakukan perencanaan implementasi, konversi sistem dan data, acceptance testing, komunikasi, persiapan rilis, promosi ke produksi proses bisnis/layanan TI baru atau yang diubah, dukungan produksi awal, dan kajian pascaimplementasi (post implementation \nreview).', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(65, 19, 'i', 'Bank menjaga ketersediaan informasi yang relevan, terkini, tervalidasi, dan andal untuk mendukung proses dan memfasilitasi \npengambilan keputusan terkait tata kelola dan manajemen TI Bank.', 9, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(66, 19, 'j', 'Bank mengelola aset TI di sepanjang siklus hidup TI untuk memastikan bahwa penggunaannya memberikan nilai dengan biaya optimal, aset tetap beroperasi sesuai dengan tujuan, dan diperhitungkan serta dilindungi secara fisik.', 10, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(67, 19, 'k', 'Bank menyusun dan mengelola model deskripsi dan hubungan (configuration model) layanan, aset, infrastuktur dan kapabilitas TI yang dibutuhkan untuk mendukung layanan TI.', 11, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(68, 20, 'a', 'Bank menerapkan prosedur operasional secara andal dan konsisten dalam memberikan layanan TI, baik layanan TI internal, layanan TI kepada pihak eksternal, infrastuktur TI, dan fasilitas terkait seperti peralatan daya dan komunikasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(69, 20, 'b', 'Bank memberikan respons yang tepat waktu dan efektif terhadap permintaan pengguna dan resolusi atas semua jenis insiden TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(70, 20, 'c', 'Bank melakukan upaya identifikasi dan klasifikasi masalah serta akar penyebab dari insiden atau permasalahan yang muncul, termasuk menyusun klasifikasi masalah, kategorisasi dan prioritas, mencakup hal sebagai berikut:\n1) persentase insiden besar yang masalahnya dicatat;\n2) persentase insiden yang diselesaikan sesuai dengan jaminan tingkat layanan atau service level agreement (SLA) yang disepakati; dan\n3) persentase masalah yang diidentifikasi dengan tepat, termasuk klasifikasi, kategorisasi, dan prioritas.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(71, 21, 'a', 'Bank menetapkan kebijakan, tujuan, dan ruang lingkup kelangsungan bisnis.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(72, 21, 'b', 'Bank telah melakukan Business Impact Analysis (BIA), termasuk:\n1) total waktu henti akibat insiden atau gangguan besar; dan\n2) persentase pemangku kepentingan utama yang terlibat dalam analisis dampak bisnis yang mengevaluasi dampak gangguan dari waktu ke waktu terhadap fungsi bisnis penting dan dampak gangguan terhadap Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(73, 21, 'c', 'Bank telah mengevaluasi berbagai pilihan strategi ketahanan bisnis guna memastikan kelangsungan bisnis disaat terjadi insiden TI.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(74, 21, 'd', 'Bank telah mengembangkan dan mengimplementasikan Business Continuity Plan (BCP) dan Disaster Recovery Plan (DRP) berdasarkan pilihan strategi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(75, 21, 'e', 'Bank memastikan uji coba BCP dan DRP dilakukan secara berkala dan telah memenuhi kebutuhan bisnis sesuai BIA.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(76, 21, 'f', 'Bank telah melakukan tinjauan atas kecukupan BCP dan DRP pasca hasil uji coba dan pasca insiden/disrupsi.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(77, 22, 'a', 'Bank mengelola keamanan pada level sistem aplikasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(78, 22, 'b', 'Bank mengelola keamanan jaringan dan konektivitas.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(79, 22, 'c', 'Bank mengelola keamanan endpoint, seperti pada laptop, desktop, server, perangkat jaringan atau perangkat aplikasi.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(80, 22, 'd', 'Bank mengelola identitas pengguna dan logical access.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(81, 22, 'e', 'Bank mengelola physical access ke aset TI.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(82, 22, 'f', 'Bank mengelola output devices seperti printer dan security tokens.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(83, 22, 'g', 'Bank mengelola kerentanan dan memantau infrastruktur untuk kejadian terkait keamanan.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(84, 23, 'a', 'Bank melakukan evaluasi kesesuaian TI dengan target kinerja yang disepakati minimal 1 (satu) kali dalam setahun.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(85, 23, 'b', 'Bank memiliki mekanisme untuk melakukan evaluasi atas kecukupan kontrol internal.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(86, 23, 'c', 'Bank mengevaluasi bahwa proses bisnis yang didukung TI patuh terhadap persyaratan perjanjian dan ketentuan peraturan perundang-undangan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(87, 23, 'd', 'Bank melakukan pemeriksaan independen \nterkait TI terhadap kepatuhan atas persyaratan internal, ketentuan peraturan perundang_x0002_undangan, dan tujuan strategis.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(88, 25, 'a', 'Direksi dan Komite Pengarah TI terlibat secara aktif dalam proses penyusunan arsitektur TI sesuai kewenangannya. Keterlibatan Direksi dan Komite Pengarah TI dilihat dari adanya rapat rutin sesuai kebutuhan Bank untuk pembahasan terkait penyusunan arsitektur TI termasuk perubahannya, apabila ada.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(89, 26, 'a', 'Arsitektur TI Bank disusun dengan mempertimbangkan faktor paling sedikit:\n1) visi dan misi Bank;\n2) rencana korporasi Bank;\n3) proses dan kapabilitas bisnis Bank; \n4) tata kelola TI Bank;\n5) prinsip pengelolaan data, aplikasi, dan teknologi Bank; \n6) ukuran dan kompleksitas bisnis Bank;\n7) kemampuan permodalan Bank;\n8) standar yang berlaku secara nasional maupun internasional; dan \n9) ketentuan peraturan perundang-undangan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(90, 26, 'b', 'Arsitektur TI Bank mempertimbangkan kebijakan keamanan TI;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(91, 26, 'c', 'Arsitektur TI Bank dievaluasi secara berkala untuk memastikan kesesuaian dengan kondisi terkini.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(92, 28, 'a', 'Bank memiliki mekanisme persetujuan, tata cara pemberian informasi, dan media komunikasi kepada pemangku kepentingan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(93, 29, 'a', 'Investasi TI dan akusisi TI Bank selaras dengan arsitektur TI Bank serta RSTI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(94, 29, 'b', 'Arsitektur TI Bank menjadi salah satu referensi dalam pengambilan keputusan bisnis terkait TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(95, 30, 'a', 'Bank melakukan identifikasi dan penilaian risiko TI dengan terlebih dahulu memastikan adanya risk awareness di seluruh lini Bank, yaitu:\n1) risk awareness dari Direksi dan pejabat eksekutif;\n2) pemahaman yang jelas mengenai risk appetite dari Bank;\n3) pemahaman terhadap ketentuan peraturan perundang-undangan terkait TI; dan\n4) transparansi dan integrasi terkait tanggung jawab mengenai risiko yang signifikan dari setiap aspek terkait penyelenggaraan TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(96, 30, 'b', 'Bank memiliki pendekatan manajemen risiko yang terpadu atau terintegrasi untuk dapat melakukan identifikasi risiko terkait penyelenggaraan TI yang utama antara lain risiko operasional, risiko kepatuhan, risiko hukum, risiko reputasi, dan risiko stratejik.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(97, 30, 'c', 'Bank melakukan identifikasi terhadap aset dan infrastruktur informasi vital, berikut risiko yang menyertainya.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(98, 30, 'd', 'Risiko untuk aspek penyelenggaraan TI pada risiko operasional harus dikaji ulang bersamaan dengan risiko lain yang dimiliki Bank untuk menentukan profil risiko Bank secara keseluruhan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(99, 31, 'a', 'Penilaian risiko untuk aspek TI pada risiko operasional oleh Bank harus dilakukan secara berkesinambungan sebagai suatu siklus dan paling sedikit memuat 4 (empat) langkah penting berikut:\n\n1) melakukan pengumpulan data atau dokumen atas aktivitas terkait TI yang berpotensi menimbulkan atau meningkatkan risiko, baik dari kegiatan yang sedang maupun yang akan berjalan termasuk namun tidak terbatas pada:\na) hasil kaji ulang rencana strategis bisnis;\nb) hasil uji tuntas (due diligence) dan pemantauan terhadap kinerja pihak penyedia jasa TI;\nc) hasil kaji ulang atas laporan atau keluhan yang disampaikan oleh nasabah dan/atau pengguna TI padacall center dan/atau helpdesk; \nd) hasil penilaian sendiri (self assessment yang dilakukan seluruh satuan kerja terhadap pengendalian yang dilakukan terkait TI; dan\ne) temuan audit terkait penyelenggaraan dan penggunaan TI;\n2) melakukan analisis risiko berkaitan dengan dampak potensial dari setiap risiko, seperti fraud pada pemrograman, virus komputer, kegagalan sistem, bencana alam, dan kesalahan pemilihan teknologi yang digunakan;\n3) menetapkan prioritas pengendalian dan langkah mitigasi yang didasarkan pada hasil penilaian risiko Bank secara keseluruhan. Bank membuat peringkat risiko berdasarkan kemungkinan kejadian dan besarnya dampak yang dapat ditimbulkan serta mitigasi risiko yang dapat dilakukan untuk menurunkan eksposur risiko tersebut; dan\n4) melakukan pemantauan kegiatan pengendalian dan mitigasi yang telah dilakukan atas risiko yang diidentifikasi dalam periode penilaian risiko sebelumnya, yang antara lain mencakup rencana tindak lanjut perbaikan, kejelasan akuntabilitas dan tanggung jawab, sistem pelaporan, serta pengendalian kualitas termasuk bentuk pengawasan lain atau compensating controls.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(100, 31, 'b', 'Bank memperhatikan signifikansi dampak risiko yang telah diidentifikasi oleh Bank terhadap kondisi Bank dan frekuensi terjadinya risiko.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(101, 31, 'c', 'Bank memiliki dokumentasi risiko atau yang sering disebut sebagai risk register yang paling sedikit memuat:\n1) penetapan aset, proses, produk, atau kejadian yang mengandung risiko;\n2) pengukuran atau pemeringkatan kemungkinan kejadian dan dampak (inherent risk assessment); dan\n3) langkah penanganan terhadap risiko potensial (potential risk treatment), misalnya accept, control, avoid, atau transfer (ACAT).', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(102, 31, 'd', 'Dalam dokumentasi penanganan terhadap risiko potensial (potential risk treatment), Bank memperhatikan antara lain risk appetite dari manajemen, fasilitas yang dapat digunakan sebagai preventive control atau corrective control, dan kesesuaian rencana mitigasi risiko dengan kondisi keuangan Bank. Dokumentasi penanganan terhadap risiko potensial perlu dikinikan secara berkala.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(103, 32, 'a', 'Bank melakukan pemantauan risiko terkait penyelenggaraan TI dengan mengevaluasi kesesuaian, kecukupan, dan efektivitas kinerja penyelenggaraan TI. Hal yang dapat menjadi cakupan dalam evaluasi antara lain:\n1) hasil audit dan kajian terkait;\n2) umpan balik yang diterima;\n3) kebijakan, standar, dan prosedur serta penerapannya;\n4) status dari tindakan preventif maupun korektif terkait risiko yang dihadapi Bank;\n5) kelemahan dan ancaman, baik yang telah ada maupun yang masih berupa potensi;\n6) hasil pengukuran atas efektivitas penyelenggaraan TI;\n7) tindak lanjut atas hasil evaluasi sebelumnya;\n8) perubahan kondisi yang mempengaruhi penyelenggaraan TI; dan\n9) rekomendasi untuk perbaikan atau penyempurnaan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(104, 32, 'b', 'Tindak lanjut atas hasil evaluasi dapat dituangkan dalam bentuk keputusan maupun tindakan untuk meningkatkan efektivitas penyelenggaraan TI Bank, antara lain:\n1) pengkinian profil risiko, pengukuran risiko, dan rencana penanganan risiko;\n2) penyempurnaan kebijakan, standar, dan prosedur di bidang TI;\n3) pemenuhan kebutuhan SDM;\n4) penetapan dan pelaksanaan tindakan preventif dan korektif berdasarkan penilaian atas ketidaksesuaian yang ada maupun yang masih bersifat potensi, dengan mempertimbangkan skala prioritas; \n5) pemantauan dan evaluasi atas pelaksanaan tindakan preventif dan korektif; dan\n6) pendokumentasian hasil evaluasi dan tindak lanjut harus secara memadai.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(105, 33, 'a', 'Bank memperhatikan praktik pengendalian risiko penyelenggaraan TI secara keseluruhan dengan memperhatikan paling sedikit:\n1) hasil penilaian risiko;\n2) kriteria penanganan risiko dan rekomendasi bentuk penanganan risiko; dan\n3) ketentuan peraturan perundang undangan dan persyaratan hukum atau kontrak lainnya.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(106, 33, 'b', 'Bank melakukan pengendalian risiko \npenyelenggaraan TI dengan: \n1) menerapkan kebijakan, standar, dan prosedur, serta struktur organisasi termasuk alur kerja;\n2) menerapkan pengendalian intern yang efektif yang dapat memitigasi risiko dalam proses TI;\n3) menerapkan identifikasi persyaratan \nspesifik pengendalian intern yang diperlukan dalam setiap kebijakan dan prosedur yang diterapkan;\n4) menetapkan kebijakan, standar, dan prosedur sistem pengelolaan pengamanan informasi yang diperlukan Bank untuk melakukan pengamanan aset terkait penyelenggaraan TI termasuk data atau informasi;\n5) melakukan evaluasi hasil kaji ulang dan pengujian atas DRP untuk setiap bagian operasional yang kritis;\n6) menetapkan kebijakan dan prosedur mengenai penggunaan pihak penyedia jasa \nTI;\n7) melakukan evaluasi terkait kemampuan penyedia jasa TI untuk menjaga tingkat keamanan paling sedikit sama atau lebih \nketat dari yang diterapkan oleh pihak intern \nBank baik dari sisi kerahasiaan, integritas  data, dan ketersediaan informasi;\n8) menggunakan asuransi sebagai upaya untuk melengkapi mitigasi potensi kerugian dalam penyelenggaraan TI; dan\n9) melakukan kaji ulang secara berkala atas kebutuhan, cakupan, dan nilai asuransi yang ditutup.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(107, 34, 'a', 'Direksi memberikan arahan strategis atas ketersediaan sistem informasi manajemen risiko terkait penyelenggaraan TI yang dapat menghasilkan informasi yang diperlukan dalam rangka mendukung peran dan fungsi manajemen secara efektif.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(108, 34, 'b', 'Bank memastikan sistem informasi manajemen risiko terkait penyelenggaraan TI dapat:\n1) memfasilitasi pengelolaan operasional bisnis Bank termasuk pelayanan kepada nasabah;\n2) melakukan pencatatan dan mengumpulkan informasi secara objektif;\n3) mendistribusikan data atau informasi ke berbagai satuan kerja yang sesuai, baik dari sisi jenis informasi, kualitas dan kuantitas informasi, maupun frekuensi dan waktu pengiriman laporan yang dibutuhkan;\n4) meningkatkan efektivitas dan efisiensi komunikasi di Bank;\n5) membantu Bank meningkatkan kepatuhan terhadap ketentuan peraturan perundangundangan; dan\n6) mendukung proses penilaian kinerja seluruh satuan kerja.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(109, 34, 'c', 'Satuan kerja TI menetapkan kebijakan, prosedur, dan pengendalian manajemen pangkalan data (database) dan pembuatan laporan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(110, 36, 'a', 'Kebijakan terkait proses adopsi TI Bank memuat paling sedikit:\na. identifikasi kebutuhan adopsi TI;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(111, 36, 'b', 'kajian, studi kelayakan, dan strategi adopsi TI;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(112, 36, 'c', 'budaya kerja yang mendukung inovasi pengembangan TI; dan', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(113, 36, 'd', 'kerja sama dengan pihak ketiga dalam implementasi adopsi TI.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(114, 37, 'a', 'Studi kelayakan yang dilakukan Bank memuat paling sedikit:\na. potensi dari inovasi yang dihasilkan dari penggunaan TI bagi Bank dan nasabah;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(115, 37, 'b', 'analisis berbagai aspek terkait implementasi TI antara lain risiko inheren, kesesuaian dengan arsitektur TI, keselarasan dengan strategi bisnis Bank, dampak hukum yang ditimbulkan dari pemanfaatan teknologi, regulasi terkait pemanfaatan teknologi baru, keselarasan dengan strategi TI Bank, penerapan praktik dan standar baik secara nasional maupun internasional, serta mitigasi atas risiko yang ditimbulkan;\nc. metode pengukuran dan pemantauan risiko yang muncul atas adopsi TI; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(116, 37, 'd', 'perencanaan implementasi adopsi TI atau inovasi yang mencakup target, kebutuhan anggaran dan analisis tingkat pengembalian investasi, jangka waktu pengembangan, dan akuntabilitas dari adopsi TI.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(117, 38, 'a', 'Strategi implementasi TI Bank memuat paling sedikit:\na. kesesuaian adopsi TI dengan Rencana Strategis TI;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(118, 38, 'b', 'metode implementasi TI antara lain big bang, piloting atau paralel; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(119, 38, 'c', 'penggunaan sistem pendukung atau utama', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(120, 39, 'a', 'Evaluasi atas adopsi TI mencakup:\na. Bank memantau penerapan dan penggunaan TI untuk memastikan bahwa manfaat atau hasil yang diharapkan dari penggunaan TI terealisasi sesuai perencanaan Bank;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(121, 39, 'b', 'Bank melakukan evaluasi atas TI yang diadopsi dengan periode dan cakupan tertentu. Yang dimaksud dengan cakupan tertentu seperti performance testing, backtesting, dan benchmarking.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(122, 39, 'c', 'Bank mengidentifikasi pelajaran terpetik dari adopsi TI dan merekomendasikan tindak lanjut atas hasil evaluasi.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(123, 40, 'a', 'Pengelolaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank secara memadai mencakup:\na. Bank menerapkan manajemen risiko terkait penggunaan pihak penyedia jasa TI dengan mengacu pada penerapan proses manajemen risiko dalam penyelenggaraan TI. Dalam hal Bank menempatkan sistem elektronik pada pusat data dan/atau pusat pemulihan bencana di luar wilayah Indonesia, Bank mempertimbangkan risiko negara', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(124, 40, 'b', 'Bank menetapkan strategi terkait penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank dan strategi tersebut telah sejalan dengan strategi TI dan strategi Bank secara keseluruhan;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(125, 40, 'c', 'Bank menetapkan kebijakan dan prosedur yang memadai terkait penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(126, 40, 'd', 'Bank menetapkan wewenang dan tanggung jawab yang jelas dari Direksi, Dewan Komisaris, Komite Pengarah TI, dan pejabat tertinggi yang memimpin satuan kerja TI serta pejabat pada setiap jenjang jabatan yang terkait dengan penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(127, 40, 'e', 'Bank melakukan monitoring, pengawasan, dan evaluasi atas strategi dan kebijakan penggunaan pihak penyedia jasa TI dalam penyelenggaraan TI Bank secara berkala.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(128, 41, 'a', 'Bank melakukan proses manajemen risiko penggunaan pihak penyedia jasa TI, meliputi:\na. tanggung jawab Bank atas penerapan manajemen risiko terkait penggunaan pihak penyedia jasa TI;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(129, 41, 'b', 'penyediaan DRP yang teruji dan memadai; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(130, 41, 'c', 'penetapan dan pemantauan atas pemenuhan persyaratan keamanan data dan/atau informasi dalam kebijakan dan prosedur intern serta dalam perjanjian kerja sama.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(131, 42, 'a', 'Bank dalam melakukan proses pemilihan pihak penyedia jasa TI, paling sedikit memperhatikan:\na. kualifikasi dan kompetensi pihak penyedia jasa TI, termasuk SDM yang dimiliki;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(132, 42, 'b', 'analisis biaya dan manfaat dengan mengikutsertakan satuan kerja penyelenggara TI Bank;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(133, 42, 'c', 'prinsip kehati-hatian dan manajemen risiko; dan', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(134, 42, 'c', 'komitmen pihak penyedia jasa TI untuk menyampaikan hasil audit TI secara berkala yang dilakukan auditor independen atas penyediaan jasa TI kepada Bank;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(135, 43, 'a', 'Bank dalam melakukan hubungan kerja sama dengan pihak penyedia jasa TI memiliki perjanjian kerja sama dengan pihak penyedia jasa TI, dengan memperhatikan paling sedikit:\na. kualifikasi dan kompetensi SDM yang dimiliki pihak penyedia jasa TI;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(136, 43, 'b', 'komitmen pihak penyedia jasa TI dalam menjaga kerahasiaan data dan/atau informasi Bank serta nasabah Bank;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(137, 43, 'c', 'komitmen pihak penyedia jasa TI untuk menyampaikan hasil audit TI secara berkala yang dilakukan auditor independen atas penyediaan jasa TI kepada Bank;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(138, 43, 'd', 'pengalihan sebagian kegiatan atau subkontrak oleh pihak penyedia jasa TI dilakukan atas persetujuan Bank yang dibuktikan dengan dokumen tertulis;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(139, 43, 'e', 'mekanisme pelaporan kejadian kritis oleh pihak penyedia jasa TI kepada Bank;', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(140, 43, 'f', 'mekanisme penghentian perjanjian kerja sama jika terdapat penghentian perjanjian sebelum jangka waktu perjanjian berakhir;', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(141, 43, 'g', 'pemenuhan ketentuan peraturan perundang-undangan atas penyediaan jasa TI oleh pihak penyedia jasa TI;', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(142, 43, 'h', 'kesediaan pihak penyedia jasa TI untuk memenuhi kewajiban dan/atau persyaratan yang dimuat dalam perjanjian kerja sama;', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(143, 43, 'i', 'kesediaan pihak penyedia jasa TI untuk memberikan akses kepada Otoritas Jasa Keuangan dan/atau pihak lain yang berwenang untuk melakukan pemeriksaan terhadap kegiatan penyediaan jasa TI yang diberikan sesuai dengan ketentuan peraturan perundang_x0002_undangan;', 9, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(144, 43, 'j', 'SLA; dan', 10, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(145, 43, 'k', 'klausul yang menyatakan bahwa SLA tetap berlaku apabila terjadi perubahan kepemilikan baik pada Bank maupun penyedia jasa TI.', 11, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(146, 44, 'a', 'Bank memiliki pegawai atau konsultan hukum yang kompeten untuk melakukan evaluasi atas perjanjian kerja sama yang terkait dengan penyediaan jasa TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(147, 45, 'a', 'Satuan Kerja TI atau satuan kerja terkait telah melakukan koordinasi dan komunikasi yang efektif dengan pihak penyedia jasa TI mengenai aspek yang telah disepakati dalam perjanjian kerja sama untuk memastikan kedua belah pihak memiliki pemahaman yang sama dan pihak penyedia jasa TI memahami dan mematuhi hal yang diperjanjikan (misalnya ruang lingkup pekerjaan yang telah disepakati oleh kedua pihak telah termuat dalam Term of Reference/TOR).', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(148, 45, 'b', 'Bank telah melakukan alih pengetahuan (transfer of knowledge) terkait area pekerjaan yang dialihdayakan kepada pihak penyedia jasa TI melalui komunikasi yang efektif.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(149, 46, 'a', 'Terdapat dokumen tertulis atau laporan mengenai peninjauan klausul perjanjian dengan penyedia jasa TI secara berkala kepada Direksi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(150, 46, 'b', 'Bank melakukan koordinasi dan komunikasi yang efektif dengan pihak penyedia jasa TI mengenai penyesuaian perjanjian kerja sama untuk memastikan pemahaman kedua belah pihak atas penyesuaian klausul yang telah disepakati.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(151, 47, 'a', 'Bank memiliki standar keamanan informasi yang harus dipenuhi oleh penyedia jasa TI serta dalam perjanjian kerja sama dengan pihak penyedia jasa TI mencakup paling sedikit:\na. keamanan informasi organisasi;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(152, 47, 'b', 'pengelolaan akses;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(153, 47, 'c', 'manajemen enkripsi dan sandi;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(154, 47, 'd', 'keamanan jaringan dan operasi;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(155, 47, 'e', 'aplikasi pemrograman antarmuka atau application programming interfaces (API);', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(156, 47, 'f', 'lokasi data;', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(157, 47, 'g', 'kerahasiaan data pribadi konsumen; dan', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(158, 47, 'h', 'pemusnahan data/informasi Bank dan nasabah Bank pada saat perjanjian kerja sama berakhir.', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(159, 48, 'a', 'Bank dalam melakukan penilaian kinerja dan kepatuhan pihak penyedia jasa TI memperhatikan paling sedikit:\na. pemantauan dan evaluasi keandalan pihak penyedia jasa TI secara berkala terkait kinerja, reputasi pihak penyedia jasa TI, dan kelangsungan penyediaan layanan;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(160, 48, 'b', 'penerapan pengendalian TI secara memadai oleh pihak penyedia jasa TI, yang dibuktikan dengan hasil audit dan/atau penilaian yang dilakukan oleh pihak independen; dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(161, 48, 'c', 'pemenuhan tingkat layanan sesuai dengan SLA antara Bank dan pihak penyedia jasa TI.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(162, 49, 'a', 'Dalam penyusunan BCP, Bank telah memperhitungkan peran pihak peyedia jasa TI pada proses bisnis Bank serta mempertimbangkan recovery time objectives (RTO) dan recovery point objectives (RPO) pihak penyedia jasa TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(163, 49, 'b', 'Bank mampu mengidentifikasi keterkaitan antar sistem dalam menjalankan proses bisnis.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(164, 49, 'c', 'Bank melakukan pengujian BCP dengan mengikutsertakan pihak penyedia jasa TI.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(165, 50, 'a', 'Rencana kerja tahunan audit intern mencakup pemeriksaan berkala terhadap proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(166, 50, 'b', 'Terdapat prosedur audit terhadap pihak penyedia jasa TI, baik dilakukan oleh audit intern Bank maupun pihak audit ekstern yang ditunjuk oleh Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(167, 50, 'c', 'Terdapat laporan hasil audit intern dan/atau ekstern terhadap proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI dan pelaksanaan audit telah berjalan dengan efektif dengan memperhatikan faktor sebagai berikut:\n1) cakupan dan kedalaman audit telah meliputi seluruh proses dan standar perjanjian kerja sama dengan pihak penyedia jasa TI;\n2) kompetensi auditor intern telah sesuai dengan kompleksitas aktivitas pihak penyedia jasa TI dalam penyelenggaraan TI \nBank dan memiliki keahlian pada bidang yang diaudit; dan\n3) kelengkapan dokumentasi atas cakupan, prosedur, temuan audit, dan tanggapan manajemen terhadap temuan audit.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(168, 50, 'd', 'Satuan kerja audit intern melakukan monitoring terhadap tindak lanjut atas temuan pemeriksaan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(169, 50, 'e', 'Satuan kerja audit intern melakukan tindak lanjut dalam hal temuan pemeriksaan tidak ditindaklanjuti oleh manajemen.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(170, 51, 'a', 'Bank memiliki kebijakan dan prosedur internal mengenai rencana penghentian penggunaan pihak penyedia jasa TI dalam hal terdapat kondisi antara lain:\n1) memburuknya kinerja penyelenggaraan TI oleh pihak penyedia jasa TI yang berpotensi menimbulkan dan/atau mengakibatkan \ndampak yang signifikan pada kegiatan usaha Bank;\n2) pihak penyedia jasa TI menjadi insolven, dalam proses menuju likuidasi, atau dipailitkan oleh pengadilan;\n3) terdapat pelanggaran oleh pihak penyedia jasa TI terhadap ketentuan peraturan perundang-undangan mengenai rahasia \nbank dan pelindungan data pribadi;\n4) terdapat kondisi yang menyebabkan Bank tidak dapat menyediakan data yang diperlukan dalam rangka pengawasan oleh \nOtoritas Jasa Keuangan; dan\n5) hasil penilaian ulang materialitas menunjukkan bahwa penyediaan jasa TI tidak berjalan dengan efektif.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(171, 51, 'b', 'Bank melakukan penilaian atas ketahanan dan keberlangsungan layanan dan data terkait dengan kegiatan yang diserahkan kepada pihak penyedia jasa TI serta pengujian atau simulasi terhadap kelangsungan bisnis Bank dalam hal akan dilakukan penghentian penggunaan pihak penyedia jasa TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(172, 51, 'c', 'Seluruh proses penghentian penggunaan pihak penyedia jasa TI telah didokumentasikan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(173, 52, 'a', 'Pengelolaan data mencakup aktivitas:\n1) penyusunan kebijakan dan standar pengelolaan data;\n2) pengelolaan kualitas data; dan\n3) pelaksanaan kegiatan operasional pengelolaan data.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(174, 52, 'b', 'Bank memiliki kebijakan mengenai tugas dan tanggung jawab dalam pengelolaan data.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(175, 52, 'c', 'Bank menetapkan pembagian tugas dan wewenang pengelolaan data sesuai kompleksitas usaha Bank dengan memperhatikan kepemilikan dan kepengurusan data.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(176, 52, 'd', 'Direksi dan Dewan Komisaris Bank memahami dan secara aktif menerapkan prinsip pemrosesan data dalam rangka pelindungan data di Bank, serta bertanggung jawab atas kepatuhan terhadap prinsip-prinsip tersebut.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(177, 52, 'e', 'Bank menetapkan kebijakan pengelolaan data secara memadai.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(178, 53, 'a', 'Bank menetapkan standar, persyaratan, dan spesifikasi penerapan kontrol kualitas data.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(179, 53, 'b', 'Bank melakukan identifikasi permasalahan terkait kualitas data.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(180, 53, 'c', 'Bank melakukan upaya peningkatan kualitas data yang diidentifikasi.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(181, 53, 'd', 'Bank melakukan evaluasi tingkat kualitas data', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(182, 54, 'a', 'Bank memiliki kebijakan data yang memuat paling sedikit prinsip dan tujuan Bank dalam pengelolaan data serta aturan dasar yang mengatur pembuatan, akuisisi, keamanan, kualitas, dan penggunaan data dan informasi, termasuk klasifikasi data, serta pemrosesan data nasabah dan calon nasabah.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(183, 54, 'b', 'Bank menetapkan klasifikasi data berdasarkan kritikalitas dan sensitivitas dari masing-masing jenis data.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(184, 54, 'c', 'Bank memiliki kebijakan kontrol akses pengelolaan data sesuai klasifikasi data.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43');
INSERT INTO `sub_controls` (`id`, `control_id`, `label`, `criteria_description`, `order`, `created_at`, `updated_at`) VALUES
(185, 54, 'd', 'Bank memiliki kebijakan dan strategi pelindungan data sesuai peraturan perundang_x0002_undangan mengenai pelindungan data pribadi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(186, 54, 'e', 'Bank memiliki kebijakan dan prosedur pemrosesan data yang memuat antara lain:\n1) pemrosesan data secara adil dan transparan, seperti data nasabah/calon nasabah diperoleh dengan cara yang sah serta dipergunakan secara sah dan tidak dipergunakan untuk perbuatan melanggar hukum;\n2) proses pengumpulan data nasabah/calon nasabah;\n3) informasi yang diberikan kepada individu dan pelaksanaan hak individu;\n4) langkah teknis pengelolaan keamanan data;\n5) prosedur penyelesaian perselisihan dengan nasabah terkait akurasi pencatatan data nasabah;\n6) pengelolaan dokumentasi setiap tahap pemrosesan data;\n7) pelaporan kebocoran data nasabah; dan\n8) analisis dampak pemrosesan data.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(187, 55, 'a', 'Bank memiliki arsitektur data sebagai bagian dari arsitektur TI.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(188, 55, 'b', 'Bank menerapkan pelindungan data dan informasi, mencakup: \n1) penetapan standar pengamanan data sesuai dengan klasifikasi data; dan\n2) implementasi kontrol dan prosedur pengamanan data dan informasi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(189, 55, 'c', 'Bank mengelola integrasi dan interoperabilitas data. Integrasi data dan interoperabilitas menggambarkan proses terkait pergerakan dan konsolidasi data di dalam dan antara penyimpanan data, aplikasi, dan organisasi. Integrasi merupakan penggabungan data ke dalam bentuk yang konsisten, baik fisik maupun virtual. Interoperabilitas data merupakan kemampuan beberapa sistem untuk berkomunikasi. Penerapan integrasi dan interoperabilitas data memastikan Bank dapat memperoleh data dimanapun, kapanpun, dan dalam bentuk apapun sesuai kebutuhan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(190, 55, 'd', 'Bank menerapkan pengelolaan data yang meliputi akuisisi, pembuatan, penyimpanan, pemrosesan, penggunaan, retensi, dan \npemusnahan data.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(191, 55, 'e', 'Bank menerapkan pengelolaan referensi dan manajemen data master. Yang dimaksud pengelolaan referensi dan manajemen data master adalah berbagi data informasi lintas domain bisnis untuk memenuhi tujuan organisasi, mengurangi risiko yang terkait dengan redundansi data, memastikan kualitas data terjaga, dan mengurangi biaya integrasi data.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(192, 55, 'f', 'Bank mengelola data warehouse dan sistem aplikasi Business Intelligence.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(193, 55, 'g', 'Bank melakukan kegiatan perencanaan, implementasi, dan pengendalian untuk memungkinkan akses data kualitas tinggi dan/atau metadata terintegrasi.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(194, 55, 'h', 'Bank melakukan pengolahan berbagai jenis data untuk memperoleh informasi yang dapat memberikan nilai tambah terutama untuk pengambilan keputusan.', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(195, 56, 'a', 'Bank menerapkan pengelolaan teknologi pangkalan data secara memadai, mencakup:\n1) perencanaan mengenai teknologi pangkalan data; \n2) pengelolaan teknologi pangkalan data; dan \n3) proses evaluasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(196, 56, 'b', 'Bank menerapkan pengelolaan operasional pangkalan data secara memadai, paling sedikit: \n1) identifikasi kebutuhan terkait pangkalan data, kebutuhan sistem penyimpanan file, kebutuhan penambahan kapasitas penyimpanan, kepatuhan terhadap regulasi, metode dan tools yang sesuai untuk akses data;\n2) merencanakan kelangsungan usaha (business continuity) apabila terjadi bencana yang berdampak pada sistem \npenyimpanan data. Bank memastikan rencana pemulihan diterapkan pada seluruh pangkalan data dan server pangkalan data, mencakup skenario yang dapat mengakibatkan hilangnya atau rusaknya data termasuk membuat cadangan pangkalan data dan pengujian pemulihan data secara berkala; dan\n3) melakukan pengujian terhadap pangkalan data.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(197, 57, 'a', 'Bank memastikan keamanan data pribadi yang diprosesnya dalam pengembangan dan/atau penyelenggaraan TI, dengan melakukan:\n\na. penyusunan dan penerapan langkah untuk melindungi data pribadi dari gangguan pemrosesan data pribadi yang bertentangan dengan ketentuan peraturan perundang_x0002_undangan; dan', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(198, 57, 'b', 'penentuan tingkat keamanan data pribadi dengan memperhatikan sifat dan risiko dari data pribadi yang harus dilindungi dalam pemrosesan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(199, 58, 'a', 'Dasar pemrosesan data pribadi meliputi: \na. persetujuan dari nasabah dan/atau calon nasabah untuk tujuan tertentu sebagai dasar pemrosesan data pribadi, yang dilakukan sesuai dengan ketentuan peraturan perundang_x0002_undangan mengenai pelindungan data pribadi;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(200, 58, 'b', 'pemenuhan kewajiban perjanjian dalam hal nasabah dan/atau calon nasabah merupakan salah satu pihak atau untuk memenuhi permintaan nasabah dan/atau calon nasabah pada saat akan melakukan perjanjian;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(201, 58, 'c', 'pemenuhan kewajiban hukum dari pihak yang melakukan pengendalian data pribadi sesuai dengan ketentuan peraturan perundang_x0002_undangan;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(202, 58, 'd', 'pemenuhan pelindungan kepentingan vital nasabah dan/atau calon nasabah;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(203, 58, 'e', 'pelaksanaan tugas dalam rangka kepentingan umum, pelayanan publik, atau pelaksanaan kewenangan pihak yang melakukan pengendalian data pribadi berdasarkan peraturan perundang-undangan; dan', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(204, 58, 'f', 'pemenuhan kepentingan yang sah lainnya dengan memperhatikan tujuan, kebutuhan, dan keseimbangan kepentingan pihak yang melakukan pengendalian data pribadi dan hak nasabah dan/atau calon nasabah.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(205, 59, 'a', 'Bank memastikan adanya persetujuan nasabah dan/atau calon nasabah sebagai dasar hukum untuk pemrosesan data.\nb. Permintaan persetujuan Bank tidak berupa persetujuan yang bersifat otomatis tanpa ada instruksi dari nasabah, seperti penggunaan kotak centang (tick box) yang telah dicentang sebelumnya atau jenis persetujuan otomatis lainnya.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(206, 59, 'c', 'Permintaan persetujuan disusun dalam bahasa yang jelas, sederhana dan mudah dimengerti.\nd. Bank menginformasikan kepada nasabah tujuan permintaan data pribadi nasabah oleh Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(207, 59, 'e', 'Bank memberikan opsi pilihan persetujuan untuk setiap tujuan dan jenis pemrosesan data pribadi yang berbeda. \nf. Bank memberikan informasi legalitas dari \npemrosesan data pribadi nasabah sesuai \ndengan ketentuan perundang-undangan. \ng. Bank memberikan informasi hak nasabah \nuntuk menarik persetujuan yang telah diberikan kepada Bank. \nh. Bank memastikan bahwa nasabah memiliki hak untuk menolak pemberian persetujuan.\ni. Bank tidak menjadikan pemberian persetujuan atas hal-hal yang tidak terkait langsung dengan nasabah sebagai prasyarat pemberian layanan Bank.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(208, 59, 'j', 'Bank melakukan penghapusan data setelah masa retensi data pribadi (hanya untuk kepentingan maintenance/audit/rekam jejak) berakhir sesuai dengan peraturan perundang_x0002_undangan mengenai pelindungan data pribadi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(209, 60, 'a', 'Bank memelihara catatan mengenai kapan dan bagaimana persetujuan nasabah dan/atau calon nasabah diperoleh.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(210, 60, 'b', 'Bank menyimpan catatan persis sesuai dengan yang disampaikan nasabah dan/atau calon nasabah saat pemberian persetujuan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(211, 60, 'c', 'Bank meninjau persetujuan secara berkala melalui pemeriksaan khusus atau sistem pencatatan secara periodik untuk memastikan bahwa hubungan, pemrosesan, dan tujuannya tidak berubah.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(212, 60, 'd', 'Bank memiliki proses untuk memperbarui persetujuan pada selang waktu yang sesuai dengan kebutuhan Bank untuk memastikan konsistensi antara persetujuan nasabah, pengumpulan, pemrosesan, dan tujuan pemrosesan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(213, 60, 'e', 'Bank memberikan kemudahan untuk nasabah dan/atau calon nasabah untuk menarik persetujuan kapanpun dan mempublikasikan cara melakukannya serta bertindak atas penarikan persetujuan sesegera mungkin.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(214, 61, 'a', 'Perjanjian kerja sama Bank dengan pihak ketiga paling sedikit memuat:\n1) ruang lingkup dan durasi pemrosesan;\n2) sifat dan tujuan pemrosesan;\n3) jenis data pribadi dan kategori data nasabah; dan\n4) kewajiban dan hak pengendali data.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(215, 61, 'b', 'Cakupan perjanjian kerja sama Bank dengan pihak ketiga selaku pemroses data pribadi:\n1) pemroses hanya boleh bertindak berdasarkan instruksi tertulis dari Bank, kecuali diharuskan oleh hukum untuk bertindak tanpa instruksi tersebut;\n2) pemroses memastikan bahwa orang yang memproses data pribadi tunduk pada kewajiban kerahasiaan;\n3) pemroses mengambil tindakan yang tepat untuk memastikan keamanan pemrosesan. \n4) pemroses dapat menggunakan subpemroses dengan persetujuan dari Bank berdasarkan perjanjian tertulis;\n5) pemroses membantu Bank dalam menyediakan akses data pribadi dan mengizinkan nasabah menggunakan haknya;\n6) pemroses membantu Bank dalam memenuhi kewajiban terkait keamanan pemrosesan, pemberitahuan pelanggaran data pribadi, dan penilaian dampak pelindungan data pribadi;\n7) pemroses menghapus atau mengembalikan semua data pribadi ke Bank seperti yang sesuai perjanjian kerja sama;\n8) pemroses tunduk pada audit dan inspeksi, memberikan seluruh informasi yang diperlukan Bank untuk memastikan bahwa \npemroses dan Bank memenuhi peraturan mengenai pelindungan data pribadi, dan segera memberi tahu Bank jika diminta untuk melakukan sesuatu yang melanggar peraturan mengenai pelindungan data\npribadi; dan\n9) tidak terdapat klausul dalam perjanjian kerja sama yang menyatakan bahwa pemroses bebas dari tanggung jawab dan kewajiban langsungnya sendiri.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(216, 62, 'a', 'Bank melakukan identifikasi tujuan pemrosesan data pribadi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(217, 62, 'b', 'Bank mendokumentasikan tujuan dari pemrosesan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(218, 62, 'c', 'Bank mencantumkan tujuan dari pemrosesan data pribadi dalam informasi kepada nasabah/calon nasabah.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(219, 62, 'd', 'Dalam hal Bank akan menggunakan data pribadi nasabah untuk tujuan lain, Bank melakukan identifikasi apakah pemrosesan data pribadi selaras dengan tujuan awal atau telah mendapat persetujuan dari nasabah untuk tujuan lain.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(220, 62, 'e', 'Bank memiliki prosedur untuk memastikan data pribadi yang dibutuhkan sesuai dengan tujuan.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(221, 63, 'a', 'Bank memiliki prosedur untuk memastikan akurasi data pribadi yang dikumpulkan dan Bank merekam sumber perolehan data pribadi yang dimiliki.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(222, 63, 'b', 'Bank memiliki prosedur terkait proses perubahan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(223, 63, 'c', 'Bank memiliki data jejak audit (audit trail) untuk mengetahui kapan perubahan data pribadi dilakukan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(224, 63, 'd', 'Bank memberikan hak kepada nasabah untuk melengkapi, memperbarui, memperbaiki, dan/atau menghapus data pribadi milik nasabah.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(225, 64, 'a', 'Bank memiliki kebijakan mengenai pengkinian,perbaikan, penghapusan, dan pemusnahan data pribadi nasabah.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(226, 64, 'b', 'Bank memiliki kebijakan atau prosedur penolakan atas permintaan perubahan data pribadi nasabah sesuai peraturan perundang-undangan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(227, 64, 'c', 'Bank memiliki prosedur untuk menginformasikan kepada nasabah dalam hal Bank melakukan pengkinian, perbaikan, penghapusan, dan pemusnahan data pribadi nasabah.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(228, 65, 'a', 'Bank mengklasifikasikan data pribadi nasabah sesuai dengan pengelolaan dan peruntukannya.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(229, 65, 'b', 'Bank memiliki dasar pertimbangan penetapan jangka waktu retensi data pribadi nasabah.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(230, 65, 'c', 'Bank memiliki kebijakan periode retensi data pribadi.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(231, 65, 'd', 'Bank memiliki prosedur untuk mereviu informasi secara berkala dan menghapus data pribadi yang tidak lagi dibutuhkan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(232, 65, 'e', 'Bank memiliki prosedur untuk menghapus data pribadi nasabah sesuai permintaan nasabah.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(233, 65, 'f', 'Bank mengidentifikasi kebutuhan data pribadi yang disimpan untuk riset dan statistik.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(234, 66, 'a', 'Bank memiliki kebijakan keamanan data pribadi dan informasi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(235, 66, 'b', 'Bank melakukan peninjauan secara berkala atas penerapan kebijakan keamanan data pribadi dan informasi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(236, 66, 'c', 'Bank menerapkan keamanan data pribadi dan informasi sesuai dengan kerangka atau standar tertentu.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(237, 66, 'd', 'Bank melakukan enkripsi dan/atau pseudonimisasi atas data pribadi nasabah sesuai kebutuhan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(238, 66, 'e', 'Bank melakukan pengujian sistem pengamanan data pribadi secara berkala untuk mengukur dan memastikan efektivitas keamanan data pribadi.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(239, 67, 'a', 'Bank melakukan identifikasi kriteria data pribadi yang berisiko tinggi sesuai dengan kriteria yang diatur dalam peraturan perundang-undangan mengenai pelindungan data pribadi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(240, 67, 'b', 'Bank melakukan penilaian dampak pelindungan data pribadi nasabah dalam hal pemrosesan data pribadi memiliki potensi risiko tinggi terhadap nasabah.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(241, 68, 'a', 'Bank mendokumentasikan aktivitas pemrosesan data pribadi oleh Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(242, 68, 'b', 'Bank mendokumentasikan informasi yang diperlukan untuk pemberitahuan privasi, catatan persetujuan, perjanjian kerja sama antara Bank dan pihak ketiga, lokasi data pribadi, laporan penilaian dampak atas penerapan pelindungan data, dan catatan pelanggaran data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(243, 68, 'c', 'Bank mendokumentasikan kegiatan pemrosesan data pribadi oleh Bank dalam bentuk elektronik sehingga Bank dapat menambah, menghapus, dan mengubah informasi dengan mudah.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(244, 69, 'a', 'Bank memberikan informasi kepada nasabah antara lain mengenai kejelasan identitas, dasar kepentingan hukum, tujuan permintaan, dan penggunaan data pribadi nasabah.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(245, 69, 'b', 'Bank memberikan informasi tersebut secara ringkas, transparan, mudah diakses, serta menggunakan bahasa sederhana dan jelas dalam bentuk yang sesuai dengan struktur dan/atau format yang lazim digunakan atau dapat dibaca oleh sistem elektronik.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(246, 70, 'a', 'Bank memiliki kebijakan mengenai permintaan akses data pribadi yang dikelola oleh Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(247, 70, 'b', 'Bank memilliki mekanisme untuk melakukan verifikasi hak akses terhadap data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(248, 70, 'c', 'Bank memahami kondisi yang memungkinkan Bank untuk menolak permintaan akses data pribadi dan informasi sesuai peraturan perundang undangan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(249, 71, 'a', 'Bank memiliki kebijakan penanganan permintaan nasabah untuk pembatasan pemrosesan data pribadi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(250, 71, 'b', 'Bank memiliki kebijakan terkait batas waktu untuk menanggapi permintaan pembatasan pemrosesan data pribadi sesuai dengan peraturan perundang-undangan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(251, 71, 'c', 'Bank telah memiliki prosedur untuk membatasi pemrosesan data pribadi di sistem Bank dan memiliki prosedur untuk menginformasikan kepada pihak ketiga selaku penerima data pribadi terkait pembatasan pemrosesan data pribadi milik nasabah.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(252, 72, 'a', 'Bank memiliki kebijakan penanganan permintaan nasabah untuk mentransfer data pribadi milik nasabah kepada pihak ketiga.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(253, 72, 'b', 'Bank memiliki proses untuk penanganan permintaan nasabah untuk mentransfer data pribadi milik nasabah kepada pihak ketiga dengan menggunakan metode yang aman untuk mengirimkan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(254, 72, 'c', 'Bank memiliki kebijakan atau prosedur penolakan atas permintaan nasabah untuk mentransfer data pribadi milik nasabah ke pihak ketiga.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(255, 73, 'a', 'Bank memiliki kebijakan atau prosedur bagi nasabah untuk mengajukan keberatan atas pemrosesan data pribadi secara otomatis.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(256, 73, 'b', 'Bank memiliki kebijakan untuk menolak keberatan nasabah disertai dengan informasi dan alasan penolakan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(257, 73, 'c', 'Bank menginformasikan mengenai hak nasabah dan/atau calon nasabah untuk menolak pemrosesan data pribadi dalam pemberitahuan privasi Bank dan media lainnya.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(258, 73, 'd', 'Bank memiliki prosedur untuk menghapus atau menghentikan pemrosesan data pribadi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(259, 74, 'a', 'Bank memastikan bahwa kebijakan, prosedur, dan standar pertukaran atau transfer data dan informasi mencakup paling sedikit: \na. jenis data nasabah untuk pertukaran atau transfer data dan informasi;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(260, 74, 'b', 'persetujuan nasabah untuk pertukaran atau transfer data dan informasi;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(261, 74, 'c', 'mekanisme permintaan informasi oleh pihak ekstern dan pemberian informasi kepada pihak ekstern;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(262, 74, 'd', 'mekanisme transfer data di internal Bank kepada pihak selain pemilik data;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(263, 74, 'e', 'media yang diperkenankan untuk dipergunakan dalam pertukaran data dan informasi;', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(264, 74, 'f', 'pengamanan jaringan komunikasi dan transmisi data dan informasi termasuk penggunaan enkripsi;', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(265, 74, 'g', 'hak nasabah dalam transaksi yang melibatkan pertukaran atau transfer data dan informasi; dan', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(266, 74, 'h', 'pembagian tanggung jawab pihak yang terlibat dalam pertukaran atau transfer data atas risiko kebocoran data nasabah.', 8, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(267, 75, 'a', 'Perjanjian pertukaran atau transfer data paling sedikit memuat aspek: \na. pihak pengendali data pada setiap tahap pertukaran atau transfer data;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(268, 75, 'b', 'tujuan pertukaran atau transfer data yang meliputi\n1) tujuan khusus dan alasan dibutuhkannya pertukaran atau transfer data; dan \n2) keuntungan yang diperoleh dari pertukaran atau transfer data, tidak digunakan untuk peruntukan selain yang tercantum dalam perjanjian;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(269, 75, 'c', 'pihak ketiga lain yang mungkin terlibat dalam pertukaran atau transfer data;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(270, 75, 'd', 'data yang akan dipertukarkan;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(271, 75, 'e', 'prosedur pemenuhan hak subjek data seperti akses subjek data terhadap data yang dilakukan proses pertukaran atau transfer data;', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(272, 75, 'f', 'pengaturan teknis pertukaran atau transfer data (contoh: standar data, standar keamanan informasi, prosedur permintaan akses data, penghentian pertukaran data, SLA pengiriman data, dan penanganan masalah kegagalan perpindahan data); dan', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(273, 75, 'g', 'pengaturan perjanjian kerahasiaan (nondisclosure agreement) bahwa data yang disampaikan kepada pihak ketiga tidak akan diteruskan kepada pihak lain dan tidak digunakan untuk peruntukan lain selain yang tercantum dalam perjanjian tanpa persetujuan Bank.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(274, 76, 'a', 'Bank menerapkan serangkaian langkah teknis untuk memastikan keamanan jaringan komunikasi yang dipergunakan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(275, 76, 'b', 'Bank melakukan enkripsi atas data yang dipertukarkan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(276, 76, 'c', 'Bank menerapkan standar integritas data.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(277, 76, 'd', 'Bank menerapkan metode autentikasi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(278, 76, 'e', 'Bank menerapkan standar otorisasi.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(279, 77, 'a', 'Bank memperoleh persetujuan nasabah untuk dapat mentransfer data pribadinya.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(280, 77, 'b', 'Bank pelaksana transfer data pribadi nasabah dan Bank penerima transfer data pribadi nasabah mematuhi peraturan perundang- undangan mengenai pelindungan data pribadi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(281, 77, 'c', 'Bank hanya dapat melakukan transfer data pribadi nasabah kepada pihak lain dalam wilayah hukum Negara Republik Indonesia.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(282, 77, 'd', 'Bank dapat melakukan transfer data pribadi nasabah kepada pihak lain di luar wilayah negara Republik Indonesia apabila negara penerima transfer data pribadi memiliki tingkat pelindungan data pribadi yang setara atau lebih tinggi dari yang diatur dalam ketentuan peraturan perundang-undangan mengenai pelindungan data pribadi.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(283, 77, 'e', 'Dalam hal poin d tidak terpenuhi, Bank memastikan terdapat kebijakan pelindungan data pribadi yang memadai dan bersifat mengikat.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(284, 77, 'f', 'Dalam hal huruf d dan huruf e tidak terpenuhi, Bank wajib mendapatkan persetujuan nasabah.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(285, 78, 'a', 'Penerapan strategi terkait kemitraan telah dimuat dalam Rencana Strategis TI Bank dan/atau rencana bisnis Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(286, 78, 'b', 'Penerapan strategi dan kebijakan terkait kemitraan telah sesuai dengan visi, misi, strategi bisnis, dan risk appetite Bank, serta kecukupan permodalan Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(287, 78, 'c', 'Penerapan strategi dan kebijakan terkait kemitraan telah mempertimbangkan faktor analisis biaya dan manfaat.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(288, 78, 'd', 'Penerapan strategi dan kebijakan kemitraan telah memperhatikan kecukupan dan kesiapan SDM Bank yang dapat dibuktikan dengan telah memiliki tugas dan tanggung jawab atas unit atau satuan kerja yang terlibat dalam proses kerja sama kemitraan', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(289, 79, 'a', 'Standar baku perjanjian kerja sama kemitraan oleh Bank paling sedikit:\na. memenuhi prinsip kehati-hatian;\nb. memperhatikan analisis biaya dan manfaat;\nc. memenuhi prinsip hubungan kerja sama secara wajar;\nd. memenuhi ketentuan peraturan perundang-undangan;\ne. terdapat klausul bahwa masing-masing pihak akan bertanggung jawab atas keamanan sistemnya sendiri;\nf. terdapat klausul bahwa mitra akan menyampaikan informasi kepada Bank sesegera mungkin setelah mengetahui setiap pelanggaran keamanan di sistem mitra yang berpotensi berdampak terhadap layanan Bank;\ng. dalam hal mitra memberikan layanan berupa penerusan instruksi nasabah, mitra hanya berkomunikasi dengan Bank berdasarkan instruksi nasabah yang telah disetujui nasabah; \nh. mitra, termasuk pihak ketiga dari mitra, bertanggung jawab untuk menerapkan proses pencegahan penipuan atau penyimpangan (fraud);\ni. Bank dan/atau mitra bertanggung jawab atas kekurangan pelayanan dalam pelaksanaan transaksi karena kesalahan atau kelalaiannya;\nj. mitra bertanggung jawab atas segala penyalahgunaan merek Bank dan untuk setiap aktivitas yang menyebabkan kerusakan reputasi Bank, termasuk namun tidak terbatas pada penipuan, penyalahgunaan API,kesalahan penyajian produk dan layanan Bank, keamanan, atau layanan yang kurang memuaskan terus-menerus kepada konsumen;\nk. mitra telah memiliki asuransi yang memadai untuk menutupi seluruh kewajibannya selama jangka waktu perjanjian kerja sama; \nl. Bank dapat melakukan pemeriksaan/audit/investigasi ketika terdapat indikasi pelanggaran; \nm. Bank tidak dibebankan tanggung jawab dan/atau tidak dianggap melanggar perjanjian kemitraan:\n1) atas pelanggaran perjanjian kemitraan atau kegagalan Bank untuk menyediakan akses, jika hal tersebut disebabkan oleh kegagalan mitra dalam memenuhi kewajibannya berdasarkan perjanjian kemitraan; dan \n2) atas kehilangan dan/atau kerusakan yang disebabkan secara langsung atau tidak langsung oleh tindakan atau kelalaian pihak ketiga yang bekerja sama dengan mitra; dan\nn. Bank dan mitra memiliki narahubung yang bertugas sebagai kontak utama untuk segala hal yang berkaitan dengan perjanjian kerja sama.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(290, 80, 'a', 'Kebijakan antara lain memuat pelaksanaan kemitraan terkait: \na. kondisi keuangan mitra (termasuk kemampuan mitra untuk memenuhi kewajiban yang mungkin timbul dari penyediaan layanan oleh mitra);', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(291, 80, 'b', 'mitra memiliki semua izin yang diperlukan untuk kegiatan yang ingin dilakukan;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(292, 80, 'c', 'tindakan dan kontrol keamanan mitra, termasuk kebijakan keamanan siber dan pemantauannya;', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(293, 80, 'd', 'mitra memiliki BCP dan DRP;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(294, 80, 'e', 'operasi dan kontrol manajemen risiko keamanan yang dimiliki mitra, khususnya terkait dengan pelindungan data pribadi  (misalnya, pelatihan pegawai dalam undang-undang dan praktik kerahasiaan data, praktik penyimpanan dan penghancuran data, langkah untuk menghindari pengumpulan data pribadi yang berlebihan); dan', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(295, 80, 'f', 'tidak memiliki reputasi buruk dan tidak melakukan kegiatan yang melanggar hukum atau ketentuan.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(296, 81, 'a', 'Bank melakukan pemantauan dan evaluasi hubungan kerja sama dengan mitra untuk menentukan tindakan tertentu dalam hal:\na. mitra tidak lagi memenuhi kriteria kelayakan;\nb. mitra telah melanggar salah satu ketentuan yang tercantum pada bagian \"autentikasi dan persetujuan nasabah\";\nc. mitra menggunakan API untuk tujuan yang \ntidak diungkapkan kepada Bank;\nd. mitra menyatakan atau mengakui \nkepailitannya atau tidak mampu membayar \nutang pada saat jatuh tempo atau pada saat \ndiajukannya proses kepailitan;\ne. mitra memasukkan malware yang dapat \nmengganggu sistem Bank;\nf. mitra melakukan penawaran layanan dengan cara yang dapat merusak reputasi Bank;\ng. mitra menggunakan data nasabah selain untuk tujuan yang diizinkan/diperjanjikan;\nh. terdapat dugaan pelanggaran keamanan oleh mitra; dan/atau\ni. terdapat dugaan pelanggaran perjanjian kerja sama oleh mitra.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(297, 82, 'a', 'Dalam rangka melakukan autentikasi terhadap nasabah yang mengakses layanan Bank melalui mitra, Bank paling sedikit:\na. menerapkan faktor autentikasi multifaktor;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(298, 82, 'b', 'memiliki kendali atas proses autentikasi;', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(299, 82, 'c', 'memastikan mitra tidak menyimpan data kredensial konsumen (menggunakan interface mitra);', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(300, 82, 'd', 'bersama dengan mitra memastikan keamanan proses autentikasi melalui penggunaan perangkat atau saluran terpisah dari perangkat atau saluran milik mitra untuk menyelesaikan autentikasi nasabah;', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(301, 82, 'e', 'memproses permintaan data nasabah yang diminta oleh mitra setelah Bank melakukan autentikasi nasabah dan mitra; dan', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(302, 82, 'f', 'memberikan data yang diperlukan kepada mitra untuk layanan yang diakses oleh nasabah setelah Bank meyakini bahwa proses autentikasi telah berjalan sesuai prosedur yang telah disepakati.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(303, 83, 'a', 'Bank menerapkan dan mendokumentasikan standar teknis interkoneksi yang mencakup protokol komunikasi, struktur dan format data, metode autentikasi, metode otorisasi, metode enkripsi, dan persyaratan pengelolaan akses, termasuk manajemen pengelolaan kunci (key management).', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(304, 83, 'b', 'Bank memberitahukan mitra apabila terjadi perubahan di standar teknis interkoneksi.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(305, 84, 'a', 'Bank hanya dapat menyediakan jasa TI kepada lembaga jasa keuangan lain yang diawasi oleh Otoritas Jasa Keuangan dan/atau di luar wilayah Indonesia yang diawasi otoritas pengawas dan pengatur lembaga jasa keuangan setempat.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(306, 84, 'b', 'Bank memenuhi persyaratan penyediaan jasa TI tidak menjadi salah satu kegiatan pokok Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(307, 84, 'c', 'Bank memenuhi prinsip kehati-hatian.\nd. Bank memperhatikan analisis biaya dan manfaat.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(308, 84, 'e', 'Bank memenuhi prinsip hubungan kerja sama secara wajar.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(309, 84, 'f', 'Bank memenuhi ketentuan peraturan perundang-undangan.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(310, 84, 'g', 'Bank memperoleh izin Otoritas Jasa Keuangan untuk setiap rencana penyediaan jasa TI.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(311, 84, 'h', 'Penyediaan jasa TI berupa aplikasi kepada lembaga jasa keuangan selain bank dapat dilakukan sepanjang lembaga jasa keuangan pengguna jasa TI berada dalam satu grup atau \nkelompok dengan Bank dan penggunaan aplikasi ditujukan untuk mendukung kegiatan operasional yang umum.', 7, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(312, 85, 'a', 'Satuan kerja terkait mempertimbangkan beberapa hal dalam melakukan identifikasi, pengukuran, pemantauan, dan pengendalian risiko atas penyediaan jasa TI oleh Bank secara memadai yang mencakup:\na. aktivitas dan fungsi penyediaan jasa TI meliputi sensitivitas data yang diakses, dilindungi, atau dikendalikan oleh Bank;', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(313, 85, 'b', 'teknologi yang digunakan meliputi keandalan (reliability), keamanan (security), ketersediaan (availability), dan ketepatan waktu (timeliness); dan', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(314, 85, 'c', 'Identifikasi risiko meliputi:\n1) risiko operasional;\n2) risiko hukum;\n3) risiko reputasi;\n4) risiko kepatuhan; dan\n5) risiko stratejik.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(315, 86, 'a', 'Bank memiliki mekanisme untuk mengukur keterlibatan nasabah dalam rangka melakukan penyesuaian dan perbaikan terhadap produk dan layanan kepada nasabah.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(316, 86, 'b', 'Bank memiliki strategi untuk mempertahankan nasabah melalui pengembangan produk dan peningkatan layanan Bank.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(317, 87, 'a', 'Bank memiliki dokumen standar pelayanan keuangan kepada penyandang disabilitas.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(318, 87, 'b', 'Bank mengadopsi prinsip pelayanan keuangan yang bersifat desain universal.\n1) Prinsip desain universal untuk pelayanan fisik yaitu dapat digunakan oleh semua orang, fleksibel dalam penggunaannya, menggunakan tenaga fisik yang minimal, serta ruang dan ukuran yang memadai.\n2) Prinsip desain universal untuk pelayanan nonfisik maupun pelayanan dokumen yaitu dapat digunakan oleh semua orang, sederhana, fleksibel dalam penggunaannya, komunikasi yang efektif, dan mentoleransi \nkesalahan.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(319, 87, 'c', 'Teknologi yang dapat digunakan Bank antara lain:\n1) kompatibel dengan voice over, talk back, atau screen reader;\n2) menggunakan desain dan bahasa yang sederhana untuk menghindari kebingungan;\n3) akses login ke dalam layanan internet banking yang dapat diakses tanpa menggunakan mouse dan dapat dibaca dengan menggunakan alat pembaca layar;\n4) alternatif kode Completely Automatic Public Turing Test to Tell Computers and Human Apart (CAPTCHA), tersedia dalam kode audio atau pertanyaan matematika sederhana;\n5) menyediakan waktu yang cukup untuk memasukkan kata sandi yang diterima melalui pesan singkat atau surat elektronik; dan\n6) pesan kekeliruan (error) tersedia dalam bentuk teks dan audio, namun tidak spesifik menginformasikan jenis kesalahan (username atau password atau pin dan lainnya).', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(320, 88, 'a', 'Bank memanfaatkan data nasabah antara lain aspek demografi, perilaku, preferensi dan kebutuhan nasabah, dalam mengembangkan produk dan layanan.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(321, 88, 'b', 'Bank melakukan kolaborasi dengan nasabah dalam menciptakan produk Bank dengan melibatkan ide ataupun peran serta nasabah dalam proses penyusunan produk dan layanan Bank. Kolaborasi yang dimaksud harus jelas mengenai tanggung jawab dan kewenangan serta hak dan kewajiban yang didokumentasikan dalam dokumen tertulis.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(322, 89, 'a', 'Bank memiliki mekanisme untuk perolehan persepsi nasabah dan tata cara analisis data tersebut yang paling sedikit terkait dengan: \n1) product quality yaitu persepsi nasabah terhadap kualitas produk dan layanan Bank;\n2) customer support quality yaitu persepsi nasabah terhadap kualitas customer support Bank;\n3) positioning yaitu persepsi nasabah terhadap produk dan layanan Bank dibandingkan dengan produk dan layanan kompetitor;\n4) price yaitu persepsi nasabah terhadap biaya, contoh suku bunga simpanan dan kredit yang ditawarkan oleh Bank; dan\n5) reputation yaitu persepsi nasabah terhadap citra produk dan layanan Bank, yang diperoleh melalui antara lain media sosial, atau reviu aplikasi Bank pada platform distribusi.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(323, 89, 'b', 'Bank telah memiliki saluran umpan balik untuk mendapatkan masukan dari nasabah', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(324, 90, 'a', 'Bank menganalisis pengalaman nasabah dalam menggunakan produk dan/atau layanan yang diberikan oleh Bank, antara lain:\n1) desain produk, dapat berupa tampilan mobile apps Bank, kenyamanan interaksi user dengan mobile apps, serta alur proses (flow) menu aplikasi;\n2) range of products, yaitu jenis produk yang ditawarkan dalam aplikasi Bank; dan/atau\n3) speed of delivery, yaitu kecepatan akses aplikasi Bank.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(325, 90, 'b', 'Bank melakukan perbaikan serta peningkatan kualitas atas produk dan layanan dengan mengacu antara lain pada sistematika Define, Measure, Analyze, Improve, dan Control (DMAIC).', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(326, 91, 'a', 'Bank dan mitra hanya dapat memproses data nasabah sesuai dengan ketentuan perundang-undangan mengenai pelindungan data pribadi.\nb. Mitra menggunakan dan mengamankan semua data yang disediakan oleh Bank dan/atau\nnasabah sesuai dengan persyaratan keamanan yang disepakati oleh Bank dan mitra, termasukdari ancaman serangan siber.\nc. Permintaan data kepada nasabah Bank, sebatas keperluan pemberian layanan Bank kepada nasabah.\nd. Bank mengecek persetujuan konsumen dari mitra meliputi:\n1) prosedur untuk memberikan persetujuan dan bagaimana persetujuan harus ditarik (withdrawn);\n2) tidak terdapat batasan atau larangan \ndimana konsumen tidak dapat lagi menarik persetujuan;\n3) konsumen diinformasikan dan memiliki hak untuk menyetujui atau menolak tentang data yang dapat diakses oleh mitra pada saat konsumen menandatangani kontrak dengan mitra; dan\n4) mitra hanya dapat mengakses data \nkonsumen terbatas dengan jangka waktu \ntertentu (syarat waktu dapat ditentukan \nlebih lanjut antar Bank dan mitra).\ne. Mitra menggunakan alat pendeteksi untuk memindai malware.\nf. Mitra melakukan analisis risiko secara teratur dan mengambil langkah untuk memperbarui tindakan pengamanan yang diperlukan untuk memperbaiki insiden keamanan atau kerentanan yang teridentifikasi.\ng. Bank dan mitra melakukan pertemuan secara berkala untuk membahas setiap pengaduan konsumen atau nasabah yang diterima oleh mitra. Bank berhak untuk meminta informasi lebih lanjut tentang pengaduan konsumen atau nasabah serta penanganannya kepada mitra.\nh. Bank dan mitra membahas perselisihan dalam jangka waktu tertentu yang telah ditentukan.\ni. Bank menetapkan strategi kelangsungan bisnis dalam hal layanan mitra tidak dapat diakses oleh Bank atau mengalami permasalahan, untuk memastikan bahwa layanan kepada konsumen tetap berjalan.\nj. Bank menetapkan alternatif layanan dengan keamanan yang memadai.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(327, 92, 'a', 'Bank memiliki saluran untuk menerima pengaduan nasabah yang dapat diakses nasabah setiap saat secara daring.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(328, 92, 'b', 'Bank memiliki fungsi/unit kerja yang berwenang dalam penyelesaian pengaduan nasabah.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(329, 92, 'c', 'Bank memiliki kebijakan penyelesaian pengaduan nasabah sesuai dengan peraturan perundang-undangan.', 3, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(330, 92, 'd', 'Bank melakukan monitoring proses penyelesaian pengaduan nasabah dan memiliki SLA yang jelas untuk setiap jenis pengaduan.', 4, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(331, 92, 'e', 'Bank melakukan evaluasi secara periodik atas kinerja penyelesaian pengaduan nasabah.', 5, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(332, 92, 'f', 'Bank memiliki mekanisme pengaduan kembali bagi nasabah yang tidak setuju dengan keputusan penyelesaian pengaduan oleh Bank.', 6, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(333, 93, 'a', 'Bank memiliki dan menjalankan program untuk meningkatkan literasi keuangan di era digital kepada nasabah dan/atau masyarakat.', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(334, 93, 'b', 'Bank melakukan sosialisasi terkait aspek keamanan dalam bertransaksi secara digital.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(335, 94, 'a', 'Penerapan transparansi dan pengungkapan yang bertanggung jawab mencakup:\na. Bank memberikan penjelasan kepada nasabah mengenai pemahaman umum tentang sistem berbasis TI yang digunakan oleh Bank dalam memberikan layanan kepada nasabah; dan', 1, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(336, 94, 'b', 'Bank telah memberikan penjelasan kepada nasabah mengenai sarana dan prosedur bagi nasabah untuk melakukan klarifikasi atas hasil sistem berbasis TI.', 2, '2026-06-22 13:57:43', '2026-06-22 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','assessor','reviewer','approval') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessor',
  `division_id` bigint UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `division_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@banksumut.co.id', 'admin', NULL, NULL, '$2y$12$32bKXl1ecwtzGtSSPnBtluqGDCbk1aDR.BnkjJBpvug0hGdWiwoGe', NULL, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(2, 'Assessor DTI', 'assessor@banksumut.co.id', 'assessor', 5, NULL, '$2y$12$t5G2cZs0JggnVNDvJI27Q.s1d1NuUKID0IBhyqVwZ6cMk0x3GZNEy', NULL, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(3, 'Reviewer', 'reviewer@banksumut.co.id', 'reviewer', NULL, NULL, '$2y$12$JHBLAW9AAhK28yBbMjnCk.vGj/weSERIj76Pvf4TnfMazsQfTBmsu', NULL, '2026-06-22 13:57:43', '2026-06-22 13:57:43'),
(4, 'Pimpinan', 'approval@banksumut.co.id', 'approval', NULL, NULL, '$2y$12$L3O37p3wk5UEI6X/XxfqYODzgWAPjFZw5ir/z74l9k.AAXjvF9Ny.', NULL, '2026-06-22 13:57:43', '2026-06-22 13:57:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_control_results`
--
ALTER TABLE `assessment_control_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acr_period_control_unique` (`assessment_period_id`,`control_id`),
  ADD KEY `assessment_control_results_control_id_foreign` (`control_id`),
  ADD KEY `assessment_control_results_reviewed_by_foreign` (`reviewed_by`),
  ADD KEY `assessment_control_results_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `assessment_periods`
--
ALTER TABLE `assessment_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_periods_created_by_foreign` (`created_by`);

--
-- Indexes for table `assessment_sub_control_results`
--
ALTER TABLE `assessment_sub_control_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ascr_result_subcontrol_unique` (`assessment_control_result_id`,`sub_control_id`),
  ADD KEY `assessment_sub_control_results_sub_control_id_foreign` (`sub_control_id`),
  ADD KEY `assessment_sub_control_results_filled_by_foreign` (`filled_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `controls`
--
ALTER TABLE `controls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `controls_code_unique` (`code`),
  ADD KEY `controls_subdomain_id_foreign` (`subdomain_id`);

--
-- Indexes for table `control_divisions`
--
ALTER TABLE `control_divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `control_divisions_control_id_division_id_unique` (`control_id`,`division_id`),
  ADD KEY `control_divisions_division_id_foreign` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_code_unique` (`code`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domains_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `score_caches`
--
ALTER TABLE `score_caches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `score_cache_unique` (`assessment_period_id`,`scoreable_type`,`scoreable_id`),
  ADD KEY `score_cache_lookup` (`assessment_period_id`,`scoreable_type`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subdomains`
--
ALTER TABLE `subdomains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subdomains_code_unique` (`code`),
  ADD KEY `subdomains_domain_id_foreign` (`domain_id`);

--
-- Indexes for table `sub_controls`
--
ALTER TABLE `sub_controls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_controls_control_id_foreign` (`control_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_division_id_foreign` (`division_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment_control_results`
--
ALTER TABLE `assessment_control_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `assessment_periods`
--
ALTER TABLE `assessment_periods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assessment_sub_control_results`
--
ALTER TABLE `assessment_sub_control_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=673;

--
-- AUTO_INCREMENT for table `controls`
--
ALTER TABLE `controls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `control_divisions`
--
ALTER TABLE `control_divisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `score_caches`
--
ALTER TABLE `score_caches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `subdomains`
--
ALTER TABLE `subdomains`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_controls`
--
ALTER TABLE `sub_controls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_control_results`
--
ALTER TABLE `assessment_control_results`
  ADD CONSTRAINT `assessment_control_results_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assessment_control_results_assessment_period_id_foreign` FOREIGN KEY (`assessment_period_id`) REFERENCES `assessment_periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_control_results_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  ADD CONSTRAINT `assessment_control_results_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `assessment_periods`
--
ALTER TABLE `assessment_periods`
  ADD CONSTRAINT `assessment_periods_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `assessment_sub_control_results`
--
ALTER TABLE `assessment_sub_control_results`
  ADD CONSTRAINT `ascr_acr_id_foreign` FOREIGN KEY (`assessment_control_result_id`) REFERENCES `assessment_control_results` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_sub_control_results_filled_by_foreign` FOREIGN KEY (`filled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assessment_sub_control_results_sub_control_id_foreign` FOREIGN KEY (`sub_control_id`) REFERENCES `sub_controls` (`id`);

--
-- Constraints for table `controls`
--
ALTER TABLE `controls`
  ADD CONSTRAINT `controls_subdomain_id_foreign` FOREIGN KEY (`subdomain_id`) REFERENCES `subdomains` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `control_divisions`
--
ALTER TABLE `control_divisions`
  ADD CONSTRAINT `control_divisions_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `control_divisions_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `score_caches`
--
ALTER TABLE `score_caches`
  ADD CONSTRAINT `score_caches_assessment_period_id_foreign` FOREIGN KEY (`assessment_period_id`) REFERENCES `assessment_periods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subdomains`
--
ALTER TABLE `subdomains`
  ADD CONSTRAINT `subdomains_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_controls`
--
ALTER TABLE `sub_controls`
  ADD CONSTRAINT `sub_controls_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
