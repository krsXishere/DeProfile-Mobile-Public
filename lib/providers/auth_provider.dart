import 'dart:developer';
import 'package:de_profile_public/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;
  String? _token;
  String? get tokens => _token;
  AuthService authService = AuthService();
  bool isLoading = false;
  bool isObsecure = true;
  bool isObsecure2 = true;
  bool isObsecure3 = true;
  bool isLogin = false;
  bool isLogout = false;

  set tokens(String? token) {
    _token = token;
    notifyListeners();
  }

  set user(UserModel? userModel) {
    _user = userModel;
    notifyListeners();
  }

  void checkObsecure() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  void checkObsecure2() {
    isObsecure2 = !isObsecure2;
    notifyListeners();
  }

  void checkObsecure3() {
    isObsecure3 = !isObsecure3;
    notifyListeners();
  }

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    checkLoading(true);
    try {
      UserModel? user = await authService.login(email, password);

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      log(e.toString());
      checkLoading(false);
      return false;
    }
  }

  Future<bool> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    checkLoading(true);
    try {
      UserModel? user = await authService.register(
        name,
        email,
        password,
        confirmPassword,
      );

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      log(e.toString());
      checkLoading(false);
      return false;
    }
  }

  Future<bool> logout() async {
    checkLoading(true);
    try {
      String? token = await authService.logout();

      _token = token;
      checkLoading(false);
      return true;
    } catch (e) {
      log(e.toString());
      checkLoading(false);
      return false;
    }
  }
}
