import 'package:de_profile_public/models/galeri_model.dart';
import 'package:de_profile_public/services/galeri_service.dart';
import 'package:flutter/material.dart';

class GaleriProvider with ChangeNotifier {
  final _galeriService = GaleriService();
  List<GaleriModel> _galeri = [];
  List<GaleriModel> get galeri => _galeri;
  GaleriModel? _singleGaleri;
  GaleriModel? get singleGaleri => _singleGaleri;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllGaleri(int? id) async {
    checkLoading(true);
    final data = await _galeriService.getAllGaleri(id);

    _galeri = data;

    checkLoading(false);
  }

  Future<void> getSingleGaleri(int? id) async {
    checkLoading(true);
    final data = await _galeriService.getSingleGaleri(id);

    _singleGaleri = data;
    checkLoading(false);
  }
}
