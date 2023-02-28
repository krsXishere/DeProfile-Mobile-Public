import 'dart:convert';
import 'package:de_profile_public/models/prestasi_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;

class PrestasiService {
  Future<List<PrestasiModel>> getAllPrestasi(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-prestasi/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final prestasi = jsonDecode(response.body)['data']['prestasi'] as List;
      final prestasis = prestasi.map((object) {
        return PrestasiModel(
          id: object['id'],
          nama: object['nama'],
          jenisPrestasi: object['jenis_prestasi'],
          tingkat: object['tingkat'],
          keterangan: object['keterangan'],
          sekolahId: object['sekolah_id'],
        );
      }).toList();
      // log(jurusans.toString());

      return prestasis;
    } else {
      return [];
    }
  }

  Future<PrestasiModel> getSinglePrestasi(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/prestasi/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log("Ngakak: ${response.statusCode}");

    final prestasi = jsonDecode(response.body) as Map<String, dynamic>;
    final prestasis = PrestasiModel.fromJson(prestasi['data']);

    if (response.statusCode == 200) {
      // log("Ngakak: $jurusans");
      return prestasis;
    } else {
      return prestasis;
    }
  }
}
