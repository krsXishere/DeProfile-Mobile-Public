import 'package:de_profile_public/models/guru_model.dart';
import 'package:de_profile_public/models/sekolah_models.dart';
import 'package:de_profile_public/models/siswa_model.dart';
import 'package:de_profile_public/services/sekolah_service.dart';
import 'package:flutter/material.dart';

class SekolahProvider with ChangeNotifier {
  final _sekolahService = SekolahService();
  List<SekolahModel> _sekolahs = [];
  List<SekolahModel> get sekolah => _sekolahs;
  SekolahModel? _singleSekolah;
  SekolahModel? get singleSekolah => _singleSekolah;
  SiswaModel? _siswa;
  SiswaModel? get siswa => _siswa;
  GuruModel? _guru;
  GuruModel? get guru => _guru;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCountStudents(int? id) async {
    checkLoading(true);
    final data = await _sekolahService.getCountStudents(id);

    _siswa = data;
    checkLoading(false);
  }

  Future<void> getCountTeachers(int? id) async {
    checkLoading(true);
    final data = await _sekolahService.getCountTeachers(id);

    _guru = data;
    checkLoading(false);
  }

  Future<void> getSingleSekolah(int? id) async {
    checkLoading(true);
    final data = await _sekolahService.getSingleSekolah(id);

    _singleSekolah = data;
    checkLoading(false);
  }

  Future<void> getAllSekolah() async {
    checkLoading(true);
    final data = await _sekolahService.getSekolah();

    _sekolahs = data;

    checkLoading(false);
  }

  Future<void> getSearchSekolah(String value) async {
    checkLoading(true);
    final data = await _sekolahService.getSearchSekolah(value);

    _sekolahs = data;

    checkLoading(false);
  }
}
