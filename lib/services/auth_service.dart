import 'dart:convert';
import 'dart:developer';
import 'package:de_profile_public/models/user_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/globals.dart' as global;

class AuthService {
  Future<UserModel> login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String apiURL = "${global.baseLocalURL}/login";
    var response = await post(
      Uri.parse(
        apiURL,
      ),
      headers: {
        'Accept': 'application/json',
        'Conten-Type': 'application/json',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      await sharedPreferences.setString('token', jsonObject['message']);
      // log(jsonObject['data']);
      return UserModel.fromJson(jsonObject['data']);
    } else {
      throw Exception("Login Gagal");
    }
  }

  Future<UserModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String apiURL = "${global.baseLocalURL}/register";
    var response = await post(
      Uri.parse(
        apiURL,
      ),
      headers: {
        'Accept': 'application/json',
        'Conten-Type': 'application/json',
      },
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      await sharedPreferences.setString('token', jsonObject['message']);

      // log(jsonObject['data']);
      log("Register Berhasil");
      return UserModel.fromJson(jsonObject['data']);
    } else {
      log("Register Gagal");
      throw Exception('Gagal register');
    }
  }

  Future<String?> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var tokenId = token?.substring(0, token.indexOf("|"));

    String apiURL = "${global.baseLocalURL}/logout/$tokenId";
    var response = await post(
      Uri.parse(
        apiURL,
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Conten-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      log("Logout Berhasil");
      await sharedPreferences.remove("token");
      return "";
    } else {
      log(response.statusCode.toString());
      log("Logout Gagal");
      return token;
    }
  }
}
