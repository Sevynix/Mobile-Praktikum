import 'dart:io';

void main() {
  List<String> datalist =[];
  print('Data list kosong: $datalist');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try{
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch(e) {
      print('input tidak valid! masukkan angka yang benar');
    }
  }

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i+1}:');
    String x = stdin.readLineSync()!;
    datalist.add(x);
  }

  print('data list:');
  print(datalist);

  stdout.write('Masukkan index yang ingin ditampilkan: ');
  int indexTertentu = int.parse(stdin.readLineSync()!);
  print('Data index ke-$indexTertentu: ${datalist[indexTertentu]}');

  stdout.write('Masukkan index yang ingin diubah: ');
  int indexbaru = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan data baru: ');
  String databaru = stdin.readLineSync()!;
  datalist[indexbaru] = databaru;
  print('Data setelah diubah: $datalist');

  stdout.write('Masukkan index yang ingin dihapus: ');
  int indexhapus = int.parse(stdin.readLineSync()!);
  datalist.removeAt(indexhapus);
  print('Data setelah dihapus: $datalist');

  print('\nSEMUA DATA');
  for (int i = 0; i < datalist.length; i++) {
    print('Index $i: ${datalist[i]}');
  }
}
