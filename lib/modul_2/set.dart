import 'dart:io';

void main() {
  Set<String> dataset = {};

  stdout.write('Masukkan jumlah data: ');
  int count = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    dataset.add(stdin.readLineSync()!);
  }

  print('\nSEMUA DATA');
  int no = 1;
  for (String item in dataset) {
    print('$no. $item');
    no++;
  }
  print('Total data: ${dataset.length}');

  stdout.write('Masukkan data baru: ');
  String newdata = stdin.readLineSync()!;
  if (dataset.add(newdata)) {
    print('Data "$newdata" berhasil ditambahkan!');
  } else {
    print('Data "$newdata" sudah ada!');
  }

  stdout.write('Masukkan data yang ingin dihapus: ');
  String hapusdata = stdin.readLineSync()!;
  if (dataset.remove(hapusdata)) {
    print('Data "$hapusdata" berhasil dihapus!');
  } else {
    print('Data "$hapusdata" tidak ditemukan!');
  }

  stdout.write('Masukkan data yang ingin dicek: ');
  String cekdata = stdin.readLineSync()!;
  if (dataset.contains(cekdata)) {
    print('Data "$cekdata" ada di Set!');
  } else {
    print('Data "$cekdata" tidak ada di Set!');
  }
}