import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _mahasiswa = 0;
  int _dosen = 0;
  int _mataKuliah = 0;

  int get mahasiswa => _mahasiswa;
  int get dosen => _dosen;
  int get mataKuliah => _mataKuliah;

  void tambahMahasiswa() {
    _mahasiswa++;
    notifyListeners();
  }

  void tambahDosen() {
    _dosen++;
    notifyListeners();
  }

  void tambahMataKuliah() {
    _mataKuliah++;
    notifyListeners();
  }
}