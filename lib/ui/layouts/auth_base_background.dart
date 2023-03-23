import 'package:flutter/material.dart';

class AuthBaseBackground extends StatelessWidget {
  const AuthBaseBackground({Key? key, this.child, this.padding}) : super(key: key);

  final Widget? child;
  final double? padding;

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
        padding: EdgeInsets.all(padding??8.0),
        child: child,
      ),
    );
  }
}
