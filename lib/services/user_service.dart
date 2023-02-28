// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:de_profile_public/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common//globals.dart' as global;
import 'package:path/path.dart' as path;

class UserService {
  Future<UserModel> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.get(
      Uri.parse("${global.baseLocalURL}/user/userProfile"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // log("Ngakak: ${response.statusCode}");

    final user = jsonDecode(response.body) as Map<String, dynamic>;
    final data = UserModel.fromJson(user['data']);

    if (response.statusCode == 200) {
      // log("Ngakak: $jurusans");
      return data;
    } else {
      return data;
    }
  }

  Future<UserModel> updateUserProfile(String name, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http
        .post(Uri.parse("${global.baseLocalURL}/user/updateProfile"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      'name': name,
      'email': email,
    });
    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      final data = UserModel.fromJson(user['data']);

      return data;
    } else {
      throw Exception("Gagal update profile!");
    }
  }

  Future<UserModel> changePassword(
    String oldPassword,
    String newPassword,
    String confirmNewPassword,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    var response = await http.post(
        Uri.parse("${global.baseLocalURL}/user/changePassword"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'old_password': oldPassword,
          'password': newPassword,
          'confirm_password': confirmNewPassword,
        });
    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      final data = UserModel.fromJson(user['data']);

      return data;
    } else {
      throw Exception("Gagal ubah kata sandi!");
    }
  }

  Future<UserModel> addProfilePicture(File? file) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var stream = http.ByteStream(file!.openRead());
    stream.cast();
    var length = await file.length();

    // Map<String, String> headers = {

    // };
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${global.baseLocalURL}/user/addProfilePicture"),
    );
    request.headers.addAll(
      {
        'Authorization': "Bearer $token",
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
    );
    request.files.add(
      http.MultipartFile(
        'image',
        stream,
        length,
        filename: path.basename(file.path),
      ),
    );

    http.Response response = await http.Response.fromStream(
      await request.send(),
    );

    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      final data = UserModel.fromJson(user['data']);

      return data;
    } else {
      throw Exception("Gagal upload PP!");
    }
  }

  Future<UserModel> editProfilePicture(File? file) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var stream = http.ByteStream(file!.openRead());
    stream.cast();
    var length = await file.length();

    // Map<String, String> headers = {

    // };
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${global.baseLocalURL}/user/editProfilePicture"),
    );
    request.headers.addAll(
      {
        'Authorization': "Bearer $token",
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
    );
    request.files.add(
      http.MultipartFile(
        'image',
        stream,
        length,
        filename: path.basename(file.path),
      ),
    );

    http.Response response = await http.Response.fromStream(
      await request.send(),
    );

    log("Ngakak: ${response.statusCode}");

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      final data = UserModel.fromJson(user['data']);

      return data;
    } else {
      throw Exception("Gagal upload PP!");
    }
  }
}
