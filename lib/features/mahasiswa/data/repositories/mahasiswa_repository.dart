import 'package:learning_project/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '2241720001',
        email: 'budi.santoso@student.example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Dewi Rahayu',
        nim: '2241720002',
        email: 'dewi.rahayu@student.example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Eko Prasetyo',
        nim: '2241720003',
        email: 'eko.prasetyo@student.example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Fitri Handayani',
        nim: '2241720004',
        email: 'fitri.handayani@student.example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}
