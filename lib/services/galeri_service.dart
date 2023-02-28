import 'dart:convert';
import 'package:de_profile_public/models/galeri_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class GaleriService {
  Future<List<GaleriModel>> getAllGaleri(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-galeri/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final galeri = jsonDecode(response.body)['data']['galeri'] as List;
      final galeris = galeri.map((object) {
        return GaleriModel(
          id: object['id'],
          judul: object['judul'],
          deskripsi: object['deskripsi'],
          image: object['image'],
          sekolahId: object['sekolah_id'],
        );
      }).toList();
      // log(fasilitass.toString());

      return galeris;
    } else {
      return [];
    }
  }

  Future<GaleriModel> getSingleGaleri(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/galeri/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log("Ngakak: ${response.statusCode}");

    final galeri = jsonDecode(response.body) as Map<String, dynamic>;
    final galeris = GaleriModel.fromJson(galeri['data']);

    if (response.statusCode == 200) {
      // log("Ngakak: $jurusans");
      return galeris;
    } else {
      return galeris;
    }
  }
}
