class Wisata {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String jamBuka;
  final double rating;
  final int ulasan;
  final String hargaTiket;
  final String imageUrl;
  final String kategori;

  Wisata({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.jamBuka,
    required this.rating,
    required this.ulasan,
    required this.hargaTiket,
    required this.imageUrl,
    required this.kategori,
  });
}

List<Wisata> daftarWisataDummy = [
  Wisata(
    nama: "Lengkung Langit 2",
    lokasi: "Jl. Wan Abdurrahman, Sumber Agung, Kec. Kemiling, Kota Bandar Lampung",
    deskripsi: "Lengkung Langit Dua Lampung berasal dari bentuk lengkungan yang terbentuk oleh pepohonan di atas bukit. Lengkungan ini tampak seperti pelangi yang menghiasi langit biru.",
    jamBuka: "08.00 - 20.00 WIB",
    rating: 4.8,
    ulasan: 100,
    hargaTiket: "Rp. 15.000,00",
    imageUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    kategori: "Alam",
  ),
  Wisata(
    nama: "Kampung Vietnam",
    lokasi: "Sumber Agung, Kec. Kemiling, Kota Bandar Lampung",
    deskripsi: "Dikenal dengan pemandangan perbukitan yang asri, fasilitas area santai, spot foto.",
    jamBuka: "08.00 - 22.00 WIB",
    rating: 4.7,
    ulasan: 85,
    hargaTiket: "Rp. 10.000,00",
    imageUrl: "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05",
    kategori: "Wisata",
  ),
  Wisata(
    nama: "Paraduta Hill",
    lokasi: "Sumber Agung, Kec. Kemiling, Kota Bandar Lampung",
    deskripsi: "Destinasi yang memadukan restoran dengan pemandangan lampu kota (city light) Bandar Lampung.",
    jamBuka: "11.00 - 22.00 WIB",
    rating: 4.9,
    ulasan: 120,
    hargaTiket: "Rp. 25.000,00",
    imageUrl: "https://images.unsplash.com/photo-1501854140801-50d01698950b",
    kategori: "Buatan",
  ),
];