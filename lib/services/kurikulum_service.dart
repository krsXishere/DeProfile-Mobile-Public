import 'dart:convert';
import 'package:de_profile_public/models/kurikulum_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class KurikulumService {
  Future<List<KurikulumModel>> getAllKurikulum(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-kurikulum/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final kurikulum = jsonDecode(response.body)['data']['galeri'] as List;
      final kurikulums = kurikulum.map((object) {
        return KurikulumModel(
          id: object['id'],
          kurikulum: object['kurikulum'],
          keterangan: object['keterangan'],
        );
      }).toList();
      // log(fasilitass.toString());

      return kurikulums;
    } else {
      return [];
    }
  }
}
