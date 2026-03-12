class ProfileModel {
  final String nama;
  final String jabatan;
  final String email;
  final String telepon;

  ProfileModel({
    required this.nama,
    required this.jabatan,
    required this.email,
    required this.telepon,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      jabatan: json['jabatan'] ?? '',
      email: json['email'] ?? '',
      telepon: json['telepon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'jabatan': jabatan,
      'email': email,
      'telepon': telepon,
    };
  }
}
