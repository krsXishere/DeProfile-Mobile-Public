import 'package:de_profile_public/models/fasilitas_model.dart';
import 'package:de_profile_public/services/fasilitas_service.dart';
import 'package:flutter/material.dart';

class FasilitasProvider with ChangeNotifier {
  final _fasilitasService = FasilitasService();
  List<FasilitasModel> _fasilitas = [];
  List<FasilitasModel> get fasilitas => _fasilitas;
  FasilitasModel? _singleFasilitas;
  FasilitasModel? get singleFasilitas => _singleFasilitas;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllFasilitas(int? id) async {
    checkLoading(true);
    final data = await _fasilitasService.getAllFasilitas(id);

    _fasilitas = data;

    checkLoading(false);
  }

  Future<void> getSingleFasilitas(int? id) async {
    checkLoading(true);
    final data = await _fasilitasService.getSingleFasilitas(id);

    _singleFasilitas = data;
    checkLoading(false);
  }
}
