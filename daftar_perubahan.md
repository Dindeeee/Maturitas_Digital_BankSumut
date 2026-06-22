Halo, ini daftar perubahan yang sudah dikerjakan di aplikasi Assessment Maturitas Digital Bank Sumut 👇

*1. Rename Role Viewer → Approval*
- Role "viewer" sudah diganti jadi "approval" di seluruh aplikasi
- Migrasi database sudah dibuat untuk rename enum dan tambah kolom approval
- Akun seeder: email jadi approval@banksumut.co.id, role approval
- Semua route, controller, view, sidebar sudah diupdate

*2. Fitur Approval (Setujui/Tolak)*
- Role approval (pimpinan) sekarang punya tombol *Setujui* (hijau) dan *Tolak* (merah) di halaman review detail
- Status approval tampil di tabel review index sebagai badge (Disetujui / Ditolak)
- Data tersimpan: siapa yang approve, kapan, dan statusnya

*3. Edit Periode Assessment*
- Periode berstatus *draft* dan *active* sekarang bisa diedit (nama, tahun, tanggal mulai/selesai)
- Tombol Edit muncul di tabel periode, buka modal edit
- Periode yang sudah *completed* (ditutup) tidak bisa diedit

*4. Hapus Legenda Kategori Maturitas di Dashboard*
- Kartu legenda kategori maturitas (1-5 warna) sudah dihapus dari dashboard

*5. Label Angka di Chart Overview Dashboard*
- Sekarang ada angka skor (2 desimal) yang langsung tampil di atas tiap bar chart overview

*6. Tabel Skor Domain Asesmen*
- Tambah tabel baru "Skor Domain Asesmen {tahun} Pelaporan {tahun+1}"
- Isi: Domain, Skor Asesmen, Status (badge berwarna)
- Ada baris Total Score di bagian bawah tabel
- Format angka 2 desimal

*7. Tabel Perbandingan Tahun Sebelumnya*
- Tabel perbandingan sekarang terpisah dan lebih lengkap
- Kolom: Domain, Skor tahun ini, Status, DELTA, Skor tahun lalu, Status tahun lalu
- Ada baris Total Score dengan delta keseluruhan
- Tabel ini hanya muncul kalau ada data periode sebelumnya

*8. Navigasi Review Tidak Kehilangan Periode*
- Ketika pilih periode tertentu di halaman review, lalu masuk ke detail kontrol dan kembali, periode yang dipilih tetap sama (tidak reset)
- Berlaku juga untuk filter domain

*9. Tombol Kembali di Review Detail*
- Tombol kembali di halaman review detail sekarang lebih jelas, ada ikon panah + teks "Kembali" (bukan cuma simbol ← kecil)

File yang diubah: 14 file (controllers, models, views, routes, migration, seeder)
    