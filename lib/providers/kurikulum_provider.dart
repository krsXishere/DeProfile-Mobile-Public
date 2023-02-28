import 'package:de_profile_public/models/kurikulum_models.dart';
import 'package:de_profile_public/services/kurikulum_service.dart';
import 'package:flutter/material.dart';

class KurikulumProvider with ChangeNotifier {
  final _kurikulumService = KurikulumService();
  List<KurikulumModel> _kurikulum = [];
  List<KurikulumModel> get kurikulum => _kurikulum;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllKurikulum(int? id) async {
    checkLoading(true);
    final data = await _kurikulumService.getAllKurikulum(id);

    _kurikulum = data;

    checkLoading(false);
  }
}
