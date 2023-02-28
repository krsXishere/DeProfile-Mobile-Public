import 'dart:developer';
import 'dart:io';
import 'package:de_profile_public/models/user_model.dart';
import 'package:de_profile_public/services/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final _userService = UserService();
  UserModel? _user;
  UserModel? get user => _user;
  bool isLoading = false;

  void checkLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set user(UserModel? userModel) {
    _user = userModel;
    notifyListeners();
  }

  Future<void> getUserProfile() async {
    checkLoading(true);
    final data = await _userService.getUserProfile();

    _user = data;
    checkLoading(false);
  }

  Future<bool> updateUserProfile(String name, String email) async {
    checkLoading(true);
    try {
      UserModel? user = await _userService.updateUserProfile(name, email);

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      checkLoading(false);
      log(e.toString());
      return false;
    }
  }

  Future<bool> changePassword(
    String oldPassword,
    String newPassword,
    String confirmNewPassword,
  ) async {
    checkLoading(true);
    try {
      UserModel? user = await _userService.changePassword(
        oldPassword,
        newPassword,
        confirmNewPassword,
      );

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      checkLoading(false);
      log(e.toString());
      return false;
    }
  }

  Future<bool> addProfilePicture(File? file) async {
    checkLoading(true);
    try {
      UserModel? user = await _userService.addProfilePicture(file);

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      checkLoading(false);
      log(e.toString());
      return false;
    }
  }

  Future<bool> editProfilePicture(File? file) async {
    checkLoading(true);
    try {
      UserModel? user = await _userService.editProfilePicture(file);

      _user = user;
      checkLoading(false);
      return true;
    } catch (e) {
      checkLoading(false);
      log(e.toString());
      return false;
    }
  }
}
