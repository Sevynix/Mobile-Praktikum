import 'dart:io';

class Mahasiswa {
  String nama;
  int nim;
  String jurusan;

  Mahasiswa(this.nama, this.nim, this.jurusan);

  void tampilkanData() {
    print("Nama: $nama");
    print("NIM: $nim");
    print("Jurusan: $jurusan");
  }
}

class MahasiswaAktif extends Mahasiswa {
  int semester;
  double ipk;

  MahasiswaAktif(String nama, int nim, String jurusan, this.semester, this.ipk)
      : super(nama, nim, jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Semester: $semester");
    print("IPK: $ipk");
    print("Status: Aktif");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  int tahunLulus;
  String pekerjaanSekarang;

  MahasiswaAlumni(
      String nama, int nim, String jurusan, this.tahunLulus, this.pekerjaanSekarang)
      : super(nama, nim, jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Tahun Lulus: $tahunLulus");
    print("Pekerjaan: $pekerjaanSekarang");
    print("Status: Alumni");
  }
}

void main() {
  print("INPUT MAHASISWA AKTIF\n");

  stdout.write("Nama: ");
  String namaAktif = stdin.readLineSync() ?? 'Unknown';

  stdout.write("NIM: ");
  int nimAktif = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  stdout.write("Jurusan: ");
  String jurusanAktif = stdin.readLineSync() ?? 'Unknown';

  stdout.write("Semester: ");
  int semester = int.tryParse(stdin.readLineSync() ?? '1') ?? 1;

  stdout.write("IPK: ");
  double ipk = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

  var mahasiswaAktif = MahasiswaAktif(namaAktif, nimAktif, jurusanAktif, semester, ipk);

  print("\nDATA MAHASISWA AKTIF");
  mahasiswaAktif.tampilkanData();

  print("\nINPUT MAHASISWA ALUMNI\n");

  stdout.write("Nama: ");
  String namaAlumni = stdin.readLineSync() ?? 'Unknown';

  stdout.write("NIM: ");
  int nimAlumni = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  stdout.write("Jurusan: ");
  String jurusanAlumni = stdin.readLineSync() ?? 'Unknown';

  stdout.write("Tahun Lulus: ");
  int tahunLulus = int.tryParse(stdin.readLineSync() ?? '2024') ?? 2024;

  stdout.write("Pekerjaan Sekarang: ");
  String pekerjaan = stdin.readLineSync() ?? 'Belum Bekerja';

  var mahasiswaAlumni = MahasiswaAlumni(
      namaAlumni, nimAlumni, jurusanAlumni, tahunLulus, pekerjaan);

  print("\nDATA MAHASISWA ALUMNI");
  mahasiswaAlumni.tampilkanData();
}