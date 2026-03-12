import 'dart:io';

void main() {
  print('INPUT DATA MAHASISWA');
  stdout.write('Masukkan NIM: ');
  String nim = stdin.readLineSync()!;
  stdout.write('Masukkan Nama: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Jurusan: ');
  String jurusan = stdin.readLineSync()!;
  stdout.write('Masukkan IPK: ');
  String ipk = stdin.readLineSync()!;

  Map<String, dynamic> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': double.parse(ipk),
  };
  print('Data Mahasiswa: $mahasiswa');

  print('\nINPUT MULTIPLE MAHASISWA');
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> listmahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print('\nMahasiswa ke-${i + 1}');
    stdout.write('Masukkan NIM: ');
    String n = stdin.readLineSync()!;
    stdout.write('Masukkan Nama: ');
    String nm = stdin.readLineSync()!;
    stdout.write('Masukkan Jurusan: ');
    String jr = stdin.readLineSync()!;
    stdout.write('Masukkan IPK: ');
    String ip = stdin.readLineSync()!;

    listmahasiswa.add({
      'nim': n,
      'nama': nm,
      'jurusan': jr,
      'ipk': double.parse(ip),
    });
  }

  print('\nDATA SEMUA MAHASISWA');
  for (var mhs in listmahasiswa) {
    print(mhs);
  }
}
