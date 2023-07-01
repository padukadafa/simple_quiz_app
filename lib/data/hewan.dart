import 'package:flutter_application_2/models/hewan_model.dart';

class HewanList {
  // fungsi untuk mengambil daftar hewan sesuai tipenya
  static List<Hewan> hewanList(HewanType type) {
    if (type == HewanType.mamalia) {
      return mamaliaList;
    } else if (type == HewanType.reptil) {
      return reptilList;
    } else if (type == HewanType.serangga) {
      return seranggaList;
    } else {
      return unggasList;
    }
  }

  static List<Hewan> allHewanList() {
    return [...mamaliaList, ...reptilList, ...seranggaList, ...unggasList];
  }

  static final List<Hewan> mamaliaList = [
    Hewan(
      nama: 'Singa',
      gambar: 'assets/images/singa.jpg',
      deskripsi: 'SINGA = SIINTING.',
    ),
    Hewan(
      nama: 'Gajah',
      gambar: 'assets/images/gajah.jpg',
      deskripsi: 'Gajah = Bikase.',
    ),
    Hewan(
      nama: 'Harimau',
      gambar: 'assets/images/harimau.jpg',
      deskripsi: 'Harimau = Meoloier.',
    ),
    // Tambahkan mamalia lainnya sesuai kebutuhan
    // ...
  ];

  static final List<Hewan> reptilList = [
    Hewan(
      nama: 'Buaya',
      gambar: 'assets/images/buaya.jpg',
      deskripsi: 'BUAYA = Rainer.',
    ),
    Hewan(
      nama: 'Ular',
      gambar: 'assets/images/ular.jpg',
      deskripsi: 'Ular = Gerar.',
    ),
    Hewan(
      nama: 'Kura-kura',
      gambar: 'assets/images/kura.jpg',
      deskripsi: 'Kura-Kura = Master.',
    ),
    Hewan(
      nama: 'Komodo',
      gambar: 'assets/images/komodo.png',
      deskripsi: 'Komodo = Patris.',
    ),
    Hewan(
      nama: 'Kadal',
      gambar: 'assets/images/kadal.jpg',
      deskripsi: 'Kadal = Tombol.',
    ),
    // Tambahkan mamalia lainnya sesuai kebutuhan
    // ...
  ];
  static final List<Hewan> seranggaList = [
    Hewan(
      nama: 'Lebah',
      gambar: 'assets/images/lebah.jpg',
      deskripsi: 'Lebah = Rainer.',
    ),
    Hewan(
      nama: 'Kecoak',
      gambar: 'assets/images/kecoak.jpg',
      deskripsi: 'Kecoak = Gerar.',
    ),
    // Tambahkan mamalia lainnya sesuai kebutuhan
    // ...
  ];
  static final List<Hewan> unggasList = [
    Hewan(
      nama: 'Ayam',
      gambar: 'assets/images/ayam.jpg',
      deskripsi: 'Ayam = Rainer.',
    ),
    Hewan(
      nama: 'Burung',
      gambar: 'assets/images/burung.jpg',
      deskripsi: 'Burung = Gerar.',
    ),
    // Tambahkan mamalia lainnya sesuai kebutuhan
    // ...
  ];
}
