import 'package:learning_project/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));

    return ProfileModel(
      nama: 'Admin Universitas',
      jabatan: 'Administrator',
      email: 'admin@example.com',
      telepon: '+62 812 3456 7890',
    );
  }
}
