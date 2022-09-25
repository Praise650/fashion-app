import 'package:fashion_app/ui/pages/create_account/create_account_screen.dart';
import 'package:fashion_app/ui/pages/login/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';

import '../buttons.dart';
import '../../../app/res/images.dart';
import '../input_field.dart';
import '../sign-up-options.dart';

class LoginBody extends StatelessWidget {
  LoginBody(
    this.showSpinner, {
    Key? key,
    required this.model,
  }) : super(key: key);
  bool showSpinner;
  final LoginViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          //background Image goes in here
          image: AssetImage('images/c1.jpg'),
          fit: BoxFit.cover,
        ),
        //background Image ends in here
      ),
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 3,
              ),
              //background logo goes in here
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: AppImages.imagePath('images/m1.jpeg'),
              ),
              /*---- Logo ends Here-------------------*/
              Padding(padding: EdgeInsets.all(10)),
              Form(
                child: Column(
                  children: [
                    InputField(
                      controller: model.email,
                      text: 'E-mail',
                      iconData: Icons.email,
                    ),
                    InputField(
                      controller: model.password,
                      text: 'Password',
                      iconData: Icons.lock,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user)));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: submitButton(
                      text: 'Submit', onPressed: () => model.login())),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Or continue with'),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 15.0, left: 8.0, right: 8.0),
                child: SignUpOptions(loading: showSpinner),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchSigningOptions(
                  mainText: "Don't have an Account? ",
                  subText: 'Sign up',
                  screen: CreateAccount(),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
