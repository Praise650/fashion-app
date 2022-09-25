import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/create_account/view_model/create_account_view_model.dart';
import '../pages/homepage/homepage.dart';

class SignUpOptions extends StatefulWidget {
  SignUpOptions({
    Key? key,
    required this.loading,
    // required this.createAccountViewModel,
  }) : super(key: key);

  bool loading;
  // CreateAccountViewModel createAccountViewModel;

  @override
  _SignUpOptionsState createState() => _SignUpOptionsState();
}

class _SignUpOptionsState extends State<SignUpOptions> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        2,
        (index) => GestureDetector(
          onTap: index == 0
              ? () {}
              : () async {
                  setState(() {
                    widget.loading = true;
                  });
                  // auth.signInGoogle().then((value) =>
                  //     Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => HomePage(value)))
                  //         .then((value) => setState(() {
                  //               widget.loading = false;
                  //             })));
                },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    index == 0
                        ? FontAwesomeIcons.facebookF
                        : FontAwesomeIcons.google,
                    color: index == 0 ? Colors.blue : Colors.red,
                  ),
                  Text(index == 0 ? 'FACEBOOK' : 'GOOGLE')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
