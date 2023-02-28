import 'dart:convert';
import 'dart:developer';
import 'package:de_profile_public/models/guru_model.dart';
import 'package:de_profile_public/models/sekolah_models.dart';
import 'package:de_profile_public/models/siswa_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;
// import '../main.dart';

class SekolahService {
  Future<SiswaModel> getCountStudents(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-jumlah-siswa/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final siswa = jsonDecode(response.body);
      final data = SiswaModel.fromJson(siswa['data']);

      return data;
    } else {
      throw Exception("Gagal get data jumlah siswa!");
    }
  }

  Future<GuruModel> getCountTeachers(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-jumlah-guru/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final siswa = jsonDecode(response.body);
      final data = GuruModel.fromJson(siswa['data']);

      return data;
    } else {
      throw Exception("Gagal get data jumlah guru!");
    }
  }

  Future<SekolahModel>? getSingleSekolah(int? id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    // log("Ngakak: ${response.statusCode}");

    final sekolah = jsonDecode(response.body) as Map<String, dynamic>;
    final sekolahs = SekolahModel.fromJson(sekolah['data']);

    if (response.statusCode == 200) {
      return sekolahs;
    } else {
      return sekolahs;
    }
  }

  Future<List<SekolahModel>> getSekolah() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    // log(token.toString());

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final sekolah = jsonDecode(response.body)['data'] as List;
      final sekolahs = sekolah.map((e) {
        return SekolahModel(
            id: e['id'],
            nss: e['nss'],
            npsn: e['npsn'],
            nama: e['nama'],
            alamat: e['alamat'],
            idDesa: e['id_desa'],
            rw: e['rw'],
            rt: e['rt'],
            noTelpon: e['no_telpon'],
            noFax: e['no_fax'],
            latLong: e['lat_long'],
            image: e['image'],
            email: e['email'],
            kepalaSekolah: e['kepala_sekolah']);
      }).toList();

      return sekolahs;
    } else {
      return [];
    }
  }

  Future<List<SekolahModel>> getSearchSekolah(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    // log(token.toString());

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/sekolah-search/$value"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final sekolah = jsonDecode(response.body)['data'] as List;
      final sekolahs = sekolah.map((e) {
        return SekolahModel(
            id: e['id'],
            nss: e['nss'],
            npsn: e['npsn'],
            nama: e['nama'],
            alamat: e['alamat'],
            idDesa: e['id_desa'],
            rw: e['rw'],
            rt: e['rt'],
            noTelpon: e['no_telpon'],
            noFax: e['no_fax'],
            latLong: e['lat_long'],
            image: e['image'],
            email: e['email'],
            kepalaSekolah: e['kepala_sekolah']);
      }).toList();

      return sekolahs;
    } else {
      return [];
    }
  }
}
