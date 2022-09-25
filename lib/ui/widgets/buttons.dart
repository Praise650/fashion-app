import 'package:flutter/material.dart';

Widget submitButton({required String text, required Function() onPressed}) {
  return MaterialButton(
    color: Colors.red,
    elevation: 5.0,
    height: 50,
    onPressed: onPressed,
    shape: StadiumBorder(),
    child: Text('$text'),
  );
}

class SwitchSigningOptions extends StatelessWidget {
  SwitchSigningOptions({
    Key? key,
    required this.screen,
    required this.mainText,
    required this.subText,
  });

  String mainText;
  String subText;
  Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: RichText(
          text: TextSpan(
            text: mainText,
            style: TextStyle(
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: subText,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BaseButton extends StatelessWidget {
  const BaseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

