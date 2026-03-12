import 'dart:io';

mixin Pengajar {
  List<String> mataKuliah = [];

  void tambahMataKuliah(String mk) {
    mataKuliah.add(mk);
  }

  void tampilkanMataKuliah() {
    print("Mata Kuliah: ${mataKuliah.join(', ')}");
  }
}

mixin Peneliti {
  List<String> penelitian = [];

  void tambahPenelitian(String p) {
    penelitian.add(p);
  }

  void tampilkanPenelitian() {
    print("Penelitian: ${penelitian.join(', ')}");
  }
}

mixin Jabatan {
  String jabatan = "";

  void setJabatan(String j) {
    jabatan = j;
  }

  void tampilkanJabatan() {
    print("Jabatan: $jabatan");
  }
}

class Mahasiswa {
  String nama;
  String id;

  Mahasiswa(this.nama, this.id);
}

class Dosen extends Mahasiswa with Pengajar, Peneliti, Jabatan {
  Dosen(String nama, String id) : super(nama, id);

  void tampilkan() {
    print("\nDOSEN");
    print("Nama: $nama");
    print("NIP: $id");
    tampilkanJabatan();
    tampilkanMataKuliah();
    tampilkanPenelitian();
  }
}

class Fakultas extends Mahasiswa with Pengajar, Jabatan {
  Fakultas(String nama, String id) : super(nama, id);

  void tampilkan() {
    print("\nFAKULTAS");
    print("Nama Fakultas: $nama");
    print("Kode: $id");
    tampilkanJabatan();
    tampilkanMataKuliah();
  }
}

void main() {
  print("INPUT DOSEN");

  stdout.write("Nama Dosen: ");
  String nama = stdin.readLineSync() ?? "";

  stdout.write("NIP: ");
  String nip = stdin.readLineSync() ?? "";

  var dosen = Dosen(nama, nip);

  stdout.write("Jabatan: ");
  dosen.setJabatan(stdin.readLineSync() ?? "");

  stdout.write("Mata Kuliah: ");
  String mk = stdin.readLineSync() ?? "";
  for (var m in mk.split(',')) {
    if (m.trim().isNotEmpty) {
      dosen.tambahMataKuliah(m.trim());
    }
  }

  stdout.write("Penelitian: ");
  String penelitian = stdin.readLineSync() ?? "";
  for (var p in penelitian.split(',')) {
    if (p.trim().isNotEmpty) {
      dosen.tambahPenelitian(p.trim());
    }
  }

  dosen.tampilkan();

  print("\nINPUT FAKULTAS");

  stdout.write("Nama Fakultas: ");
  String namaFak = stdin.readLineSync() ?? "";

  stdout.write("Kode Fakultas: ");
  String kodeFak = stdin.readLineSync() ?? "";

  var fakultas = Fakultas(namaFak, kodeFak);

  stdout.write("Nama Dekan: ");
  fakultas.setJabatan(stdin.readLineSync() ?? "");

  stdout.write("Program Studi: ");
  String prodi = stdin.readLineSync() ?? "";
  for (var p in prodi.split(',')) {
    if (p.trim().isNotEmpty) {
      fakultas.tambahMataKuliah(p.trim());
    }
  }

  fakultas.tampilkan();
}