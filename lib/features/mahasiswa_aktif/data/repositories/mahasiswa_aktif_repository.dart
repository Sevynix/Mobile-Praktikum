import 'package:learning_project/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Budi Santoso',
        nim: '2241720001',
        email: 'budi.santoso@student.example.com',
        jurusan: 'Teknik Informatika',
        semester: '6',
      ),
      MahasiswaAktifModel(
        nama: 'Dewi Rahayu',
        nim: '2241720002',
        email: 'dewi.rahayu@student.example.com',
        jurusan: 'Teknik Informatika',
        semester: '4',
      ),
      MahasiswaAktifModel(
        nama: 'Eko Prasetyo',
        nim: '2241720003',
        email: 'eko.prasetyo@student.example.com',
        jurusan: 'Teknik Informatika',
        semester: '2',
      ),
    ];
  }
}
