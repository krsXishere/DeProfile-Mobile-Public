import 'package:de_profile_public/models/prestasi_model.dart';
import 'package:de_profile_public/services/prestasi_service.dart';
import 'package:flutter/material.dart';

class PrestasiProvider with ChangeNotifier {
  final _prestasiService = PrestasiService();
  List<PrestasiModel> _prestasi = [];
  List<PrestasiModel> get prestasi => _prestasi;
  PrestasiModel? _singlePrestasi;
  PrestasiModel? get singlePrestasi => _singlePrestasi;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getSinglePrestasi(int? id) async {
    checkLoading(true);
    final data = await _prestasiService.getSinglePrestasi(id);

    _singlePrestasi = data;
    checkLoading(false);
  }

  Future<void> getAllPrestasi(int? id) async {
    checkLoading(true);
    final data = await _prestasiService.getAllPrestasi(id);

    _prestasi = data;

    checkLoading(false);
  }
}
