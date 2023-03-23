import 'package:fashion_app/ui/pages/login/view_model/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

import '../../layouts/auth_base_background.dart';
import '../../widgets/login/loginBody.dart';
import '../create_account/view_model/create_account_view_model.dart';
import '../homepage/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // SharedPreferences? sharedPreferences;
  GoogleSignIn googleSignIn = GoogleSignIn();

  bool loading = false;
  bool isLoggedIn = false;
  bool _isHidden = true;
  // method handling obscure text in textFormField
  void hideText() => setState(() => _isHidden = !_isHidden);

  @override
  void initState() {
    super.initState();
    // isSignedIn();
  }

  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   isLoggedIn = await googleSignIn.isSignedIn();
  //   if (isLoggedIn = true) {
  //     Auth auth = Auth();
  //     final User? user = auth.signInGoogle() as User?;
  //     await Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => HomePage(user!)))
  //         .then((value) => setState(() {
  //               loading = false;
  //             }));
  //   }else {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: ()=>LoginViewModel(),
      builder: (context,model,_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: AuthBaseBackground(
              padding: 10,
              child: LoginBody(
                loading,
                model: model
              ),
            ),
          ),
        );
      }
    );
  }
}
