import 'package:fashion_app/ui/pages/create_account/view_model/create_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/res/images.dart';
import '../../layouts/auth_base_background.dart';
import '../../widgets/buttons.dart';
import '../../widgets/input_field.dart';
import '../../widgets/sign-up-options.dart';
import '../login/login.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        viewModelBuilder: () => CreateAccountViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: AuthBaseBackground(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3),
                    //background logo goes in here
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: AppImages.imagePath('images/m1.jpeg'),
                    ),
                    /*---- Logo ends Here-------------------*/
                    Padding(padding: EdgeInsets.all(8)),
                    GeneralInputField(
                      controller: model.name,
                      text: 'Name',
                      iconData: Icons.person,
                    ),
                    GeneralInputField(
                      controller: model.email,
                      text: 'E-mail',
                      iconData: Icons.mail,
                    ),
                    GeneralInputField(
                      controller: model.password,
                      text: 'Password',
                      iconData: Icons.lock,
                    ),
                    GeneralInputField(
                      controller: model.confirmPassword,
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
                              groupValue: model.genderValue,
                              onChanged: (value) => model.updateGender(value!),
                            ),
                            Text('Male'),
                            Radio<String>(
                              value: "Female",
                              groupValue: model.genderValue,
                              onChanged: (value) => model.updateGender(value!),
                            ),
                            Text('Female')
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: SubmitButton(
                          text: 'Sign Up',
                          isBusy: model.isBusy,
                          onPressed: () => model.createAccount(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Or continue with'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 8.0, right: 8.0),
                      child: SignUpOptions(
                        loading: model.showSpinner,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SwitchSigningOptions(
                        mainText: "Already have an Account? ",
                        subText: 'Sign in',
                        screen: Login(),
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
