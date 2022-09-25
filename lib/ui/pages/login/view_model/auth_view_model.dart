import 'package:fashion_app/app/res/app_string.dart';
import 'package:fashion_app/ui/pages/homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/locator.dart';
import '../../../../core/services/auth/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService? _registerService = serviceLocator<AuthService>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool? isLoggedIn;

  void getCurrentUser() async {
    User? user = auth.currentUser;
    user!.email == null ? isLoggedIn = false : isLoggedIn = true;
    //TODO:check current user before login
  }

  bool isLoading = false;

  void login() async {
    isLoading = true;
    notifyListeners();
    User? user = await _registerService!
        .login(email: email.text, password: password.text);
    print('hello');
    if (user != null) {
      Future.delayed(
          Duration(microseconds: 200), () => Get.to(() => HomePage(user)));
      isLoading = false;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppStrings.email, user.email.toString());
      prefs.setString(AppStrings.lastName, user.email.toString());
      prefs.setString(AppStrings.firstName, user.email.toString());
      notifyListeners();
    } else {
      throw FirebaseAuthException(code: 'Failed to authenticate');
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
