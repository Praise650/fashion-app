import 'package:fashion_app/ui/pages/create_account/view_model/create_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/res/images.dart';
import '../../widgets/buttons.dart';
import '../../widgets/input_field.dart';
import '../../widgets/sign-up-options.dart';
import '../login/login.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? genderValue;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        viewModelBuilder: () => CreateAccountViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Container(
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
                  padding: const EdgeInsets.all(8.0),
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
                      Padding(padding: EdgeInsets.all(8)),
                      InputField(
                        controller: name,
                        text: 'Name',
                        iconData: Icons.person,
                      ),
                      InputField(
                        controller: email,
                        text: 'E-mail',
                        iconData: Icons.mail,
                      ),
                      InputField(
                        controller: password,
                        text: 'Password',
                        iconData: Icons.lock,
                      ),
                      InputField(
                        controller: password,
                        text: 'Confirm password',
                        iconData: Icons.lock,
                      ),
                      Row(
                        children: [
                          Text('Gender:'),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Male",
                                  groupValue: genderValue,
                                  onChanged: (value) =>
                                      onGroupValueChanged(value!)),
                              Text('Male'),
                              Radio<String>(
                                  value: "Female",
                                  groupValue: genderValue,
                                  onChanged: (value) =>
                                      onGroupValueChanged(value!)),
                              Text('Female')
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: submitButton(
                            text: 'Sign Up',
                              onPressed: () => model.createAccount(
                                    acctType: 'admin',
                                    firstName: name.text,
                                    gender: genderValue!,
                                    lastName: name.text,
                                    email: email.text.trim(),
                                    password: password.text.trim(),
                                  )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Or continue with'),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       bottom: 15.0, left: 8.0, right: 8.0),
                      //   child: SignUpOptions(loading: showSpinner),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SwitchSigningOptions(
                          mainText: "Already have an Account? ",
                          subText: 'Sign in',
                          screen: Login(),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  onGroupValueChanged(String gender) {
    if (gender == 'Male') {
      setState(() {
        genderValue = gender;
      });
    } else if (gender == 'Female') {
      setState(() {
        genderValue = gender;
      });
    }
  }
}
