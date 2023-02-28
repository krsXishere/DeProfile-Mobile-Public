import 'dart:convert';  
import 'package:de_profile_public/models/fasilitas_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class FasilitasService {
  Future<List<FasilitasModel>> getAllFasilitas(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-fasilitas/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final fasilitas = jsonDecode(response.body)['data']['fasilitas'] as List;
      final fasilitass = fasilitas.map((object) {
        return FasilitasModel(
          id: object['id'],
          nama: object['nama'],
          jenis: object['jenis'],
          keterangan: object['keterangan'],
          sekolahId: object['sekolah_id'],
        );
      }).toList();
      // log(fasilitass.toString());

      return fasilitass;
    } else {
      return [];
    }
  }

  Future<FasilitasModel> getSingleFasilitas(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/fasilitas/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log("Ngakak: ${response.statusCode}");

    final prestasi = jsonDecode(response.body) as Map<String, dynamic>;
    final prestasis = FasilitasModel.fromJson(prestasi['data']);

    if (response.statusCode == 200) {
      // log("Ngakak: $jurusans");
      return prestasis;
    } else {
      return prestasis;
    }
  }
}
