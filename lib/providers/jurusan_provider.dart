import 'package:de_profile_public/models/jurusan_model.dart';
import 'package:de_profile_public/services/jurusan_service.dart';
import 'package:flutter/material.dart';

class JurusanProvider with ChangeNotifier {
  final _jurusanService = JurusanService();
  List<JurusanModel> _jurusans = [];
  List<JurusanModel> get jurusan => _jurusans;
  JurusanModel? _singleJurusan;
  JurusanModel? get singleJurusan => _singleJurusan;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getSingleSekolah(int? id) async {
    checkLoading(true);
    final data = await _jurusanService.getSingleJurusan(id);

    _singleJurusan = data;
    checkLoading(false);
  }

  Future<void> getAllJurusan(int? id) async {
    checkLoading(true);
    final data = await _jurusanService.getAllJurusan(id);

    _jurusans = data;

    checkLoading(false);
  }
}
