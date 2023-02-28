import 'package:de_profile_public/models/ekstrakulikuler_model.dart';
import 'package:de_profile_public/services/ekstrakulikuler_service.dart';
import 'package:flutter/material.dart';

class EkstrakulikulerProvider with ChangeNotifier {
  final _ekstrakulikulerService = EsktrakulikulerService();
  List<EkstrakulikulerModel> _ekstrakulikuler = [];
  List<EkstrakulikulerModel> get ekstrakulikuler => _ekstrakulikuler;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllEkstrakulikuler(int? id) async {
    checkLoading(true);
    final data = await _ekstrakulikulerService.getAllEkstrakulikuler(id);

    _ekstrakulikuler = data;

    checkLoading(false);
  }
}