import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.controller,
    required this.text,
    this.iconData,
  });
  TextEditingController controller;
  String text;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[50]!.withOpacity(0.4),
          prefixIcon: Icon(iconData),
          hintText: "$text",
          labelText: '$text',
        ),
      ),
    );
  }
}