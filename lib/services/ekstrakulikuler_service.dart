import 'dart:convert';
import 'package:de_profile_public/models/ekstrakulikuler_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class EsktrakulikulerService {
  Future<List<EkstrakulikulerModel>> getAllEkstrakulikuler(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-ekstrakulikuler/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final ekstrakulikuler =
          jsonDecode(response.body)['data']['ekstrakulikuler'] as List;
      final ekstrakulikulers = ekstrakulikuler.map((object) {
        return EkstrakulikulerModel(
          id: object['id'],
          jenis: object['jenis'],
          nama: object['nama'],
          sekolahId: object['sekolah_id'],
        );
      } ).toList();
      // log(fasilitass.toString());

      return ekstrakulikulers;
    } else {
      return [];
    }
  }
}
