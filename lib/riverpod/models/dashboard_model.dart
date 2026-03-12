class DashboardData {
  final String userName;
  final int totalMahasiswa;
  final int mahasiswaAktif;
  final int jumlahKelas;
  final int tingkatKelulusan;

  DashboardData({
    required this.userName,
    required this.totalMahasiswa,
    required this.mahasiswaAktif,
    required this.jumlahKelas,
    required this.tingkatKelulusan,
  });

  DashboardData copyWith({
    String? userName,
    int? totalMahasiswa,
    int? mahasiswaAktif,
    int? jumlahKelas,
    int? tingkatKelulusan,
  }) {
    return DashboardData(
      userName: userName ?? this.userName,
      totalMahasiswa: totalMahasiswa ?? this.totalMahasiswa,
      mahasiswaAktif: mahasiswaAktif ?? this.mahasiswaAktif,
      jumlahKelas: jumlahKelas ?? this.jumlahKelas,
      tingkatKelulusan: tingkatKelulusan ?? this.tingkatKelulusan,
    );
  }
}