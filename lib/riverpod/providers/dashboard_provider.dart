import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_model.dart';

class DashboardNotifier extends StateNotifier<DashboardData> {
  DashboardNotifier()
      : super(DashboardData(
    userName: 'Admin D4TI',
    totalMahasiswa: 0,
    mahasiswaAktif: 0,
    jumlahKelas: 0,
    tingkatKelulusan: 0,
  ));

  void setUserName(String name) {
    state = state.copyWith(userName: name);
  }

  void setTotalMahasiswa(int value) {
    state = state.copyWith(totalMahasiswa: value);
  }

  void setMahasiswaAktif(int value) {
    state = state.copyWith(mahasiswaAktif: value);
  }

  void setJumlahKelas(int value) {
    state = state.copyWith(jumlahKelas: value);
  }

  void setTingkatKelulusan(int value) {
    state = state.copyWith(tingkatKelulusan: value);
  }

  void incrementMahasiswa() {
    state = state.copyWith(totalMahasiswa: state.totalMahasiswa + 1);
  }

  void decrementMahasiswa() {
    if (state.totalMahasiswa > 0) {
      state = state.copyWith(totalMahasiswa: state.totalMahasiswa - 1);
    }
  }

  void incrementMahasiswaAktif() {
    state = state.copyWith(mahasiswaAktif: state.mahasiswaAktif + 1);
  }

  void decrementMahasiswaAktif() {
    if (state.mahasiswaAktif > 0) {
      state = state.copyWith(mahasiswaAktif: state.mahasiswaAktif - 1);
    }
  }

  void incrementKelas() {
    state = state.copyWith(jumlahKelas: state.jumlahKelas + 1);
  }

  void decrementKelas() {
    if (state.jumlahKelas > 0) {
      state = state.copyWith(jumlahKelas: state.jumlahKelas - 1);
    }
  }

  void incrementKelulusan() {
    if (state.tingkatKelulusan < 100) {
      state = state.copyWith(tingkatKelulusan: state.tingkatKelulusan + 1);
    }
  }

  void decrementKelulusan() {
    if (state.tingkatKelulusan > 0) {
      state = state.copyWith(tingkatKelulusan: state.tingkatKelulusan - 1);
    }
  }
}

final dashboardProvider =
StateNotifierProvider<DashboardNotifier, DashboardData>((ref) {
  return DashboardNotifier();
});