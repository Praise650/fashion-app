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
  final AuthService _registerService = serviceLocator<AuthService>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  bool? isLoggedIn;

  void getCurrentUser() async {
    User? user = auth.currentUser;
    user!.email == null ? isLoggedIn = false : isLoggedIn = true;
    //TODO:check current user before login
  }

  bool isLoading = false;

  void login() async {
    setBusy(true);
    notifyListeners();
    if (validateAndSave()) {
      User? user = await _registerService.login(
          email: email.text, password: password.text);
      print('hello');
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(AppStrings.email, user.email!);
        prefs.setString(AppStrings.id, user.uid);
        prefs.setString(AppStrings.firstName, user.email!);
        setBusy(false);
        notifyListeners();
        Future.delayed(
            Duration(microseconds: 200), () => Get.to(() => HomePage(user)));
        notifyListeners();
      } else {
        throw FirebaseAuthException(code: 'Failed to authenticate');
      }
    } else {
      throw FirebaseAuthException(code: 'Failed to validate credentials');
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  bool validateAndSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }
}
