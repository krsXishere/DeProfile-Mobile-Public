import 'dart:convert';
import 'package:de_profile_public/models/jurusan_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class JurusanService {
  Future<List<JurusanModel>> getAllJurusan(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-jurusan/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final jurusan = jsonDecode(response.body)['data']['jurusan'] as List;
      final jurusans = jurusan.map((object) {
        return JurusanModel(
          id: object['id'],
          jurusan: object['jurusan'],
          keterangan: object['keterangan'],
          tahun: object['tahun'],
          kurikulumId: object['kurikulum_id'],
          sekolahId: object['sekolah_id'],
          akreditasi: object['akreditasi'],
        );
      }).toList();
      // log(jurusans.toString());

      return jurusans;
    } else {
      return [];
    }
  }

  Future<JurusanModel> getSingleJurusan(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/jurusan/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log("Ngakak: ${response.statusCode}");

    final jurusan = jsonDecode(response.body) as Map<String, dynamic>;
    final jurusans = JurusanModel.fromJson(jurusan['data']);

    if (response.statusCode == 200) {
      // log("Ngakak: $jurusans");
      return jurusans;
    } else {
      return jurusans;
    }
  }
}
